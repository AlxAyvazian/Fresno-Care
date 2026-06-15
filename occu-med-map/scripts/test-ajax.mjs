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
  console.log('Logged in:', sessionCookie.includes('wordpress_logged_in'));

  // Call the AJAX endpoint for search results
  const ajaxData = new URLSearchParams();
  ajaxData.append('Input_Study_Search[]', '70450');
  ajaxData.append('Input_Zipcode_Simple', '32501');
  ajaxData.append('Sort', 'Distance');
  ajaxData.append('Input_Template', 'AHG_Client');
  ajaxData.append('Distance', '50');
  ajaxData.append('ra_payor_id', '99313');
  ajaxData.append('ra_affiliate_id', '');

  console.log('\n=== Calling AJAX endpoint ===');
  const ajaxRes = await fetch('https://radiologyassist.com/js/Update_Search_Results/Update_Search_Results.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Referer': 'https://assisthealthgroup.com/client/ra-search-results/',
      'Cookie': sessionCookie,
      'User-Agent': 'Mozilla/5.0',
    },
    body: ajaxData.toString(),
  });

  const ajaxHtml = await ajaxRes.text();
  console.log('AJAX status:', ajaxRes.status);
  console.log('Length:', ajaxHtml.length);
  console.log('Has facility:', /facility|center|location/i.test(ajaxHtml));
  console.log('Has price:', /\$[\d,]+/i.test(ajaxHtml));

  const fs = await import('fs');
  fs.writeFileSync('/tmp/ajax-results.html', ajaxHtml);

  // Show first 2000 chars
  console.log('\n=== First 3000 chars ===');
  console.log(ajaxHtml.slice(0, 3000));
}
test().catch(console.error);
