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

  // Get scheduling page
  const schedRes = await fetch('https://assisthealthgroup.com/client/schedule-radiology/', {
    headers: {
      'Cookie': sessionCookie,
      'User-Agent': 'Mozilla/5.0',
    },
    redirect: 'manual',
  });
  const schedHtml = await schedRes.text();

  const wpnonce = schedHtml.match(/name="_wpnonce"[^>]*value="([^"]+)"/);
  console.log('Schedule page wpnonce:', wpnonce ? wpnonce[1] : 'none');

  // Submit the form with MRI + zip 32501
  const formData = new URLSearchParams();
  formData.append('Select_Modality', 'MRI');
  formData.append('Select_Bodypart', '0');
  formData.append('Select_Type', '0');
  formData.append('Input_Zipcode_Simple', '32501');
  if (wpnonce) {
    formData.append('_wpnonce', wpnonce[1]);
  }

  const searchRes = await fetch('https://assisthealthgroup.com/client/schedule-radiology/', {
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
  const fs = await import('fs');
  fs.writeFileSync('/tmp/form-submit-result.html', searchHtml);

  console.log('Search status:', searchRes.status);
  console.log('Has facility:', /facility|center|location/i.test(searchHtml));
  console.log('Has price:', /\$[\d,]+/i.test(searchHtml));
  console.log('Has results:', /result|found|available/i.test(searchHtml));
  console.log('Saved to /tmp/form-submit-result.html');
}
test().catch(console.error);
