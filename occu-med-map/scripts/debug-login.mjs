async function debug() {
  const getRes = await fetch('https://assisthealthgroup.com/client/', {
    headers: {
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36',
    },
    redirect: 'manual',
  });

  const cookies = getRes.headers.get('set-cookie');
  const html = await getRes.text();

  console.log('GET status:', getRes.status);
  console.log('Cookies:', cookies);

  const nonceMatch = html.match(/name="_wpnonce"[^>]*value="([^"]+)"/);
  const nonce = nonceMatch ? nonceMatch[1] : '';

  const formIdMatch = html.match(/name="form_id"[^>]*value="([^"]+)"/);
  const formId = formIdMatch ? formIdMatch[1] : '6';

  const refererMatch = html.match(/name="_wp_http_referer"[^>]*value="([^"]+)"/);
  const referer = refererMatch ? refererMatch[1] : '/';

  console.log('nonce:', nonce);
  console.log('form_id:', formId);
  console.log('referer:', referer);

  const body = new URLSearchParams();
  body.append('username-6', 'occumed');
  body.append('user_password-6', 'y2GNp1p66o^d*JkT');
  body.append('form_id', formId);
  body.append('_wpnonce', nonce);
  body.append('_wp_http_referer', referer);
  body.append('rememberme', '1');

  const postRes = await fetch('https://assisthealthgroup.com/client/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Referer': 'https://assisthealthgroup.com/client/',
      'Cookie': cookies ? cookies.split(';')[0] : '',
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36',
    },
    body: body.toString(),
    redirect: 'manual',
  });

  const postHtml = await postRes.text();
  const postCookies = postRes.headers.get('set-cookie');

  console.log('\nPOST status:', postRes.status);
  console.log('POST cookies:', postCookies);
  console.log('Location header:', postRes.headers.get('location'));

  const hasLogout = postHtml.includes('logout') || postHtml.includes('Logout');
  const hasUMProfile = postHtml.includes('um-profile') || postHtml.includes('um-account');
  const hasWelcome = /welcome|dashboard|my account/i.test(postHtml);
  const hasError = postHtml.includes('error') || postHtml.includes('incorrect');

  console.log('Has logout link:', hasLogout);
  console.log('Has UM profile:', hasUMProfile);
  console.log('Has welcome text:', hasWelcome);
  console.log('Has error text:', hasError);

  const fs = await import('fs');
  fs.writeFileSync('/tmp/login-response.html', postHtml);
  console.log('\nSaved response to /tmp/login-response.html');
}

debug().catch(console.error);
