import 'dotenv/config';
import { chromium } from 'playwright';
import fs from 'fs/promises';
import path from 'path';

const USERNAME = process.env.RADIOLOGY_ASSIST_USERNAME;
const PASSWORD = process.env.RADIOLOGY_ASSIST_PASSWORD;
const BASE_URL = process.env.RADIOLOGY_ASSIST_BASE_URL || 'https://assisthealthgroup.com/client';
const OUTPUT_DIR = process.env.RADIOLOGY_ASSIST_OUTPUT_DIR || '/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map';

const SCREENSHOT_DIR = path.join(OUTPUT_DIR, 'screenshots');
const HTML_DEBUG_DIR = path.join(OUTPUT_DIR, 'html-debug');
const DROPDOWN_DEBUG_DIR = path.join(OUTPUT_DIR, 'dropdown-debug');
const DROPDOWN_MAP_FILE = path.join(OUTPUT_DIR, 'radiology_assist_dropdown_map.json');

async function ensureDirs() {
  for (const dir of [SCREENSHOT_DIR, HTML_DEBUG_DIR, DROPDOWN_DEBUG_DIR]) {
    await fs.mkdir(dir, { recursive: true });
  }
}

async function login(page: any): Promise<void> {
  console.log('Logging in...');
  await page.goto(`${BASE_URL}/`, { waitUntil: 'networkidle' });

  const usernameInput = await page.$('input[name*="username"]');
  const passwordInput = await page.$('input[name*="user_password"]');

  if (!usernameInput || !passwordInput) {
    throw new Error('Login form fields not found on page');
  }

  await usernameInput.fill(USERNAME!);
  await passwordInput.fill(PASSWORD!);

  const submitBtnInfo = await page.evaluate(() => {
    const btns = Array.from(document.querySelectorAll('input[type="submit"], button[type="submit"]'));
    return btns.map(b => ({
      tag: b.tagName,
      value: (b as HTMLInputElement).value,
      text: b.textContent?.trim(),
      class: b.className,
      id: b.id,
      visible: !!(b as HTMLElement).offsetParent,
    }));
  });

  const visibleSubmit = submitBtnInfo.find((b: any) => b.visible);
  if (!visibleSubmit) {
    throw new Error('No visible login submit button found');
  }

  if (visibleSubmit.id) {
    await page.click(`#${visibleSubmit.id}`);
  } else {
    await page.evaluate(() => {
      const btn = Array.from(document.querySelectorAll('input[type="submit"], button[type="submit"]'))
        .find(b => (b as HTMLElement).offsetParent);
      if (btn) (btn as HTMLElement).click();
    });
  }

  await page.waitForURL('**/client-home/**', { timeout: 15000 });
  console.log('Login successful.');
}

async function getSelectOptions(page: any, selector: string): Promise<string[]> {
  return page.evaluate((sel: string) => {
    const el = document.querySelector(sel) as HTMLSelectElement;
    if (!el) return [];
    return Array.from(el.options).map(o => o.text.trim()).filter(t => t && !t.toLowerCase().includes('select'));
  }, selector);
}

async function dumpDropdownState(page: any, label: string): Promise<void> {
  const timestamp = Date.now();
  const screenshotPath = path.join(DROPDOWN_DEBUG_DIR, `${label}_${timestamp}.png`);
  const htmlPath = path.join(DROPDOWN_DEBUG_DIR, `${label}_${timestamp}.html`);

  await page.screenshot({ path: screenshotPath, fullPage: false });
  const html = await page.content();
  await fs.writeFile(htmlPath, html, 'utf-8');

  console.log(`  Saved debug: ${screenshotPath}, ${htmlPath}`);
}

interface DropdownMap {
  [modality: string]: {
    [bodyPart: string]: string[];
  };
}

