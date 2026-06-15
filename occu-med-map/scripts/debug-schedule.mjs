import { chromium } from 'playwright';

async function debug() {
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage();

  // Login
  await page.goto('https://assisthealthgroup.com/client/');
  await page.fill('input[name*="username"]', 'occumed');
  await page.fill('input[name*="user_password"]', 'y2GNp1p66o^d*JkT');

  // Find the login submit button
  const loginBtnInfo = await page.evaluate(() => {
    const btns = Array.from(document.querySelectorAll('input[type="submit"], button[type="submit"]'));
    return btns.map(b => ({
      tag: b.tagName,
      value: b.value,
      text: b.textContent?.trim(),
      class: b.className,
      id: b.id,
      visible: !!(b.offsetParent),
    }));
  });
  console.log('Login submit buttons:', JSON.stringify(loginBtnInfo, null, 2));

  // Click the visible submit button (not the hidden search one)
  const visibleSubmit = loginBtnInfo.find(b => b.visible);
  if (visibleSubmit) {
    if (visibleSubmit.id) {
      await page.click(`#${visibleSubmit.id}`);
    } else {
      await page.evaluate(() => {
        const btn = Array.from(document.querySelectorAll('input[type="submit"], button[type="submit"]'))
          .find(b => b.offsetParent);
        if (btn) btn.click();
      });
    }
  }
  await page.waitForURL('**/client-home/**', { timeout: 15000 });
  console.log('Logged in, current URL:', page.url());

  // Navigate to schedule-radiology
  await page.goto('https://assisthealthgroup.com/client/schedule-radiology/');
  await page.waitForLoadState('networkidle');

  // Find the search button
  const buttons = await page.$$eval('button, input[type="submit"], a', els =>
    els.filter(e => e.textContent.toLowerCase().includes('search') || e.value?.toLowerCase().includes('search'))
      .map(e => ({
        tag: e.tagName,
        type: e.type,
        text: e.textContent?.trim(),
        value: e.value,
        class: e.className,
        id: e.id,
        name: e.name,
      }))
  );
  console.log('Search-like elements:', JSON.stringify(buttons, null, 2));

  // Also check for any element with "Btn" or "Search" in class
  const btnElements = await page.$$eval('[class*="Btn"], [class*="search"], [class*="Search"]', els =>
    els.map(e => ({
      tag: e.tagName,
      text: e.textContent?.trim().slice(0, 50),
      class: e.className,
      id: e.id,
    }))
  );
  console.log('Btn/Search class elements:', JSON.stringify(btnElements, null, 2));

  // Check form fields
  const fields = await page.$$eval('#Select_Modality, #Select_Bodypart, #Select_Type, #Input_Zipcode_Simple', els =>
    els.map(e => ({
      id: e.id,
      tag: e.tagName,
      type: e.type,
      options: e.tagName === 'SELECT'
        ? Array.from(e.options).map(o => o.text).slice(0, 10)
        : null,
    }))
  );
  console.log('Form fields:', JSON.stringify(fields, null, 2));

  await browser.close();
}

debug().catch(err => {
  console.error('Error:', err.message);
  process.exit(1);
});
