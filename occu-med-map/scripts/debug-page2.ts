import { load } from 'cheerio';

// Try page 2
const url2 = 'https://bluehive.com/provider/california/los-angeles?page=2';
const res2 = await fetch(url2, {
  headers: {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
  }
});
const html2 = await res2.text();
const $2 = load(html2);

const links2 = new Set<string>();
$2('a[href^="/provider/"]').each((_: any, el: any) => {
  const href = $2(el).attr('href');
  if (href) links2.add(href);
});

const stateSegs = ['provider', 'california'];
const ourLinks2 = [...links2].filter((href: string) => {
  const segs = href.replace(/\/$/, '').split('/').filter(Boolean);
  return segs.length === 2 && segs[0] === 'provider' && segs[1] !== stateSegs[1];
});

console.log('Page 2 total links:', links2.size);
console.log('Page 2 provider links:', ourLinks2.length);
if (ourLinks2.length > 0) {
  console.log('Sample page 2 links:', ourLinks2.slice(0, 5));
}

// Also try ?page=1 to compare
const url1 = 'https://bluehive.com/provider/california/los-angeles?page=1';
const res1 = await fetch(url1, {
  headers: {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
  }
});
const html1 = await res1.text();
const $1 = load(html1);

const links1 = new Set<string>();
$1('a[href^="/provider/"]').each((_: any, el: any) => {
  const href = $1(el).attr('href');
  if (href) links1.add(href);
});

const ourLinks1 = [...links1].filter((href: string) => {
  const segs = href.replace(/\/$/, '').split('/').filter(Boolean);
  return segs.length === 2 && segs[0] === 'provider' && segs[1] !== stateSegs[1];
});

console.log('\nPage 1 total links:', links1.size);
console.log('Page 1 provider links:', ourLinks1.length);
