import pandas as pd
import json
from collections import Counter

# Load expected data
expected = pd.read_excel('/Users/ayvazian/Downloads/bluehive_state_city_counts_combined_no_dc.xlsx')

# Load actual data from JSONL
actual = []
with open('/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map/bluehive_providers.jsonl') as f:
    for line in f:
        if line.strip():
            actual.append(json.loads(line))

# Build actual counts by city
city_counts = Counter()
for r in actual:
    city = str(r.get('city', '')).strip()
    state = str(r.get('state', '')).strip()
    city_key = f"{city}, {state}"
    if city and state:
        city_counts[city_key] += 1

# Merge
expected['Expected Provider Count'] = pd.to_numeric(expected['Expected Provider Count'], errors='coerce')
expected['City'] = expected['City'].astype(str)
expected['State'] = expected['State'].astype(str)
expected['city_key'] = expected['City'] + ', ' + expected['State']
expected['actual_count'] = expected['city_key'].map(lambda x: city_counts.get(x, 0))
expected['diff'] = expected['Expected Provider Count'] - expected['actual_count']
expected['pct'] = (expected['actual_count'] / expected['Expected Provider Count'] * 100).round(1)

# Show biggest gaps
print('Biggest gaps (expected - actual):')
gaps = expected.nlargest(20, 'diff')[['State', 'City', 'Expected Provider Count', 'actual_count', 'diff', 'pct']]
print(gaps.to_string(index=False))
print()
print('Cities with 0 actual but high expected:')
zero_actual = expected[expected['actual_count'] == 0].nlargest(20, 'Expected Provider Count')[['State', 'City', 'Expected Provider Count']]
print(zero_actual.to_string(index=False))

# Also save the full comparison to CSV
expected[['State', 'State Name', 'City', 'Expected Provider Count', 'actual_count', 'diff', 'pct']].to_csv(
    '/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map/bluehive_expected_vs_actual.csv', 
    index=False
)
print('\nSaved full comparison to bluehive_expected_vs_actual.csv')
