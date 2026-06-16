-- Batch: MainStreet Family Care
-- Source: /Users/alexayvazian/CascadeProjects/Network-Map/occu-med-map/data/mainstreet-family-care-dedup.xlsx
-- Total records: 111
-- Generated: 2026-06-16 02:44:25.791436


    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_32b19314f891d8dfd2cfe36bfd539b8c',
        'MainStreet Family Care',
        '1531 3rd Ave N',
        33.519055,
        -86.809707,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(205) 913-6544',
        NULL,
        'United States',
        'Birmingham',
        'AL',
        '35203.0',
        'uploaded',
        'uploaded_32b19314f891d8dfd2cfe36bfd539b8c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1531 3rd Ave N", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(205) 913-6544", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Birmingham", "Zip Code": 35203.0, "Latitude": 33.519055, "Longitude": -86.809707, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "1531 3rd Ave N", "lat": 33.519055, "lng": -86.809707, "phone": "(205) 913-6544", "country": "United States", "city": "Birmingham", "state": "AL", "postal_code": 35203.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_11e96e29bcd5331f56272aeb91d11f33',
        'MainStreet Family Care',
        '2508 Hwy 280',
        32.903432,
        -85.926699,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(256) 414-3013',
        NULL,
        'United States',
        'Alex City',
        'AL',
        '35010.0',
        'uploaded',
        'uploaded_11e96e29bcd5331f56272aeb91d11f33',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "2508 Hwy 280", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(256) 414-3013", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Alex City", "Zip Code": 35010.0, "Latitude": 32.903432, "Longitude": -85.926699, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "2508 Hwy 280", "lat": 32.903432, "lng": -85.926699, "phone": "(256) 414-3013", "country": "United States", "city": "Alex City", "state": "AL", "postal_code": 35010.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_bd5d45bdcd857f7f3da8fdab97e99c0a',
        'nan',
        'nan',
        32.903432,
        -85.926699,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Alexander City',
        'AL',
        '35010.0',
        'uploaded',
        'uploaded_bd5d45bdcd857f7f3da8fdab97e99c0a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Alexander City", "Zip Code": 35010.0, "Latitude": 32.903432, "Longitude": -85.926699, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.903432, "lng": -85.926699, "phone": null, "country": null, "city": "Alexander City", "state": "AL", "postal_code": 35010.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_0db3347d8d07b8744b86904a863e002b',
        'MainStreet Family Care',
        '508 East 3 Notch St ',
        31.279043,
        -86.486996,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(334) 362-2015',
        NULL,
        'United States',
        'Andalusia',
        'AL',
        '36420.0',
        'uploaded',
        'uploaded_0db3347d8d07b8744b86904a863e002b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "508 East 3 Notch St ", "Address Two": "Suite 100", "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(334) 362-2015", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Andalusia", "Zip Code": 36420.0, "Latitude": 31.279043, "Longitude": -86.486996, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "508 East 3 Notch St ", "lat": 31.279043, "lng": -86.486996, "phone": "(334) 362-2015", "country": "United States", "city": "Andalusia", "state": "AL", "postal_code": 36420.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_2384f7b5d8df52e2a25d489ff841c65b',
        'nan',
        'nan',
        31.279043,
        -86.486996,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Dixie',
        'AL',
        '36420.0',
        'uploaded',
        'uploaded_2384f7b5d8df52e2a25d489ff841c65b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Dixie", "Zip Code": 36420.0, "Latitude": 31.279043, "Longitude": -86.486996, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 31.279043, "lng": -86.486996, "phone": null, "country": null, "city": "Dixie", "state": "AL", "postal_code": 36420.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_474d06c3cec616ec830c49b3e3b4298b',
        'MainStreet Family Care',
        '1420 Brindlee Mountain Parkway ',
        nan,
        nan,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(256) 677-4553',
        NULL,
        'United States',
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_474d06c3cec616ec830c49b3e3b4298b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1420 Brindlee Mountain Parkway ", "Address Two": "Suite A-1", "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(256) 677-4553", "Country": "United States", "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "MainStreet Family Care", "address": "1420 Brindlee Mountain Parkway ", "lat": null, "lng": null, "phone": "(256) 677-4553", "country": "United States", "city": null, "state": null, "postal_code": null, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_0e7303529238f6290661426b954e6d90',
        'MainStreet Family Care',
        '2134 Douglas Ave',
        31.129008,
        -87.10173,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(251) 236-4026',
        NULL,
        'United States',
        'Brewton',
        'AL',
        '36426.0',
        'uploaded',
        'uploaded_0e7303529238f6290661426b954e6d90',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "2134 Douglas Ave", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(251) 236-4026", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Brewton", "Zip Code": 36426.0, "Latitude": 31.129008, "Longitude": -87.10173, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "2134 Douglas Ave", "lat": 31.129008, "lng": -87.10173, "phone": "(251) 236-4026", "country": "United States", "city": "Brewton", "state": "AL", "postal_code": 36426.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_bdfe702e6ab662e80658dc4f305da440',
        'nan',
        'nan',
        31.129008,
        -87.10173,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Damascus',
        'AL',
        '36426.0',
        'uploaded',
        'uploaded_bdfe702e6ab662e80658dc4f305da440',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Damascus", "Zip Code": 36426.0, "Latitude": 31.129008, "Longitude": -87.10173, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 31.129008, "lng": -87.10173, "phone": null, "country": null, "city": "Damascus", "state": "AL", "postal_code": 36426.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_282c5d40e23beb45dd8ae22c127d2f48',
        'MainStreet Family Care',
        '1925 West Main Street ',
        34.141067,
        -85.604726,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(256) 677-4552',
        NULL,
        'United States',
        'Centre',
        'AL',
        '35960.0',
        'uploaded',
        'uploaded_282c5d40e23beb45dd8ae22c127d2f48',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1925 West Main Street ", "Address Two": "Suite 102", "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(256) 677-4552", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Centre", "Zip Code": 35960.0, "Latitude": 34.141067, "Longitude": -85.604726, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "1925 West Main Street ", "lat": 34.141067, "lng": -85.604726, "phone": "(256) 677-4552", "country": "United States", "city": "Centre", "state": "AL", "postal_code": 35960.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_b0f680f67255520c592635b5feecac49',
        'MainStreet Family Care',
        '3071 South Oates St',
        31.180076,
        -85.404509,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(334) 500-5044',
        NULL,
        'United States',
        'Dothan',
        'AL',
        '36301.0',
        'uploaded',
        'uploaded_b0f680f67255520c592635b5feecac49',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "3071 South Oates St", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(334) 500-5044", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Dothan", "Zip Code": 36301.0, "Latitude": 31.180076, "Longitude": -85.404509, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "3071 South Oates St", "lat": 31.180076, "lng": -85.404509, "phone": "(334) 500-5044", "country": "United States", "city": "Dothan", "state": "AL", "postal_code": 36301.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_8802b743cd13f88b258534d6af984bcd',
        'nan',
        'nan',
        31.180076,
        -85.404509,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Grimes',
        'AL',
        '36301.0',
        'uploaded',
        'uploaded_8802b743cd13f88b258534d6af984bcd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Grimes", "Zip Code": 36301.0, "Latitude": 31.180076, "Longitude": -85.404509, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 31.180076, "lng": -85.404509, "phone": null, "country": null, "city": "Grimes", "state": "AL", "postal_code": 36301.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_2fa10872b4386c0b074d87e8328ce51a',
        'MainStreet Family Care',
        '1026 South Eufaula Ave',
        31.876168,
        -85.173627,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(334) 689-4025',
        NULL,
        'United States',
        'Bakerhill',
        'AL',
        '36027.0',
        'uploaded',
        'uploaded_2fa10872b4386c0b074d87e8328ce51a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1026 South Eufaula Ave", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(334) 689-4025", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Bakerhill", "Zip Code": 36027.0, "Latitude": 31.876168, "Longitude": -85.173627, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "1026 South Eufaula Ave", "lat": 31.876168, "lng": -85.173627, "phone": "(334) 689-4025", "country": "United States", "city": "Bakerhill", "state": "AL", "postal_code": 36027.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_16d510f803b7d420530c31d4284f18a4',
        'nan',
        'nan',
        31.876168,
        -85.173627,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Eufaula',
        'AL',
        '36027.0',
        'uploaded',
        'uploaded_16d510f803b7d420530c31d4284f18a4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Eufaula", "Zip Code": 36027.0, "Latitude": 31.876168, "Longitude": -85.173627, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 31.876168, "lng": -85.173627, "phone": null, "country": null, "city": "Eufaula", "state": "AL", "postal_code": 36027.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_01f217eee597ca2acefbe8f70f2ec657',
        'MainStreet Family Care',
        '1401 Al Hwy 14',
        32.492335,
        -86.366926,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(334) 310-6059',
        NULL,
        'United States',
        'Millbrook',
        'AL',
        '36054.0',
        'uploaded',
        'uploaded_01f217eee597ca2acefbe8f70f2ec657',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1401 Al Hwy 14", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(334) 310-6059", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Millbrook", "Zip Code": 36054.0, "Latitude": 32.492335, "Longitude": -86.366926, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "1401 Al Hwy 14", "lat": 32.492335, "lng": -86.366926, "phone": "(334) 310-6059", "country": "United States", "city": "Millbrook", "state": "AL", "postal_code": 36054.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_7758c369202d3beb7c3569e8d9712530',
        'MainStreet Family Care',
        '1195 South Alabama Ave',
        31.509039,
        -87.32416,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(334) 689-4025',
        NULL,
        'United States',
        'Monroeville',
        'AL',
        '36460.0',
        'uploaded',
        'uploaded_7758c369202d3beb7c3569e8d9712530',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1195 South Alabama Ave", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(334) 689-4025", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Monroeville", "Zip Code": 36460.0, "Latitude": 31.509039, "Longitude": -87.32416, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "1195 South Alabama Ave", "lat": 31.509039, "lng": -87.32416, "phone": "(334) 689-4025", "country": "United States", "city": "Monroeville", "state": "AL", "postal_code": 36460.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_2dafff3af72d2fc7c8ba9ea061d4e124',
        'nan',
        'nan',
        31.509039,
        -87.32416,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Mville',
        'AL',
        '36460.0',
        'uploaded',
        'uploaded_2dafff3af72d2fc7c8ba9ea061d4e124',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Mville", "Zip Code": 36460.0, "Latitude": 31.509039, "Longitude": -87.32416, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 31.509039, "lng": -87.32416, "phone": null, "country": null, "city": "Mville", "state": "AL", "postal_code": 36460.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_414733a8283ca8101a725eea4d1781c2',
        'MainStreet Family Care',
        '2211 Moody Parkway',
        33.606379,
        -86.502492,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(205) 352-2480',
        NULL,
        'United States',
        'Acmar',
        'AL',
        '35004.0',
        'uploaded',
        'uploaded_414733a8283ca8101a725eea4d1781c2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "2211 Moody Parkway", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(205) 352-2480", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Acmar", "Zip Code": 35004.0, "Latitude": 33.606379, "Longitude": -86.502492, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "2211 Moody Parkway", "lat": 33.606379, "lng": -86.502492, "phone": "(205) 352-2480", "country": "United States", "city": "Acmar", "state": "AL", "postal_code": 35004.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_0cb58eae3be75e13d3e38152ebe12564',
        'nan',
        'nan',
        33.606379,
        -86.502492,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Moody',
        'AL',
        '35004.0',
        'uploaded',
        'uploaded_0cb58eae3be75e13d3e38152ebe12564',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Moody", "Zip Code": 35004.0, "Latitude": 33.606379, "Longitude": -86.502492, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 33.606379, "lng": -86.502492, "phone": null, "country": null, "city": "Moody", "state": "AL", "postal_code": 35004.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_05688e0699a43e93620690e30af12102',
        'MainStreet Family Care',
        '2022 2nd Avenue East',
        33.944897,
        -86.458134,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(205) 625-3650',
        NULL,
        'United States',
        'Highland Lake',
        'AL',
        '35121.0',
        'uploaded',
        'uploaded_05688e0699a43e93620690e30af12102',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "2022 2nd Avenue East", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(205) 625-3650", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Highland Lake", "Zip Code": 35121.0, "Latitude": 33.944897, "Longitude": -86.458134, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "2022 2nd Avenue East", "lat": 33.944897, "lng": -86.458134, "phone": "(205) 625-3650", "country": "United States", "city": "Highland Lake", "state": "AL", "postal_code": 35121.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_69df11d7ec759502c08af97ab3cd33ca',
        'nan',
        'nan',
        33.944897,
        -86.458134,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Hoods Crossroads',
        'AL',
        '35121.0',
        'uploaded',
        'uploaded_69df11d7ec759502c08af97ab3cd33ca',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Hoods Crossroads", "Zip Code": 35121.0, "Latitude": 33.944897, "Longitude": -86.458134, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 33.944897, "lng": -86.458134, "phone": null, "country": null, "city": "Hoods Crossroads", "state": "AL", "postal_code": 35121.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_bb76209a04d155ea84fe853a20554491',
        'MainStreet Family Care',
        '1475 Al Hwy 14 East',
        32.419846,
        -86.977836,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(334) 526-3240',
        NULL,
        'United States',
        'Selma',
        'AL',
        '36703.0',
        'uploaded',
        'uploaded_bb76209a04d155ea84fe853a20554491',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1475 Al Hwy 14 East", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(334) 526-3240", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Selma", "Zip Code": 36703.0, "Latitude": 32.419846, "Longitude": -86.977836, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "1475 Al Hwy 14 East", "lat": 32.419846, "lng": -86.977836, "phone": "(334) 526-3240", "country": "United States", "city": "Selma", "state": "AL", "postal_code": 36703.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_48858b451b553ccbc4de87657db3ecfa',
        'nan',
        'nan',
        32.419846,
        -86.977836,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Valley Grande',
        'AL',
        '36703.0',
        'uploaded',
        'uploaded_48858b451b553ccbc4de87657db3ecfa',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Valley Grande", "Zip Code": 36703.0, "Latitude": 32.419846, "Longitude": -86.977836, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.419846, "lng": -86.977836, "phone": null, "country": null, "city": "Valley Grande", "state": "AL", "postal_code": 36703.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_2af938f488cf46299ddd1db9540b4b3b',
        'MainStreet Family Care',
        '40900 Us Hwy 280',
        33.185782,
        -86.251059,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(334) 526-3240',
        NULL,
        'United States',
        'Oak Grove',
        'AL',
        '35150.0',
        'uploaded',
        'uploaded_2af938f488cf46299ddd1db9540b4b3b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "40900 Us Hwy 280", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(334) 526-3240", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Oak Grove", "Zip Code": 35150.0, "Latitude": 33.185782, "Longitude": -86.251059, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "40900 Us Hwy 280", "lat": 33.185782, "lng": -86.251059, "phone": "(334) 526-3240", "country": "United States", "city": "Oak Grove", "state": "AL", "postal_code": 35150.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_b9b262d881ea216964b8a37dd040bc72',
        'nan',
        'nan',
        33.185782,
        -86.251059,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Sylacauga',
        'AL',
        '35150.0',
        'uploaded',
        'uploaded_b9b262d881ea216964b8a37dd040bc72',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Sylacauga", "Zip Code": 35150.0, "Latitude": 33.185782, "Longitude": -86.251059, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 33.185782, "lng": -86.251059, "phone": null, "country": null, "city": "Sylacauga", "state": "AL", "postal_code": 35150.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_58eefb7840392efeed8f449da10785ea',
        'MainStreet Family Care',
        '837 East Battle Street',
        33.415449,
        -86.109085,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(256) 649-8134',
        NULL,
        'United States',
        'Talladega',
        'AL',
        '35160.0',
        'uploaded',
        'uploaded_58eefb7840392efeed8f449da10785ea',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "837 East Battle Street", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(256) 649-8134", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Talladega", "Zip Code": 35160.0, "Latitude": 33.415449, "Longitude": -86.109085, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "837 East Battle Street", "lat": 33.415449, "lng": -86.109085, "phone": "(256) 649-8134", "country": "United States", "city": "Talladega", "state": "AL", "postal_code": 35160.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_abe278a238260e71b6011e8691514f3f',
        'MainStreet Family Care',
        '3306 20th Avenue',
        32.777662,
        -85.176236,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(334) 756-0305',
        NULL,
        'United States',
        'Fairfax',
        'AL',
        '36854.0',
        'uploaded',
        'uploaded_abe278a238260e71b6011e8691514f3f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "3306 20th Avenue", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(334) 756-0305", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Fairfax", "Zip Code": 36854.0, "Latitude": 32.777662, "Longitude": -85.176236, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "3306 20th Avenue", "lat": 32.777662, "lng": -85.176236, "phone": "(334) 756-0305", "country": "United States", "city": "Fairfax", "state": "AL", "postal_code": 36854.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_54d2af93038211f9aff576430e67f4f9',
        'nan',
        'nan',
        32.777662,
        -85.176236,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Langdale',
        'AL',
        '36854.0',
        'uploaded',
        'uploaded_54d2af93038211f9aff576430e67f4f9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Langdale", "Zip Code": 36854.0, "Latitude": 32.777662, "Longitude": -85.176236, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.777662, "lng": -85.176236, "phone": null, "country": null, "city": "Langdale", "state": "AL", "postal_code": 36854.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_61ac26a76c6cbd636920018fc45d5905',
        'MainStreet Family Care',
        '6280 Grelot Rd.',
        30.662735,
        -88.162551,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(251) 288-5606',
        NULL,
        'United States',
        'Mobile',
        'AL',
        '36609.0',
        'uploaded',
        'uploaded_61ac26a76c6cbd636920018fc45d5905',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "6280 Grelot Rd.", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-9PM", "Phone Number": "(251) 288-5606", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Mobile", "Zip Code": 36609.0, "Latitude": 30.662735, "Longitude": -88.162551, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "6280 Grelot Rd.", "lat": 30.662735, "lng": -88.162551, "phone": "(251) 288-5606", "country": "United States", "city": "Mobile", "state": "AL", "postal_code": 36609.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_d57bfb22d26c0df4003fbae3b1c718b7',
        'MainStreet Family Care',
        '153 N. Florida St. ',
        30.699539,
        -88.104749,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(251) 328-4621',
        NULL,
        'United States',
        'Mobile',
        'AL',
        '36607.0',
        'uploaded',
        'uploaded_d57bfb22d26c0df4003fbae3b1c718b7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "153 N. Florida St. ", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(251) 328-4621", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Mobile", "Zip Code": 36607.0, "Latitude": 30.699539, "Longitude": -88.104749, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "153 N. Florida St. ", "lat": 30.699539, "lng": -88.104749, "phone": "(251) 328-4621", "country": "United States", "city": "Mobile", "state": "AL", "postal_code": 36607.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_35d2968acffa85ab20cd49e23c0613bc',
        'MainStreet Family Care',
        '3039 Vaughn Rd',
        32.354888,
        -86.271616,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(334) 513-7819',
        NULL,
        'United States',
        'Montgomery',
        'AL',
        '36106.0',
        'uploaded',
        'uploaded_35d2968acffa85ab20cd49e23c0613bc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "3039 Vaughn Rd", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-9PM", "Phone Number": "(334) 513-7819", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Montgomery", "Zip Code": 36106.0, "Latitude": 32.354888, "Longitude": -86.271616, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "3039 Vaughn Rd", "lat": 32.354888, "lng": -86.271616, "phone": "(334) 513-7819", "country": "United States", "city": "Montgomery", "state": "AL", "postal_code": 36106.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_e00cf7f44450e80b93e5c10e2f546080',
        'nan',
        'nan',
        32.354888,
        -86.271616,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Mtgy',
        'AL',
        '36106.0',
        'uploaded',
        'uploaded_e00cf7f44450e80b93e5c10e2f546080',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Mtgy", "Zip Code": 36106.0, "Latitude": 32.354888, "Longitude": -86.271616, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.354888, "lng": -86.271616, "phone": null, "country": null, "city": "Mtgy", "state": "AL", "postal_code": 36106.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_76d40dde7e5dbe766c91927320dbba18',
        'MainStreet Family Care',
        '3116 Parliament Circle',
        32.31324,
        -86.236722,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(334) 651-8685',
        NULL,
        'United States',
        'Montgomery',
        'AL',
        '36116.0',
        'uploaded',
        'uploaded_76d40dde7e5dbe766c91927320dbba18',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "3116 Parliament Circle", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(334) 651-8685", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Montgomery", "Zip Code": 36116.0, "Latitude": 32.31324, "Longitude": -86.236722, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "3116 Parliament Circle", "lat": 32.31324, "lng": -86.236722, "phone": "(334) 651-8685", "country": "United States", "city": "Montgomery", "state": "AL", "postal_code": 36116.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_2aec46333e92341097a09389810d4155',
        'nan',
        'nan',
        32.31324,
        -86.236722,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Mtgy',
        'AL',
        '36116.0',
        'uploaded',
        'uploaded_2aec46333e92341097a09389810d4155',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Mtgy", "Zip Code": 36116.0, "Latitude": 32.31324, "Longitude": -86.236722, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.31324, "lng": -86.236722, "phone": null, "country": null, "city": "Mtgy", "state": "AL", "postal_code": 36116.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_228ece6b306a43e8689cecc1196f0a91',
        'MainStreet Family Care',
        '300 Big Mountain Road',
        33.317471,
        -86.787269,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(205) 644-8289',
        NULL,
        'United States',
        'Indian Spgs',
        'AL',
        '35124.0',
        'uploaded',
        'uploaded_228ece6b306a43e8689cecc1196f0a91',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "300 Big Mountain Road", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-9PM", "Phone Number": "(205) 644-8289", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Indian Spgs", "Zip Code": 35124.0, "Latitude": 33.317471, "Longitude": -86.787269, "State": "AL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "300 Big Mountain Road", "lat": 33.317471, "lng": -86.787269, "phone": "(205) 644-8289", "country": "United States", "city": "Indian Spgs", "state": "AL", "postal_code": 35124.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_84fc0e405564bf1f887896c2921c7122',
        'nan',
        'nan',
        33.317471,
        -86.787269,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Indian Springs',
        'AL',
        '35124.0',
        'uploaded',
        'uploaded_84fc0e405564bf1f887896c2921c7122',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Indian Springs", "Zip Code": 35124.0, "Latitude": 33.317471, "Longitude": -86.787269, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 33.317471, "lng": -86.787269, "phone": null, "country": null, "city": "Indian Springs", "state": "AL", "postal_code": 35124.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_0b95eb0e2274e394d5da30d7826bbb36',
        'MainStreet Family Care',
        '16314 Nw Us Hwy 441',
        29.801949,
        -82.488725,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(386) 518-2418',
        NULL,
        'United States',
        'Alachua',
        'FL',
        '32615.0',
        'uploaded',
        'uploaded_0b95eb0e2274e394d5da30d7826bbb36',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "16314 Nw Us Hwy 441", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(386) 518-2418", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Alachua", "Zip Code": 32615.0, "Latitude": 29.801949, "Longitude": -82.488725, "State": "FL", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "16314 Nw Us Hwy 441", "lat": 29.801949, "lng": -82.488725, "phone": "(386) 518-2418", "country": "United States", "city": "Alachua", "state": "FL", "postal_code": 32615.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_6cf91a2673c74fc3e00ca7788c5724e1',
        'nan',
        'nan',
        29.801949,
        -82.488725,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Santa Fe',
        'FL',
        '32615.0',
        'uploaded',
        'uploaded_6cf91a2673c74fc3e00ca7788c5724e1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Santa Fe", "Zip Code": 32615.0, "Latitude": 29.801949, "Longitude": -82.488725, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 29.801949, "lng": -82.488725, "phone": null, "country": null, "city": "Santa Fe", "state": "FL", "postal_code": 32615.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_d80cc3b2935552fc91456b4f9c45953a',
        'MainStreet Family Care',
        '542435 Us Highway 1',
        30.567684,
        -81.840511,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(904) 507-4623',
        NULL,
        'United States',
        'Callahan',
        'FL',
        '32011.0',
        'uploaded',
        'uploaded_d80cc3b2935552fc91456b4f9c45953a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "542435 Us Highway 1", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(904) 507-4623", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Callahan", "Zip Code": 32011.0, "Latitude": 30.567684, "Longitude": -81.840511, "State": "FL", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "542435 Us Highway 1", "lat": 30.567684, "lng": -81.840511, "phone": "(904) 507-4623", "country": "United States", "city": "Callahan", "state": "FL", "postal_code": 32011.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_5cb8e9aeec8fac43e867778d84f76cb6',
        'MainStreet Family Care',
        '1702 Ohio Ave. N',
        30.2943,
        -82.9871,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(386) 219-4462',
        NULL,
        'United States',
        'Dowling Park',
        'FL',
        '32064.0',
        'uploaded',
        'uploaded_5cb8e9aeec8fac43e867778d84f76cb6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1702 Ohio Ave. N", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(386) 219-4462", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dowling Park", "Zip Code": 32064.0, "Latitude": 30.2943, "Longitude": -82.9871, "State": "FL", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "1702 Ohio Ave. N", "lat": 30.2943, "lng": -82.9871, "phone": "(386) 219-4462", "country": "United States", "city": "Dowling Park", "state": "FL", "postal_code": 32064.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_1c66d8219ce3cba0577e5b1038930ca2',
        'nan',
        'nan',
        30.2943,
        -82.9871,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Live Oak',
        'FL',
        '32064.0',
        'uploaded',
        'uploaded_1c66d8219ce3cba0577e5b1038930ca2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Live Oak", "Zip Code": 32064.0, "Latitude": 30.2943, "Longitude": -82.9871, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 30.2943, "lng": -82.9871, "phone": null, "country": null, "city": "Live Oak", "state": "FL", "postal_code": 32064.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_530d6a65eda7e263971b02241b48195b',
        'MainStreet Family Care',
        '9545 Fl-228',
        30.267664,
        -82.124577,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(904) 774-1041',
        NULL,
        'United States',
        'Macclenny',
        'FL',
        '32063.0',
        'uploaded',
        'uploaded_530d6a65eda7e263971b02241b48195b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "9545 Fl-228", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(904) 774-1041", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Macclenny", "Zip Code": 32063.0, "Latitude": 30.267664, "Longitude": -82.124577, "State": "FL", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "9545 Fl-228", "lat": 30.267664, "lng": -82.124577, "phone": "(904) 774-1041", "country": "United States", "city": "Macclenny", "state": "FL", "postal_code": 32063.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_2776d23ecb53dcd1572a0cdff73bd828',
        'MainStreet Family Care',
        '5861 Dogwood Dr',
        30.70969,
        -87.010988,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(229) 400-9033',
        NULL,
        'United States',
        'Milton',
        'FL',
        '32570.0',
        'uploaded',
        'uploaded_2776d23ecb53dcd1572a0cdff73bd828',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "5861 Dogwood Dr", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(229) 400-9033", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Milton", "Zip Code": 32570.0, "Latitude": 30.70969, "Longitude": -87.010988, "State": "FL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "5861 Dogwood Dr", "lat": 30.70969, "lng": -87.010988, "phone": "(229) 400-9033", "country": "United States", "city": "Milton", "state": "FL", "postal_code": 32570.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_bad37895cff9cb326f4b4a38b3c0564a',
        'MainStreet Family Care',
        '16 Bahia Ave Pl',
        29.120287,
        -82.02133,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(229) 307-2075',
        NULL,
        'United States',
        'Maricamp',
        'FL',
        '34472.0',
        'uploaded',
        'uploaded_bad37895cff9cb326f4b4a38b3c0564a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "16 Bahia Ave Pl", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(229) 307-2075", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Maricamp", "Zip Code": 34472.0, "Latitude": 29.120287, "Longitude": -82.02133, "State": "FL", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "16 Bahia Ave Pl", "lat": 29.120287, "lng": -82.02133, "phone": "(229) 307-2075", "country": "United States", "city": "Maricamp", "state": "FL", "postal_code": 34472.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_7d831b752fe068f18dc4425c639b032c',
        'nan',
        'nan',
        29.120287,
        -82.02133,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Ocala',
        'FL',
        '34472.0',
        'uploaded',
        'uploaded_7d831b752fe068f18dc4425c639b032c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ocala", "Zip Code": 34472.0, "Latitude": 29.120287, "Longitude": -82.02133, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 29.120287, "lng": -82.02133, "phone": null, "country": null, "city": "Ocala", "state": "FL", "postal_code": 34472.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_ba71f195c1d057468dc26502b01ec622',
        'MainStreet Family Care',
        '10251 Sorrento Rd',
        30.360887,
        -87.334516,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(706) 225-8773',
        NULL,
        'United States',
        'Pensacola',
        'FL',
        '32507.0',
        'uploaded',
        'uploaded_ba71f195c1d057468dc26502b01ec622',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "10251 Sorrento Rd", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(706) 225-8773", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Pensacola", "Zip Code": 32507.0, "Latitude": 30.360887, "Longitude": -87.334516, "State": "FL", "zipcode UTC": -6.0, "name": "MainStreet Family Care", "address": "10251 Sorrento Rd", "lat": 30.360887, "lng": -87.334516, "phone": "(706) 225-8773", "country": "United States", "city": "Pensacola", "state": "FL", "postal_code": 32507.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_f716014d68f44b5c1f2c439056567e0b',
        'nan',
        'nan',
        30.360887,
        -87.334516,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Perdido Key',
        'FL',
        '32507.0',
        'uploaded',
        'uploaded_f716014d68f44b5c1f2c439056567e0b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Perdido Key", "Zip Code": 32507.0, "Latitude": 30.360887, "Longitude": -87.334516, "State": "FL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 30.360887, "lng": -87.334516, "phone": null, "country": null, "city": "Perdido Key", "state": "FL", "postal_code": 32507.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_74ad4e337be89738007e5832db9b7a01',
        'MainStreet Family Care',
        '1730 Pat Thomas Parkway',
        30.573563,
        -84.614704,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(850) 662-0041',
        NULL,
        'United States',
        'Quincy',
        'FL',
        '32351.0',
        'uploaded',
        'uploaded_74ad4e337be89738007e5832db9b7a01',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1730 Pat Thomas Parkway", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM TO 8PM\nSAT-SUN: 9AM TO 4PM", "Phone Number": "(850) 662-0041", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Quincy", "Zip Code": 32351.0, "Latitude": 30.573563, "Longitude": -84.614704, "State": "FL", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "1730 Pat Thomas Parkway", "lat": 30.573563, "lng": -84.614704, "phone": "(850) 662-0041", "country": "United States", "city": "Quincy", "state": "FL", "postal_code": 32351.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_f4e4a84aef7fc221b83f58802622c87e',
        'MainStreet Family Care',
        '14044 Se 48th Ave',
        29.937512,
        -82.11706,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(904) 263-5422',
        NULL,
        'United States',
        'Kingsley Lake',
        'FL',
        '32091.0',
        'uploaded',
        'uploaded_f4e4a84aef7fc221b83f58802622c87e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "14044 Se 48th Ave", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(904) 263-5422", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Kingsley Lake", "Zip Code": 32091.0, "Latitude": 29.937512, "Longitude": -82.11706, "State": "FL", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "14044 Se 48th Ave", "lat": 29.937512, "lng": -82.11706, "phone": "(904) 263-5422", "country": "United States", "city": "Kingsley Lake", "state": "FL", "postal_code": 32091.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_0002061e0f353a9d246fb782f9c2f798',
        'nan',
        'nan',
        29.937512,
        -82.11706,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Kngsly Lk',
        'FL',
        '32091.0',
        'uploaded',
        'uploaded_0002061e0f353a9d246fb782f9c2f798',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Kngsly Lk", "Zip Code": 32091.0, "Latitude": 29.937512, "Longitude": -82.11706, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 29.937512, "lng": -82.11706, "phone": null, "country": null, "city": "Kngsly Lk", "state": "FL", "postal_code": 32091.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_3dc6489e7ad8f76788dac75c9a2d8d74',
        'MainStreet Family Care',
        '2264 Nw 43rd St',
        29.676006,
        -82.368897,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(352) 642-8258',
        NULL,
        'United States',
        'Gainesville',
        'FL',
        '32605.0',
        'uploaded',
        'uploaded_3dc6489e7ad8f76788dac75c9a2d8d74',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "2264 Nw 43rd St", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(352) 642-8258", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Gainesville", "Zip Code": 32605.0, "Latitude": 29.676006, "Longitude": -82.368897, "State": "FL", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "2264 Nw 43rd St", "lat": 29.676006, "lng": -82.368897, "phone": "(352) 642-8258", "country": "United States", "city": "Gainesville", "state": "FL", "postal_code": 32605.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_3e9bbb877e0b3e6eaa7d8fcfbe7ab7ab',
        'MainStreet Family Care',
        '2516 N. Monroe St. ',
        30.486061,
        -84.315281,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(352) 642-8258',
        NULL,
        'United States',
        'Tallahassee',
        'FL',
        '32303.0',
        'uploaded',
        'uploaded_3e9bbb877e0b3e6eaa7d8fcfbe7ab7ab',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "2516 N. Monroe St. ", "Address Two": "Suite #1", "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(352) 642-8258", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Tallahassee", "Zip Code": 32303.0, "Latitude": 30.486061, "Longitude": -84.315281, "State": "FL", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "2516 N. Monroe St. ", "lat": 30.486061, "lng": -84.315281, "phone": "(352) 642-8258", "country": "United States", "city": "Tallahassee", "state": "FL", "postal_code": 32303.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_43193f1a16a3165e16a7b5ae85d12b29',
        'MainStreet Family Care',
        '1408 Tallahassee Hwy',
        nan,
        nan,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(229) 400-9033',
        NULL,
        'United States',
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_43193f1a16a3165e16a7b5ae85d12b29',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1408 Tallahassee Hwy", "Address Two": "Suite Z", "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(229) 400-9033", "Country": "United States", "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "MainStreet Family Care", "address": "1408 Tallahassee Hwy", "lat": null, "lng": null, "phone": "(229) 400-9033", "country": "United States", "city": null, "state": null, "postal_code": null, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_b56da31f6d39a1a2d191296faaf9f3d8',
        'MainStreet Family Care',
        '440 Us Highway 84 E',
        30.8496,
        -84.2149,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(229) 307-2075',
        NULL,
        'United States',
        'Cairo',
        'GA',
        '39828.0',
        'uploaded',
        'uploaded_b56da31f6d39a1a2d191296faaf9f3d8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "440 Us Highway 84 E", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(229) 307-2075", "Country": "United States", "Time Zone Display": "EST - Eastern Standard Time", "City": "Cairo", "Zip Code": 39828.0, "Latitude": 30.8496, "Longitude": -84.2149, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "440 Us Highway 84 E", "lat": 30.8496, "lng": -84.2149, "phone": "(229) 307-2075", "country": "United States", "city": "Cairo", "state": "GA", "postal_code": 39828.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_42295122a45d59468c693e6a2e1b6b97',
        'nan',
        'nan',
        30.8496,
        -84.2149,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Cario',
        'GA',
        '39828.0',
        'uploaded',
        'uploaded_42295122a45d59468c693e6a2e1b6b97',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EST - Eastern Standard Time", "City": "Cario", "Zip Code": 39828.0, "Latitude": 30.8496, "Longitude": -84.2149, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 30.8496, "lng": -84.2149, "phone": null, "country": null, "city": "Cario", "state": "GA", "postal_code": 39828.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_d3315ebd3a775340f807324c912525da',
        'MainStreet Family Care',
        '3201 Macon Road',
        32.468442,
        -84.951282,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(706) 225-8773',
        NULL,
        'United States',
        'Cols',
        'GA',
        '31906.0',
        'uploaded',
        'uploaded_d3315ebd3a775340f807324c912525da',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "3201 Macon Road", "Address Two": "Suite 109", "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(706) 225-8773", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cols", "Zip Code": 31906.0, "Latitude": 32.468442, "Longitude": -84.951282, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "3201 Macon Road", "lat": 32.468442, "lng": -84.951282, "phone": "(706) 225-8773", "country": "United States", "city": "Cols", "state": "GA", "postal_code": 31906.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_004d20e214919bd66397c1e213fdbf75',
        'nan',
        'nan',
        32.468442,
        -84.951282,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Columbus',
        'GA',
        '31906.0',
        'uploaded',
        'uploaded_004d20e214919bd66397c1e213fdbf75',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Columbus", "Zip Code": 31906.0, "Latitude": 32.468442, "Longitude": -84.951282, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.468442, "lng": -84.951282, "phone": null, "country": null, "city": "Columbus", "state": "GA", "postal_code": 31906.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_71532681b418c418ab45ac08d2925fea',
        'MainStreet Family Care',
        '3615 Browns Bridge Rd. ',
        34.247,
        -84.1812,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(678) 456-4273',
        NULL,
        'United States',
        'Cumming',
        'GA',
        '30028.0',
        'uploaded',
        'uploaded_71532681b418c418ab45ac08d2925fea',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "3615 Browns Bridge Rd. ", "Address Two": "Suite A ", "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(678) 456-4273", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cumming", "Zip Code": 30028.0, "Latitude": 34.247, "Longitude": -84.1812, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "3615 Browns Bridge Rd. ", "lat": 34.247, "lng": -84.1812, "phone": "(678) 456-4273", "country": "United States", "city": "Cumming", "state": "GA", "postal_code": 30028.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_a2d4c17f7ee4d5f9d97cd2da43908eb9',
        'MainStreet Family Care',
        '25 Highland Crossing S',
        34.688716,
        -84.467161,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(706) 273-1954',
        NULL,
        'United States',
        'East Ellijay',
        'GA',
        '30540.0',
        'uploaded',
        'uploaded_a2d4c17f7ee4d5f9d97cd2da43908eb9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "25 Highland Crossing S", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(706) 273-1954", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "East Ellijay", "Zip Code": 30540.0, "Latitude": 34.688716, "Longitude": -84.467161, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "25 Highland Crossing S", "lat": 34.688716, "lng": -84.467161, "phone": "(706) 273-1954", "country": "United States", "city": "East Ellijay", "state": "GA", "postal_code": 30540.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_5fe0afcff7a493ef8941ccc2f5d3e208',
        'nan',
        'nan',
        34.688716,
        -84.467161,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Ellijay',
        'GA',
        '30540.0',
        'uploaded',
        'uploaded_5fe0afcff7a493ef8941ccc2f5d3e208',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ellijay", "Zip Code": 30540.0, "Latitude": 34.688716, "Longitude": -84.467161, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.688716, "lng": -84.467161, "phone": null, "country": null, "city": "Ellijay", "state": "GA", "postal_code": 30540.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_07bd4ddc26457c125b70450839a9c1df',
        'MainStreet Family Care',
        '125 Benjamin H Hill Dr Sw',
        31.720029,
        -83.250932,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(229) 635-4004',
        NULL,
        'United States',
        'Fitzgerald',
        'GA',
        '31750.0',
        'uploaded',
        'uploaded_07bd4ddc26457c125b70450839a9c1df',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "125 Benjamin H Hill Dr Sw", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(229) 635-4004", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Fitzgerald", "Zip Code": 31750.0, "Latitude": 31.720029, "Longitude": -83.250932, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "125 Benjamin H Hill Dr Sw", "lat": 31.720029, "lng": -83.250932, "phone": "(229) 635-4004", "country": "United States", "city": "Fitzgerald", "state": "GA", "postal_code": 31750.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_545165368d68bb8f779418e25c79f3b3',
        'MainStreet Family Care',
        '162 East Jarman St.',
        31.844772,
        -82.598099,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(912) 209-0239',
        NULL,
        'United States',
        'Hazlehurst',
        'GA',
        '31539.0',
        'uploaded',
        'uploaded_545165368d68bb8f779418e25c79f3b3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "162 East Jarman St.", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(912) 209-0239", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hazlehurst", "Zip Code": 31539.0, "Latitude": 31.844772, "Longitude": -82.598099, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "162 East Jarman St.", "lat": 31.844772, "lng": -82.598099, "phone": "(912) 209-0239", "country": "United States", "city": "Hazlehurst", "state": "GA", "postal_code": 31539.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_c14e49157cc7c68970e1dcca6b7214fd',
        'nan',
        'nan',
        31.844772,
        -82.598099,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Roper',
        'GA',
        '31539.0',
        'uploaded',
        'uploaded_c14e49157cc7c68970e1dcca6b7214fd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Roper", "Zip Code": 31539.0, "Latitude": 31.844772, "Longitude": -82.598099, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 31.844772, "lng": -82.598099, "phone": null, "country": null, "city": "Roper", "state": "GA", "postal_code": 31539.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_1d2cad13e99f48e0ff5772cbb888aaf8',
        'MainStreet Family Care',
        '1028 West Oglethorpe Hwy',
        31.828575,
        -81.616173,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(912) 255-4057',
        NULL,
        'United States',
        'Flemington',
        'GA',
        '31313.0',
        'uploaded',
        'uploaded_1d2cad13e99f48e0ff5772cbb888aaf8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1028 West Oglethorpe Hwy", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(912) 255-4057", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Flemington", "Zip Code": 31313.0, "Latitude": 31.828575, "Longitude": -81.616173, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "1028 West Oglethorpe Hwy", "lat": 31.828575, "lng": -81.616173, "phone": "(912) 255-4057", "country": "United States", "city": "Flemington", "state": "GA", "postal_code": 31313.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_a387c4dda15ff9ce29aedc8caaa96a91',
        'nan',
        'nan',
        31.828575,
        -81.616173,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Fort Stewart',
        'GA',
        '31313.0',
        'uploaded',
        'uploaded_a387c4dda15ff9ce29aedc8caaa96a91',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Fort Stewart", "Zip Code": 31313.0, "Latitude": 31.828575, "Longitude": -81.616173, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 31.828575, "lng": -81.616173, "phone": null, "country": null, "city": "Fort Stewart", "state": "GA", "postal_code": 31313.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_ebfe129c279beaeb8b4300aa75c86c3a',
        'MainStreet Family Care',
        '1245 Noah Dr',
        34.454934,
        -84.415833,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(706) 253-1954',
        NULL,
        'United States',
        'Big Canoe',
        'GA',
        '30143.0',
        'uploaded',
        'uploaded_ebfe129c279beaeb8b4300aa75c86c3a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1245 Noah Dr", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(706) 253-1954", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Big Canoe", "Zip Code": 30143.0, "Latitude": 34.454934, "Longitude": -84.415833, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "1245 Noah Dr", "lat": 34.454934, "lng": -84.415833, "phone": "(706) 253-1954", "country": "United States", "city": "Big Canoe", "state": "GA", "postal_code": 30143.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_b13924492863317de91dbce8bd62a69a',
        'nan',
        'nan',
        34.454934,
        -84.415833,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Jasper',
        'GA',
        '30143.0',
        'uploaded',
        'uploaded_b13924492863317de91dbce8bd62a69a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Jasper", "Zip Code": 30143.0, "Latitude": 34.454934, "Longitude": -84.415833, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.454934, "lng": -84.415833, "phone": null, "country": null, "city": "Jasper", "state": "GA", "postal_code": 30143.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_1fd58e36b78623cf4c68b8fe66f6bc80',
        'MainStreet Family Care',
        '2531 N. Columbia St.',
        33.083579,
        -83.233976,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(478) 387-2097',
        NULL,
        'United States',
        'Milledgeville',
        'GA',
        '31061.0',
        'uploaded',
        'uploaded_1fd58e36b78623cf4c68b8fe66f6bc80',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "2531 N. Columbia St.", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(478) 387-2097", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Milledgeville", "Zip Code": 31061.0, "Latitude": 33.083579, "Longitude": -83.233976, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "2531 N. Columbia St.", "lat": 33.083579, "lng": -83.233976, "phone": "(478) 387-2097", "country": "United States", "city": "Milledgeville", "state": "GA", "postal_code": 31061.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_379412f030d026670e6ace9ef80a3dde',
        'nan',
        'nan',
        33.083579,
        -83.233976,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Mville',
        'GA',
        '31061.0',
        'uploaded',
        'uploaded_379412f030d026670e6ace9ef80a3dde',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Mville", "Zip Code": 31061.0, "Latitude": 33.083579, "Longitude": -83.233976, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 33.083579, "lng": -83.233976, "phone": null, "country": null, "city": "Mville", "state": "GA", "postal_code": 31061.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_253d86b716a915fedaf93bb5e2d7c56a',
        'MainStreet Family Care',
        '14336 Us-19',
        30.883208,
        -83.912374,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(229) 233-6705',
        NULL,
        'United States',
        'Thomasville',
        'GA',
        '31757.0',
        'uploaded',
        'uploaded_253d86b716a915fedaf93bb5e2d7c56a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "14336 Us-19", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM", "Phone Number": "(229) 233-6705", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Thomasville", "Zip Code": 31757.0, "Latitude": 30.883208, "Longitude": -83.912374, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "14336 Us-19", "lat": 30.883208, "lng": -83.912374, "phone": "(229) 233-6705", "country": "United States", "city": "Thomasville", "state": "GA", "postal_code": 31757.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_d923c9c638d541d74eb9cc0476e4696f',
        'nan',
        'nan',
        30.883208,
        -83.912374,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Tville',
        'GA',
        '31757.0',
        'uploaded',
        'uploaded_d923c9c638d541d74eb9cc0476e4696f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Tville", "Zip Code": 31757.0, "Latitude": 30.883208, "Longitude": -83.912374, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 30.883208, "lng": -83.912374, "phone": null, "country": null, "city": "Tville", "state": "GA", "postal_code": 31757.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_ad01ef0e2da91be60d9118b691e4f70b',
        'MainStreet Family Care',
        '4250 Lexington Road',
        33.925085,
        -83.34529,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(706) 395-3675',
        NULL,
        'United States',
        'Athens',
        'GA',
        '30605.0',
        'uploaded',
        'uploaded_ad01ef0e2da91be60d9118b691e4f70b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "4250 Lexington Road", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(706) 395-3675", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Athens", "Zip Code": 30605.0, "Latitude": 33.925085, "Longitude": -83.34529, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "4250 Lexington Road", "lat": 33.925085, "lng": -83.34529, "phone": "(706) 395-3675", "country": "United States", "city": "Athens", "state": "GA", "postal_code": 30605.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_cb3fb07ccc653b7ce327afcba77e2d7b',
        'MainStreet Family Care',
        '3910 Washington Rd. ',
        33.512541,
        -82.094915,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(706) 664-0767',
        NULL,
        'United States',
        'Augusta',
        'GA',
        '30907.0',
        'uploaded',
        'uploaded_cb3fb07ccc653b7ce327afcba77e2d7b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "3910 Washington Rd. ", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-9PM", "Phone Number": "(706) 664-0767", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Augusta", "Zip Code": 30907.0, "Latitude": 33.512541, "Longitude": -82.094915, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "3910 Washington Rd. ", "lat": 33.512541, "lng": -82.094915, "phone": "(706) 664-0767", "country": "United States", "city": "Augusta", "state": "GA", "postal_code": 30907.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_ed4fbe946da48483d5a7c391dd742453',
        'nan',
        'nan',
        33.512541,
        -82.094915,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Martinez',
        'GA',
        '30907.0',
        'uploaded',
        'uploaded_ed4fbe946da48483d5a7c391dd742453',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Martinez", "Zip Code": 30907.0, "Latitude": 33.512541, "Longitude": -82.094915, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 33.512541, "lng": -82.094915, "phone": null, "country": null, "city": "Martinez", "state": "GA", "postal_code": 30907.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_2fc9b2b919807da42beaf6a6621e6680',
        'MainStreet Family Care',
        '6999 Abercorn Street',
        32.043058,
        -81.121833,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(912) 228-3523',
        NULL,
        'United States',
        'Garden City',
        'GA',
        '31405.0',
        'uploaded',
        'uploaded_2fc9b2b919807da42beaf6a6621e6680',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "6999 Abercorn Street", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(912) 228-3523", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Garden City", "Zip Code": 31405.0, "Latitude": 32.043058, "Longitude": -81.121833, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "6999 Abercorn Street", "lat": 32.043058, "lng": -81.121833, "phone": "(912) 228-3523", "country": "United States", "city": "Garden City", "state": "GA", "postal_code": 31405.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_7c50ca6c402c2627fcd688fec8e10571',
        'nan',
        'nan',
        32.043058,
        -81.121833,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Garden Cty',
        'GA',
        '31405.0',
        'uploaded',
        'uploaded_7c50ca6c402c2627fcd688fec8e10571',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Garden Cty", "Zip Code": 31405.0, "Latitude": 32.043058, "Longitude": -81.121833, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.043058, "lng": -81.121833, "phone": null, "country": null, "city": "Garden Cty", "state": "GA", "postal_code": 31405.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_186bec58ae5a9e1c04ae317753f02330',
        'MainStreet Family Care',
        '1609 Norman Drive',
        30.807279,
        -83.286614,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(229) 262-3149',
        NULL,
        'United States',
        'Clyattville',
        'GA',
        '31601.0',
        'uploaded',
        'uploaded_186bec58ae5a9e1c04ae317753f02330',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1609 Norman Drive", "Address Two": "Ste A", "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(229) 262-3149", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Clyattville", "Zip Code": 31601.0, "Latitude": 30.807279, "Longitude": -83.286614, "State": "GA", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "1609 Norman Drive", "lat": 30.807279, "lng": -83.286614, "phone": "(229) 262-3149", "country": "United States", "city": "Clyattville", "state": "GA", "postal_code": 31601.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_b59860028418fd9ced730e30fd546477',
        'nan',
        'nan',
        30.807279,
        -83.286614,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Dasher',
        'GA',
        '31601.0',
        'uploaded',
        'uploaded_b59860028418fd9ced730e30fd546477',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dasher", "Zip Code": 31601.0, "Latitude": 30.807279, "Longitude": -83.286614, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 30.807279, "lng": -83.286614, "phone": null, "country": null, "city": "Dasher", "state": "GA", "postal_code": 31601.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_ffc3f4378699fee001faccd8a753fe41',
        'MainStreet Family Care',
        '2151 N. Church St.',
        36.132737,
        -79.411357,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(336) 329-0959',
        NULL,
        'United States',
        'Burlington',
        'NC',
        '27217.0',
        'uploaded',
        'uploaded_ffc3f4378699fee001faccd8a753fe41',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "2151 N. Church St.", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(336) 329-0959", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Burlington", "Zip Code": 27217.0, "Latitude": 36.132737, "Longitude": -79.411357, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "2151 N. Church St.", "lat": 36.132737, "lng": -79.411357, "phone": "(336) 329-0959", "country": "United States", "city": "Burlington", "state": "NC", "postal_code": 27217.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_36cdd7beee9505c91eda2118685e4ef7',
        'nan',
        'nan',
        36.132737,
        -79.411357,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Green Level',
        'NC',
        '27217.0',
        'uploaded',
        'uploaded_36cdd7beee9505c91eda2118685e4ef7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Green Level", "Zip Code": 27217.0, "Latitude": 36.132737, "Longitude": -79.411357, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 36.132737, "lng": -79.411357, "phone": null, "country": null, "city": "Green Level", "state": "NC", "postal_code": 27217.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_bcf26d44b4d176fbae4da2d35677b403',
        'MainStreet Family Care',
        '190 Lexie Ln',
        35.278125,
        -79.151536,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(910) 493-3819',
        NULL,
        'United States',
        'Cameron',
        'NC',
        '28326.0',
        'uploaded',
        'uploaded_bcf26d44b4d176fbae4da2d35677b403',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "190 Lexie Ln", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(910) 493-3819", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cameron", "Zip Code": 28326.0, "Latitude": 35.278125, "Longitude": -79.151536, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "190 Lexie Ln", "lat": 35.278125, "lng": -79.151536, "phone": "(910) 493-3819", "country": "United States", "city": "Cameron", "state": "NC", "postal_code": 28326.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_99cd3780ef7f687417ecc923e125a1e2',
        'MainStreet Family Care',
        '2501 Lincolnton Hwy',
        35.383935,
        -81.39368,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(704) 445-7162',
        NULL,
        'United States',
        'Cherryville',
        'NC',
        '28021.0',
        'uploaded',
        'uploaded_99cd3780ef7f687417ecc923e125a1e2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "2501 Lincolnton Hwy", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(704) 445-7162", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cherryville", "Zip Code": 28021.0, "Latitude": 35.383935, "Longitude": -81.39368, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "2501 Lincolnton Hwy", "lat": 35.383935, "lng": -81.39368, "phone": "(704) 445-7162", "country": "United States", "city": "Cherryville", "state": "NC", "postal_code": 28021.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_fcdcc15bc12d1bc8c3ef77867e898eeb',
        'nan',
        'nan',
        35.383935,
        -81.39368,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Flay',
        'NC',
        '28021.0',
        'uploaded',
        'uploaded_fcdcc15bc12d1bc8c3ef77867e898eeb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Flay", "Zip Code": 28021.0, "Latitude": 35.383935, "Longitude": -81.39368, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.383935, "lng": -81.39368, "phone": null, "country": null, "city": "Flay", "state": "NC", "postal_code": 28021.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_f91b518e66ee71edab4a750a443b5765',
        'MainStreet Family Care',
        '150 Parkview Center Cir',
        35.635275,
        -78.448906,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(919) 585-5025',
        NULL,
        'United States',
        'Archers Lodge',
        'NC',
        '27520.0',
        'uploaded',
        'uploaded_f91b518e66ee71edab4a750a443b5765',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "150 Parkview Center Cir", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(919) 585-5025", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Archers Lodge", "Zip Code": 27520.0, "Latitude": 35.635275, "Longitude": -78.448906, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "150 Parkview Center Cir", "lat": 35.635275, "lng": -78.448906, "phone": "(919) 585-5025", "country": "United States", "city": "Archers Lodge", "state": "NC", "postal_code": 27520.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_26fd73d4a0019057a5e71cb39ba11dcc',
        'nan',
        'nan',
        35.635275,
        -78.448906,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Clayton',
        'NC',
        '27520.0',
        'uploaded',
        'uploaded_26fd73d4a0019057a5e71cb39ba11dcc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Clayton", "Zip Code": 27520.0, "Latitude": 35.635275, "Longitude": -78.448906, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.635275, "lng": -78.448906, "phone": null, "country": null, "city": "Clayton", "state": "NC", "postal_code": 27520.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_5361cd1d536d9d9bba06cd635b2b823d',
        'MainStreet Family Care',
        '25 Professional Park',
        35.322849,
        -78.689641,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(910) 292-4097',
        NULL,
        'United States',
        'Erwin',
        'NC',
        '28339.0',
        'uploaded',
        'uploaded_5361cd1d536d9d9bba06cd635b2b823d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "25 Professional Park", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(910) 292-4097", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Erwin", "Zip Code": 28339.0, "Latitude": 35.322849, "Longitude": -78.689641, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "25 Professional Park", "lat": 35.322849, "lng": -78.689641, "phone": "(910) 292-4097", "country": "United States", "city": "Erwin", "state": "NC", "postal_code": 28339.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_1325fd15e7d1ec6e69c739151b6e5012',
        'MainStreet Family Care',
        '187 Lowes Blvd.',
        35.317602,
        -81.867223,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(706) 395-3675',
        NULL,
        'United States',
        'Alexander Mills',
        'NC',
        '28043.0',
        'uploaded',
        'uploaded_1325fd15e7d1ec6e69c739151b6e5012',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "187 Lowes Blvd.", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(706) 395-3675", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Alexander Mills", "Zip Code": 28043.0, "Latitude": 35.317602, "Longitude": -81.867223, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "187 Lowes Blvd.", "lat": 35.317602, "lng": -81.867223, "phone": "(706) 395-3675", "country": "United States", "city": "Alexander Mills", "state": "NC", "postal_code": 28043.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_d2c0c4f2d367391ae0fb6f3c773e8573',
        'nan',
        'nan',
        35.317602,
        -81.867223,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Alexander Mls',
        'NC',
        '28043.0',
        'uploaded',
        'uploaded_d2c0c4f2d367391ae0fb6f3c773e8573',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Alexander Mls", "Zip Code": 28043.0, "Latitude": 35.317602, "Longitude": -81.867223, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.317602, "lng": -81.867223, "phone": null, "country": null, "city": "Alexander Mls", "state": "NC", "postal_code": 28043.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_09128d933dc1d4b6f02f4308280a53ad',
        'MainStreet Family Care',
        '203 S Myrtle School Road',
        35.248787,
        -81.2142,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(706) 664-0767',
        NULL,
        'United States',
        'Boogertown',
        'NC',
        '28052.0',
        'uploaded',
        'uploaded_09128d933dc1d4b6f02f4308280a53ad',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "203 S Myrtle School Road", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-9PM", "Phone Number": "(706) 664-0767", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Boogertown", "Zip Code": 28052.0, "Latitude": 35.248787, "Longitude": -81.2142, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "203 S Myrtle School Road", "lat": 35.248787, "lng": -81.2142, "phone": "(706) 664-0767", "country": "United States", "city": "Boogertown", "state": "NC", "postal_code": 28052.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_ac9e66c2d1499b9d93477608a7cf1b95',
        'nan',
        'nan',
        35.248787,
        -81.2142,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Crowders',
        'NC',
        '28052.0',
        'uploaded',
        'uploaded_ac9e66c2d1499b9d93477608a7cf1b95',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Crowders", "Zip Code": 28052.0, "Latitude": 35.248787, "Longitude": -81.2142, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.248787, "lng": -81.2142, "phone": null, "country": null, "city": "Crowders", "state": "NC", "postal_code": 28052.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_a9649c582de3bc7f372d0936f7e21344',
        'MainStreet Family Care',
        '132 Nc 581',
        35.384344,
        -78.008931,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(919) 921-9960',
        NULL,
        'United States',
        'Goldsboro',
        'NC',
        '27530.0',
        'uploaded',
        'uploaded_a9649c582de3bc7f372d0936f7e21344',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "132 Nc 581", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(919) 921-9960", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Goldsboro", "Zip Code": 27530.0, "Latitude": 35.384344, "Longitude": -78.008931, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "132 Nc 581", "lat": 35.384344, "lng": -78.008931, "phone": "(919) 921-9960", "country": "United States", "city": "Goldsboro", "state": "NC", "postal_code": 27530.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_de7b1052cdf6be108e60c06040614605',
        'nan',
        'nan',
        35.384344,
        -78.008931,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Patetown',
        'NC',
        '27530.0',
        'uploaded',
        'uploaded_de7b1052cdf6be108e60c06040614605',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Patetown", "Zip Code": 27530.0, "Latitude": 35.384344, "Longitude": -78.008931, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.384344, "lng": -78.008931, "phone": null, "country": null, "city": "Patetown", "state": "NC", "postal_code": 27530.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_faad9de76892d51447fb67eb504881c7',
        'MainStreet Family Care',
        '390 Us Hwy 70 West',
        34.884421,
        -76.889722,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(252) 652-2046',
        NULL,
        'United States',
        'Havelock',
        'NC',
        '28532.0',
        'uploaded',
        'uploaded_faad9de76892d51447fb67eb504881c7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "390 Us Hwy 70 West", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM\n", "Phone Number": "(252) 652-2046", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Havelock", "Zip Code": 28532.0, "Latitude": 34.884421, "Longitude": -76.889722, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "390 Us Hwy 70 West", "lat": 34.884421, "lng": -76.889722, "phone": "(252) 652-2046", "country": "United States", "city": "Havelock", "state": "NC", "postal_code": 28532.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_060e7a8e726c35aecc84764232fec873',
        'MainStreet Family Care',
        '1040 Us Hwy 258 N',
        35.260895,
        -77.564692,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(252) 525-4000',
        NULL,
        'United States',
        'Kinston',
        'NC',
        '28501.0',
        'uploaded',
        'uploaded_060e7a8e726c35aecc84764232fec873',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1040 Us Hwy 258 N", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM\n", "Phone Number": "(252) 525-4000", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Kinston", "Zip Code": 28501.0, "Latitude": 35.260895, "Longitude": -77.564692, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "1040 Us Hwy 258 N", "lat": 35.260895, "lng": -77.564692, "phone": "(252) 525-4000", "country": "United States", "city": "Kinston", "state": "NC", "postal_code": 28501.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_a54bfc7cb9bd8290220bdbbc0d7f9f24',
        'MainStreet Family Care',
        '246 West Swannanoa Ave. ',
        35.884276,
        -79.568095,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(336) 795-2016',
        NULL,
        'United States',
        'Kimesville',
        'NC',
        '27298.0',
        'uploaded',
        'uploaded_a54bfc7cb9bd8290220bdbbc0d7f9f24',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "246 West Swannanoa Ave. ", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(336) 795-2016", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Kimesville", "Zip Code": 27298.0, "Latitude": 35.884276, "Longitude": -79.568095, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "246 West Swannanoa Ave. ", "lat": 35.884276, "lng": -79.568095, "phone": "(336) 795-2016", "country": "United States", "city": "Kimesville", "state": "NC", "postal_code": 27298.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_c9567377a9943ce3b433a7a0be50ad45',
        'nan',
        'nan',
        35.884276,
        -79.568095,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Liberty',
        'NC',
        '27298.0',
        'uploaded',
        'uploaded_c9567377a9943ce3b433a7a0be50ad45',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Liberty", "Zip Code": 27298.0, "Latitude": 35.884276, "Longitude": -79.568095, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.884276, "lng": -79.568095, "phone": null, "country": null, "city": "Liberty", "state": "NC", "postal_code": 27298.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_d60fb1866a0a9f60cef0ae87b3c8ff03',
        'MainStreet Family Care',
        '130 James Ave.',
        35.267185,
        -80.426805,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(704) 271-3777',
        NULL,
        'United States',
        'Locust',
        'NC',
        '28097.0',
        'uploaded',
        'uploaded_d60fb1866a0a9f60cef0ae87b3c8ff03',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "130 James Ave.", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(704) 271-3777", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Locust", "Zip Code": 28097.0, "Latitude": 35.267185, "Longitude": -80.426805, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "130 James Ave.", "lat": 35.267185, "lng": -80.426805, "phone": "(704) 271-3777", "country": "United States", "city": "Locust", "state": "NC", "postal_code": 28097.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_6645197748c88c270039a649af6bc238',
        'nan',
        'nan',
        35.267185,
        -80.426805,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Western Hills',
        'NC',
        '28097.0',
        'uploaded',
        'uploaded_6645197748c88c270039a649af6bc238',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Western Hills", "Zip Code": 28097.0, "Latitude": 35.267185, "Longitude": -80.426805, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.267185, "lng": -80.426805, "phone": null, "country": null, "city": "Western Hills", "state": "NC", "postal_code": 28097.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_797257081cb58f844714c301f9f660f2',
        'MainStreet Family Care',
        '732 Lewis St. ',
        36.340501,
        -78.615954,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(919) 939-2109',
        NULL,
        'United States',
        'Oxford',
        'NC',
        '27565.0',
        'uploaded',
        'uploaded_797257081cb58f844714c301f9f660f2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "732 Lewis St. ", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8AM-8PM\nSAT-SUN: 9AM-4PM\n", "Phone Number": "(919) 939-2109", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Oxford", "Zip Code": 27565.0, "Latitude": 36.340501, "Longitude": -78.615954, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "732 Lewis St. ", "lat": 36.340501, "lng": -78.615954, "phone": "(919) 939-2109", "country": "United States", "city": "Oxford", "state": "NC", "postal_code": 27565.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_0aad087dbd94c8e91438ac8213ec27be',
        'MainStreet Family Care',
        '1202 N. Brightleaf Blvd.',
        35.506459,
        -78.344467,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(919) 912-5006',
        NULL,
        'United States',
        'Smithfield',
        'NC',
        '27577.0',
        'uploaded',
        'uploaded_0aad087dbd94c8e91438ac8213ec27be',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1202 N. Brightleaf Blvd.", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(919) 912-5006", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Smithfield", "Zip Code": 27577.0, "Latitude": 35.506459, "Longitude": -78.344467, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "1202 N. Brightleaf Blvd.", "lat": 35.506459, "lng": -78.344467, "phone": "(919) 912-5006", "country": "United States", "city": "Smithfield", "state": "NC", "postal_code": 27577.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_a39ba8c84fdf4be985d89017fd6d9470',
        'MainStreet Family Care',
        '1058 W Corbett Ave',
        34.69771,
        -77.106148,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(910) 708-7009',
        NULL,
        'United States',
        'Cape Carteret',
        'NC',
        '28584.0',
        'uploaded',
        'uploaded_a39ba8c84fdf4be985d89017fd6d9470',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "1058 W Corbett Ave", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(910) 708-7009", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cape Carteret", "Zip Code": 28584.0, "Latitude": 34.69771, "Longitude": -77.106148, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "1058 W Corbett Ave", "lat": 34.69771, "lng": -77.106148, "phone": "(910) 708-7009", "country": "United States", "city": "Cape Carteret", "state": "NC", "postal_code": 28584.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_3b8c37da82c97cd5d1560fe97c0533f5',
        'nan',
        'nan',
        34.69771,
        -77.106148,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Cedar Point',
        'NC',
        '28584.0',
        'uploaded',
        'uploaded_3b8c37da82c97cd5d1560fe97c0533f5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cedar Point", "Zip Code": 28584.0, "Latitude": 34.69771, "Longitude": -77.106148, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.69771, "lng": -77.106148, "phone": null, "country": null, "city": "Cedar Point", "state": "NC", "postal_code": 28584.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_d11123bba9361621193df2cd21de3d91',
        'MainStreet Family Care',
        '110 Western Blvd. ',
        35.905299,
        -77.540568,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(252) 774-4250',
        NULL,
        'United States',
        'Princeville',
        'NC',
        '27886.0',
        'uploaded',
        'uploaded_d11123bba9361621193df2cd21de3d91',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "110 Western Blvd. ", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-4PM", "Phone Number": "(252) 774-4250", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Princeville", "Zip Code": 27886.0, "Latitude": 35.905299, "Longitude": -77.540568, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "110 Western Blvd. ", "lat": 35.905299, "lng": -77.540568, "phone": "(252) 774-4250", "country": "United States", "city": "Princeville", "state": "NC", "postal_code": 27886.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_eb9e62a0da887ae9ce1a26f863a45b1d',
        'nan',
        'nan',
        35.905299,
        -77.540568,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Tarboro',
        'NC',
        '27886.0',
        'uploaded',
        'uploaded_eb9e62a0da887ae9ce1a26f863a45b1d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Tarboro", "Zip Code": 27886.0, "Latitude": 35.905299, "Longitude": -77.540568, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.905299, "lng": -77.540568, "phone": null, "country": null, "city": "Tarboro", "state": "NC", "postal_code": 27886.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_f3b5a024f7fed5ab835700e145523a0c',
        'MainStreet Family Care',
        '10039 University City Blvd',
        35.321279,
        -80.740507,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(704) 625-2594',
        NULL,
        'United States',
        'Charlotte',
        'NC',
        '28262.0',
        'uploaded',
        'uploaded_f3b5a024f7fed5ab835700e145523a0c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "10039 University City Blvd", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(704) 625-2594", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Charlotte", "Zip Code": 28262.0, "Latitude": 35.321279, "Longitude": -80.740507, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "10039 University City Blvd", "lat": 35.321279, "lng": -80.740507, "phone": "(704) 625-2594", "country": "United States", "city": "Charlotte", "state": "NC", "postal_code": 28262.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_087df5eebca3e3ec4e3b482ad9d233c6',
        'MainStreet Family Care',
        '402 Greenville Blvd Sw',
        35.626653,
        -77.378969,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(229) 262-3149',
        NULL,
        'United States',
        'East Carolina Univ',
        'NC',
        '27834.0',
        'uploaded',
        'uploaded_087df5eebca3e3ec4e3b482ad9d233c6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "402 Greenville Blvd Sw", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(229) 262-3149", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "East Carolina Univ", "Zip Code": 27834.0, "Latitude": 35.626653, "Longitude": -77.378969, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "402 Greenville Blvd Sw", "lat": 35.626653, "lng": -77.378969, "phone": "(229) 262-3149", "country": "United States", "city": "East Carolina Univ", "state": "NC", "postal_code": 27834.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_195a73914f1ab7b873c2fe400969f516',
        'nan',
        'nan',
        35.626653,
        -77.378969,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'East Carolina University',
        'NC',
        '27834.0',
        'uploaded',
        'uploaded_195a73914f1ab7b873c2fe400969f516',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "East Carolina University", "Zip Code": 27834.0, "Latitude": 35.626653, "Longitude": -77.378969, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.626653, "lng": -77.378969, "phone": null, "country": null, "city": "East Carolina University", "state": "NC", "postal_code": 27834.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_242c082eb6160e8dc0ee70a36afa3a84',
        'MainStreet Family Care',
        '2115 S. Main St. ',
        35.97154,
        -78.522414,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(919) 229-4833',
        NULL,
        'United States',
        'Wake Forest',
        'NC',
        '27587.0',
        'uploaded',
        'uploaded_242c082eb6160e8dc0ee70a36afa3a84',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "2115 S. Main St. ", "Address Two": "Suite A", "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(919) 229-4833", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Wake Forest", "Zip Code": 27587.0, "Latitude": 35.97154, "Longitude": -78.522414, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "2115 S. Main St. ", "lat": 35.97154, "lng": -78.522414, "phone": "(919) 229-4833", "country": "United States", "city": "Wake Forest", "state": "NC", "postal_code": 27587.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_fd4b7cd8915fd85ce7131664626744e5',
        'MainStreet Family Care',
        '4117 Oleander Dr',
        34.221512,
        -77.884521,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(910) 202-6988',
        NULL,
        'United States',
        'University Of Nc',
        'NC',
        '28403.0',
        'uploaded',
        'uploaded_fd4b7cd8915fd85ce7131664626744e5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "4117 Oleander Dr", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(910) 202-6988", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "University Of Nc", "Zip Code": 28403.0, "Latitude": 34.221512, "Longitude": -77.884521, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "4117 Oleander Dr", "lat": 34.221512, "lng": -77.884521, "phone": "(910) 202-6988", "country": "United States", "city": "University Of Nc", "state": "NC", "postal_code": 28403.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_1bc757f5bedafb805f76ff3c88c7b013',
        'nan',
        'nan',
        34.221512,
        -77.884521,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Wilm',
        'NC',
        '28403.0',
        'uploaded',
        'uploaded_1bc757f5bedafb805f76ff3c88c7b013',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Wilm", "Zip Code": 28403.0, "Latitude": 34.221512, "Longitude": -77.884521, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.221512, "lng": -77.884521, "phone": null, "country": null, "city": "Wilm", "state": "NC", "postal_code": 28403.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_84fefc6b0eb0af96720e7884b0d6620d',
        'MainStreet Family Care',
        '680 South Stratford Road',
        36.066545,
        -80.30733,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        '(336) 793-1422',
        NULL,
        'United States',
        'Ardmore',
        'NC',
        '27103.0',
        'uploaded',
        'uploaded_84fefc6b0eb0af96720e7884b0d6620d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MainStreet Family Care", "Address": "680 South Stratford Road", "Address Two": null, "clinic Hours of Operation": "MON-FRI 8AM-8PM\nSAT-SUN 9AM-9PM", "Phone Number": "(336) 793-1422", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ardmore", "Zip Code": 27103.0, "Latitude": 36.066545, "Longitude": -80.30733, "State": "NC", "zipcode UTC": -5.0, "name": "MainStreet Family Care", "address": "680 South Stratford Road", "lat": 36.066545, "lng": -80.30733, "phone": "(336) 793-1422", "country": "United States", "city": "Ardmore", "state": "NC", "postal_code": 27103.0, "category": "Occupational Health Clinic"}'::jsonb,
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
        'uploaded_7e3c1be5435217ca036cd49fa972029e',
        'nan',
        'nan',
        36.066545,
        -80.30733,
        ARRAY['Occupational Health Clinic'],
        'Occupational Health Clinic',
        NULL,
        NULL,
        NULL,
        'Hanes',
        'NC',
        '27103.0',
        'uploaded',
        'uploaded_7e3c1be5435217ca036cd49fa972029e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hanes", "Zip Code": 27103.0, "Latitude": 36.066545, "Longitude": -80.30733, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 36.066545, "lng": -80.30733, "phone": null, "country": null, "city": "Hanes", "state": "NC", "postal_code": 27103.0, "category": "Occupational Health Clinic"}'::jsonb,
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
    