async function main() {
  if (!USERNAME || !PASSWORD) {
    console.error('Missing RADIOLOGY_ASSIST_USERNAME or RADIOLOGY_ASSIST_PASSWORD.');
    process.exit(1);
  }

  await ensureDirs();

  const browser = await chromium.launch({
    headless: true,
    args: ['--disable-blink-features=AutomationControlled'],
  });

  const page = await browser.newPage();

  // Capture network requests to find AJAX endpoints
  const ajaxEndpoints: { url: string; method: string; postData?: string }[] = [];
  page.on('request', (req: any) => {
    const url = req.url();
    if (url.includes('.php') || url.includes('ajax') || url.includes('admin-ajax')) {
      ajaxEndpoints.push({
        url,
        method: req.method(),
        postData: req.postData() || undefined,
      });
    }
  });

  await login(page);
  await page.goto(`${BASE_URL}/schedule-radiology/`, { waitUntil: 'networkidle' });

  // Take screenshot of initial form state
  await page.screenshot({ path: path.join(SCREENSHOT_DIR, 'schedule-radiology-initial.png') });

  const modalities = await getSelectOptions(page, '#Select_Modality');
  console.log(`\nDiscovered ${modalities.length} modalities:`);
  console.log(modalities.map(m => `  - ${m}`).join('\n'));

  const dropdownMap: DropdownMap = {};

  for (const modality of modalities) {
    console.log(`\n=== Exploring modality: ${modality} ===`);
    dropdownMap[modality] = {};

    // Select modality
    await page.selectOption('#Select_Modality', { label: modality });
    await page.waitForTimeout(1000);

    // Wait for body parts to populate
    await page.waitForFunction(() => {
      const el = document.querySelector('#Select_Bodypart') as HTMLSelectElement;
      return el && el.options.length > 1;
    }, { timeout: 5000 }).catch(() => {
      console.log(`  WARNING: Body part dropdown did not populate for ${modality}`);
    });

    const bodyParts = await getSelectOptions(page, '#Select_Bodypart');
    console.log(`  Body parts (${bodyParts.length}): ${bodyParts.join(', ')}`);

    await dumpDropdownState(page, `modality_${modality.replace(/[^a-z0-9]/gi, '_')}`);

    for (const bodyPart of bodyParts) {
      console.log(`    Exploring: ${modality} > ${bodyPart}`);

      // Select body part
      await page.selectOption('#Select_Bodypart', { label: bodyPart });
      await page.waitForTimeout(800);

      // Wait for protocols to populate
      await page.waitForFunction(() => {
        const el = document.querySelector('#Select_Type') as HTMLSelectElement;
        return el && el.options.length > 1;
      }, { timeout: 5000 }).catch(() => {
        console.log(`      WARNING: Protocol dropdown did not populate for ${modality} > ${bodyPart}`);
      });

      const protocols = await getSelectOptions(page, '#Select_Type');
      console.log(`      Protocols (${protocols.length}): ${protocols.join(', ')}`);

      dropdownMap[modality][bodyPart] = protocols;

      await dumpDropdownState(page, `protocol_${modality.replace(/[^a-z0-9]/gi, '_')}_${bodyPart.replace(/[^a-z0-9]/gi, '_')}`);
    }
  }

  // Save dropdown map
  await fs.writeFile(DROPDOWN_MAP_FILE, JSON.stringify(dropdownMap, null, 2), 'utf-8');
  console.log(`\nSaved dropdown map to ${DROPDOWN_MAP_FILE}`);

  // Save AJAX endpoints discovered
  const ajaxLogPath = path.join(DROPDOWN_DEBUG_DIR, 'ajax-endpoints.json');
  await fs.writeFile(ajaxLogPath, JSON.stringify(ajaxEndpoints, null, 2), 'utf-8');
  console.log(`Saved ${ajaxEndpoints.length} AJAX endpoints to ${ajaxLogPath}`);

  // Print summary
  console.log('\n=== DROPDOWN MAP SUMMARY ===');
  for (const [mod, bodyParts] of Object.entries(dropdownMap)) {
    console.log(`\n${mod}:`);
    for (const [bp, protos] of Object.entries(bodyParts)) {
      console.log(`  ${bp}: ${protos.join(', ')}`);
    }
  }

  await browser.close();
}

main().catch((err) => {
  console.error('Fatal error:', err);
  process.exit(1);
});
