const fs = require('fs');
const cp = JSON.parse(fs.readFileSync('.bluehive-scrape-checkpoint.json', 'utf8'));
const citiesByState = cp.cities;
const providersByCity = cp.providers;

const allCities = [...new Set(Object.values(citiesByState).flat())];
const visitedCities = Object.keys(providersByCity);
const neverVisited = allCities.filter((c) => !visitedCities.includes(c));
const zeroProviderCities = visitedCities.filter((c) => providersByCity[c].length === 0);

console.log('Total cities:', allCities.length);
console.log('Cities visited for providers:', visitedCities.length);
console.log('Cities never visited:', neverVisited.length);
console.log('Cities with 0 providers:', zeroProviderCities.length);

const stateCounts = {};
for (const city of neverVisited) {
  const state = city.split('/')[2];
  stateCounts[state] = (stateCounts[state] || 0) + 1;
}
console.log('\nStates with unvisited cities (top 10):');
const sorted = Object.entries(stateCounts).sort((a, b) => b[1] - a[1]).slice(0, 10);
for (const [s, c] of sorted) {
  console.log('  ' + s + ': ' + c);
}
