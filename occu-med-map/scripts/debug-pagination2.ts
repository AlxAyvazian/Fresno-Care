import { load } from 'cheerio';

const url = 'https://bluehive.com/provider/california/los-angeles/';
const res = await fetch(url, {
  headers: {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
  }
});
const html = await res.text();
const $ = load(html);

// Look for any "page" or "next" related text
const bodyText = $('body').text();
console.log('Contains "Next":', bodyText.includes('Next'));
console.log('Contains "Previous":', bodyText.includes('Previous'));
console.log('Contains "Load more":', bodyText.includes('Load more'));
console.log('Contains "Show more":', bodyText.includes('Show more'));
console.log('Contains "View more":', bodyText.includes('View more'));

// Look for page numbers
const pageMatches = bodyText.match(/page[=\s]\d+/gi);
console.log('Page number matches:', pageMatches ? pageMatches.slice(0, 10) : 'none');

// Check all script tags for pagination hints
$('script').each((_: any, el: any) => {
  const text = $(el).text();
  if (text.includes('page') || text.includes('pagination') || text.includes('total')) {
    const snippet = text.slice(0, 200);
    if (snippet.includes('provider') || snippet.includes('count')) {
      console.log('\nScript snippet:', snippet);
    }
  }
});

// Check for JSON data in the page
const jsonLdScripts = $('script[type="application/ld+json"]');
console.log('\nJSON-LD scripts:', jsonLdScripts.length);
jsonLdScripts.each((_: any, el: any) => {
  try {
    const json = JSON.parse($(el).text());
    if (json['@type'] === 'ItemList' || json.mainEntity) {
      console.log('  Found list data:', JSON.stringify(json).slice(0, 200));
    }
  } catch {}
});
