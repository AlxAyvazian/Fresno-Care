import { load } from 'cheerio';

const url = 'https://bluehive.com/provider/california/los-angeles/';
const res = await fetch(url, {
  headers: {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
  }
});
const html = await res.text();

// Extract Next.js flight data
const flightMatches = html.match(/self\.__next_f\.push\(\[\d+,"([^"]*)"\]\)/g);
console.log('Flight data chunks:', flightMatches ? flightMatches.length : 0);

if (flightMatches && flightMatches.length > 0) {
  // Look for provider URLs in the flight data
  const allFlightText = flightMatches.join(' ');
  const providerUrls = allFlightText.match(/\/provider\/[^"\s,]+/g);
  if (providerUrls) {
    const unique = [...new Set(providerUrls)];
    console.log('Unique provider URLs in flight data:', unique.length);
    
    // Filter for actual provider profiles (2 segments)
    const profileUrls = unique.filter(u => {
      const segs = u.replace(/\/$/, '').split('/').filter(Boolean);
      return segs.length === 2 && segs[0] === 'provider';
    });
    console.log('Provider profile URLs in flight data:', profileUrls.length);
    console.log('Sample:', profileUrls.slice(0, 10));
  }
}

// Also check for any other script data
const scriptData = html.match(/<script[^>]*>([\s\S]*?)<\/script>/g);
console.log('\nTotal script tags:', scriptData ? scriptData.length : 0);

// Look for provider count in meta or structured data
const $ = load(html);
const metaDesc = $('meta[name="description"]').attr('content');
console.log('\nMeta description:', metaDesc);
