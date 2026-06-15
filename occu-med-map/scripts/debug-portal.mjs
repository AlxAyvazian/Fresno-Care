async function debug() {
  const fs = await import('fs');

  // Helper to extract cookies like the scraper does
  function extractCookies(setCookieHeader) {
    if (!setCookieHeader) return '';
    const parts = setCookieHeader.split(/,\s*(?=[^,]+=)/);
    return parts.map((p) => p.split(';')[0].trim()).join('; ');
  }

  // Step 1: Login
  console.log('=== Logging in ===');
  const getRes = await fetch('https://assisthealthgroup.com/client/', {
    headers: {
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36',
    },
    redirect: 'manual',
  });

  const initialCookies = extractCookies(getRes.headers.get('set-cookie'));
  const loginHtml = await getRes.text();

  const nonceMatch = loginHtml.match(/name="_wpnonce"[^>]*value="([^"]+)"/);
  const nonce = nonceMatch ? nonceMatch[1] : '';
  const refererMatch = loginHtml.match(/name="_wp_http_referer"[^>]*value="([^"]+)"/);
  const referer = refererMatch ? refererMatch[1] : '/';

  const body = new URLSearchParams();
  body.append('username-6', 'occumed');
  body.append('user_password-6', 'y2GNp1p66o^d*JkT');
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
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36',
    },
    body: body.toString(),
    redirect: 'manual',
  });

  const sessionCookie = extractCookies(postRes.headers.get('set-cookie'));
  console.log('Logged in. Cookies present:', sessionCookie.includes('wordpress_logged_in'));

  // Step 2: Explore portal pages
  const pages = [
    '/client-home/',
    '/schedule-radiology/',
    '/schedule-gastroenterology/',
    '/laboratory-scheduling/',
    '/ophthalmology-scheduling/',
    '/schedule-surgery/',
    '/status-radiology/',
    '/status-gastroenterology/',
    '/status-laboratory/',
  ];

  for (const page of pages) {
    console.log(`\n=== ${page} ===`);
    try {
      const res = await fetch(`https://assisthealthgroup.com/client${page}`, {
        headers: {
          'Cookie': sessionCookie,
          'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36',
        },
        redirect: 'manual',
      });
      const html = await res.text();
      const titleMatch = html.match(/<title>([^<]+)<\/title>/i);
      console.log('Status:', res.status, 'Title:', titleMatch ? titleMatch[1].trim() : 'No title');

      // Look for facility/location/pricing indicators
      const hasFacility = /facility|center|location|imaging center|hospital/i.test(html);
      const hasPrice = /\$[\d,]+|price|cost|rate|fee/i.test(html);
      const hasForm = /<form/i.test(html);
      const hasTable = /<table/i.test(html);
      console.log('Has facility refs:', hasFacility, 'Has prices:', hasPrice, 'Has form:', hasForm, 'Has table:', hasTable);

      fs.writeFileSync(`/tmp/portal-${page.replace(/\//g, '-')}.html`, html);
    } catch (err) {
      console.log('Error:', err.message);
    }
  }
}

debug().catch(console.error);
