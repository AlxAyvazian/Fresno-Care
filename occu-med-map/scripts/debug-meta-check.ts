import { load } from 'cheerio';

const cities = [
  { name: 'New York City', path: '/provider/new-york/new-york-city/' },
  { name: 'Chicago', path: '/provider/illinois/chicago/' },
  { name: 'Houston', path: '/provider/texas/houston/' },
];

for (const city of cities) {
  const url = `https://bluehive.com${city.path}`;
  const res = await fetch(url, {
    headers: {
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    }
  });
  const html = await res.text();
  const $ = load(html);
  
  const metaDesc = $('meta[name="description"]').attr('content');
  const countMatch = metaDesc?.match(/(\d+)\+?\s+occupational/i);
  const count = countMatch ? countMatch[1] : '?';
  
  const links = new Set<string>();
  $('a[href^="/provider/"]').each((_: any, el: any) => {
    const href = $(el).attr('href');
    if (href) links.add(href);
  });
  
  const state = city.path.split('/')[2];
  const providerLinks = [...links].filter((href: string) => {
    const segs = href.replace(/\/$/, '').split('/').filter(Boolean);
    return segs.length === 2 && segs[0] === 'provider' && segs[1] !== state;
  });
  
  console.log(`${city.name}: meta=${count}, scraped=${providerLinks.length}`);
}
