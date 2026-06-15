import re

with open('/tmp/ajax-results.html') as f:
    html = f.read()

print('=== Facility Names ===')
for m in re.finditer(r'Facility_Name_([^"]+)"[^>]*>([^<]+)', html):
    print('ID:', m.group(1), 'Name:', m.group(2).strip())

print('\n=== Addresses ===')
for m in re.finditer(r'Facility_Address_Street_([^"]+)"[^>]*>([^<]+)', html):
    print('Street:', m.group(2).strip())
for m in re.finditer(r'Facility_Address_City_([^"]+)"[^>]*>([^<]+)', html):
    print('City:', m.group(2).strip())
for m in re.finditer(r'Facility_Address_State_([^"]+)"[^>]*>([^<]+)', html):
    print('State:', m.group(2).strip())
for m in re.finditer(r'Facility_Address_Zipcode_([^"]+)"[^>]*>([^<]+)', html):
    print('Zip:', m.group(2).strip())

print('\n=== Prices ===')
for m in re.finditer(r'Rate_([^"]+)"[^>]*>([^<]+)', html):
    print('Rate:', m.group(2).strip())

print('\n=== Phone/Fax ===')
for m in re.finditer(r'Facility_Phone[^>]*>([^<]+)', html):
    print('Phone:', m.group(1).strip())
for m in re.finditer(r'Facility_Fax[^>]*>([^<]+)', html):
    print('Fax:', m.group(1).strip())

print('\n=== Facility IDs ===')
for m in re.finditer(r'facility_id_c="([^"]+)"', html):
    print('Facility ID:', m.group(1))
