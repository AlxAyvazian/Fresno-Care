const fs = require('fs');

const checkpointPath = '.bluehive-scrape-checkpoint.json';
const data = JSON.parse(fs.readFileSync(checkpointPath, 'utf8'));

const states = data.states || [];
const citiesByState = data.cities || {};
const providersByCity = data.providers || {};

const allCities = [...new Set(Object.values(citiesByState).flat())];

const statesWithoutCities = states.filter(stateUrl => {
  return !Array.isArray(citiesByState[stateUrl]);
});

const citiesNotVisitedForProviders = allCities.filter(cityUrl => {
  return !(cityUrl in providersByCity);
});

const serviceSlugPattern =
  /chest-x-ray|dot-physical|flu-vaccine|sports-physical|preventive-health-exam|titer-screening|glucose-screening|faa-medical-class|hepatitis-b|pre-placement/i;

const badCityUrls = allCities.filter(cityUrl => serviceSlugPattern.test(cityUrl));

const totalProviderUrls = Object.values(providersByCity).flat().length;

console.log('--- BLUEHIVE CITY COVERAGE CHECK ---');
console.log('States discovered:', states.length);
console.log('States with city arrays:', Object.keys(citiesByState).length);
console.log('Total unique city URLs:', allCities.length);
console.log('Total provider URLs collected from city pages:', totalProviderUrls);
console.log('States missing city list:', statesWithoutCities.length);
console.log('Cities not visited for provider-link collection:', citiesNotVisitedForProviders.length);
console.log('Service-directory URLs accidentally counted as cities:', badCityUrls.length);

if (states.length === 51 &&
    allCities.length === 5935 &&
    statesWithoutCities.length === 0 &&
    citiesNotVisitedForProviders.length === 0 &&
    badCityUrls.length === 0) {
  console.log('\nPASS: All 51 states and all 5,935 city pages were crawled cleanly.');
} else {
  console.log('\nCHECK NEEDED: Something does not match expected city coverage.');
  if (statesWithoutCities.length) {
    console.log('\nStates missing cities:');
    console.log(statesWithoutCities.slice(0, 25));
  }
  if (citiesNotVisitedForProviders.length) {
    console.log('\nCities not visited for provider collection:');
    console.log(citiesNotVisitedForProviders.slice(0, 25));
  }
  if (badCityUrls.length) {
    console.log('\nBad service URLs inside city list:');
    console.log(badCityUrls.slice(0, 25));
  }
}
