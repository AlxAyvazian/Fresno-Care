import { load } from 'cheerio';

const url = 'https://bluehive.com/provider/california/los-angeles/';
const res = await fetch(url, {
  headers: {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
  }
});
const html = await res.text();
const $ = load(html);

// Look for pagination
const paginationLinks = $('a[href*="page"], a[href*="?page"], .pagination a, [class*="page"] a, [class*="pagination"] a');
console.log('Pagination links found:', paginationLinks.length);
paginationLinks.each((_: any, el: any) => {
  const href = $(el).attr('href');
  const text = $(el).text().trim();
  console.log(`  "${text}" -> ${href}`);
});

// Look for "Load More" or infinite scroll indicators
const loadMore = $('[class*="load"], [class*="more"], button:contains("More"), button:contains("Load")');
console.log('\nLoad more elements:', loadMore.length);

// Look for data attributes that might indicate total count
console.log('\nLooking for data attributes...');
$('[data-count], [data-total], [data-results]').each((_: any, el: any) => {
  const attrs = (el as any).attribs;
  console.log('  Element:', el.tagName, 'attrs:', JSON.stringify(attrs));
});

// Check if there's a next page link pattern
const allHref = new Set<string>();
$('a[href^="/provider/california/los-angeles"]').each((_: any, el: any) => {
  const href = $(el).attr('href');
  if (href) allHref.add(href);
});
console.log('\nLinks starting with /provider/california/los-angeles:', allHref.size);
[...allHref].forEach(h => console.log(' ', h));
