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

  // Test 1: POST to results page with MRI + Brain + Without Contrast + zip
  const formData = new URLSearchParams();
  formData.append('Select_Modality', 'MRI');
  formData.append('Select_Bodypart', 'Brain');
  formData.append('Select_Type', 'Without Contrast');
  formData.append('Input_Zipcode_Simple', '32501');

  console.log('\n=== Test 1: Radiology search ===');
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
  console.log('Has facility:', /facility|center|location|hospital/i.test(searchHtml));
  console.log('Has price:', /\$[\d,]+/i.test(searchHtml));
  console.log('Has results:', /result|found|available|schedule|appointment/i.test(searchHtml));
  console.log('Has error:', /error|invalid|not found|no results/i.test(searchHtml));

  const fs = await import('fs');
  fs.writeFileSync('/tmp/test-results-radiology.html', searchHtml);

  // Test 2: Ophthalmology search
  const eyeData = new URLSearchParams();
  eyeData.append('Input_Study_Search[]', '66984');
  eyeData.append('Input_Zipcode_Simple', '32501');

  console.log('\n=== Test 2: Ophthalmology search ===');
  const eyeRes = await fetch('https://assisthealthgroup.com/client/search-result-ophthalmology/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Referer': 'https://assisthealthgroup.com/client/ophthalmology-scheduling/',
      'Cookie': sessionCookie,
      'User-Agent': 'Mozilla/5.0',
    },
    body: eyeData.toString(),
    redirect: 'manual',
  });

  const eyeHtml = await eyeRes.text();
  console.log('Status:', eyeRes.status);
  console.log('Has facility:', /facility|center|location|hospital/i.test(eyeHtml));
  console.log('Has price:', /\$[\d,]+/i.test(eyeHtml));
  console.log('Has results:', /result|found|available|schedule|appointment/i.test(eyeHtml));
  console.log('Has error:', /error|invalid|not found|no results/i.test(eyeHtml));

  fs.writeFileSync('/tmp/test-results-ophthalmology.html', eyeHtml);
}
test().catch(console.error);
