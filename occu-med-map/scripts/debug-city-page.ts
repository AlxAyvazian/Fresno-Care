import { load } from 'cheerio';

const url = 'https://bluehive.com/provider/california/los-angeles/';
const res = await fetch(url, {
  headers: {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
  }
});
const html = await res.text();
const $ = load(html);

// Count all provider links
const allLinks = new Set<string>();
$('a[href^="/provider/"]').each((_: any, el: any) => {
  const href = $(el).attr('href');
  if (href) allLinks.add(href);
});

// Filter by our extractProviders logic (2 segments, not matching state)
const stateSegs = ['provider', 'california'];
const ourLinks = [...allLinks].filter((href: string) => {
  const segs = href.replace(/\/$/, '').split('/').filter(Boolean);
  return segs.length === 2 && segs[0] === 'provider' && segs[1] !== stateSegs[1];
});

console.log('Total provider links on page:', allLinks.size);
console.log('Links matching our filter:', ourLinks.length);
console.log('\nSample links that DO match our filter:');
ourLinks.slice(0, 10).forEach((l: string) => console.log(' ', l));
console.log('\nSample links that DO NOT match our filter:');
const skipped = [...allLinks].filter((href: string) => !ourLinks.includes(href));
skipped.slice(0, 15).forEach((l: string) => console.log(' ', l));
