async function inspect() {
  function extractCookies(setCookieHeader) {
    if (!setCookieHeader) return '';
    const parts = setCookieHeader.split(/,\s*(?=[^,]+=)/);
    return parts.map((p) => p.split(';')[0].trim()).join('; ');
  }

  const username = 'occumed';
  const password = 'y2GNp1p66o^d*JkT';

  // Login
  const getRes = await fetch('https://assisthealthgroup.com/client/', {
    headers: { 'User-Agent': 'Mozilla/5.0' }, redirect: 'manual',
  });
  const initialCookies = extractCookies(getRes.headers.get('set-cookie'));
  const loginHtml = await getRes.text();
  const nonceMatch = loginHtml.match(/name="_wpnonce"[^>]*value="([^"]+)"/);
  const nonce = nonceMatch ? nonceMatch[1] : '';
  const refererMatch = loginHtml.match(/name="_wp_http_referer"[^>]*value="([^"]+)"/);
  const referer = refererMatch ? refererMatch[1] : '/';

  const body = new URLSearchParams();
  body.append('username-6', username);
  body.append('user_password-6', password);
  body.append('form_id', '6');
  body.append('_wpnonce', nonce);
  body.append('_wp_http_referer', referer);
  body.append('rememberme', '1');

  const postRes = await fetch('https://assisthealthgroup.com/client/', {
    method: 'POST', headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Referer': 'https://assisthealthgroup.com/client/',
      'Cookie': initialCookies, 'User-Agent': 'Mozilla/5.0',
    },
    body: body.toString(), redirect: 'manual',
  });
  const sessionCookie = extractCookies(postRes.headers.get('set-cookie'));

  // Submit form to get results page
  const formData = new URLSearchParams();
  formData.append('Select_Modality', 'MRI');
  formData.append('Select_Bodypart', 'Brain');
  formData.append('Select_Type', 'Without Contrast');
  formData.append('Input_Study_Search[]', '70450');
  formData.append('Input_Zipcode_Simple', '32501');

  const searchRes = await fetch('https://assisthealthgroup.com/client/ra-search-results/', {
    method: 'POST', headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Referer': 'https://assisthealthgroup.com/client/schedule-radiology/',
      'Cookie': sessionCookie, 'User-Agent': 'Mozilla/5.0',
    },
    body: formData.toString(), redirect: 'manual',
  });
  const html = await searchRes.text();

  // Inspect the page for data
  console.log('=== Script sources on results page ===');
  const scriptMatches = html.matchAll(/<script[^>]+src="([^"]+)"/g);
  for (const m of scriptMatches) {
    console.log(m[1]);
  }

  console.log('\n=== Inline scripts containing facility/search data ===');
  const inlineScripts = html.matchAll(/<script[^>]*>(.*?)<\/script>/gs);
  for (const m of inlineScripts) {
    const script = m[1];
    if (script.length > 50 && (/facility|center|location|zip|search|ajax|result|map/i.test(script))) {
      console.log(script.slice(0, 500));
      console.log('---');
    }
  }

  console.log('\n=== Data attributes / JSON-LD ===');
  const jsonLd = html.matchAll(/<script type="application\/ld\+json">(.*?)<\/script>/gs);
  for (const m of jsonLd) {
    console.log(m[1].slice(0, 300));
  }

  console.log('\n=== Any div with data-* attributes ===');
  const dataDivs = html.matchAll(/<div[^>]*data-[^>]*>/g);
  for (const m of dataDivs) {
    console.log(m[0]);
  }

  console.log('\n=== Table structures ===');
  const tables = html.matchAll(/<table[^>]*>(.*?)<\/table>/gs);
  for (const m of tables) {
    const tableText = m[1].replace(/<[^>]+>/g, ' ').replace(/\s+/g, ' ').trim();
    if (tableText.length > 20) {
      console.log('Table:', tableText.slice(0, 200));
    }
  }

  const fs = await import('fs');
  fs.writeFileSync('/tmp/inspect-results.html', html);
}
inspect().catch(console.error);
