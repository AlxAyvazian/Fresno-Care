-- Batch: CRL
-- Source: /Users/alexayvazian/CascadeProjects/Network-Map/occu-med-map/data/crl-dedup.xlsx
-- Total records: 37
-- Generated: 2026-06-16 02:47:12.699735


    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_bbdc8f513055d07a2e8b58949f40d0cb',
        'Clinical Reference Laboratory (CRL)',
        '84333 Quivira Road',
        38.961006,
        -94.741453,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(913) 492-3652',
        NULL,
        'United States',
        'Overland',
        'KS',
        '66215',
        'uploaded',
        'uploaded_bbdc8f513055d07a2e8b58949f40d0cb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "84333 Quivira Road", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(913) 492-3652", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Overland", "Zip Code": 66215, "Latitude": 38.961006, "Longitude": -94.741453, "State": "KS", "zipcode UTC": -6, "name": "Clinical Reference Laboratory (CRL)", "address": "84333 Quivira Road", "lat": 38.961006, "lng": -94.741453, "phone": "(913) 492-3652", "country": "United States", "city": "Overland", "state": "KS", "postal_code": 66215, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6e04731428787cb822d661a613119adc',
        'nan',
        'nan',
        38.961006,
        -94.741453,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Overland Park',
        'KS',
        '66215',
        'uploaded',
        'uploaded_6e04731428787cb822d661a613119adc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Overland Park", "Zip Code": 66215, "Latitude": 38.961006, "Longitude": -94.741453, "State": "KS", "zipcode UTC": -6, "name": null, "address": null, "lat": 38.961006, "lng": -94.741453, "phone": null, "country": null, "city": "Overland Park", "state": "KS", "postal_code": 66215, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_bb3290a596e6578f0569d2025c6803e6',
        'Clinical Reference Laboratory (CRL)',
        '1650 Sierra Ave',
        39.109272,
        -121.680336,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(530) 300-9198',
        NULL,
        'United States',
        'Yuba City',
        'CA',
        '95993',
        'uploaded',
        'uploaded_bb3290a596e6578f0569d2025c6803e6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "1650 Sierra Ave", "Address Two": "Ste 105", "clinic Hours of Operation": "Monday-Friday: 8:00 AM - 4:00 PM\n[Walk In from 8:00 AM - 3:30 PM]", "Phone Number": "(530) 300-9198", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Yuba City", "Zip Code": 95993, "Latitude": 39.109272, "Longitude": -121.680336, "State": "CA", "zipcode UTC": -8, "name": "Clinical Reference Laboratory (CRL)", "address": "1650 Sierra Ave", "lat": 39.109272, "lng": -121.680336, "phone": "(530) 300-9198", "country": "United States", "city": "Yuba City", "state": "CA", "postal_code": 95993, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f75452ebcf7944f46b35a987d87f48ae',
        'Clinical Reference Laboratory (CRL)',
        '75 Claremont St F,',
        48.201414,
        -114.322029,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(406) 751-4189',
        NULL,
        'United States',
        'Creston',
        'MT',
        '59901',
        'uploaded',
        'uploaded_f75452ebcf7944f46b35a987d87f48ae',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "75 Claremont St F,", "Address Two": null, "clinic Hours of Operation": "Monday through Friday 7:30 a.m. to 4 p.m.", "Phone Number": "(406) 751-4189", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Creston", "Zip Code": 59901, "Latitude": 48.201414, "Longitude": -114.322029, "State": "MT", "zipcode UTC": -7, "name": "Clinical Reference Laboratory (CRL)", "address": "75 Claremont St F,", "lat": 48.201414, "lng": -114.322029, "phone": "(406) 751-4189", "country": "United States", "city": "Creston", "state": "MT", "postal_code": 59901, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_490b27a249b27f84082ae3934aa7e716',
        'nan',
        'nan',
        48.201414,
        -114.322029,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Evergreen',
        'MT',
        '59901',
        'uploaded',
        'uploaded_490b27a249b27f84082ae3934aa7e716',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Evergreen", "Zip Code": 59901, "Latitude": 48.201414, "Longitude": -114.322029, "State": "MT", "zipcode UTC": -7, "name": null, "address": null, "lat": 48.201414, "lng": -114.322029, "phone": null, "country": null, "city": "Evergreen", "state": "MT", "postal_code": 59901, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ea5e2e95ff2e04b096a8673213a04a1e',
        'Clinical Reference Laboratory (CRL)',
        '4800 College St SE',
        47.027082,
        -122.803595,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(360) 493-4500',
        NULL,
        'United States',
        'Lacey',
        'WA',
        '98503',
        'uploaded',
        'uploaded_ea5e2e95ff2e04b096a8673213a04a1e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "4800 College St SE", "Address Two": null, "clinic Hours of Operation": "Mon - Fri: 8 a.m. - 6 p.m.", "Phone Number": "(360) 493-4500", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Lacey", "Zip Code": 98503, "Latitude": 47.027082, "Longitude": -122.803595, "State": "WA", "zipcode UTC": -8, "name": "Clinical Reference Laboratory (CRL)", "address": "4800 College St SE", "lat": 47.027082, "lng": -122.803595, "phone": "(360) 493-4500", "country": "United States", "city": "Lacey", "state": "WA", "postal_code": 98503, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_dc7cc71e6adc3e7dd1c46df214a05f53',
        'nan',
        'nan',
        47.027082,
        -122.803595,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Olympia',
        'WA',
        '98503',
        'uploaded',
        'uploaded_dc7cc71e6adc3e7dd1c46df214a05f53',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Olympia", "Zip Code": 98503, "Latitude": 47.027082, "Longitude": -122.803595, "State": "WA", "zipcode UTC": -8, "name": null, "address": null, "lat": 47.027082, "lng": -122.803595, "phone": null, "country": null, "city": "Olympia", "state": "WA", "postal_code": 98503, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9d100e9a645af0293f223ba4034458b1',
        'Clinical Reference Laboratory (CRL)',
        '401 W Cantu Rd',
        29.404267,
        -100.881162,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(830) 313-7060',
        NULL,
        'United States',
        'Del Rio',
        'TX',
        '78840',
        'uploaded',
        'uploaded_9d100e9a645af0293f223ba4034458b1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "401 W Cantu Rd", "Address Two": "Suite F", "clinic Hours of Operation": null, "Phone Number": "(830) 313-7060", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Del Rio", "Zip Code": 78840, "Latitude": 29.404267, "Longitude": -100.881162, "State": "TX", "zipcode UTC": -6, "name": "Clinical Reference Laboratory (CRL)", "address": "401 W Cantu Rd", "lat": 29.404267, "lng": -100.881162, "phone": "(830) 313-7060", "country": "United States", "city": "Del Rio", "state": "TX", "postal_code": 78840, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_cc41eec5b77de0ac600194eec419994b',
        'nan',
        'nan',
        29.404267,
        -100.881162,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Laughlin A F B',
        'TX',
        '78840',
        'uploaded',
        'uploaded_cc41eec5b77de0ac600194eec419994b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Laughlin A F B", "Zip Code": 78840, "Latitude": 29.404267, "Longitude": -100.881162, "State": "TX", "zipcode UTC": -6, "name": null, "address": null, "lat": 29.404267, "lng": -100.881162, "phone": null, "country": null, "city": "Laughlin A F B", "state": "TX", "postal_code": 78840, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_661b3c7f01ffb2422316e9ffd490fcc2',
        'Clinical Reference Laboratory (CRL)',
        '397 Warner Milne Rd',
        45.344246,
        -122.584649,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(503) 305-6262',
        NULL,
        'United States',
        'Oregon City',
        'OR',
        '97045',
        'uploaded',
        'uploaded_661b3c7f01ffb2422316e9ffd490fcc2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "397 Warner Milne Rd", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(503) 305-6262", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Oregon City", "Zip Code": 97045, "Latitude": 45.344246, "Longitude": -122.584649, "State": "OR", "zipcode UTC": -8, "name": "Clinical Reference Laboratory (CRL)", "address": "397 Warner Milne Rd", "lat": 45.344246, "lng": -122.584649, "phone": "(503) 305-6262", "country": "United States", "city": "Oregon City", "state": "OR", "postal_code": 97045, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_cf44abeb1fe60fc542a346d584524a42',
        'nan',
        'nan',
        45.344246,
        -122.584649,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Redland',
        'OR',
        '97045',
        'uploaded',
        'uploaded_cf44abeb1fe60fc542a346d584524a42',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Redland", "Zip Code": 97045, "Latitude": 45.344246, "Longitude": -122.584649, "State": "OR", "zipcode UTC": -8, "name": null, "address": null, "lat": 45.344246, "lng": -122.584649, "phone": null, "country": null, "city": "Redland", "state": "OR", "postal_code": 97045, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_a22b8df33c8cc0290a868ac77209c2ae',
        'Clinical Reference Laboratory (CRL)',
        '306 N 6th Ave',
        46.595248,
        -120.531026,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(509) 424-3589',
        NULL,
        'United States',
        'Ahtanum',
        'WA',
        '98902',
        'uploaded',
        'uploaded_a22b8df33c8cc0290a868ac77209c2ae',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "306 N 6th Ave", "Address Two": null, "clinic Hours of Operation": "Monday \u2013 Friday: 9 am to 3 pm \n(Walk-ins accepted until 2:30pm)", "Phone Number": "(509) 424-3589", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Ahtanum", "Zip Code": 98902, "Latitude": 46.595248, "Longitude": -120.531026, "State": "WA", "zipcode UTC": -8, "name": "Clinical Reference Laboratory (CRL)", "address": "306 N 6th Ave", "lat": 46.595248, "lng": -120.531026, "phone": "(509) 424-3589", "country": "United States", "city": "Ahtanum", "state": "WA", "postal_code": 98902, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_48e6a52e2d1b8672531b412381810777',
        'nan',
        'nan',
        46.595248,
        -120.531026,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Fruitvale',
        'WA',
        '98902',
        'uploaded',
        'uploaded_48e6a52e2d1b8672531b412381810777',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Fruitvale", "Zip Code": 98902, "Latitude": 46.595248, "Longitude": -120.531026, "State": "WA", "zipcode UTC": -8, "name": null, "address": null, "lat": 46.595248, "lng": -120.531026, "phone": null, "country": null, "city": "Fruitvale", "state": "WA", "postal_code": 98902, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_599619397e919f471043ce6370a6c51c',
        'Clinical Reference Laboratory (CRL)',
        '310 n 9th Street',
        46.83962,
        -100.772305,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(701) 530-8103',
        NULL,
        'United States',
        'Bis',
        'ND',
        '58501',
        'uploaded',
        'uploaded_599619397e919f471043ce6370a6c51c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "310 n 9th Street", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(701) 530-8103", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Bis", "Zip Code": 58501, "Latitude": 46.83962, "Longitude": -100.772305, "State": "ND", "zipcode UTC": -6, "name": "Clinical Reference Laboratory (CRL)", "address": "310 n 9th Street", "lat": 46.83962, "lng": -100.772305, "phone": "(701) 530-8103", "country": "United States", "city": "Bis", "state": "ND", "postal_code": 58501, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_2b609db8fad8bb75a29691552f55ea20',
        'nan',
        'nan',
        46.83962,
        -100.772305,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Bismarck',
        'ND',
        '58501',
        'uploaded',
        'uploaded_2b609db8fad8bb75a29691552f55ea20',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Bismarck", "Zip Code": 58501, "Latitude": 46.83962, "Longitude": -100.772305, "State": "ND", "zipcode UTC": -6, "name": null, "address": null, "lat": 46.83962, "lng": -100.772305, "phone": null, "country": null, "city": "Bismarck", "state": "ND", "postal_code": 58501, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ad9b8b293261e66ecd68a9e7e0f93a6f',
        'Clinical Reference Laboratory (CRL)',
        '99 Canal Landing Blvd',
        43.214613,
        -77.70626,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(585) 270-8416',
        NULL,
        'United States',
        'Greece',
        'NY',
        '14626',
        'uploaded',
        'uploaded_ad9b8b293261e66ecd68a9e7e0f93a6f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "99 Canal Landing Blvd", "Address Two": "Ste 4A", "clinic Hours of Operation": null, "Phone Number": "(585) 270-8416", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Greece", "Zip Code": 14626, "Latitude": 43.214613, "Longitude": -77.70626, "State": "NY", "zipcode UTC": -5, "name": "Clinical Reference Laboratory (CRL)", "address": "99 Canal Landing Blvd", "lat": 43.214613, "lng": -77.70626, "phone": "(585) 270-8416", "country": "United States", "city": "Greece", "state": "NY", "postal_code": 14626, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_bbbf40688c42287ff1e16e7d1424ef04',
        'nan',
        'nan',
        43.214613,
        -77.70626,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Ridgemont',
        'NY',
        '14626',
        'uploaded',
        'uploaded_bbbf40688c42287ff1e16e7d1424ef04',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ridgemont", "Zip Code": 14626, "Latitude": 43.214613, "Longitude": -77.70626, "State": "NY", "zipcode UTC": -5, "name": null, "address": null, "lat": 43.214613, "lng": -77.70626, "phone": null, "country": null, "city": "Ridgemont", "state": "NY", "postal_code": 14626, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_dcf8c8741322f66f0a16a69948f93783',
        'Clinical Reference Laboratory (CRL)',
        '3410 S Western Ave',
        43.525226,
        -96.732978,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(605) 271-9980',
        NULL,
        'United States',
        'Sioux Falls',
        'SD',
        '57105',
        'uploaded',
        'uploaded_dcf8c8741322f66f0a16a69948f93783',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "3410 S Western Ave", "Address Two": null, "clinic Hours of Operation": "Mon-Fri: 8:00 AM - 5:00 PM\nSat-Sun: CLOSED", "Phone Number": "(605) 271-9980", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Sioux Falls", "Zip Code": 57105, "Latitude": 43.525226, "Longitude": -96.732978, "State": "SD", "zipcode UTC": -6, "name": "Clinical Reference Laboratory (CRL)", "address": "3410 S Western Ave", "lat": 43.525226, "lng": -96.732978, "phone": "(605) 271-9980", "country": "United States", "city": "Sioux Falls", "state": "SD", "postal_code": 57105, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7ed4c0d05710ccabbab464223ba0e7c9',
        'Clinical Reference Laboratory (CRL)',
        '3500 Singing Hills Boulevard',
        42.466292,
        -96.352915,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(712) 274-4250',
        NULL,
        'United States',
        'Sioux City',
        'IA',
        '51106',
        'uploaded',
        'uploaded_7ed4c0d05710ccabbab464223ba0e7c9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "3500 Singing Hills Boulevard", "Address Two": null, "clinic Hours of Operation": "MON - FRI: 8:00 AM to 5:00 PM", "Phone Number": "(712) 274-4250", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Sioux City", "Zip Code": 51106, "Latitude": 42.466292, "Longitude": -96.352915, "State": "IA", "zipcode UTC": -6, "name": "Clinical Reference Laboratory (CRL)", "address": "3500 Singing Hills Boulevard", "lat": 42.466292, "lng": -96.352915, "phone": "(712) 274-4250", "country": "United States", "city": "Sioux City", "state": "IA", "postal_code": 51106, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c7f4bf9a7d741f6eba73ecf94994f272',
        'Clinical Reference Laboratory (CRL)',
        '3475 W Broadway St',
        46.92275,
        -114.076391,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(406) 543-8111',
        NULL,
        'United States',
        'Missoula',
        'MT',
        '59808',
        'uploaded',
        'uploaded_c7f4bf9a7d741f6eba73ecf94994f272',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "3475 W Broadway St", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8:00 AM - 5:00 PM\nLast drug screen at 4:45 PM", "Phone Number": "(406) 543-8111", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Missoula", "Zip Code": 59808, "Latitude": 46.92275, "Longitude": -114.076391, "State": "MT", "zipcode UTC": -7, "name": "Clinical Reference Laboratory (CRL)", "address": "3475 W Broadway St", "lat": 46.92275, "lng": -114.076391, "phone": "(406) 543-8111", "country": "United States", "city": "Missoula", "state": "MT", "postal_code": 59808, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_e5457e7d30f8517fbc9c81686d184ace',
        'nan',
        'nan',
        46.92275,
        -114.076391,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Msla',
        'MT',
        '59808',
        'uploaded',
        'uploaded_e5457e7d30f8517fbc9c81686d184ace',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Msla", "Zip Code": 59808, "Latitude": 46.92275, "Longitude": -114.076391, "State": "MT", "zipcode UTC": -7, "name": null, "address": null, "lat": 46.92275, "lng": -114.076391, "phone": null, "country": null, "city": "Msla", "state": "MT", "postal_code": 59808, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f9bc9f67661aeabfa71eaf8c832a7fea',
        'Clinical Reference Laboratory (CRL)',
        '609 10th Ave S',
        47.476152,
        -111.269091,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(406) 430-1040',
        NULL,
        'United States',
        'Great Falls',
        'MT',
        '59405',
        'uploaded',
        'uploaded_f9bc9f67661aeabfa71eaf8c832a7fea',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "609 10th Ave S", "Address Two": null, "clinic Hours of Operation": "Mon-Fri: 7:00 AM - 5:30 PM\nSat-Sun: 8:00 AM - 1:30 PM\n", "Phone Number": "(406) 430-1040", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Great Falls", "Zip Code": 59405, "Latitude": 47.476152, "Longitude": -111.269091, "State": "MT", "zipcode UTC": -7, "name": "Clinical Reference Laboratory (CRL)", "address": "609 10th Ave S", "lat": 47.476152, "lng": -111.269091, "phone": "(406) 430-1040", "country": "United States", "city": "Great Falls", "state": "MT", "postal_code": 59405, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f673d37b687c9e41b900684e6b5c7490',
        'Clinical Reference Laboratory (CRL)',
        '93 W Colt Square Drive',
        36.107078,
        -94.115927,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(877) 524-4552',
        NULL,
        'United States',
        'Fayetteville',
        'AR',
        '72703',
        'uploaded',
        'uploaded_f673d37b687c9e41b900684e6b5c7490',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "93 W Colt Square Drive", "Address Two": "Suite 6", "clinic Hours of Operation": null, "Phone Number": "(877) 524-4552", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Fayetteville", "Zip Code": 72703, "Latitude": 36.107078, "Longitude": -94.115927, "State": "AR", "zipcode UTC": -6, "name": "Clinical Reference Laboratory (CRL)", "address": "93 W Colt Square Drive", "lat": 36.107078, "lng": -94.115927, "phone": "(877) 524-4552", "country": "United States", "city": "Fayetteville", "state": "AR", "postal_code": 72703, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4e74ea314d2579d42b01773d4b8b58f9',
        'Clinical Reference Laboratory (CRL)',
        '1904 Grant Ave',
        35.844795,
        -90.684432,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(870) 493-3007',
        NULL,
        'United States',
        'Jonesboro',
        'AR',
        '72401',
        'uploaded',
        'uploaded_4e74ea314d2579d42b01773d4b8b58f9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "1904 Grant Ave", "Address Two": "Suite G", "clinic Hours of Operation": null, "Phone Number": "(870) 493-3007", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Jonesboro", "Zip Code": 72401, "Latitude": 35.844795, "Longitude": -90.684432, "State": "AR", "zipcode UTC": -6, "name": "Clinical Reference Laboratory (CRL)", "address": "1904 Grant Ave", "lat": 35.844795, "lng": -90.684432, "phone": "(870) 493-3007", "country": "United States", "city": "Jonesboro", "state": "AR", "postal_code": 72401, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d2e27547ffd47818e50c2e5e6498d82a',
        'Clinical Reference Laboratory (CRL)',
        '3636 N Stockton Hill Rd',
        35.2568,
        -114.0296,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(928) 757-3636',
        NULL,
        'United States',
        'Kingman',
        'AZ',
        '86409',
        'uploaded',
        'uploaded_d2e27547ffd47818e50c2e5e6498d82a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "3636 N Stockton Hill Rd", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(928) 757-3636", "Country": "United States", "Time Zone Display": "MST - Mountain Standard Time", "City": "Kingman", "Zip Code": 86409, "Latitude": 35.2568, "Longitude": -114.0296, "State": "AZ", "zipcode UTC": -7, "name": "Clinical Reference Laboratory (CRL)", "address": "3636 N Stockton Hill Rd", "lat": 35.2568, "lng": -114.0296, "phone": "(928) 757-3636", "country": "United States", "city": "Kingman", "state": "AZ", "postal_code": 86409, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_14b91c3158aa6c52ebff6dc44e7610b3',
        'Clinical Reference Laboratory (CRL)',
        '201 N 8th St',
        32.98975,
        -115.504751,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(760) 356-6032',
        NULL,
        'United States',
        'Brawley',
        'CA',
        '92227',
        'uploaded',
        'uploaded_14b91c3158aa6c52ebff6dc44e7610b3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "201 N 8th St", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(760) 356-6032", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Brawley", "Zip Code": 92227, "Latitude": 32.98975, "Longitude": -115.504751, "State": "CA", "zipcode UTC": -8, "name": "Clinical Reference Laboratory (CRL)", "address": "201 N 8th St", "lat": 32.98975, "lng": -115.504751, "phone": "(760) 356-6032", "country": "United States", "city": "Brawley", "state": "CA", "postal_code": 92227, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_758fdefcf8aaded0e215380fbf1ded8b',
        'Clinical Reference Laboratory (CRL)',
        '625 Demers Ave',
        47.956458,
        -96.987741,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(218) 773-5858',
        NULL,
        'United States',
        'E G Forks',
        'MN',
        '56721',
        'uploaded',
        'uploaded_758fdefcf8aaded0e215380fbf1ded8b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "625 Demers Ave", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(218) 773-5858", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "E G Forks", "Zip Code": 56721, "Latitude": 47.956458, "Longitude": -96.987741, "State": "MN", "zipcode UTC": -6, "name": "Clinical Reference Laboratory (CRL)", "address": "625 Demers Ave", "lat": 47.956458, "lng": -96.987741, "phone": "(218) 773-5858", "country": "United States", "city": "E G Forks", "state": "MN", "postal_code": 56721, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6890a419c00f19fda96d5a390195940c',
        'nan',
        'nan',
        47.956458,
        -96.987741,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'E Grand Forks',
        'MN',
        '56721',
        'uploaded',
        'uploaded_6890a419c00f19fda96d5a390195940c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "E Grand Forks", "Zip Code": 56721, "Latitude": 47.956458, "Longitude": -96.987741, "State": "MN", "zipcode UTC": -6, "name": null, "address": null, "lat": 47.956458, "lng": -96.987741, "phone": null, "country": null, "city": "E Grand Forks", "state": "MN", "postal_code": 56721, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d70b076d8e83c85b14f68a76f31c9bde',
        'Clinical Reference Laboratory (CRL)',
        '1711 W Katella Ave',
        33.818165,
        -117.973043,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(714) 400-2959',
        NULL,
        'United States',
        'Anaheim',
        'CA',
        '92804',
        'uploaded',
        'uploaded_d70b076d8e83c85b14f68a76f31c9bde',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "1711 W Katella Ave", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(714) 400-2959", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Anaheim", "Zip Code": 92804, "Latitude": 33.818165, "Longitude": -117.973043, "State": "CA", "zipcode UTC": -8, "name": "Clinical Reference Laboratory (CRL)", "address": "1711 W Katella Ave", "lat": 33.818165, "lng": -117.973043, "phone": "(714) 400-2959", "country": "United States", "city": "Anaheim", "state": "CA", "postal_code": 92804, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_83b2aa1e2d51537bb6bb446cfe627390',
        'nan',
        'nan',
        33.818165,
        -117.973043,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Brookhurst Center',
        'CA',
        '92804',
        'uploaded',
        'uploaded_83b2aa1e2d51537bb6bb446cfe627390',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Brookhurst Center", "Zip Code": 92804, "Latitude": 33.818165, "Longitude": -117.973043, "State": "CA", "zipcode UTC": -8, "name": null, "address": null, "lat": 33.818165, "lng": -117.973043, "phone": null, "country": null, "city": "Brookhurst Center", "state": "CA", "postal_code": 92804, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4c7f752b97b05df14ae859c663cb9310',
        'Clinical Reference Laboratory (CRL)',
        '1350 Sunset Dr',
        33.77132,
        -89.803019,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(662) 229-0669',
        NULL,
        'United States',
        'Dubard',
        'MS',
        '38901',
        'uploaded',
        'uploaded_4c7f752b97b05df14ae859c663cb9310',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "1350 Sunset Dr", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(662) 229-0669", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Dubard", "Zip Code": 38901, "Latitude": 33.77132, "Longitude": -89.803019, "State": "MS", "zipcode UTC": -6, "name": "Clinical Reference Laboratory (CRL)", "address": "1350 Sunset Dr", "lat": 33.77132, "lng": -89.803019, "phone": "(662) 229-0669", "country": "United States", "city": "Dubard", "state": "MS", "postal_code": 38901, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ebaf6bb1dde1f76444d4e462443c0c13',
        'nan',
        'nan',
        33.77132,
        -89.803019,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Futheyville',
        'MS',
        '38901',
        'uploaded',
        'uploaded_ebaf6bb1dde1f76444d4e462443c0c13',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Futheyville", "Zip Code": 38901, "Latitude": 33.77132, "Longitude": -89.803019, "State": "MS", "zipcode UTC": -6, "name": null, "address": null, "lat": 33.77132, "lng": -89.803019, "phone": null, "country": null, "city": "Futheyville", "state": "MS", "postal_code": 38901, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_06f3386caaef42009d372208357ab3dc',
        'Clinical Reference Laboratory (CRL)',
        '222 N Main St',
        30.941282,
        -94.034557,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(409) 384-1715',
        NULL,
        'United States',
        'Beech Grove',
        'TX',
        '75951',
        'uploaded',
        'uploaded_06f3386caaef42009d372208357ab3dc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "222 N Main St", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(409) 384-1715", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Beech Grove", "Zip Code": 75951, "Latitude": 30.941282, "Longitude": -94.034557, "State": "TX", "zipcode UTC": -6, "name": "Clinical Reference Laboratory (CRL)", "address": "222 N Main St", "lat": 30.941282, "lng": -94.034557, "phone": "(409) 384-1715", "country": "United States", "city": "Beech Grove", "state": "TX", "postal_code": 75951, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_a3b176600d42ac7456689fbc385c9cf8',
        'nan',
        'nan',
        30.941282,
        -94.034557,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Curtis',
        'TX',
        '75951',
        'uploaded',
        'uploaded_a3b176600d42ac7456689fbc385c9cf8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Curtis", "Zip Code": 75951, "Latitude": 30.941282, "Longitude": -94.034557, "State": "TX", "zipcode UTC": -6, "name": null, "address": null, "lat": 30.941282, "lng": -94.034557, "phone": null, "country": null, "city": "Curtis", "state": "TX", "postal_code": 75951, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ab0e2292972b62429d353de0f934d0b9',
        'Clinical Reference Laboratory (CRL)',
        '6582 Boll Weevil Cir',
        31.32579,
        -85.841179,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(334) 347-2027',
        NULL,
        'United States',
        'Enterprise',
        'AL',
        '36330',
        'uploaded',
        'uploaded_ab0e2292972b62429d353de0f934d0b9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "6582 Boll Weevil Cir", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(334) 347-2027", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Enterprise", "Zip Code": 36330, "Latitude": 31.32579, "Longitude": -85.841179, "State": "AL", "zipcode UTC": -6, "name": "Clinical Reference Laboratory (CRL)", "address": "6582 Boll Weevil Cir", "lat": 31.32579, "lng": -85.841179, "phone": "(334) 347-2027", "country": "United States", "city": "Enterprise", "state": "AL", "postal_code": 36330, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_cb6b07ee79af156bf6522b592d4a53dc',
        'nan',
        'nan',
        31.32579,
        -85.841179,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Eprise',
        'AL',
        '36330',
        'uploaded',
        'uploaded_cb6b07ee79af156bf6522b592d4a53dc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Eprise", "Zip Code": 36330, "Latitude": 31.32579, "Longitude": -85.841179, "State": "AL", "zipcode UTC": -6, "name": null, "address": null, "lat": 31.32579, "lng": -85.841179, "phone": null, "country": null, "city": "Eprise", "state": "AL", "postal_code": 36330, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_e378ddcfdeeb1069e0a25f19925d99a7',
        'Clinical Reference Laboratory (CRL)',
        '720 Sunrise Ave',
        38.731976,
        -121.253106,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(916) 315-0100',
        NULL,
        'United States',
        'Roseville',
        'CA',
        '95661',
        'uploaded',
        'uploaded_e378ddcfdeeb1069e0a25f19925d99a7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Clinical Reference Laboratory (CRL)", "Address": "720 Sunrise Ave", "Address Two": "Suite 100", "clinic Hours of Operation": null, "Phone Number": "(916) 315-0100", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Roseville", "Zip Code": 95661, "Latitude": 38.731976, "Longitude": -121.253106, "State": "CA", "zipcode UTC": -8, "name": "Clinical Reference Laboratory (CRL)", "address": "720 Sunrise Ave", "lat": 38.731976, "lng": -121.253106, "phone": "(916) 315-0100", "country": "United States", "city": "Roseville", "state": "CA", "postal_code": 95661, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    
