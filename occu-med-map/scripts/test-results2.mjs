async function test() {
  function extractCookies(setCookieHeader) {
    if (!setCookieHeader) return '';
    const parts = setCookieHeader.split(/,\s*(?=[^,]+=)/);
    return parts.map((p) => p.split(';')[0].trim()).join('; ');
  }

  const username = 'occumed';
  const password = 'y2GNp1p66o^d*JkT';

  // Login
  const getRes = await fetch('https://assisthealthgroup.com/client/', {
    headers: { 'User-Agent': 'Mozilla/5.0' },
    redirect: 'manual',
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
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Referer': 'https://assisthealthgroup.com/client/',
      'Cookie': initialCookies,
      'User-Agent': 'Mozilla/5.0',
    },
    body: body.toString(),
    redirect: 'manual',
  });

  const sessionCookie = extractCookies(postRes.headers.get('set-cookie'));
  console.log('Logged in:', sessionCookie.includes('wordpress_logged_in'));

  // Test with full CPT code included
  const formData = new URLSearchParams();
  formData.append('Select_Modality', 'MRI');
  formData.append('Select_Bodypart', 'Brain');
  formData.append('Select_Type', 'Without Contrast');
  formData.append('Input_Study_Search[]', '70450');
  formData.append('Input_Zipcode_Simple', '32501');

  console.log('\n=== Test: Radiology search with CPT code ===');
  const searchRes = await fetch('https://assisthealthgroup.com/client/ra-search-results/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Referer': 'https://assisthealthgroup.com/client/schedule-radiology/',
      'Cookie': sessionCookie,
      'User-Agent': 'Mozilla/5.0',
    },
    body: formData.toString(),
    redirect: 'manual',
  });

  const searchHtml = await searchRes.text();
  console.log('Status:', searchRes.status);

  const fs = await import('fs');
  fs.writeFileSync('/tmp/test-results2.html', searchHtml);

  // Check for results or no-results message
  const hasNoResults = /No tests selected|No zipcode entered|no results|not found/i.test(searchHtml);
  const hasResults = /facility|center|location|hospital|imaging/i.test(searchHtml);
  console.log('Has no-results msg:', hasNoResults);
  console.log('Has facility refs:', hasResults);

  // Look for actual text content
  const texts = searchHtml.match(/>\s*([^<]{10,100})\s*</g);
  if (texts) {
    for (const t of texts.slice(0, 30)) {
      const clean = t.replace(/[><]/g, '').trim();
      if (clean && !clean.startsWith('http') && clean.length > 10) {
        console.log('Text:', clean);
      }
    }
  }
}
test().catch(console.error);
