-- Batch: Cardio
-- Source: /Users/alexayvazian/CascadeProjects/Network-Map/occu-med-map/data/cardio-dedup.xlsx
-- Total records: 446
-- Generated: 2026-06-16 02:59:42.132828


    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b58450c47e28390405d153ede48e3d73',
        'Carolina Cardiology',
        '877-B West Faris Road',
        34.798035,
        -82.392893,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(864) 455-6900',
        NULL,
        'United States',
        'Greenville',
        'SC',
        '29605.0',
        'uploaded',
        'uploaded_b58450c47e28390405d153ede48e3d73',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Carolina Cardiology", "Address": "877-B West Faris Road", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(864) 455-6900", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Greenville", "Zip Code": 29605.0, "Latitude": 34.798035, "Longitude": -82.392893, "State": "SC", "zipcode UTC": -5.0, "name": "Carolina Cardiology", "address": "877-B West Faris Road", "lat": 34.798035, "lng": -82.392893, "phone": "(864) 455-6900", "country": "United States", "city": "Greenville", "state": "SC", "postal_code": 29605.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_dc9727b1afbd1649b4c6c70b23553238',
        'nan',
        'nan',
        34.798035,
        -82.392893,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Gville',
        'SC',
        '29605.0',
        'uploaded',
        'uploaded_dc9727b1afbd1649b4c6c70b23553238',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Gville", "Zip Code": 29605.0, "Latitude": 34.798035, "Longitude": -82.392893, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.798035, "lng": -82.392893, "phone": null, "country": null, "city": "Gville", "state": "SC", "postal_code": 29605.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_e1194dd79d03842e25fd223ad4b0cfe7',
        'Carolina Cardiology',
        '100 Healthy Way, Ste. 1250',
        34.523657,
        -82.62509,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(864) 224-2465',
        NULL,
        'United States',
        'And',
        'SC',
        '29621.0',
        'uploaded',
        'uploaded_e1194dd79d03842e25fd223ad4b0cfe7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Carolina Cardiology", "Address": "100 Healthy Way, Ste. 1250", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(864) 224-2465", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "And", "Zip Code": 29621.0, "Latitude": 34.523657, "Longitude": -82.62509, "State": "SC", "zipcode UTC": -5.0, "name": "Carolina Cardiology", "address": "100 Healthy Way, Ste. 1250", "lat": 34.523657, "lng": -82.62509, "phone": "(864) 224-2465", "country": "United States", "city": "And", "state": "SC", "postal_code": 29621.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_93fccbcbac42e90c0bf99c5939febe69',
        'nan',
        'nan',
        34.523657,
        -82.62509,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Anderson',
        'SC',
        '29621.0',
        'uploaded',
        'uploaded_93fccbcbac42e90c0bf99c5939febe69',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Anderson", "Zip Code": 29621.0, "Latitude": 34.523657, "Longitude": -82.62509, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.523657, "lng": -82.62509, "phone": null, "country": null, "city": "Anderson", "state": "SC", "postal_code": 29621.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5aed6cad0fe6449af127f880320a252f',
        'Carolina Cardiology',
        '315 Medical Parkway, Ste. 200',
        34.911469,
        -82.251789,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(864) 455-6900',
        NULL,
        'United States',
        'Greer',
        'SC',
        '29650.0',
        'uploaded',
        'uploaded_5aed6cad0fe6449af127f880320a252f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Carolina Cardiology", "Address": "315 Medical Parkway, Ste. 200", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(864) 455-6900", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Greer", "Zip Code": 29650.0, "Latitude": 34.911469, "Longitude": -82.251789, "State": "SC", "zipcode UTC": -5.0, "name": "Carolina Cardiology", "address": "315 Medical Parkway, Ste. 200", "lat": 34.911469, "lng": -82.251789, "phone": "(864) 455-6900", "country": "United States", "city": "Greer", "state": "SC", "postal_code": 29650.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_313d4bb5add332a0723ac2dce87e8f4f',
        'Carolina Cardiology',
        '719A S.E. Main Street',
        34.762693,
        -82.24512,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(864) 455-6900',
        NULL,
        'United States',
        'Simpsonville',
        'SC',
        '29681.0',
        'uploaded',
        'uploaded_313d4bb5add332a0723ac2dce87e8f4f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Carolina Cardiology", "Address": "719A S.E. Main Street", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(864) 455-6900", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Simpsonville", "Zip Code": 29681.0, "Latitude": 34.762693, "Longitude": -82.24512, "State": "SC", "zipcode UTC": -5.0, "name": "Carolina Cardiology", "address": "719A S.E. Main Street", "lat": 34.762693, "lng": -82.24512, "phone": "(864) 455-6900", "country": "United States", "city": "Simpsonville", "state": "SC", "postal_code": 29681.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b2f941a43c75dd99e08d8101d9514514',
        'Cardiology & Cardiovascular Consultants',
        '500 South Rancho Drive',
        36.184219,
        -115.162926,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(702) 258-1601',
        NULL,
        'United States',
        'Las Vegas',
        'NV',
        '89106.0',
        'uploaded',
        'uploaded_b2f941a43c75dd99e08d8101d9514514',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology & Cardiovascular Consultants", "Address": "500 South Rancho Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 6:00pm", "Phone Number": "(702) 258-1601", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Las Vegas", "Zip Code": 89106.0, "Latitude": 36.184219, "Longitude": -115.162926, "State": "NV", "zipcode UTC": -8.0, "name": "Cardiology & Cardiovascular Consultants", "address": "500 South Rancho Drive", "lat": 36.184219, "lng": -115.162926, "phone": "(702) 258-1601", "country": "United States", "city": "Las Vegas", "state": "NV", "postal_code": 89106.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4551bd2a957d4142c497e90ba5163931',
        'Cardiovascular Associates of the Delaware Valley',
        '570 Egg Harbor Road, Ste. B1',
        39.74953,
        -75.106372,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(856) 582-2000',
        NULL,
        'United States',
        'Barnsboro',
        'NJ',
        '8080.0',
        'uploaded',
        'uploaded_4551bd2a957d4142c497e90ba5163931',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Associates of the Delaware Valley", "Address": "570 Egg Harbor Road, Ste. B1", "Address Two": null, "clinic Hours of Operation": "Mon-Tues 10:00 AM", "Phone Number": "(856) 582-2000", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Barnsboro", "Zip Code": 8080.0, "Latitude": 39.74953, "Longitude": -75.106372, "State": "NJ", "zipcode UTC": -5.0, "name": "Cardiovascular Associates of the Delaware Valley", "address": "570 Egg Harbor Road, Ste. B1", "lat": 39.74953, "lng": -75.106372, "phone": "(856) 582-2000", "country": "United States", "city": "Barnsboro", "state": "NJ", "postal_code": 8080.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_2b5af87adb6b24e2ca985f1d874b185e',
        'nan',
        'nan',
        39.74953,
        -75.106372,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Cross Keys',
        'NJ',
        '8080.0',
        'uploaded',
        'uploaded_2b5af87adb6b24e2ca985f1d874b185e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cross Keys", "Zip Code": 8080.0, "Latitude": 39.74953, "Longitude": -75.106372, "State": "NJ", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.74953, "lng": -75.106372, "phone": null, "country": null, "city": "Cross Keys", "state": "NJ", "postal_code": 8080.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_e41e58a9b51e82331128f6051ce0cbd0',
        'Heart of Georgia Cardiology',
        '2064 Vineville Avenue',
        32.844872,
        -83.671193,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(478) 743-1478',
        NULL,
        'United States',
        'Macon',
        'GA',
        '31204.0',
        'uploaded',
        'uploaded_e41e58a9b51e82331128f6051ce0cbd0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Heart of Georgia Cardiology", "Address": "2064 Vineville Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Thur 9:00am - 5:00pm, Fri 9:00am - 3:00pm.", "Phone Number": "(478) 743-1478", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Macon", "Zip Code": 31204.0, "Latitude": 32.844872, "Longitude": -83.671193, "State": "GA", "zipcode UTC": -5.0, "name": "Heart of Georgia Cardiology", "address": "2064 Vineville Avenue", "lat": 32.844872, "lng": -83.671193, "phone": "(478) 743-1478", "country": "United States", "city": "Macon", "state": "GA", "postal_code": 31204.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a332c21c87884901d1d8dc016de8e590',
        'nan',
        'nan',
        32.844872,
        -83.671193,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Payne City',
        'GA',
        '31204.0',
        'uploaded',
        'uploaded_a332c21c87884901d1d8dc016de8e590',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Payne City", "Zip Code": 31204.0, "Latitude": 32.844872, "Longitude": -83.671193, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.844872, "lng": -83.671193, "phone": null, "country": null, "city": "Payne City", "state": "GA", "postal_code": 31204.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_7bd933b5204e8a44142adb6948a5f703',
        'Georgia Cardiology Center',
        '124 Hospital Drive',
        32.594698,
        -83.648734,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(478) 922-4626',
        NULL,
        'United States',
        'Warner Robins',
        'GA',
        '31088.0',
        'uploaded',
        'uploaded_7bd933b5204e8a44142adb6948a5f703',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Georgia Cardiology Center", "Address": "124 Hospital Drive", "Address Two": null, "clinic Hours of Operation": "Tues 9:00am - 3:00pm, Wed 9:00am - 3:00pm, Fri 9:00am - 3:00pm", "Phone Number": "(478) 922-4626", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Warner Robins", "Zip Code": 31088.0, "Latitude": 32.594698, "Longitude": -83.648734, "State": "GA", "zipcode UTC": -5.0, "name": "Georgia Cardiology Center", "address": "124 Hospital Drive", "lat": 32.594698, "lng": -83.648734, "phone": "(478) 922-4626", "country": "United States", "city": "Warner Robins", "state": "GA", "postal_code": 31088.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_1629190b342b711ea54b23b116ad9631',
        'Georgia Cardiology Center',
        '432 Poplar Street, Ste. A',
        32.830839,
        -83.635294,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(478) 743-2116',
        NULL,
        'United States',
        'Huber',
        'GA',
        '31201.0',
        'uploaded',
        'uploaded_1629190b342b711ea54b23b116ad9631',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Georgia Cardiology Center", "Address": "432 Poplar Street, Ste. A", "Address Two": null, "clinic Hours of Operation": "Mon 9:00am - 4:00pm, Thurs 9:00am  -4:00pm.", "Phone Number": "(478) 743-2116", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Huber", "Zip Code": 31201.0, "Latitude": 32.830839, "Longitude": -83.635294, "State": "GA", "zipcode UTC": -5.0, "name": "Georgia Cardiology Center", "address": "432 Poplar Street, Ste. A", "lat": 32.830839, "lng": -83.635294, "phone": "(478) 743-2116", "country": "United States", "city": "Huber", "state": "GA", "postal_code": 31201.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ff447af5f6e49957c40bf1a202f63a9f',
        'nan',
        'nan',
        32.830839,
        -83.635294,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Macon',
        'GA',
        '31201.0',
        'uploaded',
        'uploaded_ff447af5f6e49957c40bf1a202f63a9f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Macon", "Zip Code": 31201.0, "Latitude": 32.830839, "Longitude": -83.635294, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.830839, "lng": -83.635294, "phone": null, "country": null, "city": "Macon", "state": "GA", "postal_code": 31201.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_58b1483f875aa11444ea86c73f57c3c2',
        'South Texas Cardiovascular Consultants',
        '6800 I 10 West, Ste. 350',
        29.466781,
        -98.525194,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(210) 692-1414',
        NULL,
        'United States',
        'Balcones Heights',
        'TX',
        '78201.0',
        'uploaded',
        'uploaded_58b1483f875aa11444ea86c73f57c3c2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "South Texas Cardiovascular Consultants", "Address": "6800 I 10 West, Ste. 350", "Address Two": null, "clinic Hours of Operation": "Mon-Thurs 8:00am - 5:00pm, Fri 8:00m - 4:00pm", "Phone Number": "(210) 692-1414", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Balcones Heights", "Zip Code": 78201.0, "Latitude": 29.466781, "Longitude": -98.525194, "State": "TX", "zipcode UTC": -6.0, "name": "South Texas Cardiovascular Consultants", "address": "6800 I 10 West, Ste. 350", "lat": 29.466781, "lng": -98.525194, "phone": "(210) 692-1414", "country": "United States", "city": "Balcones Heights", "state": "TX", "postal_code": 78201.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0728470a325746bb962450bc0f12cf64',
        'nan',
        'nan',
        29.466781,
        -98.525194,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Balcones Hts',
        'TX',
        '78201.0',
        'uploaded',
        'uploaded_0728470a325746bb962450bc0f12cf64',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Balcones Hts", "Zip Code": 78201.0, "Latitude": 29.466781, "Longitude": -98.525194, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 29.466781, "lng": -98.525194, "phone": null, "country": null, "city": "Balcones Hts", "state": "TX", "postal_code": 78201.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6dae6013df758ff23b0a3864ea6e8a56',
        'Cardiology Specialists',
        '15 Professional Park Drive',
        38.726548,
        -89.9572,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(314) 447-1301',
        NULL,
        'United States',
        'Maryville',
        'IL',
        '62062.0',
        'uploaded',
        'uploaded_6dae6013df758ff23b0a3864ea6e8a56',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Specialists", "Address": "15 Professional Park Drive", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(314) 447-1301", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Maryville", "Zip Code": 62062.0, "Latitude": 38.726548, "Longitude": -89.9572, "State": "IL", "zipcode UTC": -6.0, "name": "Cardiology Specialists", "address": "15 Professional Park Drive", "lat": 38.726548, "lng": -89.9572, "phone": "(314) 447-1301", "country": "United States", "city": "Maryville", "state": "IL", "postal_code": 62062.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_de01f698572e379cab0b34e03027ffd9',
        'Cardiology Specialists',
        '1390 Highway 61, Ste. 2300',
        38.226997,
        -90.382152,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(314) 447-1301',
        NULL,
        'United States',
        'Crystal City',
        'MO',
        '63019.0',
        'uploaded',
        'uploaded_de01f698572e379cab0b34e03027ffd9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Specialists", "Address": "1390 Highway 61, Ste. 2300", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00pm", "Phone Number": "(314) 447-1301", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Crystal City", "Zip Code": 63019.0, "Latitude": 38.226997, "Longitude": -90.382152, "State": "MO", "zipcode UTC": -6.0, "name": "Cardiology Specialists", "address": "1390 Highway 61, Ste. 2300", "lat": 38.226997, "lng": -90.382152, "phone": "(314) 447-1301", "country": "United States", "city": "Crystal City", "state": "MO", "postal_code": 63019.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f8c10a456593b90c03392bb62a8f7427',
        'Cardiology Specialists',
        '3023 North Ballas Road, Ste. 4000',
        38.618582,
        -90.436435,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(314) 447-1301',
        NULL,
        'United States',
        'Crystal Lake Park',
        'MO',
        '63131.0',
        'uploaded',
        'uploaded_f8c10a456593b90c03392bb62a8f7427',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Specialists", "Address": "3023 North Ballas Road, Ste. 4000", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00pm", "Phone Number": "(314) 447-1301", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Crystal Lake Park", "Zip Code": 63131.0, "Latitude": 38.618582, "Longitude": -90.436435, "State": "MO", "zipcode UTC": -6.0, "name": "Cardiology Specialists", "address": "3023 North Ballas Road, Ste. 4000", "lat": 38.618582, "lng": -90.436435, "phone": "(314) 447-1301", "country": "United States", "city": "Crystal Lake Park", "state": "MO", "postal_code": 63131.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b52d5ad13758e2eb292e642409c53c5f',
        'nan',
        'nan',
        38.618582,
        -90.436435,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Des Peres',
        'MO',
        '63131.0',
        'uploaded',
        'uploaded_b52d5ad13758e2eb292e642409c53c5f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Des Peres", "Zip Code": 63131.0, "Latitude": 38.618582, "Longitude": -90.436435, "State": "MO", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 38.618582, "lng": -90.436435, "phone": null, "country": null, "city": "Des Peres", "state": "MO", "postal_code": 63131.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a99f2e9d2088608bee553f20e297d148',
        'Texas Cardiovascular Medicine',
        '2123 South Clear Creek Road',
        31.084108,
        -97.791492,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(254) 526-9766',
        NULL,
        'United States',
        'Killeen',
        'TX',
        '76549.0',
        'uploaded',
        'uploaded_a99f2e9d2088608bee553f20e297d148',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Texas Cardiovascular Medicine", "Address": "2123 South Clear Creek Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(254) 526-9766", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Killeen", "Zip Code": 76549.0, "Latitude": 31.084108, "Longitude": -97.791492, "State": "TX", "zipcode UTC": -6.0, "name": "Texas Cardiovascular Medicine", "address": "2123 South Clear Creek Road", "lat": 31.084108, "lng": -97.791492, "phone": "(254) 526-9766", "country": "United States", "city": "Killeen", "state": "TX", "postal_code": 76549.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4f99d2daba47c3d03aaebcc54615c53e',
        'Coastal Cardiology',
        '1033 St. Andrews Boulevard',
        32.794841,
        -80.005002,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(843) 723-6111',
        NULL,
        'United States',
        'Charleston',
        'SC',
        '29407.0',
        'uploaded',
        'uploaded_4f99d2daba47c3d03aaebcc54615c53e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Coastal Cardiology", "Address": "1033 St. Andrews Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 4:30pm", "Phone Number": "(843) 723-6111", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Charleston", "Zip Code": 29407.0, "Latitude": 32.794841, "Longitude": -80.005002, "State": "SC", "zipcode UTC": -5.0, "name": "Coastal Cardiology", "address": "1033 St. Andrews Boulevard", "lat": 32.794841, "lng": -80.005002, "phone": "(843) 723-6111", "country": "United States", "city": "Charleston", "state": "SC", "postal_code": 29407.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_63c60319a7b0c92d339ba463cf6c927b',
        'nan',
        'nan',
        32.794841,
        -80.005002,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Chas',
        'SC',
        '29407.0',
        'uploaded',
        'uploaded_63c60319a7b0c92d339ba463cf6c927b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Chas", "Zip Code": 29407.0, "Latitude": 32.794841, "Longitude": -80.005002, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.794841, "lng": -80.005002, "phone": null, "country": null, "city": "Chas", "state": "SC", "postal_code": 29407.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_235f4afee05d4f57becaa297142cf8a0',
        'Advanced Cardiovascular Specialists',
        '3801 Springhurst Boulevard, Ste. 104',
        38.305636,
        -85.584243,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(502) 425-5614',
        NULL,
        'United States',
        'Louisville',
        'KY',
        '40241.0',
        'uploaded',
        'uploaded_235f4afee05d4f57becaa297142cf8a0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Cardiovascular Specialists", "Address": "3801 Springhurst Boulevard, Ste. 104", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:00pm", "Phone Number": "(502) 425-5614", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Louisville", "Zip Code": 40241.0, "Latitude": 38.305636, "Longitude": -85.584243, "State": "KY", "zipcode UTC": -5.0, "name": "Advanced Cardiovascular Specialists", "address": "3801 Springhurst Boulevard, Ste. 104", "lat": 38.305636, "lng": -85.584243, "phone": "(502) 425-5614", "country": "United States", "city": "Louisville", "state": "KY", "postal_code": 40241.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_38a92e917342d1c20f60c985394c0e58',
        'nan',
        'nan',
        38.305636,
        -85.584243,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Lyndon',
        'KY',
        '40241.0',
        'uploaded',
        'uploaded_38a92e917342d1c20f60c985394c0e58',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lyndon", "Zip Code": 40241.0, "Latitude": 38.305636, "Longitude": -85.584243, "State": "KY", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 38.305636, "lng": -85.584243, "phone": null, "country": null, "city": "Lyndon", "state": "KY", "postal_code": 40241.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_e51cb4e295f70a240551404841c317ba',
        'Cardiology Clinic of San Antonio',
        '4411 Medical, Ste. 300',
        29.499454,
        -98.571663,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(210) 614-5400',
        NULL,
        'United States',
        'San Antonio',
        'TX',
        '78229.0',
        'uploaded',
        'uploaded_e51cb4e295f70a240551404841c317ba',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Clinic of San Antonio", "Address": "4411 Medical, Ste. 300", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(210) 614-5400", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "San Antonio", "Zip Code": 78229.0, "Latitude": 29.499454, "Longitude": -98.571663, "State": "TX", "zipcode UTC": -6.0, "name": "Cardiology Clinic of San Antonio", "address": "4411 Medical, Ste. 300", "lat": 29.499454, "lng": -98.571663, "phone": "(210) 614-5400", "country": "United States", "city": "San Antonio", "state": "TX", "postal_code": 78229.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a828ceeb5307456711615f3c59254707',
        'Diagnostic Cardiology of Houston',
        '7777 Southwest Freeway, Ste. 420',
        29.689781,
        -95.511611,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(713) 776-9500',
        NULL,
        'United States',
        'Houston',
        'TX',
        '77074.0',
        'uploaded',
        'uploaded_a828ceeb5307456711615f3c59254707',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Diagnostic Cardiology of Houston", "Address": "7777 Southwest Freeway, Ste. 420", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(713) 776-9500", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Houston", "Zip Code": 77074.0, "Latitude": 29.689781, "Longitude": -95.511611, "State": "TX", "zipcode UTC": -6.0, "name": "Diagnostic Cardiology of Houston", "address": "7777 Southwest Freeway, Ste. 420", "lat": 29.689781, "lng": -95.511611, "phone": "(713) 776-9500", "country": "United States", "city": "Houston", "state": "TX", "postal_code": 77074.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4571d4f9e7abb7450067e039104ac8a7',
        'Diagnostic Cardiology of Houston',
        '4660 Sweetwater Boulevard, Ste. 270',
        29.573345,
        -95.632132,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(713) 776-9500',
        NULL,
        'United States',
        'Dewalt',
        'TX',
        '77479.0',
        'uploaded',
        'uploaded_4571d4f9e7abb7450067e039104ac8a7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Diagnostic Cardiology of Houston", "Address": "4660 Sweetwater Boulevard, Ste. 270", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(713) 776-9500", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Dewalt", "Zip Code": 77479.0, "Latitude": 29.573345, "Longitude": -95.632132, "State": "TX", "zipcode UTC": -6.0, "name": "Diagnostic Cardiology of Houston", "address": "4660 Sweetwater Boulevard, Ste. 270", "lat": 29.573345, "lng": -95.632132, "phone": "(713) 776-9500", "country": "United States", "city": "Dewalt", "state": "TX", "postal_code": 77479.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_cd82cdc808b11aa148ce8dd4a5d27e29',
        'nan',
        'nan',
        29.573345,
        -95.632132,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Sugar Land',
        'TX',
        '77479.0',
        'uploaded',
        'uploaded_cd82cdc808b11aa148ce8dd4a5d27e29',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Sugar Land", "Zip Code": 77479.0, "Latitude": 29.573345, "Longitude": -95.632132, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 29.573345, "lng": -95.632132, "phone": null, "country": null, "city": "Sugar Land", "state": "TX", "postal_code": 77479.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_86dca5a69c67fa1d24c3a90e4a1c67b5',
        'Orleans Cardiovasular Associates',
        '2820 Canal Street',
        29.974504,
        -90.087472,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(504) 821-8158',
        NULL,
        'United States',
        'New Orleans',
        'LA',
        '70119.0',
        'uploaded',
        'uploaded_86dca5a69c67fa1d24c3a90e4a1c67b5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Orleans Cardiovasular Associates", "Address": "2820 Canal Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 4:30pm", "Phone Number": "(504) 821-8158", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "New Orleans", "Zip Code": 70119.0, "Latitude": 29.974504, "Longitude": -90.087472, "State": "LA", "zipcode UTC": -6.0, "name": "Orleans Cardiovasular Associates", "address": "2820 Canal Street", "lat": 29.974504, "lng": -90.087472, "phone": "(504) 821-8158", "country": "United States", "city": "New Orleans", "state": "LA", "postal_code": 70119.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_db351f5c35dd2aaca5140d93add43b78',
        'Mountain West Cardiovascular',
        '1160 East 3900 Street, Ste. 2000',
        40.680064,
        -111.822206,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(801) 266-3418',
        NULL,
        'United States',
        'Holladay',
        'UT',
        '84124.0',
        'uploaded',
        'uploaded_db351f5c35dd2aaca5140d93add43b78',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Mountain West Cardiovascular", "Address": "1160 East 3900 Street, Ste. 2000", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(801) 266-3418", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Holladay", "Zip Code": 84124.0, "Latitude": 40.680064, "Longitude": -111.822206, "State": "UT", "zipcode UTC": -7.0, "name": "Mountain West Cardiovascular", "address": "1160 East 3900 Street, Ste. 2000", "lat": 40.680064, "lng": -111.822206, "phone": "(801) 266-3418", "country": "United States", "city": "Holladay", "state": "UT", "postal_code": 84124.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_7f9ef14c9c94f7c3fb1f77e7fe0f357d',
        'nan',
        'nan',
        40.680064,
        -111.822206,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Murray',
        'UT',
        '84124.0',
        'uploaded',
        'uploaded_7f9ef14c9c94f7c3fb1f77e7fe0f357d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Murray", "Zip Code": 84124.0, "Latitude": 40.680064, "Longitude": -111.822206, "State": "UT", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 40.680064, "lng": -111.822206, "phone": null, "country": null, "city": "Murray", "state": "UT", "postal_code": 84124.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_92f6bed6b8a47193f1c834a615fc38ae',
        'Jackson Cardiology Associates',
        '971 Lakeland Drive, Ste. 850',
        32.334738,
        -90.16933,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(601) 981-8543',
        NULL,
        'United States',
        'Jackson',
        'MS',
        '39216.0',
        'uploaded',
        'uploaded_92f6bed6b8a47193f1c834a615fc38ae',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Jackson Cardiology Associates", "Address": "971 Lakeland Drive, Ste. 850", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(601) 981-8543", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Jackson", "Zip Code": 39216.0, "Latitude": 32.334738, "Longitude": -90.16933, "State": "MS", "zipcode UTC": -6.0, "name": "Jackson Cardiology Associates", "address": "971 Lakeland Drive, Ste. 850", "lat": 32.334738, "lng": -90.16933, "phone": "(601) 981-8543", "country": "United States", "city": "Jackson", "state": "MS", "postal_code": 39216.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_22a076ff429edfeec08bd8a2304595f9',
        'nan',
        'nan',
        32.334738,
        -90.16933,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Jax',
        'MS',
        '39216.0',
        'uploaded',
        'uploaded_22a076ff429edfeec08bd8a2304595f9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Jax", "Zip Code": 39216.0, "Latitude": 32.334738, "Longitude": -90.16933, "State": "MS", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.334738, "lng": -90.16933, "phone": null, "country": null, "city": "Jax", "state": "MS", "postal_code": 39216.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b1c81b59d2d6b0f0d71bc4e441317d50',
        'East Metro Cardiology',
        '1560 Beam Avenue, Ste. F',
        nan,
        nan,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(651) 842-3382',
        NULL,
        'United States',
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_b1c81b59d2d6b0f0d71bc4e441317d50',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "East Metro Cardiology", "Address": "1560 Beam Avenue, Ste. F", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm (TSTs on Mondays all day, Friday mornings)", "Phone Number": "(651) 842-3382", "Country": "United States", "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "East Metro Cardiology", "address": "1560 Beam Avenue, Ste. F", "lat": null, "lng": null, "phone": "(651) 842-3382", "country": "United States", "city": null, "state": null, "postal_code": null, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_936827840d6bb042b2b1d72432c50748',
        'Western Cardiology Associates',
        '8407 Bryant Street',
        39.866785,
        -105.041436,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(303) 430-3160',
        NULL,
        'United States',
        'Denver',
        'CO',
        '80031.0',
        'uploaded',
        'uploaded_936827840d6bb042b2b1d72432c50748',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Western Cardiology Associates", "Address": "8407 Bryant Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 4:30pm", "Phone Number": "(303) 430-3160", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Denver", "Zip Code": 80031.0, "Latitude": 39.866785, "Longitude": -105.041436, "State": "CO", "zipcode UTC": -7.0, "name": "Western Cardiology Associates", "address": "8407 Bryant Street", "lat": 39.866785, "lng": -105.041436, "phone": "(303) 430-3160", "country": "United States", "city": "Denver", "state": "CO", "postal_code": 80031.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_633f74a0497b59c7ffc2e5bb61381793',
        'nan',
        'nan',
        39.866785,
        -105.041436,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Westminster',
        'CO',
        '80031.0',
        'uploaded',
        'uploaded_633f74a0497b59c7ffc2e5bb61381793',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Westminster", "Zip Code": 80031.0, "Latitude": 39.866785, "Longitude": -105.041436, "State": "CO", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 39.866785, "lng": -105.041436, "phone": null, "country": null, "city": "Westminster", "state": "CO", "postal_code": 80031.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f43bcfa90ecff72cd19712a78b592e8c',
        'Western Cardiology Associates',
        '8300 Alcott, Ste. 100',
        39.866785,
        -105.041436,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(303) 430-3160',
        NULL,
        'United States',
        'Denver',
        'CO',
        '80031.0',
        'uploaded',
        'uploaded_f43bcfa90ecff72cd19712a78b592e8c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Western Cardiology Associates", "Address": "8300 Alcott, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 4:30pm", "Phone Number": "(303) 430-3160", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Denver", "Zip Code": 80031.0, "Latitude": 39.866785, "Longitude": -105.041436, "State": "CO", "zipcode UTC": -7.0, "name": "Western Cardiology Associates", "address": "8300 Alcott, Ste. 100", "lat": 39.866785, "lng": -105.041436, "phone": "(303) 430-3160", "country": "United States", "city": "Denver", "state": "CO", "postal_code": 80031.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a572e7d13815500b07dd8c2b479293aa',
        'Sanford Cardiology',
        '110 Fields Dr',
        35.458804,
        -79.164151,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(919) 777-9005',
        NULL,
        'United States',
        'Buffalo Lake',
        'NC',
        '27330.0',
        'uploaded',
        'uploaded_a572e7d13815500b07dd8c2b479293aa',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Sanford Cardiology", "Address": "110 Fields Dr", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(919) 777-9005", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Buffalo Lake", "Zip Code": 27330.0, "Latitude": 35.458804, "Longitude": -79.164151, "State": "NC", "zipcode UTC": -5.0, "name": "Sanford Cardiology", "address": "110 Fields Dr", "lat": 35.458804, "lng": -79.164151, "phone": "(919) 777-9005", "country": "United States", "city": "Buffalo Lake", "state": "NC", "postal_code": 27330.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c6354b218a94df2ce866801b1bcbe05b',
        'nan',
        'nan',
        35.458804,
        -79.164151,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Carbonton',
        'NC',
        '27330.0',
        'uploaded',
        'uploaded_c6354b218a94df2ce866801b1bcbe05b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Carbonton", "Zip Code": 27330.0, "Latitude": 35.458804, "Longitude": -79.164151, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.458804, "lng": -79.164151, "phone": null, "country": null, "city": "Carbonton", "state": "NC", "postal_code": 27330.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f056195f2740cf89af89a3fcfe4e5a1e',
        'Southeastern Cardiology',
        '2610 North Elm Street',
        34.620874,
        -78.989868,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(910) 671-6177',
        NULL,
        'United States',
        'Biggs Park',
        'NC',
        '28358.0',
        'uploaded',
        'uploaded_f056195f2740cf89af89a3fcfe4e5a1e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Southeastern Cardiology", "Address": "2610 North Elm Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(910) 671-6177", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Biggs Park", "Zip Code": 28358.0, "Latitude": 34.620874, "Longitude": -78.989868, "State": "NC", "zipcode UTC": -5.0, "name": "Southeastern Cardiology", "address": "2610 North Elm Street", "lat": 34.620874, "lng": -78.989868, "phone": "(910) 671-6177", "country": "United States", "city": "Biggs Park", "state": "NC", "postal_code": 28358.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4f8943f6a6d477d382cb517e877ca808',
        'nan',
        'nan',
        34.620874,
        -78.989868,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Lumberton',
        'NC',
        '28358.0',
        'uploaded',
        'uploaded_4f8943f6a6d477d382cb517e877ca808',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lumberton", "Zip Code": 28358.0, "Latitude": 34.620874, "Longitude": -78.989868, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.620874, "lng": -78.989868, "phone": null, "country": null, "city": "Lumberton", "state": "NC", "postal_code": 28358.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_95d21e7b763d3c73b490b8dcbd2e6a16',
        'University of Colorado Health Cardiology',
        '1400 Boulder Street, Ste. 700',
        38.851493,
        -104.778564,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(719) 635-7172',
        NULL,
        'United States',
        'Co Spgs',
        'CO',
        '80909.0',
        'uploaded',
        'uploaded_95d21e7b763d3c73b490b8dcbd2e6a16',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "University of Colorado Health Cardiology", "Address": "1400 Boulder Street, Ste. 700", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(719) 635-7172", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Co Spgs", "Zip Code": 80909.0, "Latitude": 38.851493, "Longitude": -104.778564, "State": "CO", "zipcode UTC": -7.0, "name": "University of Colorado Health Cardiology", "address": "1400 Boulder Street, Ste. 700", "lat": 38.851493, "lng": -104.778564, "phone": "(719) 635-7172", "country": "United States", "city": "Co Spgs", "state": "CO", "postal_code": 80909.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_18bb89fda9ee03e998ae6657a5a4cf4f',
        'nan',
        'nan',
        38.851493,
        -104.778564,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Colorado Spgs',
        'CO',
        '80909.0',
        'uploaded',
        'uploaded_18bb89fda9ee03e998ae6657a5a4cf4f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Colorado Spgs", "Zip Code": 80909.0, "Latitude": 38.851493, "Longitude": -104.778564, "State": "CO", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 38.851493, "lng": -104.778564, "phone": null, "country": null, "city": "Colorado Spgs", "state": "CO", "postal_code": 80909.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_896cb55d57027e2179a22cab73fa81fc',
        'Cardiology-Internal Medicine',
        '5750 Centre Avenue, Ste. 510',
        40.468968,
        -79.918639,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(412) 661-6770',
        NULL,
        'United States',
        'East Liberty',
        'PA',
        '15206.0',
        'uploaded',
        'uploaded_896cb55d57027e2179a22cab73fa81fc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology-Internal Medicine", "Address": "5750 Centre Avenue, Ste. 510", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 4:00pm", "Phone Number": "(412) 661-6770", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "East Liberty", "Zip Code": 15206.0, "Latitude": 40.468968, "Longitude": -79.918639, "State": "PA", "zipcode UTC": -5.0, "name": "Cardiology-Internal Medicine", "address": "5750 Centre Avenue, Ste. 510", "lat": 40.468968, "lng": -79.918639, "phone": "(412) 661-6770", "country": "United States", "city": "East Liberty", "state": "PA", "postal_code": 15206.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_bc26885b4aab37bf3fdea36540b53d0d',
        'nan',
        'nan',
        40.468968,
        -79.918639,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Pittsburgh',
        'PA',
        '15206.0',
        'uploaded',
        'uploaded_bc26885b4aab37bf3fdea36540b53d0d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Pittsburgh", "Zip Code": 15206.0, "Latitude": 40.468968, "Longitude": -79.918639, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.468968, "lng": -79.918639, "phone": null, "country": null, "city": "Pittsburgh", "state": "PA", "postal_code": 15206.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a1d4ceed722d5db9da1ef722af580625',
        'Carlton Cardiology Associates',
        '490 East North Avenue',
        40.460669,
        -80.011447,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(412) 322-2622',
        NULL,
        'United States',
        'Allegheny',
        'PA',
        '15212.0',
        'uploaded',
        'uploaded_a1d4ceed722d5db9da1ef722af580625',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Carlton Cardiology Associates", "Address": "490 East North Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am -  1:30pm", "Phone Number": "(412) 322-2622", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Allegheny", "Zip Code": 15212.0, "Latitude": 40.460669, "Longitude": -80.011447, "State": "PA", "zipcode UTC": -5.0, "name": "Carlton Cardiology Associates", "address": "490 East North Avenue", "lat": 40.460669, "lng": -80.011447, "phone": "(412) 322-2622", "country": "United States", "city": "Allegheny", "state": "PA", "postal_code": 15212.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8cb0b4622ec8016970af0acc70e27e7d',
        'nan',
        'nan',
        40.460669,
        -80.011447,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Pgh',
        'PA',
        '15212.0',
        'uploaded',
        'uploaded_8cb0b4622ec8016970af0acc70e27e7d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Pgh", "Zip Code": 15212.0, "Latitude": 40.460669, "Longitude": -80.011447, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.460669, "lng": -80.011447, "phone": null, "country": null, "city": "Pgh", "state": "PA", "postal_code": 15212.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_36c8425267d6e565dd40a6840739c42f',
        'Spokane Cardiology',
        '122 West 7th Avenue',
        47.648941,
        -117.431745,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(509) 455-8820',
        NULL,
        'United States',
        'Spokane',
        'WA',
        '99204.0',
        'uploaded',
        'uploaded_36c8425267d6e565dd40a6840739c42f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Spokane Cardiology", "Address": "122 West 7th Avenue", "Address Two": "Ste. 450", "clinic Hours of Operation": "Mon-Fri 7:00am - 5:00pm", "Phone Number": "(509) 455-8820", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Spokane", "Zip Code": 99204.0, "Latitude": 47.648941, "Longitude": -117.431745, "State": "WA", "zipcode UTC": -8.0, "name": "Spokane Cardiology", "address": "122 West 7th Avenue", "lat": 47.648941, "lng": -117.431745, "phone": "(509) 455-8820", "country": "United States", "city": "Spokane", "state": "WA", "postal_code": 99204.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4ac3fbad50fd459e4f123f079e0514f2',
        'Cardiovascular Consultants',
        '2727 Hearne Avenue, Ste. 301',
        32.490777,
        -93.767617,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(318) 631-6400',
        NULL,
        'United States',
        'Shreveport',
        'LA',
        '71103.0',
        'uploaded',
        'uploaded_4ac3fbad50fd459e4f123f079e0514f2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants", "Address": "2727 Hearne Avenue, Ste. 301", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(318) 631-6400", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Shreveport", "Zip Code": 71103.0, "Latitude": 32.490777, "Longitude": -93.767617, "State": "LA", "zipcode UTC": -6.0, "name": "Cardiovascular Consultants", "address": "2727 Hearne Avenue, Ste. 301", "lat": 32.490777, "lng": -93.767617, "phone": "(318) 631-6400", "country": "United States", "city": "Shreveport", "state": "LA", "postal_code": 71103.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_54b18ca95a1e3bd11c691ed56762aaee',
        'Cardiovascular Consultants',
        '8001 Youree Drive, Ste. 740',
        32.350987,
        -93.629384,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(318) 797-2328',
        NULL,
        'United States',
        'Caspiana',
        'LA',
        '71115.0',
        'uploaded',
        'uploaded_54b18ca95a1e3bd11c691ed56762aaee',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants", "Address": "8001 Youree Drive, Ste. 740", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(318) 797-2328", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Caspiana", "Zip Code": 71115.0, "Latitude": 32.350987, "Longitude": -93.629384, "State": "LA", "zipcode UTC": -6.0, "name": "Cardiovascular Consultants", "address": "8001 Youree Drive, Ste. 740", "lat": 32.350987, "lng": -93.629384, "phone": "(318) 797-2328", "country": "United States", "city": "Caspiana", "state": "LA", "postal_code": 71115.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b51d06069ac2f9d5d485fe103523542a',
        'nan',
        'nan',
        32.350987,
        -93.629384,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Shreveport',
        'LA',
        '71115.0',
        'uploaded',
        'uploaded_b51d06069ac2f9d5d485fe103523542a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Shreveport", "Zip Code": 71115.0, "Latitude": 32.350987, "Longitude": -93.629384, "State": "LA", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.350987, "lng": -93.629384, "phone": null, "country": null, "city": "Shreveport", "state": "LA", "postal_code": 71115.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_66e7e4cb9e21c5105737c4b9575877ef',
        'Cardiovascular Consultants',
        '2300 Hospital Drive, Ste. 450',
        32.552315,
        -93.708366,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(318) 752-2328',
        NULL,
        'United States',
        'Bossier City',
        'LA',
        '71111.0',
        'uploaded',
        'uploaded_66e7e4cb9e21c5105737c4b9575877ef',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants", "Address": "2300 Hospital Drive, Ste. 450", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(318) 752-2328", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Bossier City", "Zip Code": 71111.0, "Latitude": 32.552315, "Longitude": -93.708366, "State": "LA", "zipcode UTC": -6.0, "name": "Cardiovascular Consultants", "address": "2300 Hospital Drive, Ste. 450", "lat": 32.552315, "lng": -93.708366, "phone": "(318) 752-2328", "country": "United States", "city": "Bossier City", "state": "LA", "postal_code": 71111.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0a1458ad5668142de4596ca484f65495',
        'Cardiovascular Consultants',
        '102 Monroe Street',
        32.631009,
        -93.287512,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(318) 377-3425',
        NULL,
        'United States',
        'Gilark',
        'LA',
        '71055.0',
        'uploaded',
        'uploaded_0a1458ad5668142de4596ca484f65495',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants", "Address": "102 Monroe Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(318) 377-3425", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Gilark", "Zip Code": 71055.0, "Latitude": 32.631009, "Longitude": -93.287512, "State": "LA", "zipcode UTC": -6.0, "name": "Cardiovascular Consultants", "address": "102 Monroe Street", "lat": 32.631009, "lng": -93.287512, "phone": "(318) 377-3425", "country": "United States", "city": "Gilark", "state": "LA", "postal_code": 71055.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_657ae72cddfb2d4399756b1bf5e21fc8',
        'nan',
        'nan',
        32.631009,
        -93.287512,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Mcintyre',
        'LA',
        '71055.0',
        'uploaded',
        'uploaded_657ae72cddfb2d4399756b1bf5e21fc8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Mcintyre", "Zip Code": 71055.0, "Latitude": 32.631009, "Longitude": -93.287512, "State": "LA", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.631009, "lng": -93.287512, "phone": null, "country": null, "city": "Mcintyre", "state": "LA", "postal_code": 71055.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_e02df3f7758404ea5e021ed0656d6bbc',
        'Maine Medical Partners – MaineHealth Cardiology',
        '119 Gannett Dr',
        43.631549,
        -70.272724,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(207) 774-2642',
        NULL,
        'United States',
        'Portland',
        'ME',
        '4106.0',
        'uploaded',
        'uploaded_e02df3f7758404ea5e021ed0656d6bbc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Maine Medical Partners \u2013 MaineHealth Cardiology", "Address": "119 Gannett Dr", "Address Two": null, "clinic Hours of Operation": "Mon - Fri:  8:00am - 5:00pm", "Phone Number": "(207) 774-2642", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Portland", "Zip Code": 4106.0, "Latitude": 43.631549, "Longitude": -70.272724, "State": "ME", "zipcode UTC": -5.0, "name": "Maine Medical Partners \u2013 MaineHealth Cardiology", "address": "119 Gannett Dr", "lat": 43.631549, "lng": -70.272724, "phone": "(207) 774-2642", "country": "United States", "city": "Portland", "state": "ME", "postal_code": 4106.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_60728ae0a3375e154bd4d55ca49dbff5',
        'nan',
        'nan',
        43.631549,
        -70.272724,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'S Portland',
        'ME',
        '4106.0',
        'uploaded',
        'uploaded_60728ae0a3375e154bd4d55ca49dbff5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "S Portland", "Zip Code": 4106.0, "Latitude": 43.631549, "Longitude": -70.272724, "State": "ME", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 43.631549, "lng": -70.272724, "phone": null, "country": null, "city": "S Portland", "state": "ME", "postal_code": 4106.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_bd31ee96f862847ad56da211cc059501',
        'Maine Medical Partners – MaineHealth Cardiology',
        '198 Main St',
        44.094773,
        -70.191417,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(207) 777-5300',
        NULL,
        'United States',
        'Lewiston',
        'ME',
        '4240.0',
        'uploaded',
        'uploaded_bd31ee96f862847ad56da211cc059501',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Maine Medical Partners \u2013 MaineHealth Cardiology", "Address": "198 Main St", "Address Two": "Ste A", "clinic Hours of Operation": "Mon - Fri:  8:00am - 5:00pm", "Phone Number": "(207) 777-5300", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lewiston", "Zip Code": 4240.0, "Latitude": 44.094773, "Longitude": -70.191417, "State": "ME", "zipcode UTC": -5.0, "name": "Maine Medical Partners \u2013 MaineHealth Cardiology", "address": "198 Main St", "lat": 44.094773, "lng": -70.191417, "phone": "(207) 777-5300", "country": "United States", "city": "Lewiston", "state": "ME", "postal_code": 4240.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_1e6f3548e4544533dc95ac8ad469e77a',
        'Sierra Nevada Cardiology',
        '704 West Nye Lane',
        39.164966,
        -119.793824,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(775) 687-8570',
        NULL,
        'United States',
        'Carson City',
        'NV',
        '89703.0',
        'uploaded',
        'uploaded_1e6f3548e4544533dc95ac8ad469e77a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Sierra Nevada Cardiology", "Address": "704 West Nye Lane", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(775) 687-8570", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Carson City", "Zip Code": 89703.0, "Latitude": 39.164966, "Longitude": -119.793824, "State": "NV", "zipcode UTC": -8.0, "name": "Sierra Nevada Cardiology", "address": "704 West Nye Lane", "lat": 39.164966, "lng": -119.793824, "phone": "(775) 687-8570", "country": "United States", "city": "Carson City", "state": "NV", "postal_code": 89703.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a84d201e1e54070238b6bf1064cf7733',
        'New Beginning Cardiology',
        '1303 McCullough, Ste. 300',
        29.460381,
        -98.496495,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(210) 270-2992',
        NULL,
        'United States',
        'Olmos Park',
        'TX',
        '78212.0',
        'uploaded',
        'uploaded_a84d201e1e54070238b6bf1064cf7733',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "New Beginning Cardiology", "Address": "1303 McCullough, Ste. 300", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 4:30pm", "Phone Number": "(210) 270-2992", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Olmos Park", "Zip Code": 78212.0, "Latitude": 29.460381, "Longitude": -98.496495, "State": "TX", "zipcode UTC": -6.0, "name": "New Beginning Cardiology", "address": "1303 McCullough, Ste. 300", "lat": 29.460381, "lng": -98.496495, "phone": "(210) 270-2992", "country": "United States", "city": "Olmos Park", "state": "TX", "postal_code": 78212.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ada724933c93e015f65dfc6ba93e78fa',
        'nan',
        'nan',
        29.460381,
        -98.496495,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'San Antonio',
        'TX',
        '78212.0',
        'uploaded',
        'uploaded_ada724933c93e015f65dfc6ba93e78fa',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "San Antonio", "Zip Code": 78212.0, "Latitude": 29.460381, "Longitude": -98.496495, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 29.460381, "lng": -98.496495, "phone": null, "country": null, "city": "San Antonio", "state": "TX", "postal_code": 78212.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8a255c649aaac39a57d725c8c2b9dd72',
        'New Beginning Cardiology',
        '1303 McCullough, Ste. 343',
        29.460381,
        -98.496495,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(210) 271-7221',
        NULL,
        'United States',
        'Olmos Park',
        'TX',
        '78212.0',
        'uploaded',
        'uploaded_8a255c649aaac39a57d725c8c2b9dd72',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "New Beginning Cardiology", "Address": "1303 McCullough, Ste. 343", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 4:30pm", "Phone Number": "(210) 271-7221", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Olmos Park", "Zip Code": 78212.0, "Latitude": 29.460381, "Longitude": -98.496495, "State": "TX", "zipcode UTC": -6.0, "name": "New Beginning Cardiology", "address": "1303 McCullough, Ste. 343", "lat": 29.460381, "lng": -98.496495, "phone": "(210) 271-7221", "country": "United States", "city": "Olmos Park", "state": "TX", "postal_code": 78212.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_af16c9550cbcf1806e60508659156b5b',
        'Integrative Cardiology',
        '8 Commons Street',
        43.617302,
        -72.963253,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(802) 775-0100',
        NULL,
        'United States',
        'Clementwood',
        'VT',
        '5701.0',
        'uploaded',
        'uploaded_af16c9550cbcf1806e60508659156b5b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Integrative Cardiology", "Address": "8 Commons Street", "Address Two": null, "clinic Hours of Operation": "Mon-Thurs 8:00am - 4:30pm", "Phone Number": "(802) 775-0100", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Clementwood", "Zip Code": 5701.0, "Latitude": 43.617302, "Longitude": -72.963253, "State": "VT", "zipcode UTC": -5.0, "name": "Integrative Cardiology", "address": "8 Commons Street", "lat": 43.617302, "lng": -72.963253, "phone": "(802) 775-0100", "country": "United States", "city": "Clementwood", "state": "VT", "postal_code": 5701.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_fb4c81a9a45edf8947b0e789a188a1bc',
        'nan',
        'nan',
        43.617302,
        -72.963253,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'East Pittsford',
        'VT',
        '5701.0',
        'uploaded',
        'uploaded_fb4c81a9a45edf8947b0e789a188a1bc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "East Pittsford", "Zip Code": 5701.0, "Latitude": 43.617302, "Longitude": -72.963253, "State": "VT", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 43.617302, "lng": -72.963253, "phone": null, "country": null, "city": "East Pittsford", "state": "VT", "postal_code": 5701.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_eba27f3c7a26935433bcae26ab59080a',
        'Northeast Cardiology Associates',
        '1 Northeast Drive',
        44.81777,
        -68.789524,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(207) 992-7035',
        NULL,
        'United States',
        'Bangor',
        'ME',
        '4401.0',
        'uploaded',
        'uploaded_eba27f3c7a26935433bcae26ab59080a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Northeast Cardiology Associates", "Address": "1 Northeast Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(207) 992-7035", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Bangor", "Zip Code": 4401.0, "Latitude": 44.81777, "Longitude": -68.789524, "State": "ME", "zipcode UTC": -5.0, "name": "Northeast Cardiology Associates", "address": "1 Northeast Drive", "lat": 44.81777, "lng": -68.789524, "phone": "(207) 992-7035", "country": "United States", "city": "Bangor", "state": "ME", "postal_code": 4401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ef39c861a2df8f75764cf9285886b0ad',
        'nan',
        'nan',
        44.81777,
        -68.789524,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Glenburn',
        'ME',
        '4401.0',
        'uploaded',
        'uploaded_ef39c861a2df8f75764cf9285886b0ad',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Glenburn", "Zip Code": 4401.0, "Latitude": 44.81777, "Longitude": -68.789524, "State": "ME", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 44.81777, "lng": -68.789524, "phone": null, "country": null, "city": "Glenburn", "state": "ME", "postal_code": 4401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_cfa01ca85647ac644762b73a62c3d75a',
        'South Denver Cardiology',
        '1000 Southpark Drive',
        39.599687,
        -105.006584,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(303) 744-1065',
        NULL,
        'United States',
        'Littleton',
        'CO',
        '80120.0',
        'uploaded',
        'uploaded_cfa01ca85647ac644762b73a62c3d75a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "South Denver Cardiology", "Address": "1000 Southpark Drive", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(303) 744-1065", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Littleton", "Zip Code": 80120.0, "Latitude": 39.599687, "Longitude": -105.006584, "State": "CO", "zipcode UTC": -7.0, "name": "South Denver Cardiology", "address": "1000 Southpark Drive", "lat": 39.599687, "lng": -105.006584, "phone": "(303) 744-1065", "country": "United States", "city": "Littleton", "state": "CO", "postal_code": 80120.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_651e4ec13a81dff18cb26a9c5c08a471',
        'Methodist DeBakey Cardiology Associates',
        '6550 Fannin Street, Ste. 1901',
        29.704584,
        -95.404669,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(713) 441-1100',
        NULL,
        'United States',
        'Houston',
        'TX',
        '77030.0',
        'uploaded',
        'uploaded_651e4ec13a81dff18cb26a9c5c08a471',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Methodist DeBakey Cardiology Associates", "Address": "6550 Fannin Street, Ste. 1901", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(713) 441-1100", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Houston", "Zip Code": 77030.0, "Latitude": 29.704584, "Longitude": -95.404669, "State": "TX", "zipcode UTC": -6.0, "name": "Methodist DeBakey Cardiology Associates", "address": "6550 Fannin Street, Ste. 1901", "lat": 29.704584, "lng": -95.404669, "phone": "(713) 441-1100", "country": "United States", "city": "Houston", "state": "TX", "postal_code": 77030.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_1d3a137f9570490ba44b993caf4c36e3',
        'nan',
        'nan',
        29.704584,
        -95.404669,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'V A Hospital',
        'TX',
        '77030.0',
        'uploaded',
        'uploaded_1d3a137f9570490ba44b993caf4c36e3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "V A Hospital", "Zip Code": 77030.0, "Latitude": 29.704584, "Longitude": -95.404669, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 29.704584, "lng": -95.404669, "phone": null, "country": null, "city": "V A Hospital", "state": "TX", "postal_code": 77030.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_2d69ccfc1bf3caa1f5867599613ecc35',
        'Upstate Cardiology',
        '2 Innovation Dr',
        34.825592,
        -82.340997,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(864) 235-7665',
        NULL,
        'United States',
        'Batesville',
        'SC',
        '29607.0',
        'uploaded',
        'uploaded_2d69ccfc1bf3caa1f5867599613ecc35',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Upstate Cardiology", "Address": "2 Innovation Dr", "Address Two": "Ste 400", "clinic Hours of Operation": null, "Phone Number": "(864) 235-7665", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Batesville", "Zip Code": 29607.0, "Latitude": 34.825592, "Longitude": -82.340997, "State": "SC", "zipcode UTC": -5.0, "name": "Upstate Cardiology", "address": "2 Innovation Dr", "lat": 34.825592, "lng": -82.340997, "phone": "(864) 235-7665", "country": "United States", "city": "Batesville", "state": "SC", "postal_code": 29607.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_db8aace714e31a4ee3bec22713802cea',
        'nan',
        'nan',
        34.825592,
        -82.340997,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Greenville',
        'SC',
        '29607.0',
        'uploaded',
        'uploaded_db8aace714e31a4ee3bec22713802cea',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Greenville", "Zip Code": 29607.0, "Latitude": 34.825592, "Longitude": -82.340997, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.825592, "lng": -82.340997, "phone": null, "country": null, "city": "Greenville", "state": "SC", "postal_code": 29607.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_815ee99348a3877c529fd1ae6a3678cb',
        'Upstate Cardiology',
        '702 North A Street',
        34.849655,
        -82.59365,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(864) 859-9855',
        NULL,
        'United States',
        'Easley',
        'SC',
        '29640.0',
        'uploaded',
        'uploaded_815ee99348a3877c529fd1ae6a3678cb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Upstate Cardiology", "Address": "702 North A Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 5:00pm", "Phone Number": "(864) 859-9855", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Easley", "Zip Code": 29640.0, "Latitude": 34.849655, "Longitude": -82.59365, "State": "SC", "zipcode UTC": -5.0, "name": "Upstate Cardiology", "address": "702 North A Street", "lat": 34.849655, "lng": -82.59365, "phone": "(864) 859-9855", "country": "United States", "city": "Easley", "state": "SC", "postal_code": 29640.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_7384be8eaac7a47f7b00360ceef52a01',
        'Columbus Cardiology Associates',
        '2525 Williams Road',
        32.53554,
        -84.92583,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(706) 243-2334',
        NULL,
        'United States',
        'Cols',
        'GA',
        '31909.0',
        'uploaded',
        'uploaded_7384be8eaac7a47f7b00360ceef52a01',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Columbus Cardiology Associates", "Address": "2525 Williams Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(706) 243-2334", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cols", "Zip Code": 31909.0, "Latitude": 32.53554, "Longitude": -84.92583, "State": "GA", "zipcode UTC": -5.0, "name": "Columbus Cardiology Associates", "address": "2525 Williams Road", "lat": 32.53554, "lng": -84.92583, "phone": "(706) 243-2334", "country": "United States", "city": "Cols", "state": "GA", "postal_code": 31909.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f4620d4e27e416b6ee6564509de97cfc',
        'nan',
        'nan',
        32.53554,
        -84.92583,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Columbus',
        'GA',
        '31909.0',
        'uploaded',
        'uploaded_f4620d4e27e416b6ee6564509de97cfc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Columbus", "Zip Code": 31909.0, "Latitude": 32.53554, "Longitude": -84.92583, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.53554, "lng": -84.92583, "phone": null, "country": null, "city": "Columbus", "state": "GA", "postal_code": 31909.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_26e288fb21f597027b9df928454fb363',
        'California Coastal Cardiology',
        '1235 West Vista Way, Ste. L',
        33.179587,
        -117.244612,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(760) 439-6581',
        NULL,
        'United States',
        'Vista',
        'CA',
        '92083.0',
        'uploaded',
        'uploaded_26e288fb21f597027b9df928454fb363',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "California Coastal Cardiology", "Address": "1235 West Vista Way, Ste. L", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(760) 439-6581", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Vista", "Zip Code": 92083.0, "Latitude": 33.179587, "Longitude": -117.244612, "State": "CA", "zipcode UTC": -8.0, "name": "California Coastal Cardiology", "address": "1235 West Vista Way, Ste. L", "lat": 33.179587, "lng": -117.244612, "phone": "(760) 439-6581", "country": "United States", "city": "Vista", "state": "CA", "postal_code": 92083.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_32cd4b8abe59073fa24717fbd6c56745',
        'Dupage Medical Group Cardiology',
        '25 North Winfield Road',
        41.875228,
        -88.152617,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(630) 933-8100',
        NULL,
        'United States',
        'Winfield',
        'IL',
        '60190.0',
        'uploaded',
        'uploaded_32cd4b8abe59073fa24717fbd6c56745',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Dupage Medical Group Cardiology", "Address": "25 North Winfield Road", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(630) 933-8100", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Winfield", "Zip Code": 60190.0, "Latitude": 41.875228, "Longitude": -88.152617, "State": "IL", "zipcode UTC": -6.0, "name": "Dupage Medical Group Cardiology", "address": "25 North Winfield Road", "lat": 41.875228, "lng": -88.152617, "phone": "(630) 933-8100", "country": "United States", "city": "Winfield", "state": "IL", "postal_code": 60190.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_be5b2f3d94fcb64d22ada17ab0adda1a',
        'Cardiology Assocaites of Northwest Indiana',
        '10010 Donald Powers Drive',
        41.551457,
        -87.501431,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(219) 934-4200',
        NULL,
        'United States',
        'Hammond',
        'IN',
        '46321.0',
        'uploaded',
        'uploaded_be5b2f3d94fcb64d22ada17ab0adda1a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Assocaites of Northwest Indiana", "Address": "10010 Donald Powers Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 5:00pm", "Phone Number": "(219) 934-4200", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Hammond", "Zip Code": 46321.0, "Latitude": 41.551457, "Longitude": -87.501431, "State": "IN", "zipcode UTC": -6.0, "name": "Cardiology Assocaites of Northwest Indiana", "address": "10010 Donald Powers Drive", "lat": 41.551457, "lng": -87.501431, "phone": "(219) 934-4200", "country": "United States", "city": "Hammond", "state": "IN", "postal_code": 46321.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_3d83accc54e50854f9581c08acad5c02',
        'nan',
        'nan',
        41.551457,
        -87.501431,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Munster',
        'IN',
        '46321.0',
        'uploaded',
        'uploaded_3d83accc54e50854f9581c08acad5c02',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Munster", "Zip Code": 46321.0, "Latitude": 41.551457, "Longitude": -87.501431, "State": "IN", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 41.551457, "lng": -87.501431, "phone": null, "country": null, "city": "Munster", "state": "IN", "postal_code": 46321.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_2fb8db26b20066b88ea02367dd41f8f9',
        'East Atlanta Cardiology',
        '5447 Dividend Drive',
        33.725739,
        -84.211144,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(770) 322-8881',
        NULL,
        'United States',
        'Decatur',
        'GA',
        '30035.0',
        'uploaded',
        'uploaded_2fb8db26b20066b88ea02367dd41f8f9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "East Atlanta Cardiology", "Address": "5447 Dividend Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Wed 8:30am - 5:00pm", "Phone Number": "(770) 322-8881", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Decatur", "Zip Code": 30035.0, "Latitude": 33.725739, "Longitude": -84.211144, "State": "GA", "zipcode UTC": -5.0, "name": "East Atlanta Cardiology", "address": "5447 Dividend Drive", "lat": 33.725739, "lng": -84.211144, "phone": "(770) 322-8881", "country": "United States", "city": "Decatur", "state": "GA", "postal_code": 30035.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8820f185622941039aa9461547007f1d',
        'nan',
        'nan',
        33.725739,
        -84.211144,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Snapfinger',
        'GA',
        '30035.0',
        'uploaded',
        'uploaded_8820f185622941039aa9461547007f1d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Snapfinger", "Zip Code": 30035.0, "Latitude": 33.725739, "Longitude": -84.211144, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 33.725739, "lng": -84.211144, "phone": null, "country": null, "city": "Snapfinger", "state": "GA", "postal_code": 30035.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f5e5f8669175195f70c4cde98f7a4746',
        'Institute for Advanced Cardiovascular Care',
        '2375 Champions Boulevard',
        32.577135,
        -85.472821,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(334) 321-3600',
        NULL,
        'United States',
        'Auburn',
        'AL',
        '36830.0',
        'uploaded',
        'uploaded_f5e5f8669175195f70c4cde98f7a4746',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Institute for Advanced Cardiovascular Care", "Address": "2375 Champions Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(334) 321-3600", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Auburn", "Zip Code": 36830.0, "Latitude": 32.577135, "Longitude": -85.472821, "State": "AL", "zipcode UTC": -6.0, "name": "Institute for Advanced Cardiovascular Care", "address": "2375 Champions Boulevard", "lat": 32.577135, "lng": -85.472821, "phone": "(334) 321-3600", "country": "United States", "city": "Auburn", "state": "AL", "postal_code": 36830.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_da8015e3a783d6c17c448047bf42b7bf',
        'nan',
        'nan',
        32.577135,
        -85.472821,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Big Blue Book Store',
        'AL',
        '36830.0',
        'uploaded',
        'uploaded_da8015e3a783d6c17c448047bf42b7bf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Big Blue Book Store", "Zip Code": 36830.0, "Latitude": 32.577135, "Longitude": -85.472821, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.577135, "lng": -85.472821, "phone": null, "country": null, "city": "Big Blue Book Store", "state": "AL", "postal_code": 36830.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_501ea666a7ae289e3f069b43f174b00a',
        'Riverside Cardiology Associates',
        '28780 Single Oak Drive, Ste. 270',
        33.479467,
        -117.20933,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(951) 696-3559',
        NULL,
        'United States',
        'Rancho California',
        'CA',
        '92590.0',
        'uploaded',
        'uploaded_501ea666a7ae289e3f069b43f174b00a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Riverside Cardiology Associates", "Address": "28780 Single Oak Drive, Ste. 270", "Address Two": null, "clinic Hours of Operation": "Tues 9:00am - 3:00pm, Fri 9:00am - 11:30am", "Phone Number": "(951) 696-3559", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Rancho California", "Zip Code": 92590.0, "Latitude": 33.479467, "Longitude": -117.20933, "State": "CA", "zipcode UTC": -8.0, "name": "Riverside Cardiology Associates", "address": "28780 Single Oak Drive, Ste. 270", "lat": 33.479467, "lng": -117.20933, "phone": "(951) 696-3559", "country": "United States", "city": "Rancho California", "state": "CA", "postal_code": 92590.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_9633edb11cf39af6371b8c82a0cd8017',
        'nan',
        'nan',
        33.479467,
        -117.20933,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Temecula',
        'CA',
        '92590.0',
        'uploaded',
        'uploaded_9633edb11cf39af6371b8c82a0cd8017',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Temecula", "Zip Code": 92590.0, "Latitude": 33.479467, "Longitude": -117.20933, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 33.479467, "lng": -117.20933, "phone": null, "country": null, "city": "Temecula", "state": "CA", "postal_code": 92590.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_994033b8291c15e6a12eb2e759c51fd4',
        'Riverside Cardiology Associates',
        '4500 Brockton Avenue, Ste. 203',
        33.991181,
        -117.370744,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(951) 686-3600',
        NULL,
        'United States',
        'Riverside',
        'CA',
        '92501.0',
        'uploaded',
        'uploaded_994033b8291c15e6a12eb2e759c51fd4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Riverside Cardiology Associates", "Address": "4500 Brockton Avenue, Ste. 203", "Address Two": null, "clinic Hours of Operation": "Mon - Fri: 8:30am - 5:00pm\n\n\n\n", "Phone Number": "(951) 686-3600", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Riverside", "Zip Code": 92501.0, "Latitude": 33.991181, "Longitude": -117.370744, "State": "CA", "zipcode UTC": -8.0, "name": "Riverside Cardiology Associates", "address": "4500 Brockton Avenue, Ste. 203", "lat": 33.991181, "lng": -117.370744, "phone": "(951) 686-3600", "country": "United States", "city": "Riverside", "state": "CA", "postal_code": 92501.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5d0c3eb2c90b5033e65bbcbced11d996',
        'Warren Clinic Cardiology',
        '6151 South Yale Avenue, Ste. 1304',
        36.059495,
        -95.93922,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(918) 494-6900',
        NULL,
        'United States',
        'Tulsa',
        'OK',
        '74136.0',
        'uploaded',
        'uploaded_5d0c3eb2c90b5033e65bbcbced11d996',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Warren Clinic Cardiology", "Address": "6151 South Yale Avenue, Ste. 1304", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(918) 494-6900", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Tulsa", "Zip Code": 74136.0, "Latitude": 36.059495, "Longitude": -95.93922, "State": "OK", "zipcode UTC": -6.0, "name": "Warren Clinic Cardiology", "address": "6151 South Yale Avenue, Ste. 1304", "lat": 36.059495, "lng": -95.93922, "phone": "(918) 494-6900", "country": "United States", "city": "Tulsa", "state": "OK", "postal_code": 74136.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_51233d8736bfd29d79b65308daac214e',
        'Auburn Cardiovascular',
        '994 Drew Lane',
        32.577135,
        -85.472821,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(334) 821-1219',
        NULL,
        'United States',
        'Auburn',
        'AL',
        '36830.0',
        'uploaded',
        'uploaded_51233d8736bfd29d79b65308daac214e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Auburn Cardiovascular", "Address": "994 Drew Lane", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(334) 821-1219", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Auburn", "Zip Code": 36830.0, "Latitude": 32.577135, "Longitude": -85.472821, "State": "AL", "zipcode UTC": -6.0, "name": "Auburn Cardiovascular", "address": "994 Drew Lane", "lat": 32.577135, "lng": -85.472821, "phone": "(334) 821-1219", "country": "United States", "city": "Auburn", "state": "AL", "postal_code": 36830.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_894d30983b610f370d554dfc86ddf832',
        'Bluestem Cardiology',
        '3400 SE Frank Phillips Boulevard, Ste. 502',
        36.733398,
        -95.924049,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(918) 331-2577',
        NULL,
        'United States',
        'Bartlesville',
        'OK',
        '74006.0',
        'uploaded',
        'uploaded_894d30983b610f370d554dfc86ddf832',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Bluestem Cardiology", "Address": "3400 SE Frank Phillips Boulevard, Ste. 502", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(918) 331-2577", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Bartlesville", "Zip Code": 74006.0, "Latitude": 36.733398, "Longitude": -95.924049, "State": "OK", "zipcode UTC": -6.0, "name": "Bluestem Cardiology", "address": "3400 SE Frank Phillips Boulevard, Ste. 502", "lat": 36.733398, "lng": -95.924049, "phone": "(918) 331-2577", "country": "United States", "city": "Bartlesville", "state": "OK", "postal_code": 74006.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_de97423ca6f19a094323d4546000855f',
        'nan',
        'nan',
        36.733398,
        -95.924049,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Brtlsville',
        'OK',
        '74006.0',
        'uploaded',
        'uploaded_de97423ca6f19a094323d4546000855f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Brtlsville", "Zip Code": 74006.0, "Latitude": 36.733398, "Longitude": -95.924049, "State": "OK", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 36.733398, "lng": -95.924049, "phone": null, "country": null, "city": "Brtlsville", "state": "OK", "postal_code": 74006.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_17644900caf34e937bd812fa241ba1f1',
        'Parkersburg Cardiology Associates',
        '600 18th Street, Ste. 512',
        39.306083,
        -81.366395,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(304) 424-4574',
        NULL,
        'United States',
        'Waverly',
        'WV',
        '26184.0',
        'uploaded',
        'uploaded_17644900caf34e937bd812fa241ba1f1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Parkersburg Cardiology Associates", "Address": "600 18th Street, Ste. 512", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(304) 424-4574", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Waverly", "Zip Code": 26184.0, "Latitude": 39.306083, "Longitude": -81.366395, "State": "WV", "zipcode UTC": -5.0, "name": "Parkersburg Cardiology Associates", "address": "600 18th Street, Ste. 512", "lat": 39.306083, "lng": -81.366395, "phone": "(304) 424-4574", "country": "United States", "city": "Waverly", "state": "WV", "postal_code": 26184.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_623718c3cc152669f758d23eac1e8d33',
        'South Charleston Cardiodiagnostics',
        '428 Division Street',
        38.329768,
        -81.734186,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(304) 766-3688',
        NULL,
        'United States',
        'Charleston',
        'WV',
        '25309.0',
        'uploaded',
        'uploaded_623718c3cc152669f758d23eac1e8d33',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "South Charleston Cardiodiagnostics", "Address": "428 Division Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 6:30am - 5:00pm", "Phone Number": "(304) 766-3688", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Charleston", "Zip Code": 25309.0, "Latitude": 38.329768, "Longitude": -81.734186, "State": "WV", "zipcode UTC": -5.0, "name": "South Charleston Cardiodiagnostics", "address": "428 Division Street", "lat": 38.329768, "lng": -81.734186, "phone": "(304) 766-3688", "country": "United States", "city": "Charleston", "state": "WV", "postal_code": 25309.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_250de45f56ae9473d092666a8b8c8958',
        'nan',
        'nan',
        38.329768,
        -81.734186,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'S Charleston',
        'WV',
        '25309.0',
        'uploaded',
        'uploaded_250de45f56ae9473d092666a8b8c8958',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "S Charleston", "Zip Code": 25309.0, "Latitude": 38.329768, "Longitude": -81.734186, "State": "WV", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 38.329768, "lng": -81.734186, "phone": null, "country": null, "city": "S Charleston", "state": "WV", "postal_code": 25309.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_7777c185219e85c24bdd1d1e96c5dc80',
        'Northampton Cardiology Associates',
        '10 Main Street',
        42.324232,
        -72.679157,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(413) 584-1588',
        NULL,
        'United States',
        'Bay State Village',
        'MA',
        '1062.0',
        'uploaded',
        'uploaded_7777c185219e85c24bdd1d1e96c5dc80',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Northampton Cardiology Associates", "Address": "10 Main Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 4:30am", "Phone Number": "(413) 584-1588", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Bay State Village", "Zip Code": 1062.0, "Latitude": 42.324232, "Longitude": -72.679157, "State": "MA", "zipcode UTC": -5.0, "name": "Northampton Cardiology Associates", "address": "10 Main Street", "lat": 42.324232, "lng": -72.679157, "phone": "(413) 584-1588", "country": "United States", "city": "Bay State Village", "state": "MA", "postal_code": 1062.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_d913d0c1149585782de92743051f9e34',
        'nan',
        'nan',
        42.324232,
        -72.679157,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Bay State Vlg',
        'MA',
        '1062.0',
        'uploaded',
        'uploaded_d913d0c1149585782de92743051f9e34',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Bay State Vlg", "Zip Code": 1062.0, "Latitude": 42.324232, "Longitude": -72.679157, "State": "MA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 42.324232, "lng": -72.679157, "phone": null, "country": null, "city": "Bay State Vlg", "state": "MA", "postal_code": 1062.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f8f11202b7954d48e53df2dc657bf23b',
        'Camp Lowell Cardiology',
        '4790 E Camp Lowell Dr.',
        32.249551,
        -110.887805,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(520) 319-5922',
        NULL,
        'United States',
        'Tucson',
        'AZ',
        '85712.0',
        'uploaded',
        'uploaded_f8f11202b7954d48e53df2dc657bf23b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Camp Lowell Cardiology", "Address": "4790 E Camp Lowell Dr.", "Address Two": null, "clinic Hours of Operation": "Mon-Thurs 8:00am - 5:00pm, Fri 8:00am - 3:00pm", "Phone Number": "(520) 319-5922", "Country": "United States", "Time Zone Display": "MST - Mountain Standard Time", "City": "Tucson", "Zip Code": 85712.0, "Latitude": 32.249551, "Longitude": -110.887805, "State": "AZ", "zipcode UTC": -7.0, "name": "Camp Lowell Cardiology", "address": "4790 E Camp Lowell Dr.", "lat": 32.249551, "lng": -110.887805, "phone": "(520) 319-5922", "country": "United States", "city": "Tucson", "state": "AZ", "postal_code": 85712.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5427f35caac08f2b57da274b47939099',
        'Cardiovascular Consultants of Cape Cod',
        '140 Yarmouth Road',
        41.654741,
        -70.289501,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(508) 778-8818',
        NULL,
        'United States',
        'Hyannis',
        'MA',
        '2601.0',
        'uploaded',
        'uploaded_5427f35caac08f2b57da274b47939099',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants of Cape Cod", "Address": "140 Yarmouth Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(508) 778-8818", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hyannis", "Zip Code": 2601.0, "Latitude": 41.654741, "Longitude": -70.289501, "State": "MA", "zipcode UTC": -5.0, "name": "Cardiovascular Consultants of Cape Cod", "address": "140 Yarmouth Road", "lat": 41.654741, "lng": -70.289501, "phone": "(508) 778-8818", "country": "United States", "city": "Hyannis", "state": "MA", "postal_code": 2601.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_7c3a3fc6b83feb2594c047ccba5e48d4',
        'Cardiovascular Consultants of Idaho',
        '1070 North Curtis Road, Ste. 125',
        43.593523,
        -116.199032,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(208) 377-1415',
        NULL,
        'United States',
        'Boise',
        'ID',
        '83706.0',
        'uploaded',
        'uploaded_7c3a3fc6b83feb2594c047ccba5e48d4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants of Idaho", "Address": "1070 North Curtis Road, Ste. 125", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(208) 377-1415", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Boise", "Zip Code": 83706.0, "Latitude": 43.593523, "Longitude": -116.199032, "State": "ID", "zipcode UTC": -7.0, "name": "Cardiovascular Consultants of Idaho", "address": "1070 North Curtis Road, Ste. 125", "lat": 43.593523, "lng": -116.199032, "phone": "(208) 377-1415", "country": "United States", "city": "Boise", "state": "ID", "postal_code": 83706.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_777dc97571872b0ef5b471c78b8977f0',
        'The Cardiovascular Specialists',
        '90 Ter Heun Drive',
        41.56105,
        -70.619682,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(508) 540-0604',
        NULL,
        'United States',
        'Falmouth',
        'MA',
        '2540.0',
        'uploaded',
        'uploaded_777dc97571872b0ef5b471c78b8977f0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "The Cardiovascular Specialists", "Address": "90 Ter Heun Drive", "Address Two": "Ste. 300", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(508) 540-0604", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Falmouth", "Zip Code": 2540.0, "Latitude": 41.56105, "Longitude": -70.619682, "State": "MA", "zipcode UTC": -5.0, "name": "The Cardiovascular Specialists", "address": "90 Ter Heun Drive", "lat": 41.56105, "lng": -70.619682, "phone": "(508) 540-0604", "country": "United States", "city": "Falmouth", "state": "MA", "postal_code": 2540.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_cabec79c9fc0c60a5642f5a8df4a8f91',
        'Desert Cardiology of Tucson',
        '6080 North La Chola Boulevard, Ste. 200',
        32.338126,
        -111.04259,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(520) 797-8550',
        NULL,
        'United States',
        'Tucson',
        'AZ',
        '85741.0',
        'uploaded',
        'uploaded_cabec79c9fc0c60a5642f5a8df4a8f91',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Desert Cardiology of Tucson", "Address": "6080 North La Chola Boulevard, Ste. 200", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(520) 797-8550", "Country": "United States", "Time Zone Display": "MST - Mountain Standard Time", "City": "Tucson", "Zip Code": 85741.0, "Latitude": 32.338126, "Longitude": -111.04259, "State": "AZ", "zipcode UTC": -7.0, "name": "Desert Cardiology of Tucson", "address": "6080 North La Chola Boulevard, Ste. 200", "lat": 32.338126, "lng": -111.04259, "phone": "(520) 797-8550", "country": "United States", "city": "Tucson", "state": "AZ", "postal_code": 85741.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8fda40445c7ed014b7b327a3e3290f30',
        'Desert Cardiology of Tucson',
        '1521 East Tangerine Road, Ste. 255',
        32.4492,
        -110.9708,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(520) 797-8550',
        NULL,
        'United States',
        'Oro Valley',
        'AZ',
        '85755.0',
        'uploaded',
        'uploaded_8fda40445c7ed014b7b327a3e3290f30',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Desert Cardiology of Tucson", "Address": "1521 East Tangerine Road, Ste. 255", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(520) 797-8550", "Country": "United States", "Time Zone Display": "MST - Mountain Standard Time", "City": "Oro Valley", "Zip Code": 85755.0, "Latitude": 32.4492, "Longitude": -110.9708, "State": "AZ", "zipcode UTC": -7.0, "name": "Desert Cardiology of Tucson", "address": "1521 East Tangerine Road, Ste. 255", "lat": 32.4492, "lng": -110.9708, "phone": "(520) 797-8550", "country": "United States", "city": "Oro Valley", "state": "AZ", "postal_code": 85755.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_9f6ee77b24456170394de344a3f42d42',
        'nan',
        'nan',
        32.4492,
        -110.9708,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Tucson',
        'AZ',
        '85755.0',
        'uploaded',
        'uploaded_9f6ee77b24456170394de344a3f42d42',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MST - Mountain Standard Time", "City": "Tucson", "Zip Code": 85755.0, "Latitude": 32.4492, "Longitude": -110.9708, "State": "AZ", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 32.4492, "lng": -110.9708, "phone": null, "country": null, "city": "Tucson", "state": "AZ", "postal_code": 85755.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_e9384c849e5fe8ca7d17f3db9b399d6a',
        'Premier Cardiovascular Center',
        '803 North Salk Drive',
        32.878138,
        -111.734993,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(520) 836-6682',
        NULL,
        'United States',
        'Casa Grande',
        'AZ',
        '85222.0',
        'uploaded',
        'uploaded_e9384c849e5fe8ca7d17f3db9b399d6a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Cardiovascular Center", "Address": "803 North Salk Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(520) 836-6682", "Country": "United States", "Time Zone Display": "MST - Mountain Standard Time", "City": "Casa Grande", "Zip Code": 85222.0, "Latitude": 32.878138, "Longitude": -111.734993, "State": "AZ", "zipcode UTC": -7.0, "name": "Premier Cardiovascular Center", "address": "803 North Salk Drive", "lat": 32.878138, "lng": -111.734993, "phone": "(520) 836-6682", "country": "United States", "city": "Casa Grande", "state": "AZ", "postal_code": 85222.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0e2bbb51322f44e4c9f850398c17b8ed',
        'nan',
        'nan',
        32.878138,
        -111.734993,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Eleven Mile',
        'AZ',
        '85222.0',
        'uploaded',
        'uploaded_0e2bbb51322f44e4c9f850398c17b8ed',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MST - Mountain Standard Time", "City": "Eleven Mile", "Zip Code": 85222.0, "Latitude": 32.878138, "Longitude": -111.734993, "State": "AZ", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 32.878138, "lng": -111.734993, "phone": null, "country": null, "city": "Eleven Mile", "state": "AZ", "postal_code": 85222.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_534f2e1292d3c17e104a7a865544751a',
        'Younis Cardiology Associates',
        '6624 Fannin, Ste. 2420',
        29.704584,
        -95.404669,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(713) 790-0400',
        NULL,
        'United States',
        'Houston',
        'TX',
        '77030.0',
        'uploaded',
        'uploaded_534f2e1292d3c17e104a7a865544751a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Younis Cardiology Associates", "Address": "6624 Fannin, Ste. 2420", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(713) 790-0400", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Houston", "Zip Code": 77030.0, "Latitude": 29.704584, "Longitude": -95.404669, "State": "TX", "zipcode UTC": -6.0, "name": "Younis Cardiology Associates", "address": "6624 Fannin, Ste. 2420", "lat": 29.704584, "lng": -95.404669, "phone": "(713) 790-0400", "country": "United States", "city": "Houston", "state": "TX", "postal_code": 77030.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_48085f4461bdd72a1b333bf081ff059a',
        'North Texas Cardiology Center',
        '2101 9th Street',
        33.916497,
        -98.471329,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(940) 766-4488',
        NULL,
        'United States',
        'Wichita Falls',
        'TX',
        '76301.0',
        'uploaded',
        'uploaded_48085f4461bdd72a1b333bf081ff059a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "North Texas Cardiology Center", "Address": "2101 9th Street", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(940) 766-4488", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Wichita Falls", "Zip Code": 76301.0, "Latitude": 33.916497, "Longitude": -98.471329, "State": "TX", "zipcode UTC": -6.0, "name": "North Texas Cardiology Center", "address": "2101 9th Street", "lat": 33.916497, "lng": -98.471329, "phone": "(940) 766-4488", "country": "United States", "city": "Wichita Falls", "state": "TX", "postal_code": 76301.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f7c5f54f52fe0c62f0254acc21e2aa9b',
        'Cardiology Clinic of Muskogee',
        '350 South 40th Street',
        35.739681,
        -95.407114,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(918) 683-0753',
        NULL,
        'United States',
        'Bacone',
        'OK',
        '74401.0',
        'uploaded',
        'uploaded_f7c5f54f52fe0c62f0254acc21e2aa9b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Clinic of Muskogee", "Address": "350 South 40th Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 5:00pm", "Phone Number": "(918) 683-0753", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Bacone", "Zip Code": 74401.0, "Latitude": 35.739681, "Longitude": -95.407114, "State": "OK", "zipcode UTC": -6.0, "name": "Cardiology Clinic of Muskogee", "address": "350 South 40th Street", "lat": 35.739681, "lng": -95.407114, "phone": "(918) 683-0753", "country": "United States", "city": "Bacone", "state": "OK", "postal_code": 74401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a01a85cd53f527ffc45e5b1d1f4c228d',
        'nan',
        'nan',
        35.739681,
        -95.407114,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Beland',
        'OK',
        '74401.0',
        'uploaded',
        'uploaded_a01a85cd53f527ffc45e5b1d1f4c228d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Beland", "Zip Code": 74401.0, "Latitude": 35.739681, "Longitude": -95.407114, "State": "OK", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 35.739681, "lng": -95.407114, "phone": null, "country": null, "city": "Beland", "state": "OK", "postal_code": 74401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_fc9bd2fa4e5889a85a973a59e88938b2',
        'Brockton Cardiology Associates',
        '830 Oak Street',
        42.0794,
        -71.034413,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(508) 583-4440',
        NULL,
        'United States',
        'Brockton',
        'MA',
        '2301.0',
        'uploaded',
        'uploaded_fc9bd2fa4e5889a85a973a59e88938b2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Brockton Cardiology Associates", "Address": "830 Oak Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am -5:00pm", "Phone Number": "(508) 583-4440", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Brockton", "Zip Code": 2301.0, "Latitude": 42.0794, "Longitude": -71.034413, "State": "MA", "zipcode UTC": -5.0, "name": "Brockton Cardiology Associates", "address": "830 Oak Street", "lat": 42.0794, "lng": -71.034413, "phone": "(508) 583-4440", "country": "United States", "city": "Brockton", "state": "MA", "postal_code": 2301.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8066cf86fb92f0683e25dc37c54e4e17',
        'Southwest Cardiovascular Center',
        '1255 South Telshor Boulevard',
        32.312506,
        -106.703061,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(575) 522-0300',
        NULL,
        'United States',
        'Las Cruces',
        'NM',
        '88011.0',
        'uploaded',
        'uploaded_8066cf86fb92f0683e25dc37c54e4e17',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Southwest Cardiovascular Center", "Address": "1255 South Telshor Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(575) 522-0300", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Las Cruces", "Zip Code": 88011.0, "Latitude": 32.312506, "Longitude": -106.703061, "State": "NM", "zipcode UTC": -7.0, "name": "Southwest Cardiovascular Center", "address": "1255 South Telshor Boulevard", "lat": 32.312506, "lng": -106.703061, "phone": "(575) 522-0300", "country": "United States", "city": "Las Cruces", "state": "NM", "postal_code": 88011.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0d9620521e761983bc49df32f972c2c3',
        'Cardiology Institute of Michigan',
        '5100 Gateway Centre Drive',
        42.973263,
        -83.701423,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(810) 733-6480',
        NULL,
        'United States',
        'Flint',
        'MI',
        '48507.0',
        'uploaded',
        'uploaded_0d9620521e761983bc49df32f972c2c3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Institute of Michigan", "Address": "5100 Gateway Centre Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(810) 733-6480", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Flint", "Zip Code": 48507.0, "Latitude": 42.973263, "Longitude": -83.701423, "State": "MI", "zipcode UTC": -5.0, "name": "Cardiology Institute of Michigan", "address": "5100 Gateway Centre Drive", "lat": 42.973263, "lng": -83.701423, "phone": "(810) 733-6480", "country": "United States", "city": "Flint", "state": "MI", "postal_code": 48507.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_82cf4fb441e50f0b488d73f3ca4fbd3c',
        'Central Cardiology Medical Clinic',
        '2901 Sillect Avenue, Ste. 100',
        35.487491,
        -119.008966,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(661) 323-8384',
        NULL,
        'United States',
        'Bakersfield',
        'CA',
        '93308.0',
        'uploaded',
        'uploaded_82cf4fb441e50f0b488d73f3ca4fbd3c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Central Cardiology Medical Clinic", "Address": "2901 Sillect Avenue, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(661) 323-8384", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Bakersfield", "Zip Code": 93308.0, "Latitude": 35.487491, "Longitude": -119.008966, "State": "CA", "zipcode UTC": -8.0, "name": "Central Cardiology Medical Clinic", "address": "2901 Sillect Avenue, Ste. 100", "lat": 35.487491, "lng": -119.008966, "phone": "(661) 323-8384", "country": "United States", "city": "Bakersfield", "state": "CA", "postal_code": 93308.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5ce8d23c2bbab05861bca8682f4359b5',
        'TPMG Williamsburg Diagnostic Cardiology',
        '4125 Ironpound Road, Ste. 201',
        37.322936,
        -76.757931,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(757) 565-0600',
        NULL,
        'United States',
        'Williamsburg',
        'VA',
        '23188.0',
        'uploaded',
        'uploaded_5ce8d23c2bbab05861bca8682f4359b5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "TPMG Williamsburg Diagnostic Cardiology", "Address": "4125 Ironpound Road, Ste. 201", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am - 5.00pm", "Phone Number": "(757) 565-0600", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Williamsburg", "Zip Code": 23188.0, "Latitude": 37.322936, "Longitude": -76.757931, "State": "VA", "zipcode UTC": -5.0, "name": "TPMG Williamsburg Diagnostic Cardiology", "address": "4125 Ironpound Road, Ste. 201", "lat": 37.322936, "lng": -76.757931, "phone": "(757) 565-0600", "country": "United States", "city": "Williamsburg", "state": "VA", "postal_code": 23188.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_fddf0fb2294756b400771ee35381b5fc',
        'nan',
        'nan',
        37.322936,
        -76.757931,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Wlmg',
        'VA',
        '23188.0',
        'uploaded',
        'uploaded_fddf0fb2294756b400771ee35381b5fc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Wlmg", "Zip Code": 23188.0, "Latitude": 37.322936, "Longitude": -76.757931, "State": "VA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 37.322936, "lng": -76.757931, "phone": null, "country": null, "city": "Wlmg", "state": "VA", "postal_code": 23188.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_46ff69f006297f50309c3055c6c7f55d',
        'Cardiology Care Consultants',
        '7814 Gateway East Blvd',
        31.743038,
        -106.369576,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(915) 542-2352',
        NULL,
        'United States',
        'El Paso',
        'TX',
        '79915.0',
        'uploaded',
        'uploaded_46ff69f006297f50309c3055c6c7f55d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Care Consultants", "Address": "7814 Gateway East Blvd", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(915) 542-2352", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "El Paso", "Zip Code": 79915.0, "Latitude": 31.743038, "Longitude": -106.369576, "State": "TX", "zipcode UTC": -7.0, "name": "Cardiology Care Consultants", "address": "7814 Gateway East Blvd", "lat": 31.743038, "lng": -106.369576, "phone": "(915) 542-2352", "country": "United States", "city": "El Paso", "state": "TX", "postal_code": 79915.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c90bf471bdcf54815db4499b24b1c757',
        'Cardiology Institute',
        '1051 Gause Boulevard, Ste. 320',
        30.269565,
        -89.775874,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(985) 641-7577',
        NULL,
        'United States',
        'North Shore',
        'LA',
        '70458.0',
        'uploaded',
        'uploaded_c90bf471bdcf54815db4499b24b1c757',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Institute", "Address": "1051 Gause Boulevard, Ste. 320", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(985) 641-7577", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "North Shore", "Zip Code": 70458.0, "Latitude": 30.269565, "Longitude": -89.775874, "State": "LA", "zipcode UTC": -6.0, "name": "Cardiology Institute", "address": "1051 Gause Boulevard, Ste. 320", "lat": 30.269565, "lng": -89.775874, "phone": "(985) 641-7577", "country": "United States", "city": "North Shore", "state": "LA", "postal_code": 70458.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f7541372d1c1e75cd7361f921f42f259',
        'nan',
        'nan',
        30.269565,
        -89.775874,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Slidell',
        'LA',
        '70458.0',
        'uploaded',
        'uploaded_f7541372d1c1e75cd7361f921f42f259',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Slidell", "Zip Code": 70458.0, "Latitude": 30.269565, "Longitude": -89.775874, "State": "LA", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 30.269565, "lng": -89.775874, "phone": null, "country": null, "city": "Slidell", "state": "LA", "postal_code": 70458.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0d03dd44d9cea9f0fbb3ffdcafa4344d',
        'Midatlantic Cardiovascular Associates',
        '1838 Greene Tree Rd',
        39.376879,
        -76.7287,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(410) 602-9262',
        NULL,
        'United States',
        'Baltimore',
        'MD',
        '21208.0',
        'uploaded',
        'uploaded_0d03dd44d9cea9f0fbb3ffdcafa4344d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Midatlantic Cardiovascular Associates", "Address": "1838 Greene Tree Rd", "Address Two": "Ste 150", "clinic Hours of Operation": "Mon - Fri:  8:00am - 5:00pm", "Phone Number": "(410) 602-9262", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Baltimore", "Zip Code": 21208.0, "Latitude": 39.376879, "Longitude": -76.7287, "State": "MD", "zipcode UTC": -5.0, "name": "Midatlantic Cardiovascular Associates", "address": "1838 Greene Tree Rd", "lat": 39.376879, "lng": -76.7287, "phone": "(410) 602-9262", "country": "United States", "city": "Baltimore", "state": "MD", "postal_code": 21208.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_fd1709a79627b86e9a6919eec0fae6e5',
        'nan',
        'nan',
        39.376879,
        -76.7287,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Pikesville',
        'MD',
        '21208.0',
        'uploaded',
        'uploaded_fd1709a79627b86e9a6919eec0fae6e5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Pikesville", "Zip Code": 21208.0, "Latitude": 39.376879, "Longitude": -76.7287, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.376879, "lng": -76.7287, "phone": null, "country": null, "city": "Pikesville", "state": "MD", "postal_code": 21208.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_7c0b455095cc6a0d7826f63c761a573f',
        'Cardiology & Arrhythmia Consultants',
        '400 Gresham Avenue',
        36.864047,
        -76.29947,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(757) 624-1788',
        NULL,
        'United States',
        'Norfolk',
        'VA',
        '23507.0',
        'uploaded',
        'uploaded_7c0b455095cc6a0d7826f63c761a573f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology & Arrhythmia Consultants", "Address": "400 Gresham Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(757) 624-1788", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Norfolk", "Zip Code": 23507.0, "Latitude": 36.864047, "Longitude": -76.29947, "State": "VA", "zipcode UTC": -5.0, "name": "Cardiology & Arrhythmia Consultants", "address": "400 Gresham Avenue", "lat": 36.864047, "lng": -76.29947, "phone": "(757) 624-1788", "country": "United States", "city": "Norfolk", "state": "VA", "postal_code": 23507.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_bdb167ec37361ef4d83d2f8d4b2394d4',
        'Advanced Cardiovascular Institute',
        '5215 Monticello Avenue, Ste. A',
        37.322936,
        -76.757931,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(757) 229-1440',
        NULL,
        'United States',
        'Williamsburg',
        'VA',
        '23188.0',
        'uploaded',
        'uploaded_bdb167ec37361ef4d83d2f8d4b2394d4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Cardiovascular Institute", "Address": "5215 Monticello Avenue, Ste. A", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00pm", "Phone Number": "(757) 229-1440", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Williamsburg", "Zip Code": 23188.0, "Latitude": 37.322936, "Longitude": -76.757931, "State": "VA", "zipcode UTC": -5.0, "name": "Advanced Cardiovascular Institute", "address": "5215 Monticello Avenue, Ste. A", "lat": 37.322936, "lng": -76.757931, "phone": "(757) 229-1440", "country": "United States", "city": "Williamsburg", "state": "VA", "postal_code": 23188.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b484de484661d72cb912b7a6f17947ef',
        'New Coast Cardiology',
        '14055 Seaway Road',
        30.461786,
        -89.103811,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(228) 868-5555',
        NULL,
        'United States',
        'Gpt',
        'MS',
        '39503.0',
        'uploaded',
        'uploaded_b484de484661d72cb912b7a6f17947ef',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "New Coast Cardiology", "Address": "14055 Seaway Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(228) 868-5555", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Gpt", "Zip Code": 39503.0, "Latitude": 30.461786, "Longitude": -89.103811, "State": "MS", "zipcode UTC": -6.0, "name": "New Coast Cardiology", "address": "14055 Seaway Road", "lat": 30.461786, "lng": -89.103811, "phone": "(228) 868-5555", "country": "United States", "city": "Gpt", "state": "MS", "postal_code": 39503.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_9e60ca10c3bb814f3719db65f6c01cb7',
        'nan',
        'nan',
        30.461786,
        -89.103811,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Gulfport',
        'MS',
        '39503.0',
        'uploaded',
        'uploaded_9e60ca10c3bb814f3719db65f6c01cb7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Gulfport", "Zip Code": 39503.0, "Latitude": 30.461786, "Longitude": -89.103811, "State": "MS", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 30.461786, "lng": -89.103811, "phone": null, "country": null, "city": "Gulfport", "state": "MS", "postal_code": 39503.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_43b5c6e3fda3ce8b1f6b1f29617e6726',
        'Coast Cardiovascular Consultants',
        '1720A Medical Park Drive',
        30.462388,
        -88.932936,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(228) 392-7429',
        NULL,
        'United States',
        'Biloxi',
        'MS',
        '39532.0',
        'uploaded',
        'uploaded_43b5c6e3fda3ce8b1f6b1f29617e6726',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Coast Cardiovascular Consultants", "Address": "1720A Medical Park Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Thurs 8:00am - 5:00pm, Fri 8:00am - 4:00pm", "Phone Number": "(228) 392-7429", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Biloxi", "Zip Code": 39532.0, "Latitude": 30.462388, "Longitude": -88.932936, "State": "MS", "zipcode UTC": -6.0, "name": "Coast Cardiovascular Consultants", "address": "1720A Medical Park Drive", "lat": 30.462388, "lng": -88.932936, "phone": "(228) 392-7429", "country": "United States", "city": "Biloxi", "state": "MS", "postal_code": 39532.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_23613de94e8712c539e8a9189e46b281',
        'nan',
        'nan',
        30.462388,
        -88.932936,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Blx',
        'MS',
        '39532.0',
        'uploaded',
        'uploaded_23613de94e8712c539e8a9189e46b281',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Blx", "Zip Code": 39532.0, "Latitude": 30.462388, "Longitude": -88.932936, "State": "MS", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 30.462388, "lng": -88.932936, "phone": null, "country": null, "city": "Blx", "state": "MS", "postal_code": 39532.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_43bbc72939c6a8a3531c807e0abf6fd0',
        'Marshall Cardiology',
        '5170 East Glenn Street, Ste. 160',
        32.249551,
        -110.887805,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(520) 298-7900',
        NULL,
        'United States',
        'Tucson',
        'AZ',
        '85712.0',
        'uploaded',
        'uploaded_43bbc72939c6a8a3531c807e0abf6fd0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Marshall Cardiology", "Address": "5170 East Glenn Street, Ste. 160", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00pm", "Phone Number": "(520) 298-7900", "Country": "United States", "Time Zone Display": "MST - Mountain Standard Time", "City": "Tucson", "Zip Code": 85712.0, "Latitude": 32.249551, "Longitude": -110.887805, "State": "AZ", "zipcode UTC": -7.0, "name": "Marshall Cardiology", "address": "5170 East Glenn Street, Ste. 160", "lat": 32.249551, "lng": -110.887805, "phone": "(520) 298-7900", "country": "United States", "city": "Tucson", "state": "AZ", "postal_code": 85712.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_7141afb58ec95ef4ee244e563c5f81a3',
        'Cardiovascular Institute of Novi',
        '47601 West Grand River',
        42.462734,
        -83.458653,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(248) 465-4225',
        NULL,
        'United States',
        'Novi',
        'MI',
        '48375.0',
        'uploaded',
        'uploaded_7141afb58ec95ef4ee244e563c5f81a3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Institute of Novi", "Address": "47601 West Grand River", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 5:00pm", "Phone Number": "(248) 465-4225", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Novi", "Zip Code": 48375.0, "Latitude": 42.462734, "Longitude": -83.458653, "State": "MI", "zipcode UTC": -5.0, "name": "Cardiovascular Institute of Novi", "address": "47601 West Grand River", "lat": 42.462734, "lng": -83.458653, "phone": "(248) 465-4225", "country": "United States", "city": "Novi", "state": "MI", "postal_code": 48375.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ff96177f3608b349fcb150c23db24c18',
        'nan',
        'nan',
        42.462734,
        -83.458653,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Novi Township',
        'MI',
        '48375.0',
        'uploaded',
        'uploaded_ff96177f3608b349fcb150c23db24c18',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Novi Township", "Zip Code": 48375.0, "Latitude": 42.462734, "Longitude": -83.458653, "State": "MI", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 42.462734, "lng": -83.458653, "phone": null, "country": null, "city": "Novi Township", "state": "MI", "postal_code": 48375.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_89ea3afefb18b5768abaf0f29c695ad9',
        'Capitol Cardiology Associates',
        '8116 Good Luck Road, Ste. 305',
        38.964093,
        -76.853318,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(301) 552-1200',
        NULL,
        'United States',
        'Glenarden',
        'MD',
        '20706.0',
        'uploaded',
        'uploaded_89ea3afefb18b5768abaf0f29c695ad9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Capitol Cardiology Associates", "Address": "8116 Good Luck Road, Ste. 305", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 4:30pm", "Phone Number": "(301) 552-1200", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Glenarden", "Zip Code": 20706.0, "Latitude": 38.964093, "Longitude": -76.853318, "State": "MD", "zipcode UTC": -5.0, "name": "Capitol Cardiology Associates", "address": "8116 Good Luck Road, Ste. 305", "lat": 38.964093, "lng": -76.853318, "phone": "(301) 552-1200", "country": "United States", "city": "Glenarden", "state": "MD", "postal_code": 20706.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b03cb0d91670515bd36ebb8cccd54cf5',
        'nan',
        'nan',
        38.964093,
        -76.853318,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Lanham',
        'MD',
        '20706.0',
        'uploaded',
        'uploaded_b03cb0d91670515bd36ebb8cccd54cf5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lanham", "Zip Code": 20706.0, "Latitude": 38.964093, "Longitude": -76.853318, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 38.964093, "lng": -76.853318, "phone": null, "country": null, "city": "Lanham", "state": "MD", "postal_code": 20706.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5fb0a98dce6ac77c7b7ebf5ddb8cd4c0',
        'Great Falls Cardiology',
        '1417 9th Street South',
        47.476152,
        -111.269091,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(406) 771-7700',
        NULL,
        'United States',
        'Great Falls',
        'MT',
        '59405.0',
        'uploaded',
        'uploaded_5fb0a98dce6ac77c7b7ebf5ddb8cd4c0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Great Falls Cardiology", "Address": "1417 9th Street South", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(406) 771-7700", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Great Falls", "Zip Code": 59405.0, "Latitude": 47.476152, "Longitude": -111.269091, "State": "MT", "zipcode UTC": -7.0, "name": "Great Falls Cardiology", "address": "1417 9th Street South", "lat": 47.476152, "lng": -111.269091, "phone": "(406) 771-7700", "country": "United States", "city": "Great Falls", "state": "MT", "postal_code": 59405.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_04453a217225d50d32e8a0c2a3a720d2',
        'Cardiovascular Consultants',
        '4700 Waters Avenue, Ste. 400',
        32.046143,
        -81.067243,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(912) 355-0070',
        NULL,
        'United States',
        'Savannah',
        'GA',
        '31404.0',
        'uploaded',
        'uploaded_04453a217225d50d32e8a0c2a3a720d2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants", "Address": "4700 Waters Avenue, Ste. 400", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(912) 355-0070", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Savannah", "Zip Code": 31404.0, "Latitude": 32.046143, "Longitude": -81.067243, "State": "GA", "zipcode UTC": -5.0, "name": "Cardiovascular Consultants", "address": "4700 Waters Avenue, Ste. 400", "lat": 32.046143, "lng": -81.067243, "phone": "(912) 355-0070", "country": "United States", "city": "Savannah", "state": "GA", "postal_code": 31404.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_960c285a5e9b6d63e655e02428d38e31',
        'nan',
        'nan',
        32.046143,
        -81.067243,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'State College',
        'GA',
        '31404.0',
        'uploaded',
        'uploaded_960c285a5e9b6d63e655e02428d38e31',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "State College", "Zip Code": 31404.0, "Latitude": 32.046143, "Longitude": -81.067243, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.046143, "lng": -81.067243, "phone": null, "country": null, "city": "State College", "state": "GA", "postal_code": 31404.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_950ad337d992dc388553e538864e2506',
        'Statesboro Cardiology',
        '5 Grady Johnson Road',
        32.423083,
        -81.80677,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(912) 489-6246',
        NULL,
        'United States',
        'Statesboro',
        'GA',
        '30458.0',
        'uploaded',
        'uploaded_950ad337d992dc388553e538864e2506',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Statesboro Cardiology", "Address": "5 Grady Johnson Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am - 4:00pm", "Phone Number": "(912) 489-6246", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Statesboro", "Zip Code": 30458.0, "Latitude": 32.423083, "Longitude": -81.80677, "State": "GA", "zipcode UTC": -5.0, "name": "Statesboro Cardiology", "address": "5 Grady Johnson Road", "lat": 32.423083, "lng": -81.80677, "phone": "(912) 489-6246", "country": "United States", "city": "Statesboro", "state": "GA", "postal_code": 30458.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4bf5284cab35902d294b424313c2b6dc',
        'Cardiology Associates',
        '1329 Lusitana Street, Ste. 409',
        21.313033,
        -157.856152,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(808) 521-8211',
        NULL,
        'United States',
        'Hon',
        'HI',
        '96813.0',
        'uploaded',
        'uploaded_4bf5284cab35902d294b424313c2b6dc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates", "Address": "1329 Lusitana Street, Ste. 409", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(808) 521-8211", "Country": "United States", "Time Zone Display": "HAST - Hawaiian Standard Time", "City": "Hon", "Zip Code": 96813.0, "Latitude": 21.313033, "Longitude": -157.856152, "State": "HI", "zipcode UTC": -10.0, "name": "Cardiology Associates", "address": "1329 Lusitana Street, Ste. 409", "lat": 21.313033, "lng": -157.856152, "phone": "(808) 521-8211", "country": "United States", "city": "Hon", "state": "HI", "postal_code": 96813.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_16a2df1fe11493c007eacb912777b5c6',
        'nan',
        'nan',
        21.313033,
        -157.856152,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Hono',
        'HI',
        '96813.0',
        'uploaded',
        'uploaded_16a2df1fe11493c007eacb912777b5c6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "HAST - Hawaiian Standard Time", "City": "Hono", "Zip Code": 96813.0, "Latitude": 21.313033, "Longitude": -157.856152, "State": "HI", "zipcode UTC": -10.0, "name": null, "address": null, "lat": 21.313033, "lng": -157.856152, "phone": null, "country": null, "city": "Hono", "state": "HI", "postal_code": 96813.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f41b25ba7ae095834d174e09d5928c22',
        'Just Heart Cardiovascular Group',
        '300 Armory Place, Ste. 3M',
        39.352496,
        -76.634523,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(410) 225-8615',
        NULL,
        'United States',
        'Baltimore',
        'MD',
        '21210.0',
        'uploaded',
        'uploaded_f41b25ba7ae095834d174e09d5928c22',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Just Heart Cardiovascular Group", "Address": "300 Armory Place, Ste. 3M", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00pm", "Phone Number": "(410) 225-8615", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Baltimore", "Zip Code": 21210.0, "Latitude": 39.352496, "Longitude": -76.634523, "State": "MD", "zipcode UTC": -5.0, "name": "Just Heart Cardiovascular Group", "address": "300 Armory Place, Ste. 3M", "lat": 39.352496, "lng": -76.634523, "phone": "(410) 225-8615", "country": "United States", "city": "Baltimore", "state": "MD", "postal_code": 21210.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_65eeba7dfd660c42c864993496948c39',
        'nan',
        'nan',
        39.352496,
        -76.634523,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Roland Park',
        'MD',
        '21210.0',
        'uploaded',
        'uploaded_65eeba7dfd660c42c864993496948c39',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Roland Park", "Zip Code": 21210.0, "Latitude": 39.352496, "Longitude": -76.634523, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.352496, "lng": -76.634523, "phone": null, "country": null, "city": "Roland Park", "state": "MD", "postal_code": 21210.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_3027f928ab84ba44ed9f95ef1f12e368',
        'Lansing Cardiovascular Consultants',
        '3413 Woods Edge Drive',
        42.702128,
        -84.419462,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(517) 349-3303',
        NULL,
        'United States',
        'Okemos',
        'MI',
        '48864.0',
        'uploaded',
        'uploaded_3027f928ab84ba44ed9f95ef1f12e368',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Lansing Cardiovascular Consultants", "Address": "3413 Woods Edge Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:30pm", "Phone Number": "(517) 349-3303", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Okemos", "Zip Code": 48864.0, "Latitude": 42.702128, "Longitude": -84.419462, "State": "MI", "zipcode UTC": -5.0, "name": "Lansing Cardiovascular Consultants", "address": "3413 Woods Edge Drive", "lat": 42.702128, "lng": -84.419462, "phone": "(517) 349-3303", "country": "United States", "city": "Okemos", "state": "MI", "postal_code": 48864.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_51b5683d97a4578d98e05790bdb8843c',
        'Savannah Cardiology',
        '6301 Abercorn Street',
        32.043058,
        -81.121833,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(912) 352-8700',
        NULL,
        'United States',
        'Garden City',
        'GA',
        '31405.0',
        'uploaded',
        'uploaded_51b5683d97a4578d98e05790bdb8843c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Savannah Cardiology", "Address": "6301 Abercorn Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:30pm", "Phone Number": "(912) 352-8700", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Garden City", "Zip Code": 31405.0, "Latitude": 32.043058, "Longitude": -81.121833, "State": "GA", "zipcode UTC": -5.0, "name": "Savannah Cardiology", "address": "6301 Abercorn Street", "lat": 32.043058, "lng": -81.121833, "phone": "(912) 352-8700", "country": "United States", "city": "Garden City", "state": "GA", "postal_code": 31405.0, "category": "Cardiologist"}'::jsonb,
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
        ARRAY['Cardiologist'],
        'Cardiologist',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Garden Cty", "Zip Code": 31405.0, "Latitude": 32.043058, "Longitude": -81.121833, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.043058, "lng": -81.121833, "phone": null, "country": null, "city": "Garden Cty", "state": "GA", "postal_code": 31405.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_afa9c7a6657cb058347ad5d1aa5387f4',
        'Pacific Cardiology',
        '550 South Beretania Street, Ste. 601',
        21.313033,
        -157.856152,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(808) 522-7222',
        NULL,
        'United States',
        'Hon',
        'HI',
        '96813.0',
        'uploaded',
        'uploaded_afa9c7a6657cb058347ad5d1aa5387f4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiology", "Address": "550 South Beretania Street, Ste. 601", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(808) 522-7222", "Country": "United States", "Time Zone Display": "HAST - Hawaiian Standard Time", "City": "Hon", "Zip Code": 96813.0, "Latitude": 21.313033, "Longitude": -157.856152, "State": "HI", "zipcode UTC": -10.0, "name": "Pacific Cardiology", "address": "550 South Beretania Street, Ste. 601", "lat": 21.313033, "lng": -157.856152, "phone": "(808) 522-7222", "country": "United States", "city": "Hon", "state": "HI", "postal_code": 96813.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_fbc12adb4e4122744edd88bf5a926827',
        'First Coast Cardiovascular Institute',
        '3900 University Boulevard',
        30.28374,
        -81.583591,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(904) 493-3333',
        NULL,
        'United States',
        'Jacksonville',
        'FL',
        '32216.0',
        'uploaded',
        'uploaded_fbc12adb4e4122744edd88bf5a926827',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "First Coast Cardiovascular Institute", "Address": "3900 University Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(904) 493-3333", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Jacksonville", "Zip Code": 32216.0, "Latitude": 30.28374, "Longitude": -81.583591, "State": "FL", "zipcode UTC": -5.0, "name": "First Coast Cardiovascular Institute", "address": "3900 University Boulevard", "lat": 30.28374, "lng": -81.583591, "phone": "(904) 493-3333", "country": "United States", "city": "Jacksonville", "state": "FL", "postal_code": 32216.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_da1c9feb35f87aba3b9805724f994068',
        'nan',
        'nan',
        30.28374,
        -81.583591,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Jax',
        'FL',
        '32216.0',
        'uploaded',
        'uploaded_da1c9feb35f87aba3b9805724f994068',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Jax", "Zip Code": 32216.0, "Latitude": 30.28374, "Longitude": -81.583591, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 30.28374, "lng": -81.583591, "phone": null, "country": null, "city": "Jax", "state": "FL", "postal_code": 32216.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_2a7a089ad826a14c9192fbb1a570ca22',
        'Columbus Cardiovascular Care',
        '255 Baptist Boulevard, Ste. 402',
        33.581599,
        -88.432978,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(662) 240-1412',
        NULL,
        'United States',
        'Columbus',
        'MS',
        '39705.0',
        'uploaded',
        'uploaded_2a7a089ad826a14c9192fbb1a570ca22',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Columbus Cardiovascular Care", "Address": "255 Baptist Boulevard, Ste. 402", "Address Two": null, "clinic Hours of Operation": "Mon-Thurs 8:00am - 5:00pm, Fri 8:00am - 12:00pm", "Phone Number": "(662) 240-1412", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Columbus", "Zip Code": 39705.0, "Latitude": 33.581599, "Longitude": -88.432978, "State": "MS", "zipcode UTC": -6.0, "name": "Columbus Cardiovascular Care", "address": "255 Baptist Boulevard, Ste. 402", "lat": 33.581599, "lng": -88.432978, "phone": "(662) 240-1412", "country": "United States", "city": "Columbus", "state": "MS", "postal_code": 39705.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_7176308c9e71a7b3d38ce67ee14308ae',
        'Cabrillo Cardiology',
        '2241 Wankel Way, Ste. C',
        34.21707,
        -119.176902,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(805) 983-0922 x1',
        NULL,
        'United States',
        'Oxnard',
        'CA',
        '93030.0',
        'uploaded',
        'uploaded_7176308c9e71a7b3d38ce67ee14308ae',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cabrillo Cardiology", "Address": "2241 Wankel Way, Ste. C", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(805) 983-0922 x1", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Oxnard", "Zip Code": 93030.0, "Latitude": 34.21707, "Longitude": -119.176902, "State": "CA", "zipcode UTC": -8.0, "name": "Cabrillo Cardiology", "address": "2241 Wankel Way, Ste. C", "lat": 34.21707, "lng": -119.176902, "phone": "(805) 983-0922 x1", "country": "United States", "city": "Oxnard", "state": "CA", "postal_code": 93030.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_74f3f50a1751d4774115be4ae88cc6d9',
        'Cardiovascular Center of Lompoc',
        '136 North Third Street, Ste. 1',
        34.639682,
        -120.447108,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(805) 735-7771',
        NULL,
        'United States',
        'Lompoc',
        'CA',
        '93436.0',
        'uploaded',
        'uploaded_74f3f50a1751d4774115be4ae88cc6d9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Center of Lompoc", "Address": "136 North Third Street, Ste. 1", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(805) 735-7771", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Lompoc", "Zip Code": 93436.0, "Latitude": 34.639682, "Longitude": -120.447108, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Center of Lompoc", "address": "136 North Third Street, Ste. 1", "lat": 34.639682, "lng": -120.447108, "phone": "(805) 735-7771", "country": "United States", "city": "Lompoc", "state": "CA", "postal_code": 93436.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5f7f40f2f7e4e6ae1d059641befb3254',
        'nan',
        'nan',
        34.639682,
        -120.447108,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Vandenberg Village',
        'CA',
        '93436.0',
        'uploaded',
        'uploaded_5f7f40f2f7e4e6ae1d059641befb3254',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Vandenberg Village", "Zip Code": 93436.0, "Latitude": 34.639682, "Longitude": -120.447108, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 34.639682, "lng": -120.447108, "phone": null, "country": null, "city": "Vandenberg Village", "state": "CA", "postal_code": 93436.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6cc76a9a234a7251cf31c553e7148629',
        'Springfield Diagnostic & Interventional Cardiology',
        '2200 North Limestone Street, Ste. 100',
        39.94831,
        -83.782051,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(937) 390-5563',
        NULL,
        'United States',
        'Springfield',
        'OH',
        '45503.0',
        'uploaded',
        'uploaded_6cc76a9a234a7251cf31c553e7148629',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Springfield Diagnostic & Interventional Cardiology", "Address": "2200 North Limestone Street, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(937) 390-5563", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Springfield", "Zip Code": 45503.0, "Latitude": 39.94831, "Longitude": -83.782051, "State": "OH", "zipcode UTC": -5.0, "name": "Springfield Diagnostic & Interventional Cardiology", "address": "2200 North Limestone Street, Ste. 100", "lat": 39.94831, "lng": -83.782051, "phone": "(937) 390-5563", "country": "United States", "city": "Springfield", "state": "OH", "postal_code": 45503.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c154300a1633b1a4f013ed3e9968d50f',
        'Cardiologists of Lubbock',
        '4802 North Loop 289',
        33.62386,
        -101.880574,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(806) 788-0040',
        NULL,
        'United States',
        'Lubbock',
        'TX',
        '79415.0',
        'uploaded',
        'uploaded_c154300a1633b1a4f013ed3e9968d50f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiologists of Lubbock", "Address": "4802 North Loop 289", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 5:00pm", "Phone Number": "(806) 788-0040", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Lubbock", "Zip Code": 79415.0, "Latitude": 33.62386, "Longitude": -101.880574, "State": "TX", "zipcode UTC": -6.0, "name": "Cardiologists of Lubbock", "address": "4802 North Loop 289", "lat": 33.62386, "lng": -101.880574, "phone": "(806) 788-0040", "country": "United States", "city": "Lubbock", "state": "TX", "postal_code": 79415.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a3fb235a0a356e90692d98dd9f7e7947',
        'Consultants in Cardiovascular Diseases',
        '2315 Myrtle Street, Ste. 190',
        42.110757,
        -80.100244,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(814) 453-7767',
        NULL,
        'United States',
        'Erie',
        'PA',
        '16502.0',
        'uploaded',
        'uploaded_a3fb235a0a356e90692d98dd9f7e7947',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Consultants in Cardiovascular Diseases", "Address": "2315 Myrtle Street, Ste. 190", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(814) 453-7767", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Erie", "Zip Code": 16502.0, "Latitude": 42.110757, "Longitude": -80.100244, "State": "PA", "zipcode UTC": -5.0, "name": "Consultants in Cardiovascular Diseases", "address": "2315 Myrtle Street, Ste. 190", "lat": 42.110757, "lng": -80.100244, "phone": "(814) 453-7767", "country": "United States", "city": "Erie", "state": "PA", "postal_code": 16502.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_92ac94c02b2f918db24ca0a782b4686b',
        'Florida Cardiovascular Association',
        '605 North Washington Avenue, Ste. 100',
        28.623371,
        -80.841231,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(321) 383-7600',
        NULL,
        'United States',
        'Titusville',
        'FL',
        '32796.0',
        'uploaded',
        'uploaded_92ac94c02b2f918db24ca0a782b4686b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Florida Cardiovascular Association", "Address": "605 North Washington Avenue, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Thurs 9:00am - 5:00pm, Fri 9:00am -12:00pm", "Phone Number": "(321) 383-7600", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Titusville", "Zip Code": 32796.0, "Latitude": 28.623371, "Longitude": -80.841231, "State": "FL", "zipcode UTC": -5.0, "name": "Florida Cardiovascular Association", "address": "605 North Washington Avenue, Ste. 100", "lat": 28.623371, "lng": -80.841231, "phone": "(321) 383-7600", "country": "United States", "city": "Titusville", "state": "FL", "postal_code": 32796.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4726108a40a84c0e9ebca5291a2916e7',
        'Cardiologist of Clark & Champaign Counties',
        '1911 East High Street',
        39.91086,
        -83.785793,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(937) 323-1404',
        NULL,
        'United States',
        'Springfield',
        'OH',
        '45505.0',
        'uploaded',
        'uploaded_4726108a40a84c0e9ebca5291a2916e7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiologist of Clark & Champaign Counties", "Address": "1911 East High Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(937) 323-1404", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Springfield", "Zip Code": 45505.0, "Latitude": 39.91086, "Longitude": -83.785793, "State": "OH", "zipcode UTC": -5.0, "name": "Cardiologist of Clark & Champaign Counties", "address": "1911 East High Street", "lat": 39.91086, "lng": -83.785793, "phone": "(937) 323-1404", "country": "United States", "city": "Springfield", "state": "OH", "postal_code": 45505.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_bf91523f454a08db629e2359934a664c',
        'Empire Cardiology',
        '3065 Southwestern Boulevard',
        42.759917,
        -78.752942,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(716) 677-5866',
        NULL,
        'United States',
        'Orchard Park',
        'NY',
        '14127.0',
        'uploaded',
        'uploaded_bf91523f454a08db629e2359934a664c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Empire Cardiology", "Address": "3065 Southwestern Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon - Thurs 9:00am-4:00pm, Fri 9:00am-12:00pm ", "Phone Number": "(716) 677-5866", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Orchard Park", "Zip Code": 14127.0, "Latitude": 42.759917, "Longitude": -78.752942, "State": "NY", "zipcode UTC": -5.0, "name": "Empire Cardiology", "address": "3065 Southwestern Boulevard", "lat": 42.759917, "lng": -78.752942, "phone": "(716) 677-5866", "country": "United States", "city": "Orchard Park", "state": "NY", "postal_code": 14127.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4ad878443b3d78314f9d475a01678564',
        'Parkway Cardiology Associates',
        '80 Vermont Avenue',
        35.992691,
        -84.270448,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(865) 482-4078',
        NULL,
        'United States',
        'Oak Ridge',
        'TN',
        '37830.0',
        'uploaded',
        'uploaded_4ad878443b3d78314f9d475a01678564',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Parkway Cardiology Associates", "Address": "80 Vermont Avenue", "Address Two": null, "clinic Hours of Operation": "Mon - Fri 9:00am-5:00pm", "Phone Number": "(865) 482-4078", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Oak Ridge", "Zip Code": 37830.0, "Latitude": 35.992691, "Longitude": -84.270448, "State": "TN", "zipcode UTC": -5.0, "name": "Parkway Cardiology Associates", "address": "80 Vermont Avenue", "lat": 35.992691, "lng": -84.270448, "phone": "(865) 482-4078", "country": "United States", "city": "Oak Ridge", "state": "TN", "postal_code": 37830.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8a9ed5406821768cec7e1be19862bb79',
        'Cardiology Group of Western New York',
        '825 Wehrle Drive',
        42.977456,
        -78.733561,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(716) 634-3243',
        NULL,
        'United States',
        'Amherst',
        'NY',
        '14221.0',
        'uploaded',
        'uploaded_8a9ed5406821768cec7e1be19862bb79',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Group of Western New York", "Address": "825 Wehrle Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(716) 634-3243", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Amherst", "Zip Code": 14221.0, "Latitude": 42.977456, "Longitude": -78.733561, "State": "NY", "zipcode UTC": -5.0, "name": "Cardiology Group of Western New York", "address": "825 Wehrle Drive", "lat": 42.977456, "lng": -78.733561, "phone": "(716) 634-3243", "country": "United States", "city": "Amherst", "state": "NY", "postal_code": 14221.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_68ffb3e048565dedb88d623e822eafc5',
        'nan',
        'nan',
        42.977456,
        -78.733561,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Buffalo',
        'NY',
        '14221.0',
        'uploaded',
        'uploaded_68ffb3e048565dedb88d623e822eafc5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Buffalo", "Zip Code": 14221.0, "Latitude": 42.977456, "Longitude": -78.733561, "State": "NY", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 42.977456, "lng": -78.733561, "phone": null, "country": null, "city": "Buffalo", "state": "NY", "postal_code": 14221.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_61416614971fe7f427237e4b629d1974',
        'Northwest Cardiologists',
        '333 Southeast 7th Avenue, Ste. 5200',
        45.491024,
        -122.957452,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(503) 640-4737',
        NULL,
        'United States',
        'Hillsboro',
        'OR',
        '97123.0',
        'uploaded',
        'uploaded_61416614971fe7f427237e4b629d1974',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Northwest Cardiologists", "Address": "333 Southeast 7th Avenue, Ste. 5200", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(503) 640-4737", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Hillsboro", "Zip Code": 97123.0, "Latitude": 45.491024, "Longitude": -122.957452, "State": "OR", "zipcode UTC": -8.0, "name": "Northwest Cardiologists", "address": "333 Southeast 7th Avenue, Ste. 5200", "lat": 45.491024, "lng": -122.957452, "phone": "(503) 640-4737", "country": "United States", "city": "Hillsboro", "state": "OR", "postal_code": 97123.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4313fbc3edd01911081f4999bd53d245',
        'nan',
        'nan',
        45.491024,
        -122.957452,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Orenco',
        'OR',
        '97123.0',
        'uploaded',
        'uploaded_4313fbc3edd01911081f4999bd53d245',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Orenco", "Zip Code": 97123.0, "Latitude": 45.491024, "Longitude": -122.957452, "State": "OR", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 45.491024, "lng": -122.957452, "phone": null, "country": null, "city": "Orenco", "state": "OR", "postal_code": 97123.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_3a24902550850285a63059b37b7f4122',
        'Stuart Cardiology Group',
        '1001 Southeast Monterey Commons Boulevard',
        27.195927,
        -80.21143,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(772) 286-9400',
        NULL,
        'United States',
        'Sewalls Point',
        'FL',
        '34996.0',
        'uploaded',
        'uploaded_3a24902550850285a63059b37b7f4122',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Stuart Cardiology Group", "Address": "1001 Southeast Monterey Commons Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(772) 286-9400", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Sewalls Point", "Zip Code": 34996.0, "Latitude": 27.195927, "Longitude": -80.21143, "State": "FL", "zipcode UTC": -5.0, "name": "Stuart Cardiology Group", "address": "1001 Southeast Monterey Commons Boulevard", "lat": 27.195927, "lng": -80.21143, "phone": "(772) 286-9400", "country": "United States", "city": "Sewalls Point", "state": "FL", "postal_code": 34996.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4768ea0af56f720a3609f6a0c632e02e',
        'nan',
        'nan',
        27.195927,
        -80.21143,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Stuart',
        'FL',
        '34996.0',
        'uploaded',
        'uploaded_4768ea0af56f720a3609f6a0c632e02e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Stuart", "Zip Code": 34996.0, "Latitude": 27.195927, "Longitude": -80.21143, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 27.195927, "lng": -80.21143, "phone": null, "country": null, "city": "Stuart", "state": "FL", "postal_code": 34996.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_e37c8b5da1059fb7acd13f8e289af3a9',
        'Cardiovascular Center of Hampton Roads/Riverside',
        '11803 Jefferson Avenue, Ste. 110',
        37.078196,
        -76.494468,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(757) 873-0360',
        NULL,
        'United States',
        'Newport News',
        'VA',
        '23606.0',
        'uploaded',
        'uploaded_e37c8b5da1059fb7acd13f8e289af3a9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Center of Hampton Roads/Riverside", "Address": "11803 Jefferson Avenue, Ste. 110", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(757) 873-0360", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Newport News", "Zip Code": 23606.0, "Latitude": 37.078196, "Longitude": -76.494468, "State": "VA", "zipcode UTC": -5.0, "name": "Cardiovascular Center of Hampton Roads/Riverside", "address": "11803 Jefferson Avenue, Ste. 110", "lat": 37.078196, "lng": -76.494468, "phone": "(757) 873-0360", "country": "United States", "city": "Newport News", "state": "VA", "postal_code": 23606.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0a468957be50731d7191500d03bcc676',
        'Sunrays Cardiology',
        '1924 Tamarack Road',
        40.079115,
        -82.400546,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(614) 252-7561',
        NULL,
        'United States',
        'Marne',
        'OH',
        '43055.0',
        'uploaded',
        'uploaded_0a468957be50731d7191500d03bcc676',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Sunrays Cardiology", "Address": "1924 Tamarack Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(614) 252-7561", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Marne", "Zip Code": 43055.0, "Latitude": 40.079115, "Longitude": -82.400546, "State": "OH", "zipcode UTC": -5.0, "name": "Sunrays Cardiology", "address": "1924 Tamarack Road", "lat": 40.079115, "lng": -82.400546, "phone": "(614) 252-7561", "country": "United States", "city": "Marne", "state": "OH", "postal_code": 43055.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_683f0877d10ca53c36e2ee70c95a2357',
        'nan',
        'nan',
        40.079115,
        -82.400546,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Newark',
        'OH',
        '43055.0',
        'uploaded',
        'uploaded_683f0877d10ca53c36e2ee70c95a2357',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Newark", "Zip Code": 43055.0, "Latitude": 40.079115, "Longitude": -82.400546, "State": "OH", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.079115, "lng": -82.400546, "phone": null, "country": null, "city": "Newark", "state": "OH", "postal_code": 43055.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a24e83ffa37faba74bb26164bedf355f',
        'Cardiology Center',
        '310 West Ninth Street',
        39.423344,
        -77.389027,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(301) 694-5900',
        NULL,
        'United States',
        'Frederick',
        'MD',
        '21701.0',
        'uploaded',
        'uploaded_a24e83ffa37faba74bb26164bedf355f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Center", "Address": "310 West Ninth Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(301) 694-5900", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Frederick", "Zip Code": 21701.0, "Latitude": 39.423344, "Longitude": -77.389027, "State": "MD", "zipcode UTC": -5.0, "name": "Cardiology Center", "address": "310 West Ninth Street", "lat": 39.423344, "lng": -77.389027, "phone": "(301) 694-5900", "country": "United States", "city": "Frederick", "state": "MD", "postal_code": 21701.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_04c43f87f62068a96ddec31e0ba42dda',
        'nan',
        'nan',
        39.423344,
        -77.389027,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Hood College',
        'MD',
        '21701.0',
        'uploaded',
        'uploaded_04c43f87f62068a96ddec31e0ba42dda',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hood College", "Zip Code": 21701.0, "Latitude": 39.423344, "Longitude": -77.389027, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.423344, "lng": -77.389027, "phone": null, "country": null, "city": "Hood College", "state": "MD", "postal_code": 21701.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_471bb8001908745695a57b684a26b24c',
        'Centro Cardio Nuclear',
        'El Parana 1716 El Cerzal',
        18.361363,
        -66.056208,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(787) 766-2200',
        NULL,
        'Puerto Rico',
        'Alts De Borinquen Gdns',
        'PR',
        '926.0',
        'uploaded',
        'uploaded_471bb8001908745695a57b684a26b24c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Centro Cardio Nuclear", "Address": "El Parana 1716 El Cerzal", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(787) 766-2200", "Country": "Puerto Rico", "Time Zone Display": "AST - Atlantic Standard Time", "City": "Alts De Borinquen Gdns", "Zip Code": 926.0, "Latitude": 18.361363, "Longitude": -66.056208, "State": "PR", "zipcode UTC": -4.0, "name": "Centro Cardio Nuclear", "address": "El Parana 1716 El Cerzal", "lat": 18.361363, "lng": -66.056208, "phone": "(787) 766-2200", "country": "Puerto Rico", "city": "Alts De Borinquen Gdns", "state": "PR", "postal_code": 926.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_01c7dc8335cfa83d6f839dc33280f818',
        'nan',
        'nan',
        18.361363,
        -66.056208,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Alts De Caldas',
        'PR',
        '926.0',
        'uploaded',
        'uploaded_01c7dc8335cfa83d6f839dc33280f818',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "AST - Atlantic Standard Time", "City": "Alts De Caldas", "Zip Code": 926.0, "Latitude": 18.361363, "Longitude": -66.056208, "State": "PR", "zipcode UTC": -4.0, "name": null, "address": null, "lat": 18.361363, "lng": -66.056208, "phone": null, "country": null, "city": "Alts De Caldas", "state": "PR", "postal_code": 926.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c534e80af2e1481422c82e2619d7dab2',
        'Sunrays Cardiology',
        '1000 East Broad Street',
        39.957265,
        -82.96587,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(614) 252-7561',
        NULL,
        'United States',
        'Columbus',
        'OH',
        '43205.0',
        'uploaded',
        'uploaded_c534e80af2e1481422c82e2619d7dab2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Sunrays Cardiology", "Address": "1000 East Broad Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(614) 252-7561", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Columbus", "Zip Code": 43205.0, "Latitude": 39.957265, "Longitude": -82.96587, "State": "OH", "zipcode UTC": -5.0, "name": "Sunrays Cardiology", "address": "1000 East Broad Street", "lat": 39.957265, "lng": -82.96587, "phone": "(614) 252-7561", "country": "United States", "city": "Columbus", "state": "OH", "postal_code": 43205.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_40364b2fb9adb1b304ba330245a1eb51',
        'Cardiovascular Specialist',
        '618 Pleasantville Road, Ste. 101',
        39.712887,
        -82.612169,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(740) 653-7511',
        NULL,
        'United States',
        'Lancaster',
        'OH',
        '43130.0',
        'uploaded',
        'uploaded_40364b2fb9adb1b304ba330245a1eb51',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Specialist", "Address": "618 Pleasantville Road, Ste. 101", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm", "Phone Number": "(740) 653-7511", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lancaster", "Zip Code": 43130.0, "Latitude": 39.712887, "Longitude": -82.612169, "State": "OH", "zipcode UTC": -5.0, "name": "Cardiovascular Specialist", "address": "618 Pleasantville Road, Ste. 101", "lat": 39.712887, "lng": -82.612169, "phone": "(740) 653-7511", "country": "United States", "city": "Lancaster", "state": "OH", "postal_code": 43130.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a6b6a7f02ef1f3fad5713b87023fb169',
        'Methodist Cardiology Physicians',
        '11725 North Illinois Street, Ste. 265',
        39.970241,
        -86.154162,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(317) 688-5100',
        NULL,
        'United States',
        'Carmel',
        'IN',
        '46032.0',
        'uploaded',
        'uploaded_a6b6a7f02ef1f3fad5713b87023fb169',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Methodist Cardiology Physicians", "Address": "11725 North Illinois Street, Ste. 265", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(317) 688-5100", "Country": "United States", "Time Zone Display": "EST - Eastern Standard Time", "City": "Carmel", "Zip Code": 46032.0, "Latitude": 39.970241, "Longitude": -86.154162, "State": "IN", "zipcode UTC": -5.0, "name": "Methodist Cardiology Physicians", "address": "11725 North Illinois Street, Ste. 265", "lat": 39.970241, "lng": -86.154162, "phone": "(317) 688-5100", "country": "United States", "city": "Carmel", "state": "IN", "postal_code": 46032.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4d9592a4bc9524bb772330062d9b87a6',
        'Frist Cardiology',
        '2400 Patterson Street, Ste. 304',
        36.152607,
        -86.789271,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(615) 342-7790',
        NULL,
        'United States',
        'Nashville',
        'TN',
        '37203.0',
        'uploaded',
        'uploaded_4d9592a4bc9524bb772330062d9b87a6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Frist Cardiology", "Address": "2400 Patterson Street, Ste. 304", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(615) 342-7790", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Nashville", "Zip Code": 37203.0, "Latitude": 36.152607, "Longitude": -86.789271, "State": "TN", "zipcode UTC": -6.0, "name": "Frist Cardiology", "address": "2400 Patterson Street, Ste. 304", "lat": 36.152607, "lng": -86.789271, "phone": "(615) 342-7790", "country": "United States", "city": "Nashville", "state": "TN", "postal_code": 37203.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b60d9710b95a881049d90ba65f8c67e5',
        'Cardiovascular Associates of the Delaware Valley',
        '525 State Street, Ste. 3',
        39.553504,
        -75.168439,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(858) 358-2363',
        NULL,
        'United States',
        'Centerton',
        'NJ',
        '8318.0',
        'uploaded',
        'uploaded_b60d9710b95a881049d90ba65f8c67e5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Associates of the Delaware Valley", "Address": "525 State Street, Ste. 3", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am-5:00pm", "Phone Number": "(858) 358-2363", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Centerton", "Zip Code": 8318.0, "Latitude": 39.553504, "Longitude": -75.168439, "State": "NJ", "zipcode UTC": -5.0, "name": "Cardiovascular Associates of the Delaware Valley", "address": "525 State Street, Ste. 3", "lat": 39.553504, "lng": -75.168439, "phone": "(858) 358-2363", "country": "United States", "city": "Centerton", "state": "NJ", "postal_code": 8318.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c0fdb6337e10e4bc66f3f9d246924e69',
        'nan',
        'nan',
        39.553504,
        -75.168439,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Daretown',
        'NJ',
        '8318.0',
        'uploaded',
        'uploaded_c0fdb6337e10e4bc66f3f9d246924e69',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Daretown", "Zip Code": 8318.0, "Latitude": 39.553504, "Longitude": -75.168439, "State": "NJ", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.553504, "lng": -75.168439, "phone": null, "country": null, "city": "Daretown", "state": "NJ", "postal_code": 8318.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_52cf46b092af3602505f603e9d63fb4f',
        'Lowcountry Cardiology Associates',
        '4969 Centre Point Drive, Ste. 100',
        32.879529,
        -80.059113,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(843) 853-0250',
        NULL,
        'United States',
        'Ch Hgts',
        'SC',
        '29418.0',
        'uploaded',
        'uploaded_52cf46b092af3602505f603e9d63fb4f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Lowcountry Cardiology Associates", "Address": "4969 Centre Point Drive, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 5:00pm", "Phone Number": "(843) 853-0250", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ch Hgts", "Zip Code": 29418.0, "Latitude": 32.879529, "Longitude": -80.059113, "State": "SC", "zipcode UTC": -5.0, "name": "Lowcountry Cardiology Associates", "address": "4969 Centre Point Drive, Ste. 100", "lat": 32.879529, "lng": -80.059113, "phone": "(843) 853-0250", "country": "United States", "city": "Ch Hgts", "state": "SC", "postal_code": 29418.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5451ffac45fec5c0fede48fad65e94c2',
        'nan',
        'nan',
        32.879529,
        -80.059113,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Charleston',
        'SC',
        '29418.0',
        'uploaded',
        'uploaded_5451ffac45fec5c0fede48fad65e94c2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Charleston", "Zip Code": 29418.0, "Latitude": 32.879529, "Longitude": -80.059113, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.879529, "lng": -80.059113, "phone": null, "country": null, "city": "Charleston", "state": "SC", "postal_code": 29418.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_be7e933622865f4d57c640d6167eb869',
        'Randolph Cardiology',
        '1928 Randolph Road, Ste. 215',
        35.197643,
        -80.82752,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(704) 332-3632',
        NULL,
        'United States',
        'Charlotte',
        'NC',
        '28207.0',
        'uploaded',
        'uploaded_be7e933622865f4d57c640d6167eb869',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Randolph Cardiology", "Address": "1928 Randolph Road, Ste. 215", "Address Two": null, "clinic Hours of Operation": "Mon-Thur 9:00am - 5:00pm  Fri 9:00am - 1:00pm", "Phone Number": "(704) 332-3632", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Charlotte", "Zip Code": 28207.0, "Latitude": 35.197643, "Longitude": -80.82752, "State": "NC", "zipcode UTC": -5.0, "name": "Randolph Cardiology", "address": "1928 Randolph Road, Ste. 215", "lat": 35.197643, "lng": -80.82752, "phone": "(704) 332-3632", "country": "United States", "city": "Charlotte", "state": "NC", "postal_code": 28207.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_254ad557f29c6cc1a72a03b717a58515',
        'Piedmont Cardiology ',
        '2660 Tate Boulevard SE',
        35.70701,
        -81.353402,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(828) 261-0009',
        NULL,
        'United States',
        'Hickory',
        'NC',
        '28602.0',
        'uploaded',
        'uploaded_254ad557f29c6cc1a72a03b717a58515',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Piedmont Cardiology ", "Address": "2660 Tate Boulevard SE", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(828) 261-0009", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hickory", "Zip Code": 28602.0, "Latitude": 35.70701, "Longitude": -81.353402, "State": "NC", "zipcode UTC": -5.0, "name": "Piedmont Cardiology ", "address": "2660 Tate Boulevard SE", "lat": 35.70701, "lng": -81.353402, "phone": "(828) 261-0009", "country": "United States", "city": "Hickory", "state": "NC", "postal_code": 28602.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_39fa1c9b6d5fe059b3200f6c6fc595cd',
        'nan',
        'nan',
        35.70701,
        -81.353402,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Long View',
        'NC',
        '28602.0',
        'uploaded',
        'uploaded_39fa1c9b6d5fe059b3200f6c6fc595cd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Long View", "Zip Code": 28602.0, "Latitude": 35.70701, "Longitude": -81.353402, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.70701, "lng": -81.353402, "phone": null, "country": null, "city": "Long View", "state": "NC", "postal_code": 28602.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_abe55c912a439316b5204803eade8900',
        'Piedmont Cardiology ',
        '721 Malcolm Boulevard',
        35.753767,
        -81.535456,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(828) 893-0097',
        NULL,
        'United States',
        'Rutherford College',
        'NC',
        '28671.0',
        'uploaded',
        'uploaded_abe55c912a439316b5204803eade8900',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Piedmont Cardiology ", "Address": "721 Malcolm Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri  8:00am - 5:00pm", "Phone Number": "(828) 893-0097", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Rutherford College", "Zip Code": 28671.0, "Latitude": 35.753767, "Longitude": -81.535456, "State": "NC", "zipcode UTC": -5.0, "name": "Piedmont Cardiology ", "address": "721 Malcolm Boulevard", "lat": 35.753767, "lng": -81.535456, "phone": "(828) 893-0097", "country": "United States", "city": "Rutherford College", "state": "NC", "postal_code": 28671.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_eeb288e9ebf8cc6dcbd24b0d5f6a03bb',
        'nan',
        'nan',
        35.753767,
        -81.535456,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Rutherfrd Col',
        'NC',
        '28671.0',
        'uploaded',
        'uploaded_eeb288e9ebf8cc6dcbd24b0d5f6a03bb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Rutherfrd Col", "Zip Code": 28671.0, "Latitude": 35.753767, "Longitude": -81.535456, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.753767, "lng": -81.535456, "phone": null, "country": null, "city": "Rutherfrd Col", "state": "NC", "postal_code": 28671.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_388b08ac6ae3f6e3d1f0e89237ed3971',
        'Piedmont Cardiology ',
        '401 Mulberry Street, Ste. 103',
        35.934783,
        -81.544766,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(828) 754-1919',
        NULL,
        'United States',
        'Brown Mountain Beach',
        'NC',
        '28645.0',
        'uploaded',
        'uploaded_388b08ac6ae3f6e3d1f0e89237ed3971',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Piedmont Cardiology ", "Address": "401 Mulberry Street, Ste. 103", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(828) 754-1919", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Brown Mountain Beach", "Zip Code": 28645.0, "Latitude": 35.934783, "Longitude": -81.544766, "State": "NC", "zipcode UTC": -5.0, "name": "Piedmont Cardiology ", "address": "401 Mulberry Street, Ste. 103", "lat": 35.934783, "lng": -81.544766, "phone": "(828) 754-1919", "country": "United States", "city": "Brown Mountain Beach", "state": "NC", "postal_code": 28645.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_7d42e2b374383c2cb7692994887dc187',
        'nan',
        'nan',
        35.934783,
        -81.544766,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Edgemont',
        'NC',
        '28645.0',
        'uploaded',
        'uploaded_7d42e2b374383c2cb7692994887dc187',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Edgemont", "Zip Code": 28645.0, "Latitude": 35.934783, "Longitude": -81.544766, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.934783, "lng": -81.544766, "phone": null, "country": null, "city": "Edgemont", "state": "NC", "postal_code": 28645.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c5d61e63229245238e4b3efaf2a6c10b',
        'Peace Arch Cardiology',
        '1215 Old Fairhaven Parkway',
        48.747578,
        -122.485086,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(360) 594-4002',
        NULL,
        'United States',
        'Bellingham',
        'WA',
        '98225.0',
        'uploaded',
        'uploaded_c5d61e63229245238e4b3efaf2a6c10b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Peace Arch Cardiology", "Address": "1215 Old Fairhaven Parkway", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(360) 594-4002", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Bellingham", "Zip Code": 98225.0, "Latitude": 48.747578, "Longitude": -122.485086, "State": "WA", "zipcode UTC": -8.0, "name": "Peace Arch Cardiology", "address": "1215 Old Fairhaven Parkway", "lat": 48.747578, "lng": -122.485086, "phone": "(360) 594-4002", "country": "United States", "city": "Bellingham", "state": "WA", "postal_code": 98225.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_746e5a57e1c9b1706e83df2237dbe4d4',
        'nan',
        'nan',
        48.747578,
        -122.485086,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Chuckanut',
        'WA',
        '98225.0',
        'uploaded',
        'uploaded_746e5a57e1c9b1706e83df2237dbe4d4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Chuckanut", "Zip Code": 98225.0, "Latitude": 48.747578, "Longitude": -122.485086, "State": "WA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 48.747578, "lng": -122.485086, "phone": null, "country": null, "city": "Chuckanut", "state": "WA", "postal_code": 98225.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_339c82cf9f6bb01d262973df798e408b',
        'Southeast Cardiology',
        '1812 Wallace School Road',
        32.794841,
        -80.005002,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(843) 766-2011',
        NULL,
        'United States',
        'Charleston',
        'SC',
        '29407.0',
        'uploaded',
        'uploaded_339c82cf9f6bb01d262973df798e408b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Southeast Cardiology", "Address": "1812 Wallace School Road", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(843) 766-2011", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Charleston", "Zip Code": 29407.0, "Latitude": 32.794841, "Longitude": -80.005002, "State": "SC", "zipcode UTC": -5.0, "name": "Southeast Cardiology", "address": "1812 Wallace School Road", "lat": 32.794841, "lng": -80.005002, "phone": "(843) 766-2011", "country": "United States", "city": "Charleston", "state": "SC", "postal_code": 29407.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4cc33a415e746d909b158f6de6a7effe',
        'Cumberland Cardiology',
        '3505 Village Drive',
        35.02844,
        -78.970374,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(910) 323-0065',
        NULL,
        'United States',
        'Fayetteville',
        'NC',
        '28304.0',
        'uploaded',
        'uploaded_4cc33a415e746d909b158f6de6a7effe',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cumberland Cardiology", "Address": "3505 Village Drive", "Address Two": "Suite 201", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(910) 323-0065", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Fayetteville", "Zip Code": 28304.0, "Latitude": 35.02844, "Longitude": -78.970374, "State": "NC", "zipcode UTC": -5.0, "name": "Cumberland Cardiology", "address": "3505 Village Drive", "lat": 35.02844, "lng": -78.970374, "phone": "(910) 323-0065", "country": "United States", "city": "Fayetteville", "state": "NC", "postal_code": 28304.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6248c9e4a089cf08de03765720f1e48b',
        'nan',
        'nan',
        35.02844,
        -78.970374,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Lafayette',
        'NC',
        '28304.0',
        'uploaded',
        'uploaded_6248c9e4a089cf08de03765720f1e48b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lafayette", "Zip Code": 28304.0, "Latitude": 35.02844, "Longitude": -78.970374, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.02844, "lng": -78.970374, "phone": null, "country": null, "city": "Lafayette", "state": "NC", "postal_code": 28304.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_547ccccb71aca5a52b43c3aea65c9652',
        'Sioux Falls Cardiovascular',
        '1727 South Cleveland Avenue',
        43.537075,
        -96.695276,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(605) 274-6300',
        NULL,
        'United States',
        'Sioux Falls',
        'SD',
        '57103.0',
        'uploaded',
        'uploaded_547ccccb71aca5a52b43c3aea65c9652',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Sioux Falls Cardiovascular", "Address": "1727 South Cleveland Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm", "Phone Number": "(605) 274-6300", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Sioux Falls", "Zip Code": 57103.0, "Latitude": 43.537075, "Longitude": -96.695276, "State": "SD", "zipcode UTC": -6.0, "name": "Sioux Falls Cardiovascular", "address": "1727 South Cleveland Avenue", "lat": 43.537075, "lng": -96.695276, "phone": "(605) 274-6300", "country": "United States", "city": "Sioux Falls", "state": "SD", "postal_code": 57103.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_bb0e3e5bee2fe46a461507c965d7d644',
        'Winston-Salem Cardiology',
        '186 Kimel Park Drive',
        36.066545,
        -80.30733,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(336) 277-2000',
        NULL,
        'United States',
        'Ardmore',
        'NC',
        '27103.0',
        'uploaded',
        'uploaded_bb0e3e5bee2fe46a461507c965d7d644',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Winston-Salem Cardiology", "Address": "186 Kimel Park Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(336) 277-2000", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ardmore", "Zip Code": 27103.0, "Latitude": 36.066545, "Longitude": -80.30733, "State": "NC", "zipcode UTC": -5.0, "name": "Winston-Salem Cardiology", "address": "186 Kimel Park Drive", "lat": 36.066545, "lng": -80.30733, "phone": "(336) 277-2000", "country": "United States", "city": "Ardmore", "state": "NC", "postal_code": 27103.0, "category": "Cardiologist"}'::jsonb,
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
        ARRAY['Cardiologist'],
        'Cardiologist',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hanes", "Zip Code": 27103.0, "Latitude": 36.066545, "Longitude": -80.30733, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 36.066545, "lng": -80.30733, "phone": null, "country": null, "city": "Hanes", "state": "NC", "postal_code": 27103.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_9c51a5ff94c442a71650f0d1776e6819',
        'Baton Rouge Cardiology',
        '5231 Brittany Drive',
        30.411391,
        -91.149705,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(225) 769-0933',
        NULL,
        'United States',
        'Baton Rouge',
        'LA',
        '70808.0',
        'uploaded',
        'uploaded_9c51a5ff94c442a71650f0d1776e6819',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Baton Rouge Cardiology", "Address": "5231 Brittany Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(225) 769-0933", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Baton Rouge", "Zip Code": 70808.0, "Latitude": 30.411391, "Longitude": -91.149705, "State": "LA", "zipcode UTC": -6.0, "name": "Baton Rouge Cardiology", "address": "5231 Brittany Drive", "lat": 30.411391, "lng": -91.149705, "phone": "(225) 769-0933", "country": "United States", "city": "Baton Rouge", "state": "LA", "postal_code": 70808.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4375cc188566c53ee6d62d1530e11015',
        'West Bank Cardiology ',
        '59335 Riverwest Drive, Ste. C',
        30.270694,
        -91.248538,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(225) 685-1052',
        NULL,
        'United States',
        'Plaquemine',
        'LA',
        '70764.0',
        'uploaded',
        'uploaded_4375cc188566c53ee6d62d1530e11015',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "West Bank Cardiology ", "Address": "59335 Riverwest Drive, Ste. C", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(225) 685-1052", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Plaquemine", "Zip Code": 70764.0, "Latitude": 30.270694, "Longitude": -91.248538, "State": "LA", "zipcode UTC": -6.0, "name": "West Bank Cardiology ", "address": "59335 Riverwest Drive, Ste. C", "lat": 30.270694, "lng": -91.248538, "phone": "(225) 685-1052", "country": "United States", "city": "Plaquemine", "state": "LA", "postal_code": 70764.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_bbf68b88b51cee3d4f1fa4feeeb71c66',
        'Heart South Cardiology',
        '2232 West 24th Street',
        30.195424,
        -85.664587,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(850) 913-8996',
        NULL,
        'United States',
        'Panama City',
        'FL',
        '32405.0',
        'uploaded',
        'uploaded_bbf68b88b51cee3d4f1fa4feeeb71c66',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Heart South Cardiology", "Address": "2232 West 24th Street", "Address Two": null, "clinic Hours of Operation": "Mon - Thurs: 8:00am - 4:00pm\nFri: 8:00am - 12:00pm", "Phone Number": "(850) 913-8996", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Panama City", "Zip Code": 32405.0, "Latitude": 30.195424, "Longitude": -85.664587, "State": "FL", "zipcode UTC": -6.0, "name": "Heart South Cardiology", "address": "2232 West 24th Street", "lat": 30.195424, "lng": -85.664587, "phone": "(850) 913-8996", "country": "United States", "city": "Panama City", "state": "FL", "postal_code": 32405.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_24c5c80b5784b2938dfba9a8c4c44943',
        'Cardiology & Internal Medicine Group of North Florida',
        '230 East Crawford Street',
        30.573563,
        -84.614704,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(850) 627-4327',
        NULL,
        'United States',
        'Quincy',
        'FL',
        '32351.0',
        'uploaded',
        'uploaded_24c5c80b5784b2938dfba9a8c4c44943',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology & Internal Medicine Group of North Florida", "Address": "230 East Crawford Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm  ", "Phone Number": "(850) 627-4327", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Quincy", "Zip Code": 32351.0, "Latitude": 30.573563, "Longitude": -84.614704, "State": "FL", "zipcode UTC": -5.0, "name": "Cardiology & Internal Medicine Group of North Florida", "address": "230 East Crawford Street", "lat": 30.573563, "lng": -84.614704, "phone": "(850) 627-4327", "country": "United States", "city": "Quincy", "state": "FL", "postal_code": 32351.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6a9f432a38dc75289ce9725f1e28297a',
        'Cardiology & Internal Medicine Group of North Florida',
        '155 Avenue E',
        29.71877,
        -85.027047,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(850) 653-8600',
        NULL,
        'United States',
        'Apalachicola',
        'FL',
        '32320.0',
        'uploaded',
        'uploaded_6a9f432a38dc75289ce9725f1e28297a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology & Internal Medicine Group of North Florida", "Address": "155 Avenue E", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(850) 653-8600", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Apalachicola", "Zip Code": 32320.0, "Latitude": 29.71877, "Longitude": -85.027047, "State": "FL", "zipcode UTC": -5.0, "name": "Cardiology & Internal Medicine Group of North Florida", "address": "155 Avenue E", "lat": 29.71877, "lng": -85.027047, "phone": "(850) 653-8600", "country": "United States", "city": "Apalachicola", "state": "FL", "postal_code": 32320.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8898848d37d161f87e05f86c0ea9e199',
        'Cardiology & Internal Medicine Group of North Florida',
        '293 W Base St',
        30.476181,
        -83.403032,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(850) 973-8600',
        NULL,
        'United States',
        'Madison',
        'FL',
        '32340.0',
        'uploaded',
        'uploaded_8898848d37d161f87e05f86c0ea9e199',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology & Internal Medicine Group of North Florida", "Address": "293 W Base St", "Address Two": null, "clinic Hours of Operation": "Mon-Fri:  8am-4pm", "Phone Number": "(850) 973-8600", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Madison", "Zip Code": 32340.0, "Latitude": 30.476181, "Longitude": -83.403032, "State": "FL", "zipcode UTC": -5.0, "name": "Cardiology & Internal Medicine Group of North Florida", "address": "293 W Base St", "lat": 30.476181, "lng": -83.403032, "phone": "(850) 973-8600", "country": "United States", "city": "Madison", "state": "FL", "postal_code": 32340.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4c225547c7d53342896a451b9c9918c4',
        'Cardiology Consultants of Southwest Florida',
        '13411 Parker Commons Boulevard, Ste. 101',
        26.501582,
        -81.828419,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(239) 415-4900',
        NULL,
        'United States',
        'Fort Myers',
        'FL',
        '33912.0',
        'uploaded',
        'uploaded_4c225547c7d53342896a451b9c9918c4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Consultants of Southwest Florida", "Address": "13411 Parker Commons Boulevard, Ste. 101", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(239) 415-4900", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Fort Myers", "Zip Code": 33912.0, "Latitude": 26.501582, "Longitude": -81.828419, "State": "FL", "zipcode UTC": -5.0, "name": "Cardiology Consultants of Southwest Florida", "address": "13411 Parker Commons Boulevard, Ste. 101", "lat": 26.501582, "lng": -81.828419, "phone": "(239) 415-4900", "country": "United States", "city": "Fort Myers", "state": "FL", "postal_code": 33912.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c906a4f3aee552590f84b89a8751705a',
        'nan',
        'nan',
        26.501582,
        -81.828419,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Ft Myers',
        'FL',
        '33912.0',
        'uploaded',
        'uploaded_c906a4f3aee552590f84b89a8751705a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ft Myers", "Zip Code": 33912.0, "Latitude": 26.501582, "Longitude": -81.828419, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 26.501582, "lng": -81.828419, "phone": null, "country": null, "city": "Ft Myers", "state": "FL", "postal_code": 33912.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_32ca381844845e8c2f9214a79e500191',
        'Keys Cardiology',
        '260 Beth Stacey Boulevard, Ste. 130',
        26.588982,
        -81.611639,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(239) 369-4088',
        NULL,
        'United States',
        'Lehigh',
        'FL',
        '33936.0',
        'uploaded',
        'uploaded_32ca381844845e8c2f9214a79e500191',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Keys Cardiology", "Address": "260 Beth Stacey Boulevard, Ste. 130", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(239) 369-4088", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lehigh", "Zip Code": 33936.0, "Latitude": 26.588982, "Longitude": -81.611639, "State": "FL", "zipcode UTC": -5.0, "name": "Keys Cardiology", "address": "260 Beth Stacey Boulevard, Ste. 130", "lat": 26.588982, "lng": -81.611639, "phone": "(239) 369-4088", "country": "United States", "city": "Lehigh", "state": "FL", "postal_code": 33936.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b5701f46ccd3064c3b1871c0df421d48',
        'nan',
        'nan',
        26.588982,
        -81.611639,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Lehigh Acres',
        'FL',
        '33936.0',
        'uploaded',
        'uploaded_b5701f46ccd3064c3b1871c0df421d48',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lehigh Acres", "Zip Code": 33936.0, "Latitude": 26.588982, "Longitude": -81.611639, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 26.588982, "lng": -81.611639, "phone": null, "country": null, "city": "Lehigh Acres", "state": "FL", "postal_code": 33936.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_75ff4fc572abe1805c0c2899dfaee267',
        'Cardiology Specialists',
        '155 Hospital Drive, Ste. 101',
        30.185867,
        -92.047069,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(337) 269-9777',
        NULL,
        'United States',
        'Lafayette',
        'LA',
        '70503.0',
        'uploaded',
        'uploaded_75ff4fc572abe1805c0c2899dfaee267',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Specialists", "Address": "155 Hospital Drive, Ste. 101", "Address Two": null, "clinic Hours of Operation": "Mon-Thur 8:00am - 5:00pm    Fri 8:00am - 12:00pm", "Phone Number": "(337) 269-9777", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Lafayette", "Zip Code": 70503.0, "Latitude": 30.185867, "Longitude": -92.047069, "State": "LA", "zipcode UTC": -6.0, "name": "Cardiology Specialists", "address": "155 Hospital Drive, Ste. 101", "lat": 30.185867, "lng": -92.047069, "phone": "(337) 269-9777", "country": "United States", "city": "Lafayette", "state": "LA", "postal_code": 70503.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f95a1d3dd5eca53920bd50ca139192e7',
        'Live Oak Cardiology ',
        '4007 James Casey Street, Ste. C220',
        30.207559,
        -97.795751,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(512) 442-1500',
        NULL,
        'United States',
        'Austin',
        'TX',
        '78745.0',
        'uploaded',
        'uploaded_f95a1d3dd5eca53920bd50ca139192e7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Live Oak Cardiology ", "Address": "4007 James Casey Street, Ste. C220", "Address Two": null, "clinic Hours of Operation": "Mon-Thur 8:00am - 5:00pm   Fri 8:00am - 4:00pm", "Phone Number": "(512) 442-1500", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Austin", "Zip Code": 78745.0, "Latitude": 30.207559, "Longitude": -97.795751, "State": "TX", "zipcode UTC": -6.0, "name": "Live Oak Cardiology ", "address": "4007 James Casey Street, Ste. C220", "lat": 30.207559, "lng": -97.795751, "phone": "(512) 442-1500", "country": "United States", "city": "Austin", "state": "TX", "postal_code": 78745.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_9a787b438c02e855e59f5bdf2eb4c3c5',
        'nan',
        'nan',
        30.207559,
        -97.795751,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Sunset Valley',
        'TX',
        '78745.0',
        'uploaded',
        'uploaded_9a787b438c02e855e59f5bdf2eb4c3c5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Sunset Valley", "Zip Code": 78745.0, "Latitude": 30.207559, "Longitude": -97.795751, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 30.207559, "lng": -97.795751, "phone": null, "country": null, "city": "Sunset Valley", "state": "TX", "postal_code": 78745.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ba61642e32278419faa2346eae73cafc',
        'Southeastern Cardiology Consultants, P.C. ',
        '2055 East South Boulevard, Ste. 403',
        32.31324,
        -86.236722,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(334) 613-0807',
        NULL,
        'United States',
        'Montgomery',
        'AL',
        '36116.0',
        'uploaded',
        'uploaded_ba61642e32278419faa2346eae73cafc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Southeastern Cardiology Consultants, P.C. ", "Address": "2055 East South Boulevard, Ste. 403", "Address Two": null, "clinic Hours of Operation": "Mon-Thur 8:00am - 5:00pm    Fri 8:00am - 12:00pm       ", "Phone Number": "(334) 613-0807", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Montgomery", "Zip Code": 36116.0, "Latitude": 32.31324, "Longitude": -86.236722, "State": "AL", "zipcode UTC": -6.0, "name": "Southeastern Cardiology Consultants, P.C. ", "address": "2055 East South Boulevard, Ste. 403", "lat": 32.31324, "lng": -86.236722, "phone": "(334) 613-0807", "country": "United States", "city": "Montgomery", "state": "AL", "postal_code": 36116.0, "category": "Cardiologist"}'::jsonb,
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
        ARRAY['Cardiologist'],
        'Cardiologist',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Mtgy", "Zip Code": 36116.0, "Latitude": 32.31324, "Longitude": -86.236722, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.31324, "lng": -86.236722, "phone": null, "country": null, "city": "Mtgy", "state": "AL", "postal_code": 36116.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_36f07147d2852aca9acdec57ff8d4ee3',
        'Cardiology Associates',
        '1758 Pack Place, Ste. 401',
        32.354888,
        -86.271616,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(334) 264-9191',
        NULL,
        'United States',
        'Montgomery',
        'AL',
        '36106.0',
        'uploaded',
        'uploaded_36f07147d2852aca9acdec57ff8d4ee3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates", "Address": "1758 Pack Place, Ste. 401", "Address Two": null, "clinic Hours of Operation": "Mon-Thur 8:00am - 4:00pm    Fri 8:00am - 2:00pm", "Phone Number": "(334) 264-9191", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Montgomery", "Zip Code": 36106.0, "Latitude": 32.354888, "Longitude": -86.271616, "State": "AL", "zipcode UTC": -6.0, "name": "Cardiology Associates", "address": "1758 Pack Place, Ste. 401", "lat": 32.354888, "lng": -86.271616, "phone": "(334) 264-9191", "country": "United States", "city": "Montgomery", "state": "AL", "postal_code": 36106.0, "category": "Cardiologist"}'::jsonb,
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
        ARRAY['Cardiologist'],
        'Cardiologist',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Mtgy", "Zip Code": 36106.0, "Latitude": 32.354888, "Longitude": -86.271616, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.354888, "lng": -86.271616, "phone": null, "country": null, "city": "Mtgy", "state": "AL", "postal_code": 36106.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_cf21b7be3f70468f93c4eccf5af2468c',
        'Cardiology Associates',
        '805 Friendship Road Ste. B',
        32.553036,
        -85.913601,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(334) 264-9191',
        NULL,
        'United States',
        'Tallassee',
        'AL',
        '36078.0',
        'uploaded',
        'uploaded_cf21b7be3f70468f93c4eccf5af2468c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates", "Address": "805 Friendship Road Ste. B", "Address Two": null, "clinic Hours of Operation": "Thur 12:30pm - 2:30pm", "Phone Number": "(334) 264-9191", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Tallassee", "Zip Code": 36078.0, "Latitude": 32.553036, "Longitude": -85.913601, "State": "AL", "zipcode UTC": -6.0, "name": "Cardiology Associates", "address": "805 Friendship Road Ste. B", "lat": 32.553036, "lng": -85.913601, "phone": "(334) 264-9191", "country": "United States", "city": "Tallassee", "state": "AL", "postal_code": 36078.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_e465acb264b9a0733668dc48737b25bb',
        'Cardiology Associates',
        '645 McQueen Smith Boulevard, Ste. 108',
        32.459435,
        -86.427469,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(334) 264-9191',
        NULL,
        'United States',
        'Prattville',
        'AL',
        '36066.0',
        'uploaded',
        'uploaded_e465acb264b9a0733668dc48737b25bb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates", "Address": "645 McQueen Smith Boulevard, Ste. 108", "Address Two": null, "clinic Hours of Operation": "Mondays", "Phone Number": "(334) 264-9191", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Prattville", "Zip Code": 36066.0, "Latitude": 32.459435, "Longitude": -86.427469, "State": "AL", "zipcode UTC": -6.0, "name": "Cardiology Associates", "address": "645 McQueen Smith Boulevard, Ste. 108", "lat": 32.459435, "lng": -86.427469, "phone": "(334) 264-9191", "country": "United States", "city": "Prattville", "state": "AL", "postal_code": 36066.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4f093643e070cd1cbf646f64fa9ddbb5',
        'nan',
        'nan',
        32.459435,
        -86.427469,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Pville',
        'AL',
        '36066.0',
        'uploaded',
        'uploaded_4f093643e070cd1cbf646f64fa9ddbb5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Pville", "Zip Code": 36066.0, "Latitude": 32.459435, "Longitude": -86.427469, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.459435, "lng": -86.427469, "phone": null, "country": null, "city": "Pville", "state": "AL", "postal_code": 36066.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_cf8cf244d489850c61b741b2570dfe70',
        'Shroff Cardiology and Internal Medicine Clinic',
        '1501 West 11th Place, Ste. 301',
        32.21649,
        -101.453208,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(432) 267-9805',
        NULL,
        'United States',
        'Big Spring',
        'TX',
        '79720.0',
        'uploaded',
        'uploaded_cf8cf244d489850c61b741b2570dfe70',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Shroff Cardiology and Internal Medicine Clinic", "Address": "1501 West 11th Place, Ste. 301", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(432) 267-9805", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Big Spring", "Zip Code": 79720.0, "Latitude": 32.21649, "Longitude": -101.453208, "State": "TX", "zipcode UTC": -6.0, "name": "Shroff Cardiology and Internal Medicine Clinic", "address": "1501 West 11th Place, Ste. 301", "lat": 32.21649, "lng": -101.453208, "phone": "(432) 267-9805", "country": "United States", "city": "Big Spring", "state": "TX", "postal_code": 79720.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_02efb8922865f7be39f1f6abc42d2035',
        'nan',
        'nan',
        32.21649,
        -101.453208,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Vealmoor',
        'TX',
        '79720.0',
        'uploaded',
        'uploaded_02efb8922865f7be39f1f6abc42d2035',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Vealmoor", "Zip Code": 79720.0, "Latitude": 32.21649, "Longitude": -101.453208, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.21649, "lng": -101.453208, "phone": null, "country": null, "city": "Vealmoor", "state": "TX", "postal_code": 79720.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a07db27fff08251e55d4561239046dcc',
        'Cardiology Associates, PA',
        '4300 West Main Street, Ste. 102',
        31.214832,
        -85.474026,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(334) 793-9564',
        NULL,
        'United States',
        'Dothan',
        'AL',
        '36305.0',
        'uploaded',
        'uploaded_a07db27fff08251e55d4561239046dcc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates, PA", "Address": "4300 West Main Street, Ste. 102", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(334) 793-9564", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Dothan", "Zip Code": 36305.0, "Latitude": 31.214832, "Longitude": -85.474026, "State": "AL", "zipcode UTC": -6.0, "name": "Cardiology Associates, PA", "address": "4300 West Main Street, Ste. 102", "lat": 31.214832, "lng": -85.474026, "phone": "(334) 793-9564", "country": "United States", "city": "Dothan", "state": "AL", "postal_code": 36305.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f5a9d999eb6ea14669f3c0ec69fa2deb',
        'nan',
        'nan',
        31.214832,
        -85.474026,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Rehobeth',
        'AL',
        '36305.0',
        'uploaded',
        'uploaded_f5a9d999eb6ea14669f3c0ec69fa2deb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Rehobeth", "Zip Code": 36305.0, "Latitude": 31.214832, "Longitude": -85.474026, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 31.214832, "lng": -85.474026, "phone": null, "country": null, "city": "Rehobeth", "state": "AL", "postal_code": 36305.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f1b6802c4f36d195e95a14dfa801437e',
        'Cardiology One Incorporated',
        '4466 Fulton Drive Northwest',
        40.850683,
        -81.437731,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(330) 489-1386',
        NULL,
        'United States',
        'Belden Village Mall',
        'OH',
        '44718.0',
        'uploaded',
        'uploaded_f1b6802c4f36d195e95a14dfa801437e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology One Incorporated", "Address": "4466 Fulton Drive Northwest", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm", "Phone Number": "(330) 489-1386", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Belden Village Mall", "Zip Code": 44718.0, "Latitude": 40.850683, "Longitude": -81.437731, "State": "OH", "zipcode UTC": -5.0, "name": "Cardiology One Incorporated", "address": "4466 Fulton Drive Northwest", "lat": 40.850683, "lng": -81.437731, "phone": "(330) 489-1386", "country": "United States", "city": "Belden Village Mall", "state": "OH", "postal_code": 44718.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5a2d8f23498b5c4926267f6407006e57',
        'nan',
        'nan',
        40.850683,
        -81.437731,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Canton',
        'OH',
        '44718.0',
        'uploaded',
        'uploaded_5a2d8f23498b5c4926267f6407006e57',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Canton", "Zip Code": 44718.0, "Latitude": 40.850683, "Longitude": -81.437731, "State": "OH", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.850683, "lng": -81.437731, "phone": null, "country": null, "city": "Canton", "state": "OH", "postal_code": 44718.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_54561e0be209a700aec493528320a83f',
        'City Cardiology Associates',
        '95 Arch St',
        41.081788,
        -81.507453,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(330) 753-6699',
        NULL,
        'United States',
        'Akron',
        'OH',
        '44304.0',
        'uploaded',
        'uploaded_54561e0be209a700aec493528320a83f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "City Cardiology Associates", "Address": "95 Arch St", "Address Two": "Ste 130", "clinic Hours of Operation": "Mon - Thu:  9:00am - 5:00pm\nFri:  9:00am - 12:00pm", "Phone Number": "(330) 753-6699", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Akron", "Zip Code": 44304.0, "Latitude": 41.081788, "Longitude": -81.507453, "State": "OH", "zipcode UTC": -5.0, "name": "City Cardiology Associates", "address": "95 Arch St", "lat": 41.081788, "lng": -81.507453, "phone": "(330) 753-6699", "country": "United States", "city": "Akron", "state": "OH", "postal_code": 44304.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_07876dcc40c293411b59342c37b3b5ac',
        'City Cardiology Associates',
        '4466 Darrow Rd',
        41.174256,
        -81.43744,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(330) 688-1346',
        NULL,
        'United States',
        'Cuyahoga Falls',
        'OH',
        '44224.0',
        'uploaded',
        'uploaded_07876dcc40c293411b59342c37b3b5ac',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "City Cardiology Associates", "Address": "4466 Darrow Rd", "Address Two": "Ste A1", "clinic Hours of Operation": "Mon - Thu:  9:00am - 5:00pm\nFri:  9:00am - 12:00pm", "Phone Number": "(330) 688-1346", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cuyahoga Falls", "Zip Code": 44224.0, "Latitude": 41.174256, "Longitude": -81.43744, "State": "OH", "zipcode UTC": -5.0, "name": "City Cardiology Associates", "address": "4466 Darrow Rd", "lat": 41.174256, "lng": -81.43744, "phone": "(330) 688-1346", "country": "United States", "city": "Cuyahoga Falls", "state": "OH", "postal_code": 44224.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0f6b4618cf77dc0210e25370d00c9355',
        'nan',
        'nan',
        41.174256,
        -81.43744,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Cuyahoga Fls',
        'OH',
        '44224.0',
        'uploaded',
        'uploaded_0f6b4618cf77dc0210e25370d00c9355',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cuyahoga Fls", "Zip Code": 44224.0, "Latitude": 41.174256, "Longitude": -81.43744, "State": "OH", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 41.174256, "lng": -81.43744, "phone": null, "country": null, "city": "Cuyahoga Fls", "state": "OH", "postal_code": 44224.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_de5e1fb9a3fc7b046012a896515a590a',
        'City Cardiology Associates',
        '201 5th St NE',
        41.017522,
        -81.616165,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(330) 753-6699',
        NULL,
        'United States',
        'Barb',
        'OH',
        '44203.0',
        'uploaded',
        'uploaded_de5e1fb9a3fc7b046012a896515a590a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "City Cardiology Associates", "Address": "201 5th St NE", "Address Two": "Ste 18", "clinic Hours of Operation": "Mon - Thu:  9:00am - 5:00pm\nFri:  9:00am - 12:00pm", "Phone Number": "(330) 753-6699", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Barb", "Zip Code": 44203.0, "Latitude": 41.017522, "Longitude": -81.616165, "State": "OH", "zipcode UTC": -5.0, "name": "City Cardiology Associates", "address": "201 5th St NE", "lat": 41.017522, "lng": -81.616165, "phone": "(330) 753-6699", "country": "United States", "city": "Barb", "state": "OH", "postal_code": 44203.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8b86023e9e74e1d0c47556b280b5412a',
        'nan',
        'nan',
        41.017522,
        -81.616165,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Barberton',
        'OH',
        '44203.0',
        'uploaded',
        'uploaded_8b86023e9e74e1d0c47556b280b5412a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Barberton", "Zip Code": 44203.0, "Latitude": 41.017522, "Longitude": -81.616165, "State": "OH", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 41.017522, "lng": -81.616165, "phone": null, "country": null, "city": "Barberton", "state": "OH", "postal_code": 44203.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f88e3119d07ce138600936ba7df59435',
        'Miami International Cardiology Consultants',
        '3801 Biscayne Blvd',
        25.817325,
        -80.190468,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(305) 571-0620',
        NULL,
        'United States',
        'Miami',
        'FL',
        '33137.0',
        'uploaded',
        'uploaded_f88e3119d07ce138600936ba7df59435',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Miami International Cardiology Consultants", "Address": "3801 Biscayne Blvd", "Address Two": "Ste 300", "clinic Hours of Operation": "Mon - Fri:  9:00am - 5:00pm", "Phone Number": "(305) 571-0620", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Miami", "Zip Code": 33137.0, "Latitude": 25.817325, "Longitude": -80.190468, "State": "FL", "zipcode UTC": -5.0, "name": "Miami International Cardiology Consultants", "address": "3801 Biscayne Blvd", "lat": 25.817325, "lng": -80.190468, "phone": "(305) 571-0620", "country": "United States", "city": "Miami", "state": "FL", "postal_code": 33137.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_dde8186d728c1a45b6c4c777f81edd04',
        'MAB Cardiology',
        '2200 West Eau Gallie Boulevard, Ste. 200',
        28.13926,
        -80.650771,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(321) 255-1500',
        NULL,
        'United States',
        'Melbourne',
        'FL',
        '32935.0',
        'uploaded',
        'uploaded_dde8186d728c1a45b6c4c777f81edd04',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MAB Cardiology", "Address": "2200 West Eau Gallie Boulevard, Ste. 200", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(321) 255-1500", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Melbourne", "Zip Code": 32935.0, "Latitude": 28.13926, "Longitude": -80.650771, "State": "FL", "zipcode UTC": -5.0, "name": "MAB Cardiology", "address": "2200 West Eau Gallie Boulevard, Ste. 200", "lat": 28.13926, "lng": -80.650771, "phone": "(321) 255-1500", "country": "United States", "city": "Melbourne", "state": "FL", "postal_code": 32935.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ca2ce6eaac9bf0c8ca4d04b3e6f9ef41',
        'nan',
        'nan',
        28.13926,
        -80.650771,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Suntree',
        'FL',
        '32935.0',
        'uploaded',
        'uploaded_ca2ce6eaac9bf0c8ca4d04b3e6f9ef41',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Suntree", "Zip Code": 32935.0, "Latitude": 28.13926, "Longitude": -80.650771, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 28.13926, "lng": -80.650771, "phone": null, "country": null, "city": "Suntree", "state": "FL", "postal_code": 32935.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ab0a1e9429ea08e0e1a0101684bd83fb',
        'Pacific Cardiovascular',
        '1901 South Union Avenue, Bldg B, Ste. 5003',
        47.248953,
        -122.465992,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(253) 572-4900',
        NULL,
        'United States',
        'Tacoma',
        'WA',
        '98405.0',
        'uploaded',
        'uploaded_ab0a1e9429ea08e0e1a0101684bd83fb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiovascular", "Address": "1901 South Union Avenue, Bldg B, Ste. 5003", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(253) 572-4900", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Tacoma", "Zip Code": 98405.0, "Latitude": 47.248953, "Longitude": -122.465992, "State": "WA", "zipcode UTC": -8.0, "name": "Pacific Cardiovascular", "address": "1901 South Union Avenue, Bldg B, Ste. 5003", "lat": 47.248953, "lng": -122.465992, "phone": "(253) 572-4900", "country": "United States", "city": "Tacoma", "state": "WA", "postal_code": 98405.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6c4a106c9d5d674d149edfe76e75d2a4',
        'Louisiana Cardiology Associates',
        '7777 Hennessy Boulevard, Ste. 1000',
        30.411391,
        -91.149705,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(225) 757-2407',
        NULL,
        'United States',
        'Baton Rouge',
        'LA',
        '70808.0',
        'uploaded',
        'uploaded_6c4a106c9d5d674d149edfe76e75d2a4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Louisiana Cardiology Associates", "Address": "7777 Hennessy Boulevard, Ste. 1000", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(225) 757-2407", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Baton Rouge", "Zip Code": 70808.0, "Latitude": 30.411391, "Longitude": -91.149705, "State": "LA", "zipcode UTC": -6.0, "name": "Louisiana Cardiology Associates", "address": "7777 Hennessy Boulevard, Ste. 1000", "lat": 30.411391, "lng": -91.149705, "phone": "(225) 757-2407", "country": "United States", "city": "Baton Rouge", "state": "LA", "postal_code": 70808.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f1c90e39a73fb5739621dda65cbda0f1',
        'Southeastern Cardiovascular',
        '7777 Hennessy Boulevard, Ste. 8000',
        30.411391,
        -91.149705,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(225) 767-1151',
        NULL,
        'United States',
        'Baton Rouge',
        'LA',
        '70808.0',
        'uploaded',
        'uploaded_f1c90e39a73fb5739621dda65cbda0f1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Southeastern Cardiovascular", "Address": "7777 Hennessy Boulevard, Ste. 8000", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(225) 767-1151", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Baton Rouge", "Zip Code": 70808.0, "Latitude": 30.411391, "Longitude": -91.149705, "State": "LA", "zipcode UTC": -6.0, "name": "Southeastern Cardiovascular", "address": "7777 Hennessy Boulevard, Ste. 8000", "lat": 30.411391, "lng": -91.149705, "phone": "(225) 767-1151", "country": "United States", "city": "Baton Rouge", "state": "LA", "postal_code": 70808.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a9ff89a6479644f3fa015fec6da2f0e7',
        'Cardiology Associates of West Texas',
        '3180 Executive Drive, Ste. 102',
        31.344515,
        -100.472175,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(325) 944-1240',
        NULL,
        'United States',
        'San Angelo',
        'TX',
        '76904.0',
        'uploaded',
        'uploaded_a9ff89a6479644f3fa015fec6da2f0e7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates of West Texas", "Address": "3180 Executive Drive, Ste. 102", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(325) 944-1240", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "San Angelo", "Zip Code": 76904.0, "Latitude": 31.344515, "Longitude": -100.472175, "State": "TX", "zipcode UTC": -6.0, "name": "Cardiology Associates of West Texas", "address": "3180 Executive Drive, Ste. 102", "lat": 31.344515, "lng": -100.472175, "phone": "(325) 944-1240", "country": "United States", "city": "San Angelo", "state": "TX", "postal_code": 76904.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_31fa9e87e83f9b7c77513e5337b4abc1',
        'St. Louis Heart and Vascular Cardiology',
        '11155 Dunn Rd',
        38.73835,
        -90.261544,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(314) 741-0911',
        NULL,
        'United States',
        'Country Club Hills',
        'MO',
        '63136.0',
        'uploaded',
        'uploaded_31fa9e87e83f9b7c77513e5337b4abc1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "St. Louis Heart and Vascular Cardiology", "Address": "11155 Dunn Rd", "Address Two": "Ste 304E", "clinic Hours of Operation": null, "Phone Number": "(314) 741-0911", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Country Club Hills", "Zip Code": 63136.0, "Latitude": 38.73835, "Longitude": -90.261544, "State": "MO", "zipcode UTC": -6.0, "name": "St. Louis Heart and Vascular Cardiology", "address": "11155 Dunn Rd", "lat": 38.73835, "lng": -90.261544, "phone": "(314) 741-0911", "country": "United States", "city": "Country Club Hills", "state": "MO", "postal_code": 63136.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b7f1cb7dd930654663ad2657f5973904',
        'nan',
        'nan',
        38.73835,
        -90.261544,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Dellwood',
        'MO',
        '63136.0',
        'uploaded',
        'uploaded_b7f1cb7dd930654663ad2657f5973904',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Dellwood", "Zip Code": 63136.0, "Latitude": 38.73835, "Longitude": -90.261544, "State": "MO", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 38.73835, "lng": -90.261544, "phone": null, "country": null, "city": "Dellwood", "state": "MO", "postal_code": 63136.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a66d4caa0ff4bda7aea1ef21396da877',
        'Memorial Medical Group Cardiology',
        '317 Salem Place',
        38.596199,
        -90.002275,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(618) 628-8294',
        NULL,
        'United States',
        'E Saint Louis',
        'IL',
        '62208.0',
        'uploaded',
        'uploaded_a66d4caa0ff4bda7aea1ef21396da877',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Memorial Medical Group Cardiology", "Address": "317 Salem Place", "Address Two": "Ste 180", "clinic Hours of Operation": "Mon - Thu:  8:00am - 4:30pm     \nFri:  8:00am - 3:30pm", "Phone Number": "(618) 628-8294", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "E Saint Louis", "Zip Code": 62208.0, "Latitude": 38.596199, "Longitude": -90.002275, "State": "IL", "zipcode UTC": -6.0, "name": "Memorial Medical Group Cardiology", "address": "317 Salem Place", "lat": 38.596199, "lng": -90.002275, "phone": "(618) 628-8294", "country": "United States", "city": "E Saint Louis", "state": "IL", "postal_code": 62208.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b75aa60034546539e48bbb497ab37d2a',
        'nan',
        'nan',
        38.596199,
        -90.002275,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'East Saint Louis',
        'IL',
        '62208.0',
        'uploaded',
        'uploaded_b75aa60034546539e48bbb497ab37d2a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "East Saint Louis", "Zip Code": 62208.0, "Latitude": 38.596199, "Longitude": -90.002275, "State": "IL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 38.596199, "lng": -90.002275, "phone": null, "country": null, "city": "East Saint Louis", "state": "IL", "postal_code": 62208.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f146121fc80065e8402b2747c96df663',
        'Kitsap Cardiology',
        '2709 Hemlock Street',
        47.58675,
        -122.623715,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(360) 373-2547',
        NULL,
        'United States',
        'Bremerton',
        'WA',
        '98310.0',
        'uploaded',
        'uploaded_f146121fc80065e8402b2747c96df663',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Kitsap Cardiology", "Address": "2709 Hemlock Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00pm", "Phone Number": "(360) 373-2547", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Bremerton", "Zip Code": 98310.0, "Latitude": 47.58675, "Longitude": -122.623715, "State": "WA", "zipcode UTC": -8.0, "name": "Kitsap Cardiology", "address": "2709 Hemlock Street", "lat": 47.58675, "lng": -122.623715, "phone": "(360) 373-2547", "country": "United States", "city": "Bremerton", "state": "WA", "postal_code": 98310.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a1d081d10ced120df41eb9bea239653d',
        'nan',
        'nan',
        47.58675,
        -122.623715,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Brownsville',
        'WA',
        '98310.0',
        'uploaded',
        'uploaded_a1d081d10ced120df41eb9bea239653d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Brownsville", "Zip Code": 98310.0, "Latitude": 47.58675, "Longitude": -122.623715, "State": "WA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 47.58675, "lng": -122.623715, "phone": null, "country": null, "city": "Brownsville", "state": "WA", "postal_code": 98310.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_791467bdb7525ed88a401f98ff48ff46',
        'Utah Cardiology',
        '5405 South 500 East, Ste 204',
        41.165551,
        -111.967503,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(801) 479-0184',
        NULL,
        'United States',
        'Ogden',
        'UT',
        '84405.0',
        'uploaded',
        'uploaded_791467bdb7525ed88a401f98ff48ff46',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Utah Cardiology", "Address": "5405 South 500 East, Ste 204", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(801) 479-0184", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Ogden", "Zip Code": 84405.0, "Latitude": 41.165551, "Longitude": -111.967503, "State": "UT", "zipcode UTC": -7.0, "name": "Utah Cardiology", "address": "5405 South 500 East, Ste 204", "lat": 41.165551, "lng": -111.967503, "phone": "(801) 479-0184", "country": "United States", "city": "Ogden", "state": "UT", "postal_code": 84405.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_cb12566ec15e2362ee228808fc1da297',
        'nan',
        'nan',
        41.165551,
        -111.967503,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Riverdale',
        'UT',
        '84405.0',
        'uploaded',
        'uploaded_cb12566ec15e2362ee228808fc1da297',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Riverdale", "Zip Code": 84405.0, "Latitude": 41.165551, "Longitude": -111.967503, "State": "UT", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 41.165551, "lng": -111.967503, "phone": null, "country": null, "city": "Riverdale", "state": "UT", "postal_code": 84405.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a24803e364ebf34cb7e0c1772c5daaa3',
        'Cardiology Associates Of Northern New York',
        '19436 Howell Dr',
        43.976735,
        -75.911997,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(315) 786-2000',
        NULL,
        'United States',
        'Glen Park',
        'NY',
        '13601.0',
        'uploaded',
        'uploaded_a24803e364ebf34cb7e0c1772c5daaa3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates Of Northern New York", "Address": "19436 Howell Dr", "Address Two": "Ste. A", "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm", "Phone Number": "(315) 786-2000", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Glen Park", "Zip Code": 13601.0, "Latitude": 43.976735, "Longitude": -75.911997, "State": "NY", "zipcode UTC": -5.0, "name": "Cardiology Associates Of Northern New York", "address": "19436 Howell Dr", "lat": 43.976735, "lng": -75.911997, "phone": "(315) 786-2000", "country": "United States", "city": "Glen Park", "state": "NY", "postal_code": 13601.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_39959e72bea79d5de50f9c93db48e43b',
        'nan',
        'nan',
        43.976735,
        -75.911997,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Knowsville',
        'NY',
        '13601.0',
        'uploaded',
        'uploaded_39959e72bea79d5de50f9c93db48e43b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Knowsville", "Zip Code": 13601.0, "Latitude": 43.976735, "Longitude": -75.911997, "State": "NY", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 43.976735, "lng": -75.911997, "phone": null, "country": null, "city": "Knowsville", "state": "NY", "postal_code": 13601.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_d0c97e0bd48f5029f6c7bf6f60b101cd',
        'Round Rock Cardiology',
        '16010 Park Valley Drive, Ste. 200',
        30.518975,
        -97.714399,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(512) 244-9944',
        NULL,
        'United States',
        'Round Rock',
        'TX',
        '78681.0',
        'uploaded',
        'uploaded_d0c97e0bd48f5029f6c7bf6f60b101cd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Round Rock Cardiology", "Address": "16010 Park Valley Drive, Ste. 200", "Address Two": null, "clinic Hours of Operation": "Mon-Tues: 9AM - 4PM - Lunch: 12PM - 1PM\nWed: 9AM - 4 PM Lunch: 12 PM - 2:30 PM\nThurs: 9AM - 4PM - Lunch: 12PM - 1PM\nFri: 9AM - 12PM\nSAT-SUN: CLOSED\n", "Phone Number": "(512) 244-9944", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Round Rock", "Zip Code": 78681.0, "Latitude": 30.518975, "Longitude": -97.714399, "State": "TX", "zipcode UTC": -6.0, "name": "Round Rock Cardiology", "address": "16010 Park Valley Drive, Ste. 200", "lat": 30.518975, "lng": -97.714399, "phone": "(512) 244-9944", "country": "United States", "city": "Round Rock", "state": "TX", "postal_code": 78681.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_90ba8ebe4f9babf27044ef7280249c40',
        'Golden Empire Cardiology',
        '3838 San Dimas Street',
        35.381408,
        -119.019358,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(661) 321-3161',
        NULL,
        'United States',
        'Bakersfield',
        'CA',
        '93301.0',
        'uploaded',
        'uploaded_90ba8ebe4f9babf27044ef7280249c40',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Golden Empire Cardiology", "Address": "3838 San Dimas Street", "Address Two": null, "clinic Hours of Operation": "Mon - Fri: 8:00am - 5:00pm", "Phone Number": "(661) 321-3161", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Bakersfield", "Zip Code": 93301.0, "Latitude": 35.381408, "Longitude": -119.019358, "State": "CA", "zipcode UTC": -8.0, "name": "Golden Empire Cardiology", "address": "3838 San Dimas Street", "lat": 35.381408, "lng": -119.019358, "phone": "(661) 321-3161", "country": "United States", "city": "Bakersfield", "state": "CA", "postal_code": 93301.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8df55a59f58a01b713ac64fe502ac15c',
        'Lewin & Nadar Cardiology Associates',
        '425 North 21st Street, Ste. 102',
        40.236139,
        -76.930845,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(717) 972-2829',
        NULL,
        'United States',
        'Camp Hill',
        'PA',
        '17011.0',
        'uploaded',
        'uploaded_8df55a59f58a01b713ac64fe502ac15c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Lewin & Nadar Cardiology Associates", "Address": "425 North 21st Street, Ste. 102", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm", "Phone Number": "(717) 972-2829", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Camp Hill", "Zip Code": 17011.0, "Latitude": 40.236139, "Longitude": -76.930845, "State": "PA", "zipcode UTC": -5.0, "name": "Lewin & Nadar Cardiology Associates", "address": "425 North 21st Street, Ste. 102", "lat": 40.236139, "lng": -76.930845, "phone": "(717) 972-2829", "country": "United States", "city": "Camp Hill", "state": "PA", "postal_code": 17011.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6afc1b9ab68f641ff41e438873ac4fea',
        'nan',
        'nan',
        40.236139,
        -76.930845,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Shiremanstown',
        'PA',
        '17011.0',
        'uploaded',
        'uploaded_6afc1b9ab68f641ff41e438873ac4fea',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Shiremanstown", "Zip Code": 17011.0, "Latitude": 40.236139, "Longitude": -76.930845, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.236139, "lng": -76.930845, "phone": null, "country": null, "city": "Shiremanstown", "state": "PA", "postal_code": 17011.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0c91e2dc835923546db76547237fc8a7',
        'PHCVI Associated Cardiologists',
        '900 Century Drive',
        40.215939,
        -76.998271,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(717) 920-4400',
        NULL,
        'United States',
        'Andersontown',
        'PA',
        '17055.0',
        'uploaded',
        'uploaded_0c91e2dc835923546db76547237fc8a7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "PHCVI Associated Cardiologists", "Address": "900 Century Drive", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(717) 920-4400", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Andersontown", "Zip Code": 17055.0, "Latitude": 40.215939, "Longitude": -76.998271, "State": "PA", "zipcode UTC": -5.0, "name": "PHCVI Associated Cardiologists", "address": "900 Century Drive", "lat": 40.215939, "lng": -76.998271, "phone": "(717) 920-4400", "country": "United States", "city": "Andersontown", "state": "PA", "postal_code": 17055.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a8e5a8e14b4660c0e2e15d862bca5548',
        'nan',
        'nan',
        40.215939,
        -76.998271,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Brandtsville',
        'PA',
        '17055.0',
        'uploaded',
        'uploaded_a8e5a8e14b4660c0e2e15d862bca5548',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Brandtsville", "Zip Code": 17055.0, "Latitude": 40.215939, "Longitude": -76.998271, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.215939, "lng": -76.998271, "phone": null, "country": null, "city": "Brandtsville", "state": "PA", "postal_code": 17055.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_db9ac571ccad1ba67f84ee7e6641f232',
        'Roseville Cardiology Medical Associates',
        '1524 Eureka Road',
        38.731976,
        -121.253106,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(916) 782-2197 x257',
        NULL,
        'United States',
        'Roseville',
        'CA',
        '95661.0',
        'uploaded',
        'uploaded_db9ac571ccad1ba67f84ee7e6641f232',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Roseville Cardiology Medical Associates", "Address": "1524 Eureka Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri:  8:30am-5pm", "Phone Number": "(916) 782-2197 x257", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Roseville", "Zip Code": 95661.0, "Latitude": 38.731976, "Longitude": -121.253106, "State": "CA", "zipcode UTC": -8.0, "name": "Roseville Cardiology Medical Associates", "address": "1524 Eureka Road", "lat": 38.731976, "lng": -121.253106, "phone": "(916) 782-2197 x257", "country": "United States", "city": "Roseville", "state": "CA", "postal_code": 95661.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c837452d37ea4d78a23632d1a3997ca6',
        'Stanislaus Cardiology Group',
        '3621 Forest Glenn Dr',
        37.673513,
        -120.955666,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(209) 521-9661',
        NULL,
        'United States',
        'Modesto',
        'CA',
        '95355.0',
        'uploaded',
        'uploaded_c837452d37ea4d78a23632d1a3997ca6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Stanislaus Cardiology Group", "Address": "3621 Forest Glenn Dr", "Address Two": null, "clinic Hours of Operation": "Mon-Fri:  8am-5pm (closed 12pm-1pm)", "Phone Number": "(209) 521-9661", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Modesto", "Zip Code": 95355.0, "Latitude": 37.673513, "Longitude": -120.955666, "State": "CA", "zipcode UTC": -8.0, "name": "Stanislaus Cardiology Group", "address": "3621 Forest Glenn Dr", "lat": 37.673513, "lng": -120.955666, "phone": "(209) 521-9661", "country": "United States", "city": "Modesto", "state": "CA", "postal_code": 95355.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ad595fb4626e5a9626d4716edc3172b5',
        'Berk’s Cardiologists, L.T.D.',
        '2605 Keiser Boulevard',
        40.335023,
        -75.970993,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(610) 685-8500',
        NULL,
        'United States',
        'Berkshire Heights',
        'PA',
        '19610.0',
        'uploaded',
        'uploaded_ad595fb4626e5a9626d4716edc3172b5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Berk\u2019s Cardiologists, L.T.D.", "Address": "2605 Keiser Boulevard", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(610) 685-8500", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Berkshire Heights", "Zip Code": 19610.0, "Latitude": 40.335023, "Longitude": -75.970993, "State": "PA", "zipcode UTC": -5.0, "name": "Berk\u2019s Cardiologists, L.T.D.", "address": "2605 Keiser Boulevard", "lat": 40.335023, "lng": -75.970993, "phone": "(610) 685-8500", "country": "United States", "city": "Berkshire Heights", "state": "PA", "postal_code": 19610.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c95cd88ce0f8d114554e0db02ce0b080',
        'nan',
        'nan',
        40.335023,
        -75.970993,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Reading',
        'PA',
        '19610.0',
        'uploaded',
        'uploaded_c95cd88ce0f8d114554e0db02ce0b080',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Reading", "Zip Code": 19610.0, "Latitude": 40.335023, "Longitude": -75.970993, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.335023, "lng": -75.970993, "phone": null, "country": null, "city": "Reading", "state": "PA", "postal_code": 19610.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8d52769d38a2c770695aeeb1bcd93fd5',
        'Tri County Cardiology',
        '1600 Creekside Drive, Ste. 2300',
        38.672127,
        -121.157838,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(916) 983-2828',
        NULL,
        'United States',
        'Folsom',
        'CA',
        '95630.0',
        'uploaded',
        'uploaded_8d52769d38a2c770695aeeb1bcd93fd5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Tri County Cardiology", "Address": "1600 Creekside Drive, Ste. 2300", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(916) 983-2828", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Folsom", "Zip Code": 95630.0, "Latitude": 38.672127, "Longitude": -121.157838, "State": "CA", "zipcode UTC": -8.0, "name": "Tri County Cardiology", "address": "1600 Creekside Drive, Ste. 2300", "lat": 38.672127, "lng": -121.157838, "phone": "(916) 983-2828", "country": "United States", "city": "Folsom", "state": "CA", "postal_code": 95630.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_19eff051b7ba782242f14c51921445d2',
        'nan',
        'nan',
        38.672127,
        -121.157838,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Lake Natoma',
        'CA',
        '95630.0',
        'uploaded',
        'uploaded_19eff051b7ba782242f14c51921445d2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Lake Natoma", "Zip Code": 95630.0, "Latitude": 38.672127, "Longitude": -121.157838, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 38.672127, "lng": -121.157838, "phone": null, "country": null, "city": "Lake Natoma", "state": "CA", "postal_code": 95630.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ef7d4c9bd75b0c4a55778c31dc5fb3d5',
        'The Cardiovascular Institute of Greater Los Angeles',
        '17609 Ventura Boulevard, Ste. 106',
        34.155625,
        -118.489254,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(818) 986-7460',
        NULL,
        'United States',
        'Encino',
        'CA',
        '91436.0',
        'uploaded',
        'uploaded_ef7d4c9bd75b0c4a55778c31dc5fb3d5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "The Cardiovascular Institute of Greater Los Angeles", "Address": "17609 Ventura Boulevard, Ste. 106", "Address Two": null, "clinic Hours of Operation": "6:00am - 5:00pm", "Phone Number": "(818) 986-7460", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Encino", "Zip Code": 91436.0, "Latitude": 34.155625, "Longitude": -118.489254, "State": "CA", "zipcode UTC": -8.0, "name": "The Cardiovascular Institute of Greater Los Angeles", "address": "17609 Ventura Boulevard, Ste. 106", "lat": 34.155625, "lng": -118.489254, "phone": "(818) 986-7460", "country": "United States", "city": "Encino", "state": "CA", "postal_code": 91436.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_180d5313dbec15351a9e88c1dbda7dcf',
        'nan',
        'nan',
        34.155625,
        -118.489254,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Van Nuys',
        'CA',
        '91436.0',
        'uploaded',
        'uploaded_180d5313dbec15351a9e88c1dbda7dcf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Van Nuys", "Zip Code": 91436.0, "Latitude": 34.155625, "Longitude": -118.489254, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 34.155625, "lng": -118.489254, "phone": null, "country": null, "city": "Van Nuys", "state": "CA", "postal_code": 91436.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0735b78246c77c856b340dd4ed21c67c',
        'Cardiology Consultants Medical Group of the Valley',
        '18370 Burbank Boulevard, Ste. 707',
        34.164255,
        -118.54472,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(818) 345-5580',
        NULL,
        'United States',
        'Tarzana',
        'CA',
        '91356.0',
        'uploaded',
        'uploaded_0735b78246c77c856b340dd4ed21c67c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Consultants Medical Group of the Valley", "Address": "18370 Burbank Boulevard, Ste. 707", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(818) 345-5580", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Tarzana", "Zip Code": 91356.0, "Latitude": 34.164255, "Longitude": -118.54472, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiology Consultants Medical Group of the Valley", "address": "18370 Burbank Boulevard, Ste. 707", "lat": 34.164255, "lng": -118.54472, "phone": "(818) 345-5580", "country": "United States", "city": "Tarzana", "state": "CA", "postal_code": 91356.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0a672f29d0cbe185476ffc84aa1f3dfe',
        'Bay Area Cardiology Medical Group',
        '5565 West Las Positas Boulevard, Ste. 320',
        37.68973,
        -121.892442,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(925) 734-0336',
        NULL,
        'United States',
        'Pleasanton',
        'CA',
        '94588.0',
        'uploaded',
        'uploaded_0a672f29d0cbe185476ffc84aa1f3dfe',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Bay Area Cardiology Medical Group", "Address": "5565 West Las Positas Boulevard, Ste. 320", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(925) 734-0336", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Pleasanton", "Zip Code": 94588.0, "Latitude": 37.68973, "Longitude": -121.892442, "State": "CA", "zipcode UTC": -8.0, "name": "Bay Area Cardiology Medical Group", "address": "5565 West Las Positas Boulevard, Ste. 320", "lat": 37.68973, "lng": -121.892442, "phone": "(925) 734-0336", "country": "United States", "city": "Pleasanton", "state": "CA", "postal_code": 94588.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_2ee7fc2fab2dd7b06c3fb368dd41e7e4',
        'Bay Area Cardiology Medical Group',
        '2222 East Street, Ste. 260',
        37.986321,
        -122.039889,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(925) 685-7598',
        NULL,
        'United States',
        'Clyde',
        'CA',
        '94520.0',
        'uploaded',
        'uploaded_2ee7fc2fab2dd7b06c3fb368dd41e7e4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Bay Area Cardiology Medical Group", "Address": "2222 East Street, Ste. 260", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(925) 685-7598", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Clyde", "Zip Code": 94520.0, "Latitude": 37.986321, "Longitude": -122.039889, "State": "CA", "zipcode UTC": -8.0, "name": "Bay Area Cardiology Medical Group", "address": "2222 East Street, Ste. 260", "lat": 37.986321, "lng": -122.039889, "phone": "(925) 685-7598", "country": "United States", "city": "Clyde", "state": "CA", "postal_code": 94520.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_481f365fe84e3e179d451a22935f5386',
        'nan',
        'nan',
        37.986321,
        -122.039889,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Concord',
        'CA',
        '94520.0',
        'uploaded',
        'uploaded_481f365fe84e3e179d451a22935f5386',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Concord", "Zip Code": 94520.0, "Latitude": 37.986321, "Longitude": -122.039889, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 37.986321, "lng": -122.039889, "phone": null, "country": null, "city": "Concord", "state": "CA", "postal_code": 94520.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_9fe1c14e3d1c1735243fca2380c7de3d',
        'Cardiovascular Consultants Medical Group',
        '20126 Stanton Avenue, Ste. 100',
        37.702063,
        -122.079348,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(510) 537-3556',
        NULL,
        'United States',
        'Castro Valley',
        'CA',
        '94546.0',
        'uploaded',
        'uploaded_9fe1c14e3d1c1735243fca2380c7de3d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants Medical Group", "Address": "20126 Stanton Avenue, Ste. 100", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(510) 537-3556", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Castro Valley", "Zip Code": 94546.0, "Latitude": 37.702063, "Longitude": -122.079348, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Consultants Medical Group", "address": "20126 Stanton Avenue, Ste. 100", "lat": 37.702063, "lng": -122.079348, "phone": "(510) 537-3556", "country": "United States", "city": "Castro Valley", "state": "CA", "postal_code": 94546.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0431694f4d3dfad65b558999b0db9813',
        'nan',
        'nan',
        37.702063,
        -122.079348,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Hayward',
        'CA',
        '94546.0',
        'uploaded',
        'uploaded_0431694f4d3dfad65b558999b0db9813',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Hayward", "Zip Code": 94546.0, "Latitude": 37.702063, "Longitude": -122.079348, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 37.702063, "lng": -122.079348, "phone": null, "country": null, "city": "Hayward", "state": "CA", "postal_code": 94546.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_48a7b7f090c1997676ae8a2a3f18dad3',
        'Cardiovascular Consultants Medical Group',
        '365 Hawthorne Avenue, Ste. 201',
        37.834926,
        -122.264008,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(510) 452-1345',
        NULL,
        'United States',
        'Oakland',
        'CA',
        '94609.0',
        'uploaded',
        'uploaded_48a7b7f090c1997676ae8a2a3f18dad3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants Medical Group", "Address": "365 Hawthorne Avenue, Ste. 201", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(510) 452-1345", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Oakland", "Zip Code": 94609.0, "Latitude": 37.834926, "Longitude": -122.264008, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Consultants Medical Group", "address": "365 Hawthorne Avenue, Ste. 201", "lat": 37.834926, "lng": -122.264008, "phone": "(510) 452-1345", "country": "United States", "city": "Oakland", "state": "CA", "postal_code": 94609.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_710c1d11efd643af529262bc3e8460a4',
        'Cardiovascular Consultants Medical Group',
        '5201 Norris Canyon Road, Ste. 220',
        37.75735,
        -121.952138,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(510) 277-1900',
        NULL,
        'United States',
        'San Ramon',
        'CA',
        '94583.0',
        'uploaded',
        'uploaded_710c1d11efd643af529262bc3e8460a4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants Medical Group", "Address": "5201 Norris Canyon Road, Ste. 220", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(510) 277-1900", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Ramon", "Zip Code": 94583.0, "Latitude": 37.75735, "Longitude": -121.952138, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Consultants Medical Group", "address": "5201 Norris Canyon Road, Ste. 220", "lat": 37.75735, "lng": -121.952138, "phone": "(510) 277-1900", "country": "United States", "city": "San Ramon", "state": "CA", "postal_code": 94583.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_49823803a306aeb8a9b615df97a08308',
        'Cardiovascular Consultants Medical Group',
        '106 La Casa Via, Ste. 140',
        37.91878,
        -122.026188,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(925) 274-2860',
        NULL,
        'United States',
        'Walnut Creek',
        'CA',
        '94598.0',
        'uploaded',
        'uploaded_49823803a306aeb8a9b615df97a08308',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants Medical Group", "Address": "106 La Casa Via, Ste. 140", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(925) 274-2860", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Walnut Creek", "Zip Code": 94598.0, "Latitude": 37.91878, "Longitude": -122.026188, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Consultants Medical Group", "address": "106 La Casa Via, Ste. 140", "lat": 37.91878, "lng": -122.026188, "phone": "(925) 274-2860", "country": "United States", "city": "Walnut Creek", "state": "CA", "postal_code": 94598.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ef40b775c7ccdb88029418c15a7c1637',
        'Cardiovascular Consultants Medical Group',
        '2400 Balfour Road, Ste. 215',
        37.932123,
        -121.703813,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(925) 516-3230',
        NULL,
        'United States',
        'Brentwood',
        'CA',
        '94513.0',
        'uploaded',
        'uploaded_ef40b775c7ccdb88029418c15a7c1637',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants Medical Group", "Address": "2400 Balfour Road, Ste. 215", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(925) 516-3230", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Brentwood", "Zip Code": 94513.0, "Latitude": 37.932123, "Longitude": -121.703813, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Consultants Medical Group", "address": "2400 Balfour Road, Ste. 215", "lat": 37.932123, "lng": -121.703813, "phone": "(925) 516-3230", "country": "United States", "city": "Brentwood", "state": "CA", "postal_code": 94513.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_2573096be59174aabb3b477d57a2f7a1',
        'Cardiology Consultants',
        '1083 Boliing Springs Road',
        34.980636,
        -81.956655,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(864) 583-8647',
        NULL,
        'United States',
        'Spartanburg',
        'SC',
        '29303.0',
        'uploaded',
        'uploaded_2573096be59174aabb3b477d57a2f7a1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Consultants", "Address": "1083 Boliing Springs Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(864) 583-8647", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Spartanburg", "Zip Code": 29303.0, "Latitude": 34.980636, "Longitude": -81.956655, "State": "SC", "zipcode UTC": -5.0, "name": "Cardiology Consultants", "address": "1083 Boliing Springs Road", "lat": 34.980636, "lng": -81.956655, "phone": "(864) 583-8647", "country": "United States", "city": "Spartanburg", "state": "SC", "postal_code": 29303.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c305cbf5cbdfd2f86591a180a77193ac',
        'nan',
        'nan',
        34.980636,
        -81.956655,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Sptbg',
        'SC',
        '29303.0',
        'uploaded',
        'uploaded_c305cbf5cbdfd2f86591a180a77193ac',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Sptbg", "Zip Code": 29303.0, "Latitude": 34.980636, "Longitude": -81.956655, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.980636, "lng": -81.956655, "phone": null, "country": null, "city": "Sptbg", "state": "SC", "postal_code": 29303.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_14cde512731322068295932b77bd1cb4',
        'Huntsville Cardiovascular Clinic',
        '4601 Whitesburg Dr. SE',
        34.666041,
        -86.559292,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(256) 880-1050',
        NULL,
        'United States',
        'Huntsville',
        'AL',
        '35802.0',
        'uploaded',
        'uploaded_14cde512731322068295932b77bd1cb4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Huntsville Cardiovascular Clinic", "Address": "4601 Whitesburg Dr. SE", "Address Two": "Ste. 201", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(256) 880-1050", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Huntsville", "Zip Code": 35802.0, "Latitude": 34.666041, "Longitude": -86.559292, "State": "AL", "zipcode UTC": -6.0, "name": "Huntsville Cardiovascular Clinic", "address": "4601 Whitesburg Dr. SE", "lat": 34.666041, "lng": -86.559292, "phone": "(256) 880-1050", "country": "United States", "city": "Huntsville", "state": "AL", "postal_code": 35802.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b59d1a83dd577edc14a5c98254befda0',
        'Smith Center Cardio Wellness',
        '45 Creekview Court ',
        34.866801,
        -82.317392,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(864) 234-7474',
        NULL,
        'United States',
        'Greenville',
        'SC',
        '29615.0',
        'uploaded',
        'uploaded_b59d1a83dd577edc14a5c98254befda0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Smith Center Cardio Wellness", "Address": "45 Creekview Court ", "Address Two": null, "clinic Hours of Operation": "Mon, Tue, Thu 8:30am - 5:00pm   Wed, Fri 8:30am - 3:00pm", "Phone Number": "(864) 234-7474", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Greenville", "Zip Code": 29615.0, "Latitude": 34.866801, "Longitude": -82.317392, "State": "SC", "zipcode UTC": -5.0, "name": "Smith Center Cardio Wellness", "address": "45 Creekview Court ", "lat": 34.866801, "lng": -82.317392, "phone": "(864) 234-7474", "country": "United States", "city": "Greenville", "state": "SC", "postal_code": 29615.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f6d17b7abbba6ba92b1e9da5ecc906eb',
        'nan',
        'nan',
        34.866801,
        -82.317392,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Gville',
        'SC',
        '29615.0',
        'uploaded',
        'uploaded_f6d17b7abbba6ba92b1e9da5ecc906eb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Gville", "Zip Code": 29615.0, "Latitude": 34.866801, "Longitude": -82.317392, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.866801, "lng": -82.317392, "phone": null, "country": null, "city": "Gville", "state": "SC", "postal_code": 29615.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0b1dc324f340dd58360291172daaab3e',
        'Utah Cardiology',
        '2132 North 1700 West, Ste. 200',
        41.07221,
        -111.976255,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(801) 776-0174',
        NULL,
        'United States',
        'Layton',
        'UT',
        '84041.0',
        'uploaded',
        'uploaded_0b1dc324f340dd58360291172daaab3e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Utah Cardiology", "Address": "2132 North 1700 West, Ste. 200", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00pm", "Phone Number": "(801) 776-0174", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Layton", "Zip Code": 84041.0, "Latitude": 41.07221, "Longitude": -111.976255, "State": "UT", "zipcode UTC": -7.0, "name": "Utah Cardiology", "address": "2132 North 1700 West, Ste. 200", "lat": 41.07221, "lng": -111.976255, "phone": "(801) 776-0174", "country": "United States", "city": "Layton", "state": "UT", "postal_code": 84041.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_019b94044f4f699bc2c9a7f7b708cef7',
        'nan',
        'nan',
        41.07221,
        -111.976255,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'West Layton',
        'UT',
        '84041.0',
        'uploaded',
        'uploaded_019b94044f4f699bc2c9a7f7b708cef7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "West Layton", "Zip Code": 84041.0, "Latitude": 41.07221, "Longitude": -111.976255, "State": "UT", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 41.07221, "lng": -111.976255, "phone": null, "country": null, "city": "West Layton", "state": "UT", "postal_code": 84041.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5cedfd1b2e0cd32fe85ecdb367ddc6d2',
        'Collins Cardiology',
        '1208 Ocilla Road',
        31.522042,
        -82.841538,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(912) 384-6276',
        NULL,
        'United States',
        'Douglas',
        'GA',
        '31533.0',
        'uploaded',
        'uploaded_5cedfd1b2e0cd32fe85ecdb367ddc6d2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Collins Cardiology", "Address": "1208 Ocilla Road", "Address Two": null, "clinic Hours of Operation": "Per Website:\n\nMon - Thu: 8:30 am - 5:00 pm\nFriday: 8:30 am - 12:00 pm\nCLOSED Sat and Sun", "Phone Number": "(912) 384-6276", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Douglas", "Zip Code": 31533.0, "Latitude": 31.522042, "Longitude": -82.841538, "State": "GA", "zipcode UTC": -5.0, "name": "Collins Cardiology", "address": "1208 Ocilla Road", "lat": 31.522042, "lng": -82.841538, "phone": "(912) 384-6276", "country": "United States", "city": "Douglas", "state": "GA", "postal_code": 31533.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8cc6fe7de8d7c2ca9cbfe690c191c231',
        'Coastal Cardiology',
        '3226 Hampton Avenue',
        31.166786,
        -81.492137,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(912) 264-0760',
        NULL,
        'United States',
        'Altama',
        'GA',
        '31520.0',
        'uploaded',
        'uploaded_8cc6fe7de8d7c2ca9cbfe690c191c231',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Coastal Cardiology", "Address": "3226 Hampton Avenue", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(912) 264-0760", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Altama", "Zip Code": 31520.0, "Latitude": 31.166786, "Longitude": -81.492137, "State": "GA", "zipcode UTC": -5.0, "name": "Coastal Cardiology", "address": "3226 Hampton Avenue", "lat": 31.166786, "lng": -81.492137, "phone": "(912) 264-0760", "country": "United States", "city": "Altama", "state": "GA", "postal_code": 31520.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_fc9bc4b120c502d91576e9036c04d011',
        'nan',
        'nan',
        31.166786,
        -81.492137,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Brunswick',
        'GA',
        '31520.0',
        'uploaded',
        'uploaded_fc9bc4b120c502d91576e9036c04d011',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Brunswick", "Zip Code": 31520.0, "Latitude": 31.166786, "Longitude": -81.492137, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 31.166786, "lng": -81.492137, "phone": null, "country": null, "city": "Brunswick", "state": "GA", "postal_code": 31520.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_649a9f3864029d0c2bd2e57fc735e22b',
        'Valley Cardiovascular Associates',
        '200 Jose Figueres',
        37.34964,
        -121.854409,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(408) 770-3102',
        NULL,
        'United States',
        'San Jose',
        'CA',
        '95116.0',
        'uploaded',
        'uploaded_649a9f3864029d0c2bd2e57fc735e22b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Valley Cardiovascular Associates", "Address": "200 Jose Figueres", "Address Two": null, "clinic Hours of Operation": "Mon-Fri  8:00am - 5:00pm", "Phone Number": "(408) 770-3102", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Jose", "Zip Code": 95116.0, "Latitude": 37.34964, "Longitude": -121.854409, "State": "CA", "zipcode UTC": -8.0, "name": "Valley Cardiovascular Associates", "address": "200 Jose Figueres", "lat": 37.34964, "lng": -121.854409, "phone": "(408) 770-3102", "country": "United States", "city": "San Jose", "state": "CA", "postal_code": 95116.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_575df1f7775b7351b8274829855b00be',
        'Golden Gate Cardiology',
        '2340 Clay Street,',
        37.786129,
        -122.437367,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(415) 600-1099',
        NULL,
        'United States',
        'San Francisco',
        'CA',
        '94115.0',
        'uploaded',
        'uploaded_575df1f7775b7351b8274829855b00be',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Golden Gate Cardiology", "Address": "2340 Clay Street,", "Address Two": "Ste. 537", "clinic Hours of Operation": null, "Phone Number": "(415) 600-1099", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Francisco", "Zip Code": 94115.0, "Latitude": 37.786129, "Longitude": -122.437367, "State": "CA", "zipcode UTC": -8.0, "name": "Golden Gate Cardiology", "address": "2340 Clay Street,", "lat": 37.786129, "lng": -122.437367, "phone": "(415) 600-1099", "country": "United States", "city": "San Francisco", "state": "CA", "postal_code": 94115.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_05b626d23e8f8e6f7b81b0e0223d41ea',
        'Internal Medicine Cardiology Medical Clinic, Inc.',
        '6335 N Fresno St',
        36.825582,
        -119.763581,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(559) 436-1444',
        NULL,
        'United States',
        'Fresno',
        'CA',
        '93710.0',
        'uploaded',
        'uploaded_05b626d23e8f8e6f7b81b0e0223d41ea',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Internal Medicine Cardiology Medical Clinic, Inc.", "Address": "6335 N Fresno St", "Address Two": "Ste 101", "clinic Hours of Operation": "Mon - Fri:  9:30am - 5:00pm", "Phone Number": "(559) 436-1444", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Fresno", "Zip Code": 93710.0, "Latitude": 36.825582, "Longitude": -119.763581, "State": "CA", "zipcode UTC": -8.0, "name": "Internal Medicine Cardiology Medical Clinic, Inc.", "address": "6335 N Fresno St", "lat": 36.825582, "lng": -119.763581, "phone": "(559) 436-1444", "country": "United States", "city": "Fresno", "state": "CA", "postal_code": 93710.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c55185cc6fe8acea6254e97df76a63e3',
        'Mid Valley Cardiology',
        '7033 North Fresno Street',
        36.865587,
        -119.759176,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(559) 438-8181',
        NULL,
        'United States',
        'Fresno',
        'CA',
        '93720.0',
        'uploaded',
        'uploaded_c55185cc6fe8acea6254e97df76a63e3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Mid Valley Cardiology", "Address": "7033 North Fresno Street", "Address Two": "Ste. 301", "clinic Hours of Operation": "Mon-Fri 7:30am - 5:00pm", "Phone Number": "(559) 438-8181", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Fresno", "Zip Code": 93720.0, "Latitude": 36.865587, "Longitude": -119.759176, "State": "CA", "zipcode UTC": -8.0, "name": "Mid Valley Cardiology", "address": "7033 North Fresno Street", "lat": 36.865587, "lng": -119.759176, "phone": "(559) 438-8181", "country": "United States", "city": "Fresno", "state": "CA", "postal_code": 93720.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b63319d96fa4c42ff74b21676217519d',
        'Hatfield Cardiology',
        '46 North Street',
        41.654741,
        -70.289501,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(508) 778-4888',
        NULL,
        'United States',
        'Hyannis',
        'MA',
        '2601.0',
        'uploaded',
        'uploaded_b63319d96fa4c42ff74b21676217519d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Hatfield Cardiology", "Address": "46 North Street", "Address Two": "Ste. 6", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(508) 778-4888", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hyannis", "Zip Code": 2601.0, "Latitude": 41.654741, "Longitude": -70.289501, "State": "MA", "zipcode UTC": -5.0, "name": "Hatfield Cardiology", "address": "46 North Street", "lat": 41.654741, "lng": -70.289501, "phone": "(508) 778-4888", "country": "United States", "city": "Hyannis", "state": "MA", "postal_code": 2601.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_074be50df0383d560a53f4be2184f320',
        'Lubbock Cardiology Clinic, P.C.',
        '3819 24th Street',
        33.570135,
        -101.889018,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(806) 797-7000',
        NULL,
        'United States',
        'Lubbock',
        'TX',
        '79410.0',
        'uploaded',
        'uploaded_074be50df0383d560a53f4be2184f320',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Lubbock Cardiology Clinic, P.C.", "Address": "3819 24th Street", "Address Two": null, "clinic Hours of Operation": "Mon-Thu 8:00am - 5:00pm     Fri 8:00am  - 12:00pm", "Phone Number": "(806) 797-7000", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Lubbock", "Zip Code": 79410.0, "Latitude": 33.570135, "Longitude": -101.889018, "State": "TX", "zipcode UTC": -6.0, "name": "Lubbock Cardiology Clinic, P.C.", "address": "3819 24th Street", "lat": 33.570135, "lng": -101.889018, "phone": "(806) 797-7000", "country": "United States", "city": "Lubbock", "state": "TX", "postal_code": 79410.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f3283c0ac0b1539f2b7acc96e3ad1bed',
        'Spokane Cardiology',
        '212 East Centrral Avenue',
        47.693741,
        -117.388296,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(509) 482-2025',
        NULL,
        'United States',
        'Spokane',
        'WA',
        '99207.0',
        'uploaded',
        'uploaded_f3283c0ac0b1539f2b7acc96e3ad1bed',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Spokane Cardiology", "Address": "212 East Centrral Avenue", "Address Two": "Ste. 240", "clinic Hours of Operation": null, "Phone Number": "(509) 482-2025", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Spokane", "Zip Code": 99207.0, "Latitude": 47.693741, "Longitude": -117.388296, "State": "WA", "zipcode UTC": -8.0, "name": "Spokane Cardiology", "address": "212 East Centrral Avenue", "lat": 47.693741, "lng": -117.388296, "phone": "(509) 482-2025", "country": "United States", "city": "Spokane", "state": "WA", "postal_code": 99207.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_bf15210a3a46d0a6d64e1c874f5922d0',
        'Cardiology Associates',
        '98-1079 Moanula Road',
        21.389167,
        -157.930918,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(808) 521-8211',
        NULL,
        'United States',
        'Aiea',
        'HI',
        '96701.0',
        'uploaded',
        'uploaded_bf15210a3a46d0a6d64e1c874f5922d0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates", "Address": "98-1079 Moanula Road", "Address Two": "Ste. 200", "clinic Hours of Operation": null, "Phone Number": "(808) 521-8211", "Country": "United States", "Time Zone Display": "HAST - Hawaiian Standard Time", "City": "Aiea", "Zip Code": 96701.0, "Latitude": 21.389167, "Longitude": -157.930918, "State": "HI", "zipcode UTC": -10.0, "name": "Cardiology Associates", "address": "98-1079 Moanula Road", "lat": 21.389167, "lng": -157.930918, "phone": "(808) 521-8211", "country": "United States", "city": "Aiea", "state": "HI", "postal_code": 96701.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_eac6dc641b765844c1a72e73695ece0c',
        'Cardiology Associates of Central CT, LLC',
        '1062 Barnes Rd',
        41.457711,
        -72.817049,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(203) 265-9831',
        NULL,
        'United States',
        'Wallingford',
        'CT',
        '6492.0',
        'uploaded',
        'uploaded_eac6dc641b765844c1a72e73695ece0c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates of Central CT, LLC", "Address": "1062 Barnes Rd", "Address Two": "Ste 300", "clinic Hours of Operation": "Mon - Fri:  8:00am - 5:00pm", "Phone Number": "(203) 265-9831", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Wallingford", "Zip Code": 6492.0, "Latitude": 41.457711, "Longitude": -72.817049, "State": "CT", "zipcode UTC": -5.0, "name": "Cardiology Associates of Central CT, LLC", "address": "1062 Barnes Rd", "lat": 41.457711, "lng": -72.817049, "phone": "(203) 265-9831", "country": "United States", "city": "Wallingford", "state": "CT", "postal_code": 6492.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_db2498e45467f2913edc0b3c31092157',
        'nan',
        'nan',
        41.457711,
        -72.817049,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Yalesville',
        'CT',
        '6492.0',
        'uploaded',
        'uploaded_db2498e45467f2913edc0b3c31092157',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Yalesville", "Zip Code": 6492.0, "Latitude": 41.457711, "Longitude": -72.817049, "State": "CT", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 41.457711, "lng": -72.817049, "phone": null, "country": null, "city": "Yalesville", "state": "CT", "postal_code": 6492.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_559d87590939cdb4ffaf2bf9f767a0ea',
        'Virginia Cardiovascular Consultants',
        '1201 Sam Perry Boulevard',
        38.301829,
        -77.470778,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(540) 361-2922',
        NULL,
        'United States',
        'Enon',
        'VA',
        '22401.0',
        'uploaded',
        'uploaded_559d87590939cdb4ffaf2bf9f767a0ea',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Virginia Cardiovascular Consultants", "Address": "1201 Sam Perry Boulevard", "Address Two": "Ste. 280", "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00pm", "Phone Number": "(540) 361-2922", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Enon", "Zip Code": 22401.0, "Latitude": 38.301829, "Longitude": -77.470778, "State": "VA", "zipcode UTC": -5.0, "name": "Virginia Cardiovascular Consultants", "address": "1201 Sam Perry Boulevard", "lat": 38.301829, "lng": -77.470778, "phone": "(540) 361-2922", "country": "United States", "city": "Enon", "state": "VA", "postal_code": 22401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5d09878f3d7bb781c085475692c4b4ba',
        'nan',
        'nan',
        38.301829,
        -77.470778,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Fred',
        'VA',
        '22401.0',
        'uploaded',
        'uploaded_5d09878f3d7bb781c085475692c4b4ba',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Fred", "Zip Code": 22401.0, "Latitude": 38.301829, "Longitude": -77.470778, "State": "VA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 38.301829, "lng": -77.470778, "phone": null, "country": null, "city": "Fred", "state": "VA", "postal_code": 22401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b6f46c58aa423174e20d24f018b9772b',
        'Davidson Cardiology',
        '211 Old Lexington Road',
        35.871,
        -80.086033,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(336) 472-1191',
        NULL,
        'United States',
        'Erwin Heights',
        'NC',
        '27360.0',
        'uploaded',
        'uploaded_b6f46c58aa423174e20d24f018b9772b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Davidson Cardiology", "Address": "211 Old Lexington Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(336) 472-1191", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Erwin Heights", "Zip Code": 27360.0, "Latitude": 35.871, "Longitude": -80.086033, "State": "NC", "zipcode UTC": -5.0, "name": "Davidson Cardiology", "address": "211 Old Lexington Road", "lat": 35.871, "lng": -80.086033, "phone": "(336) 472-1191", "country": "United States", "city": "Erwin Heights", "state": "NC", "postal_code": 27360.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_9351932326ed4591e4e7168c765f43dc',
        'nan',
        'nan',
        35.871,
        -80.086033,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Thomasville',
        'NC',
        '27360.0',
        'uploaded',
        'uploaded_9351932326ed4591e4e7168c765f43dc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Thomasville", "Zip Code": 27360.0, "Latitude": 35.871, "Longitude": -80.086033, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.871, "lng": -80.086033, "phone": null, "country": null, "city": "Thomasville", "state": "NC", "postal_code": 27360.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_33fcdc74e09839669a554b89adb73c27',
        'Amiry Cardiology Consultant',
        '102A Fox Glen Court',
        42.160791,
        -88.152316,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(224) 848-4353',
        NULL,
        'United States',
        'Barrington',
        'IL',
        '60010.0',
        'uploaded',
        'uploaded_33fcdc74e09839669a554b89adb73c27',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Amiry Cardiology Consultant", "Address": "102A Fox Glen Court", "Address Two": null, "clinic Hours of Operation": "Mon, Tue, Thu, Fri 9:00am - 5:00pm", "Phone Number": "(224) 848-4353", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Barrington", "Zip Code": 60010.0, "Latitude": 42.160791, "Longitude": -88.152316, "State": "IL", "zipcode UTC": -6.0, "name": "Amiry Cardiology Consultant", "address": "102A Fox Glen Court", "lat": 42.160791, "lng": -88.152316, "phone": "(224) 848-4353", "country": "United States", "city": "Barrington", "state": "IL", "postal_code": 60010.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a9a4f9243b92f44db280eec29a88aeb2',
        'nan',
        'nan',
        42.160791,
        -88.152316,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Barrington Hills',
        'IL',
        '60010.0',
        'uploaded',
        'uploaded_a9a4f9243b92f44db280eec29a88aeb2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Barrington Hills", "Zip Code": 60010.0, "Latitude": 42.160791, "Longitude": -88.152316, "State": "IL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 42.160791, "lng": -88.152316, "phone": null, "country": null, "city": "Barrington Hills", "state": "IL", "postal_code": 60010.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8567dd9981017ed04aac3a2c39d1ff70',
        'Barrington Cardiology',
        '912 West Northwest Highway',
        42.194946,
        -88.216763,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(847) 516-2424',
        NULL,
        'United States',
        'Barrington Hills',
        'IL',
        '60021.0',
        'uploaded',
        'uploaded_8567dd9981017ed04aac3a2c39d1ff70',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Barrington Cardiology", "Address": "912 West Northwest Highway", "Address Two": "Ste. 100", "clinic Hours of Operation": "Mon-Fri 9:00am - 4:30pm", "Phone Number": "(847) 516-2424", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Barrington Hills", "Zip Code": 60021.0, "Latitude": 42.194946, "Longitude": -88.216763, "State": "IL", "zipcode UTC": -6.0, "name": "Barrington Cardiology", "address": "912 West Northwest Highway", "lat": 42.194946, "lng": -88.216763, "phone": "(847) 516-2424", "country": "United States", "city": "Barrington Hills", "state": "IL", "postal_code": 60021.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_917b8d910a0ef5cac24d24e7d5821dd7',
        'nan',
        'nan',
        42.194946,
        -88.216763,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Fox River Grove',
        'IL',
        '60021.0',
        'uploaded',
        'uploaded_917b8d910a0ef5cac24d24e7d5821dd7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Fox River Grove", "Zip Code": 60021.0, "Latitude": 42.194946, "Longitude": -88.216763, "State": "IL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 42.194946, "lng": -88.216763, "phone": null, "country": null, "city": "Fox River Grove", "state": "IL", "postal_code": 60021.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_fb31e19131cca8056eb5a8c47a17460c',
        'Cardiology Associates Medical Group',
        '1701 Solar Drive',
        34.21707,
        -119.176902,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(805) 278-4020',
        NULL,
        'United States',
        'Oxnard',
        'CA',
        '93030.0',
        'uploaded',
        'uploaded_fb31e19131cca8056eb5a8c47a17460c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates Medical Group", "Address": "1701 Solar Drive", "Address Two": "Ste. 150", "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00pm", "Phone Number": "(805) 278-4020", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Oxnard", "Zip Code": 93030.0, "Latitude": 34.21707, "Longitude": -119.176902, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiology Associates Medical Group", "address": "1701 Solar Drive", "lat": 34.21707, "lng": -119.176902, "phone": "(805) 278-4020", "country": "United States", "city": "Oxnard", "state": "CA", "postal_code": 93030.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_19c4e8b997a2581ab97b027c99ce2931',
        'Ventura Cardiology Consultants',
        '100 North Brent Street',
        34.268736,
        -119.224909,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(805) 648-2763',
        NULL,
        'United States',
        'San Buenaventura',
        'CA',
        '93003.0',
        'uploaded',
        'uploaded_19c4e8b997a2581ab97b027c99ce2931',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Ventura Cardiology Consultants", "Address": "100 North Brent Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(805) 648-2763", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Buenaventura", "Zip Code": 93003.0, "Latitude": 34.268736, "Longitude": -119.224909, "State": "CA", "zipcode UTC": -8.0, "name": "Ventura Cardiology Consultants", "address": "100 North Brent Street", "lat": 34.268736, "lng": -119.224909, "phone": "(805) 648-2763", "country": "United States", "city": "San Buenaventura", "state": "CA", "postal_code": 93003.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_02ba32a429e311fde7a5c48fbba2dd3f',
        'nan',
        'nan',
        34.268736,
        -119.224909,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Ventura',
        'CA',
        '93003.0',
        'uploaded',
        'uploaded_02ba32a429e311fde7a5c48fbba2dd3f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Ventura", "Zip Code": 93003.0, "Latitude": 34.268736, "Longitude": -119.224909, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 34.268736, "lng": -119.224909, "phone": null, "country": null, "city": "Ventura", "state": "CA", "postal_code": 93003.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_1580823bc8f1f68daabf5501491cc05e',
        'Cardiology Associates of Atlanta',
        '550 Peachtree Street',
        33.771755,
        -84.38065,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(404) 223-1349',
        NULL,
        'United States',
        'Atl',
        'GA',
        '30308.0',
        'uploaded',
        'uploaded_1580823bc8f1f68daabf5501491cc05e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates of Atlanta", "Address": "550 Peachtree Street", "Address Two": "Ste. 1810", "clinic Hours of Operation": "Mon-Thu 8:00am-5:00pm        Fri 8:00am-2:00pm", "Phone Number": "(404) 223-1349", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Atl", "Zip Code": 30308.0, "Latitude": 33.771755, "Longitude": -84.38065, "State": "GA", "zipcode UTC": -5.0, "name": "Cardiology Associates of Atlanta", "address": "550 Peachtree Street", "lat": 33.771755, "lng": -84.38065, "phone": "(404) 223-1349", "country": "United States", "city": "Atl", "state": "GA", "postal_code": 30308.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_15ae3aa9e3c4ef65dc18ebb00b77189c',
        'nan',
        'nan',
        33.771755,
        -84.38065,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Atlanta',
        'GA',
        '30308.0',
        'uploaded',
        'uploaded_15ae3aa9e3c4ef65dc18ebb00b77189c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Atlanta", "Zip Code": 30308.0, "Latitude": 33.771755, "Longitude": -84.38065, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 33.771755, "lng": -84.38065, "phone": null, "country": null, "city": "Atlanta", "state": "GA", "postal_code": 30308.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_11276afa87c516590de524f916ff8b52',
        'Gwinnett Consultants in Cardiology, P.C. ',
        '631 Professional Drive',
        33.9435,
        -83.9643,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(770) 962-4895',
        NULL,
        'United States',
        'Lawrenceville',
        'GA',
        '30046.0',
        'uploaded',
        'uploaded_11276afa87c516590de524f916ff8b52',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Gwinnett Consultants in Cardiology, P.C. ", "Address": "631 Professional Drive", "Address Two": "Ste. 360", "clinic Hours of Operation": "Mon-Fri 7:00am-4:30pm", "Phone Number": "(770) 962-4895", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lawrenceville", "Zip Code": 30046.0, "Latitude": 33.9435, "Longitude": -83.9643, "State": "GA", "zipcode UTC": -5.0, "name": "Gwinnett Consultants in Cardiology, P.C. ", "address": "631 Professional Drive", "lat": 33.9435, "lng": -83.9643, "phone": "(770) 962-4895", "country": "United States", "city": "Lawrenceville", "state": "GA", "postal_code": 30046.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b8acf415ba87f630653a1f9ebff33687',
        'Cardiovascular Associates of the Delaware Valley',
        '210 West Atlantic Avenue',
        39.87913,
        -75.065998,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(856) 546-3003',
        NULL,
        'United States',
        'Haddon Heights',
        'NJ',
        '8035.0',
        'uploaded',
        'uploaded_b8acf415ba87f630653a1f9ebff33687',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Associates of the Delaware Valley", "Address": "210 West Atlantic Avenue", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(856) 546-3003", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Haddon Heights", "Zip Code": 8035.0, "Latitude": 39.87913, "Longitude": -75.065998, "State": "NJ", "zipcode UTC": -5.0, "name": "Cardiovascular Associates of the Delaware Valley", "address": "210 West Atlantic Avenue", "lat": 39.87913, "lng": -75.065998, "phone": "(856) 546-3003", "country": "United States", "city": "Haddon Heights", "state": "NJ", "postal_code": 8035.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_92e52c5267b14510b9ef7c0d002452de',
        'nan',
        'nan',
        39.87913,
        -75.065998,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Haddon Hgts',
        'NJ',
        '8035.0',
        'uploaded',
        'uploaded_92e52c5267b14510b9ef7c0d002452de',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Haddon Hgts", "Zip Code": 8035.0, "Latitude": 39.87913, "Longitude": -75.065998, "State": "NJ", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.87913, "lng": -75.065998, "phone": null, "country": null, "city": "Haddon Hgts", "state": "NJ", "postal_code": 8035.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6a1f9ef4ec447722822ea644b4e78b83',
        'Cardiovascular Associates of the Delaware Valley',
        '239 Hiffville Cross Keys Road',
        39.74953,
        -75.106372,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(856) 582-2000',
        NULL,
        'United States',
        'Barnsboro',
        'NJ',
        '8080.0',
        'uploaded',
        'uploaded_6a1f9ef4ec447722822ea644b4e78b83',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Associates of the Delaware Valley", "Address": "239 Hiffville Cross Keys Road", "Address Two": "Ste. 210", "clinic Hours of Operation": null, "Phone Number": "(856) 582-2000", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Barnsboro", "Zip Code": 8080.0, "Latitude": 39.74953, "Longitude": -75.106372, "State": "NJ", "zipcode UTC": -5.0, "name": "Cardiovascular Associates of the Delaware Valley", "address": "239 Hiffville Cross Keys Road", "lat": 39.74953, "lng": -75.106372, "phone": "(856) 582-2000", "country": "United States", "city": "Barnsboro", "state": "NJ", "postal_code": 8080.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_fde3ab1e74120b5c0779599c4dd9a9c4',
        'Cardiovascular Associates of the Delaware Valley',
        '999 Route 73 N',
        39.88488,
        -74.904161,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(856) 795-2227',
        NULL,
        'United States',
        'Evesboro',
        'NJ',
        '8053.0',
        'uploaded',
        'uploaded_fde3ab1e74120b5c0779599c4dd9a9c4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Associates of the Delaware Valley", "Address": "999 Route 73 N", "Address Two": "Ste 205", "clinic Hours of Operation": null, "Phone Number": "(856) 795-2227", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Evesboro", "Zip Code": 8053.0, "Latitude": 39.88488, "Longitude": -74.904161, "State": "NJ", "zipcode UTC": -5.0, "name": "Cardiovascular Associates of the Delaware Valley", "address": "999 Route 73 N", "lat": 39.88488, "lng": -74.904161, "phone": "(856) 795-2227", "country": "United States", "city": "Evesboro", "state": "NJ", "postal_code": 8053.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_33c5655990f7b79f9e8c0340a44abae0',
        'nan',
        'nan',
        39.88488,
        -74.904161,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Evesham',
        'NJ',
        '8053.0',
        'uploaded',
        'uploaded_33c5655990f7b79f9e8c0340a44abae0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Evesham", "Zip Code": 8053.0, "Latitude": 39.88488, "Longitude": -74.904161, "State": "NJ", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.88488, "lng": -74.904161, "phone": null, "country": null, "city": "Evesham", "state": "NJ", "postal_code": 8053.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_32a05435cd33821b4db2a8391cf5a343',
        'Comprehensive Cardiovascular Consultants, Inc.',
        '715 Maple Valley Drive',
        37.779206,
        -90.414048,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(573) 756-5298',
        NULL,
        'United States',
        'Farmington',
        'MO',
        '63640.0',
        'uploaded',
        'uploaded_32a05435cd33821b4db2a8391cf5a343',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Comprehensive Cardiovascular Consultants, Inc.", "Address": "715 Maple Valley Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 4:30pm", "Phone Number": "(573) 756-5298", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Farmington", "Zip Code": 63640.0, "Latitude": 37.779206, "Longitude": -90.414048, "State": "MO", "zipcode UTC": -6.0, "name": "Comprehensive Cardiovascular Consultants, Inc.", "address": "715 Maple Valley Drive", "lat": 37.779206, "lng": -90.414048, "phone": "(573) 756-5298", "country": "United States", "city": "Farmington", "state": "MO", "postal_code": 63640.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b8011fe22ff5b3ef6949dcefdd72eb2c',
        'nan',
        'nan',
        37.779206,
        -90.414048,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Libertyville',
        'MO',
        '63640.0',
        'uploaded',
        'uploaded_b8011fe22ff5b3ef6949dcefdd72eb2c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Libertyville", "Zip Code": 63640.0, "Latitude": 37.779206, "Longitude": -90.414048, "State": "MO", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 37.779206, "lng": -90.414048, "phone": null, "country": null, "city": "Libertyville", "state": "MO", "postal_code": 63640.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_dac8538d6af4aa9eb285e289f7a17a64',
        'Gulfshore Cardiology',
        '1961 Floyd Street',
        27.310924,
        -82.521303,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(941) 366-2194',
        NULL,
        'United States',
        'Sarasota',
        'FL',
        '34239.0',
        'uploaded',
        'uploaded_dac8538d6af4aa9eb285e289f7a17a64',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Gulfshore Cardiology", "Address": "1961 Floyd Street", "Address Two": "Ste. A", "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00p  ", "Phone Number": "(941) 366-2194", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Sarasota", "Zip Code": 34239.0, "Latitude": 27.310924, "Longitude": -82.521303, "State": "FL", "zipcode UTC": -5.0, "name": "Gulfshore Cardiology", "address": "1961 Floyd Street", "lat": 27.310924, "lng": -82.521303, "phone": "(941) 366-2194", "country": "United States", "city": "Sarasota", "state": "FL", "postal_code": 34239.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_cedd646b66680de85aead2304ea0e9f1',
        'Hickory Cardiology Associates',
        '1771 Tate Boulevard',
        35.70701,
        -81.353402,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(828) 324-4804',
        NULL,
        'United States',
        'Hickory',
        'NC',
        '28602.0',
        'uploaded',
        'uploaded_cedd646b66680de85aead2304ea0e9f1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Hickory Cardiology Associates", "Address": "1771 Tate Boulevard", "Address Two": "Ste. 201", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(828) 324-4804", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hickory", "Zip Code": 28602.0, "Latitude": 35.70701, "Longitude": -81.353402, "State": "NC", "zipcode UTC": -5.0, "name": "Hickory Cardiology Associates", "address": "1771 Tate Boulevard", "lat": 35.70701, "lng": -81.353402, "phone": "(828) 324-4804", "country": "United States", "city": "Hickory", "state": "NC", "postal_code": 28602.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_1f5140e852afe5237ffd27de6cebef0b',
        'Lexington Cardiology Associates',
        '1 Liberty Square',
        41.666249,
        -72.769966,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(860) 229-6811',
        NULL,
        'United States',
        'New Brit',
        'CT',
        '6051.0',
        'uploaded',
        'uploaded_1f5140e852afe5237ffd27de6cebef0b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Lexington Cardiology Associates", "Address": "1 Liberty Square", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 4:30pm", "Phone Number": "(860) 229-6811", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "New Brit", "Zip Code": 6051.0, "Latitude": 41.666249, "Longitude": -72.769966, "State": "CT", "zipcode UTC": -5.0, "name": "Lexington Cardiology Associates", "address": "1 Liberty Square", "lat": 41.666249, "lng": -72.769966, "phone": "(860) 229-6811", "country": "United States", "city": "New Brit", "state": "CT", "postal_code": 6051.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_9dc7c68a6666f9ea00c1030c4635d5e9',
        'nan',
        'nan',
        41.666249,
        -72.769966,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'New Britain',
        'CT',
        '6051.0',
        'uploaded',
        'uploaded_9dc7c68a6666f9ea00c1030c4635d5e9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "New Britain", "Zip Code": 6051.0, "Latitude": 41.666249, "Longitude": -72.769966, "State": "CT", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 41.666249, "lng": -72.769966, "phone": null, "country": null, "city": "New Britain", "state": "CT", "postal_code": 6051.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f743c2ea699a3b446c87519ef78d766e',
        'Kentucky Cardiology',
        '161 N Eagle Creek Dr.',
        38.005199,
        -84.409545,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(859) 226-0031',
        NULL,
        'United States',
        'Lexington',
        'KY',
        '40509.0',
        'uploaded',
        'uploaded_f743c2ea699a3b446c87519ef78d766e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Kentucky Cardiology", "Address": "161 N Eagle Creek Dr.", "Address Two": "Ste. 400", "clinic Hours of Operation": "Mon - Fri: 7:30am - 5:00pm", "Phone Number": "(859) 226-0031", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lexington", "Zip Code": 40509.0, "Latitude": 38.005199, "Longitude": -84.409545, "State": "KY", "zipcode UTC": -5.0, "name": "Kentucky Cardiology", "address": "161 N Eagle Creek Dr.", "lat": 38.005199, "lng": -84.409545, "phone": "(859) 226-0031", "country": "United States", "city": "Lexington", "state": "KY", "postal_code": 40509.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ae38314fc4900ae3b5834884713a0193',
        'Scranton Cardiovascular Physician Services',
        '746 Jefferson Avenue',
        41.40918,
        -75.645082,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(570) 342-1776',
        NULL,
        'United States',
        'Dunmore',
        'PA',
        '18510.0',
        'uploaded',
        'uploaded_ae38314fc4900ae3b5834884713a0193',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Scranton Cardiovascular Physician Services", "Address": "746 Jefferson Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(570) 342-1776", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dunmore", "Zip Code": 18510.0, "Latitude": 41.40918, "Longitude": -75.645082, "State": "PA", "zipcode UTC": -5.0, "name": "Scranton Cardiovascular Physician Services", "address": "746 Jefferson Avenue", "lat": 41.40918, "lng": -75.645082, "phone": "(570) 342-1776", "country": "United States", "city": "Dunmore", "state": "PA", "postal_code": 18510.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a77a807b8d1bbef7cd1edcb0f90b807f',
        'nan',
        'nan',
        41.40918,
        -75.645082,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Scranton',
        'PA',
        '18510.0',
        'uploaded',
        'uploaded_a77a807b8d1bbef7cd1edcb0f90b807f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Scranton", "Zip Code": 18510.0, "Latitude": 41.40918, "Longitude": -75.645082, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 41.40918, "lng": -75.645082, "phone": null, "country": null, "city": "Scranton", "state": "PA", "postal_code": 18510.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_02377392d1bc23e2487d023b9dc39f70',
        'Blue Ridge Cardiovascular',
        '545 Sunset Lane',
        38.459521,
        -77.998754,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(540) 829-4374',
        NULL,
        'United States',
        'Catalpa',
        'VA',
        '22701.0',
        'uploaded',
        'uploaded_02377392d1bc23e2487d023b9dc39f70',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Blue Ridge Cardiovascular", "Address": "545 Sunset Lane", "Address Two": "Ste. 102", "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm", "Phone Number": "(540) 829-4374", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Catalpa", "Zip Code": 22701.0, "Latitude": 38.459521, "Longitude": -77.998754, "State": "VA", "zipcode UTC": -5.0, "name": "Blue Ridge Cardiovascular", "address": "545 Sunset Lane", "lat": 38.459521, "lng": -77.998754, "phone": "(540) 829-4374", "country": "United States", "city": "Catalpa", "state": "VA", "postal_code": 22701.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8c90a3fd73e67ba391dff9132896736e',
        'nan',
        'nan',
        38.459521,
        -77.998754,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Culpeper',
        'VA',
        '22701.0',
        'uploaded',
        'uploaded_8c90a3fd73e67ba391dff9132896736e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Culpeper", "Zip Code": 22701.0, "Latitude": 38.459521, "Longitude": -77.998754, "State": "VA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 38.459521, "lng": -77.998754, "phone": null, "country": null, "city": "Culpeper", "state": "VA", "postal_code": 22701.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0040f2b8e6cd54348f56645654f472d5',
        'Grand Rapids Cardiology',
        '1900 Southeast Wealthy Street ',
        42.945727,
        -85.618991,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(616) 717-5141',
        NULL,
        'United States',
        'Cascade',
        'MI',
        '49506.0',
        'uploaded',
        'uploaded_0040f2b8e6cd54348f56645654f472d5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Grand Rapids Cardiology", "Address": "1900 Southeast Wealthy Street ", "Address Two": "Ste. 380", "clinic Hours of Operation": "Mon-Fri 8:00am - 4:00pm", "Phone Number": "(616) 717-5141", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cascade", "Zip Code": 49506.0, "Latitude": 42.945727, "Longitude": -85.618991, "State": "MI", "zipcode UTC": -5.0, "name": "Grand Rapids Cardiology", "address": "1900 Southeast Wealthy Street ", "lat": 42.945727, "lng": -85.618991, "phone": "(616) 717-5141", "country": "United States", "city": "Cascade", "state": "MI", "postal_code": 49506.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_2b04471736863ff1ee40d6dd2b546a12',
        'nan',
        'nan',
        42.945727,
        -85.618991,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Cascade Twp',
        'MI',
        '49506.0',
        'uploaded',
        'uploaded_2b04471736863ff1ee40d6dd2b546a12',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cascade Twp", "Zip Code": 49506.0, "Latitude": 42.945727, "Longitude": -85.618991, "State": "MI", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 42.945727, "lng": -85.618991, "phone": null, "country": null, "city": "Cascade Twp", "state": "MI", "postal_code": 49506.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c70434e004a72a5450d5c596cb7f52b5',
        'Cottage Grove Cardiology, P.C. ',
        '711 Cottage Grove Road',
        41.832798,
        -72.726421,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(860) 242-8756',
        NULL,
        'United States',
        'Bloomfield',
        'CT',
        '6002.0',
        'uploaded',
        'uploaded_c70434e004a72a5450d5c596cb7f52b5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cottage Grove Cardiology, P.C. ", "Address": "711 Cottage Grove Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(860) 242-8756", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Bloomfield", "Zip Code": 6002.0, "Latitude": 41.832798, "Longitude": -72.726421, "State": "CT", "zipcode UTC": -5.0, "name": "Cottage Grove Cardiology, P.C. ", "address": "711 Cottage Grove Road", "lat": 41.832798, "lng": -72.726421, "phone": "(860) 242-8756", "country": "United States", "city": "Bloomfield", "state": "CT", "postal_code": 6002.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_62739e52f6eb94394f4994f539413acf',
        'Connecticut Cardiology Center, P.C. ',
        '201 Main Street',
        41.7966,
        -72.5292,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(860) 643-5443',
        NULL,
        'United States',
        'Manchester',
        'CT',
        '6042.0',
        'uploaded',
        'uploaded_62739e52f6eb94394f4994f539413acf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Connecticut Cardiology Center, P.C. ", "Address": "201 Main Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00pm", "Phone Number": "(860) 643-5443", "Country": "United States", "Time Zone Display": "EST - Eastern Standard Time", "City": "Manchester", "Zip Code": 6042.0, "Latitude": 41.7966, "Longitude": -72.5292, "State": "CT", "zipcode UTC": -5.0, "name": "Connecticut Cardiology Center, P.C. ", "address": "201 Main Street", "lat": 41.7966, "lng": -72.5292, "phone": "(860) 643-5443", "country": "United States", "city": "Manchester", "state": "CT", "postal_code": 6042.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0c2687e7783ab9f89a51893b3ea24531',
        'Santa Rosa Cardiology',
        '990 Sonoma Ave',
        38.457611,
        -122.693172,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(707) 527-8444 x1',
        NULL,
        'United States',
        'Santa Rosa',
        'CA',
        '95404.0',
        'uploaded',
        'uploaded_0c2687e7783ab9f89a51893b3ea24531',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Santa Rosa Cardiology", "Address": "990 Sonoma Ave", "Address Two": "Ste. 2", "clinic Hours of Operation": "Mon - Fri:  8:30am - 5:30pm\n\nPhone hours:\n9:00am - 12:00p / 2:00pm - 4:30pm", "Phone Number": "(707) 527-8444 x1", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Santa Rosa", "Zip Code": 95404.0, "Latitude": 38.457611, "Longitude": -122.693172, "State": "CA", "zipcode UTC": -8.0, "name": "Santa Rosa Cardiology", "address": "990 Sonoma Ave", "lat": 38.457611, "lng": -122.693172, "phone": "(707) 527-8444 x1", "country": "United States", "city": "Santa Rosa", "state": "CA", "postal_code": 95404.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_80733cd7b38c988722cc8f40b4d3e162',
        'Dallas Cardiology Associates',
        '4500 Hillcrest Road',
        33.130086,
        -96.78177,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(214) 295-6559',
        NULL,
        'United States',
        'Frisco',
        'TX',
        '75035.0',
        'uploaded',
        'uploaded_80733cd7b38c988722cc8f40b4d3e162',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Dallas Cardiology Associates", "Address": "4500 Hillcrest Road", "Address Two": "Ste. 185", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm ", "Phone Number": "(214) 295-6559", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Frisco", "Zip Code": 75035.0, "Latitude": 33.130086, "Longitude": -96.78177, "State": "TX", "zipcode UTC": -6.0, "name": "Dallas Cardiology Associates", "address": "4500 Hillcrest Road", "lat": 33.130086, "lng": -96.78177, "phone": "(214) 295-6559", "country": "United States", "city": "Frisco", "state": "TX", "postal_code": 75035.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_13227ed73d7586aebfb6cebeec97fd7b',
        'Contra Costa Cardiology Medical Group',
        '2485 High School Avenue',
        37.986321,
        -122.039889,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(925) 671-0610',
        NULL,
        'United States',
        'Clyde',
        'CA',
        '94520.0',
        'uploaded',
        'uploaded_13227ed73d7586aebfb6cebeec97fd7b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Contra Costa Cardiology Medical Group", "Address": "2485 High School Avenue", "Address Two": "#100", "clinic Hours of Operation": "Mon - Fri: 9:00am - 5:00pm", "Phone Number": "(925) 671-0610", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Clyde", "Zip Code": 94520.0, "Latitude": 37.986321, "Longitude": -122.039889, "State": "CA", "zipcode UTC": -8.0, "name": "Contra Costa Cardiology Medical Group", "address": "2485 High School Avenue", "lat": 37.986321, "lng": -122.039889, "phone": "(925) 671-0610", "country": "United States", "city": "Clyde", "state": "CA", "postal_code": 94520.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_15a1170c95413601662d449afd620cc1',
        'Cardiovascular Consultants Heart Center',
        '1207 East Herndon Avenue',
        36.865587,
        -119.759176,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(559) 432-4303',
        NULL,
        'United States',
        'Fresno',
        'CA',
        '93720.0',
        'uploaded',
        'uploaded_15a1170c95413601662d449afd620cc1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants Heart Center", "Address": "1207 East Herndon Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri:  9:00am - 5:00pm", "Phone Number": "(559) 432-4303", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Fresno", "Zip Code": 93720.0, "Latitude": 36.865587, "Longitude": -119.759176, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Consultants Heart Center", "address": "1207 East Herndon Avenue", "lat": 36.865587, "lng": -119.759176, "phone": "(559) 432-4303", "country": "United States", "city": "Fresno", "state": "CA", "postal_code": 93720.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b33b79a8dfde4aade9f63d92bb519e8c',
        'North Bay Cardiology, Inc.',
        '4740 Hoen Avenue',
        38.438161,
        -122.674191,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(707) 542-2783',
        NULL,
        'United States',
        'Santa Rosa',
        'CA',
        '95405.0',
        'uploaded',
        'uploaded_b33b79a8dfde4aade9f63d92bb519e8c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "North Bay Cardiology, Inc.", "Address": "4740 Hoen Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 9:00am - 5:00pm", "Phone Number": "(707) 542-2783", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Santa Rosa", "Zip Code": 95405.0, "Latitude": 38.438161, "Longitude": -122.674191, "State": "CA", "zipcode UTC": -8.0, "name": "North Bay Cardiology, Inc.", "address": "4740 Hoen Avenue", "lat": 38.438161, "lng": -122.674191, "phone": "(707) 542-2783", "country": "United States", "city": "Santa Rosa", "state": "CA", "postal_code": 95405.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_d1d92784b9d40c578d55627f0d85ba9c',
        'Central Coast Cardiology',
        '5 Lower Ragsdale Drive',
        36.586193,
        -121.886678,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(831) 649-3375',
        NULL,
        'United States',
        'Del Rey Oaks',
        'CA',
        '93940.0',
        'uploaded',
        'uploaded_d1d92784b9d40c578d55627f0d85ba9c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Central Coast Cardiology", "Address": "5 Lower Ragsdale Drive", "Address Two": "102", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm ", "Phone Number": "(831) 649-3375", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Del Rey Oaks", "Zip Code": 93940.0, "Latitude": 36.586193, "Longitude": -121.886678, "State": "CA", "zipcode UTC": -8.0, "name": "Central Coast Cardiology", "address": "5 Lower Ragsdale Drive", "lat": 36.586193, "lng": -121.886678, "phone": "(831) 649-3375", "country": "United States", "city": "Del Rey Oaks", "state": "CA", "postal_code": 93940.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_adc60141647db15499b5614bcc2b8bc5',
        'nan',
        'nan',
        36.586193,
        -121.886678,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Monterey',
        'CA',
        '93940.0',
        'uploaded',
        'uploaded_adc60141647db15499b5614bcc2b8bc5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Monterey", "Zip Code": 93940.0, "Latitude": 36.586193, "Longitude": -121.886678, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 36.586193, "lng": -121.886678, "phone": null, "country": null, "city": "Monterey", "state": "CA", "postal_code": 93940.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0934b0ed31af5172cebc22d61df90546',
        'Central Coast Cardiology',
        '230 San Jose Street',
        36.665879,
        -121.654971,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(831) 758-2100',
        NULL,
        'United States',
        'Salinas',
        'CA',
        '93901.0',
        'uploaded',
        'uploaded_0934b0ed31af5172cebc22d61df90546',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Central Coast Cardiology", "Address": "230 San Jose Street", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(831) 758-2100", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Salinas", "Zip Code": 93901.0, "Latitude": 36.665879, "Longitude": -121.654971, "State": "CA", "zipcode UTC": -8.0, "name": "Central Coast Cardiology", "address": "230 San Jose Street", "lat": 36.665879, "lng": -121.654971, "phone": "(831) 758-2100", "country": "United States", "city": "Salinas", "state": "CA", "postal_code": 93901.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6e60002230d33e9c929e79d21a1c3c4d',
        'Cardiovascular Consultants',
        '2161 Colorado Ave',
        37.523901,
        -120.851604,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(209) 634-6555',
        NULL,
        'United States',
        'Turlock',
        'CA',
        '95382.0',
        'uploaded',
        'uploaded_6e60002230d33e9c929e79d21a1c3c4d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Consultants", "Address": "2161 Colorado Ave", "Address Two": null, "clinic Hours of Operation": "Mon - Fri: 9:00am - 5:00pm", "Phone Number": "(209) 634-6555", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Turlock", "Zip Code": 95382.0, "Latitude": 37.523901, "Longitude": -120.851604, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Consultants", "address": "2161 Colorado Ave", "lat": 37.523901, "lng": -120.851604, "phone": "(209) 634-6555", "country": "United States", "city": "Turlock", "state": "CA", "postal_code": 95382.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_7d1a96b2c102ec0724d94af1da685466',
        'Central Valley Cardiovascular Medical Group',
        '3349 G St',
        37.294648,
        -120.474743,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(209) 385-2240',
        NULL,
        'United States',
        'Merced',
        'CA',
        '95340.0',
        'uploaded',
        'uploaded_7d1a96b2c102ec0724d94af1da685466',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Central Valley Cardiovascular Medical Group", "Address": "3349 G St", "Address Two": "Ste B", "clinic Hours of Operation": "Mon-Fri: 8:00am-5:00pm", "Phone Number": "(209) 385-2240", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Merced", "Zip Code": 95340.0, "Latitude": 37.294648, "Longitude": -120.474743, "State": "CA", "zipcode UTC": -8.0, "name": "Central Valley Cardiovascular Medical Group", "address": "3349 G St", "lat": 37.294648, "lng": -120.474743, "phone": "(209) 385-2240", "country": "United States", "city": "Merced", "state": "CA", "postal_code": 95340.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_3f431694284476ad1df69208b2ce2967',
        'Center for Cardiovascular Care',
        '200 Jose Figueres Avenue',
        37.34964,
        -121.854409,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(408) 923-3088',
        NULL,
        'United States',
        'San Jose',
        'CA',
        '95116.0',
        'uploaded',
        'uploaded_3f431694284476ad1df69208b2ce2967',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Center for Cardiovascular Care", "Address": "200 Jose Figueres Avenue", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(408) 923-3088", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Jose", "Zip Code": 95116.0, "Latitude": 37.34964, "Longitude": -121.854409, "State": "CA", "zipcode UTC": -8.0, "name": "Center for Cardiovascular Care", "address": "200 Jose Figueres Avenue", "lat": 37.34964, "lng": -121.854409, "phone": "(408) 923-3088", "country": "United States", "city": "San Jose", "state": "CA", "postal_code": 95116.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_481e406c7c0644ea8b1b3f8afdb15335',
        'Advanced Cardiovascular Specialists',
        '2490 Hospital Dr',
        37.380207,
        -122.087871,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(650) 962-4695',
        NULL,
        'United States',
        'Blossom Valley',
        'CA',
        '94040.0',
        'uploaded',
        'uploaded_481e406c7c0644ea8b1b3f8afdb15335',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Cardiovascular Specialists", "Address": "2490 Hospital Dr", "Address Two": "Ste 311", "clinic Hours of Operation": "Mon - Fri: 8:00am - 5:00pm", "Phone Number": "(650) 962-4695", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Blossom Valley", "Zip Code": 94040.0, "Latitude": 37.380207, "Longitude": -122.087871, "State": "CA", "zipcode UTC": -8.0, "name": "Advanced Cardiovascular Specialists", "address": "2490 Hospital Dr", "lat": 37.380207, "lng": -122.087871, "phone": "(650) 962-4695", "country": "United States", "city": "Blossom Valley", "state": "CA", "postal_code": 94040.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_bff571159c44cfa3b26243583f4c7ec2',
        'nan',
        'nan',
        37.380207,
        -122.087871,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Mountain View',
        'CA',
        '94040.0',
        'uploaded',
        'uploaded_bff571159c44cfa3b26243583f4c7ec2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Mountain View", "Zip Code": 94040.0, "Latitude": 37.380207, "Longitude": -122.087871, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 37.380207, "lng": -122.087871, "phone": null, "country": null, "city": "Mountain View", "state": "CA", "postal_code": 94040.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0a765feb9746e07d81e9546f821f7440',
        'Mountain Sky Cardiology, LLC',
        '1849 Austin Bluffs Parkway',
        38.916226,
        -104.766021,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(719) 344-5651',
        NULL,
        'United States',
        'Co Spgs',
        'CO',
        '80918.0',
        'uploaded',
        'uploaded_0a765feb9746e07d81e9546f821f7440',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Mountain Sky Cardiology, LLC", "Address": "1849 Austin Bluffs Parkway", "Address Two": "Ste. 100", "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm", "Phone Number": "(719) 344-5651", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Co Spgs", "Zip Code": 80918.0, "Latitude": 38.916226, "Longitude": -104.766021, "State": "CO", "zipcode UTC": -7.0, "name": "Mountain Sky Cardiology, LLC", "address": "1849 Austin Bluffs Parkway", "lat": 38.916226, "lng": -104.766021, "phone": "(719) 344-5651", "country": "United States", "city": "Co Spgs", "state": "CO", "postal_code": 80918.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_30a46e5649e845e8fce5b950758f28d0',
        'nan',
        'nan',
        38.916226,
        -104.766021,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Colorado Spgs',
        'CO',
        '80918.0',
        'uploaded',
        'uploaded_30a46e5649e845e8fce5b950758f28d0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Colorado Spgs", "Zip Code": 80918.0, "Latitude": 38.916226, "Longitude": -104.766021, "State": "CO", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 38.916226, "lng": -104.766021, "phone": null, "country": null, "city": "Colorado Spgs", "state": "CO", "postal_code": 80918.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4620332b0852883a9558e7b8889fb8b4',
        'Cardiovascular Institute of NW Florida',
        '801 East 6th Street',
        30.161901,
        -85.652977,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(850) 769-0329',
        NULL,
        'United States',
        'P C Beach',
        'FL',
        '32401.0',
        'uploaded',
        'uploaded_4620332b0852883a9558e7b8889fb8b4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Institute of NW Florida", "Address": "801 East 6th Street", "Address Two": "Ste. 504", "clinic Hours of Operation": "Mon - Fri: 9:00am - 5:00pm", "Phone Number": "(850) 769-0329", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "P C Beach", "Zip Code": 32401.0, "Latitude": 30.161901, "Longitude": -85.652977, "State": "FL", "zipcode UTC": -6.0, "name": "Cardiovascular Institute of NW Florida", "address": "801 East 6th Street", "lat": 30.161901, "lng": -85.652977, "phone": "(850) 769-0329", "country": "United States", "city": "P C Beach", "state": "FL", "postal_code": 32401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_2b45abb542cc9c1168d5d0d4b9f6473e',
        'nan',
        'nan',
        30.161901,
        -85.652977,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Panama City',
        'FL',
        '32401.0',
        'uploaded',
        'uploaded_2b45abb542cc9c1168d5d0d4b9f6473e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Panama City", "Zip Code": 32401.0, "Latitude": 30.161901, "Longitude": -85.652977, "State": "FL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 30.161901, "lng": -85.652977, "phone": null, "country": null, "city": "Panama City", "state": "FL", "postal_code": 32401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_d5bc2f4cc1dd19093254d14a49adb4e1',
        'Radin Cardiovascular Medical Group',
        '1501 Superior Avenue',
        33.619221,
        -117.930873,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(949) 722-7555',
        NULL,
        'United States',
        'Newport Beach',
        'CA',
        '92663.0',
        'uploaded',
        'uploaded_d5bc2f4cc1dd19093254d14a49adb4e1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Radin Cardiovascular Medical Group", "Address": "1501 Superior Avenue", "Address Two": "#312", "clinic Hours of Operation": "Mon-Fri:  9am to 5pm", "Phone Number": "(949) 722-7555", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Newport Beach", "Zip Code": 92663.0, "Latitude": 33.619221, "Longitude": -117.930873, "State": "CA", "zipcode UTC": -8.0, "name": "Radin Cardiovascular Medical Group", "address": "1501 Superior Avenue", "lat": 33.619221, "lng": -117.930873, "phone": "(949) 722-7555", "country": "United States", "city": "Newport Beach", "state": "CA", "postal_code": 92663.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_bcd110538277253c1deda566b237f020',
        'Western Slope Cardiology',
        '2643 Patterson Road',
        39.106039,
        -108.546795,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(970) 244-2482',
        NULL,
        'United States',
        'Grand Jct',
        'CO',
        '81506.0',
        'uploaded',
        'uploaded_bcd110538277253c1deda566b237f020',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Western Slope Cardiology", "Address": "2643 Patterson Road", "Address Two": "Ste. 605", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(970) 244-2482", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Grand Jct", "Zip Code": 81506.0, "Latitude": 39.106039, "Longitude": -108.546795, "State": "CO", "zipcode UTC": -7.0, "name": "Western Slope Cardiology", "address": "2643 Patterson Road", "lat": 39.106039, "lng": -108.546795, "phone": "(970) 244-2482", "country": "United States", "city": "Grand Jct", "state": "CO", "postal_code": 81506.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_9b173aa524995b3c5d8551ad64dca3ba',
        'nan',
        'nan',
        39.106039,
        -108.546795,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Grand Junction',
        'CO',
        '81506.0',
        'uploaded',
        'uploaded_9b173aa524995b3c5d8551ad64dca3ba',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Grand Junction", "Zip Code": 81506.0, "Latitude": 39.106039, "Longitude": -108.546795, "State": "CO", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 39.106039, "lng": -108.546795, "phone": null, "country": null, "city": "Grand Junction", "state": "CO", "postal_code": 81506.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_3f177af431c1a0daec73343547a5c37a',
        'Sunset Cardiovascular',
        '1300 Sunset Drive',
        33.77132,
        -89.803019,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(662) 227-9991',
        NULL,
        'United States',
        'Dubard',
        'MS',
        '38901.0',
        'uploaded',
        'uploaded_3f177af431c1a0daec73343547a5c37a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Sunset Cardiovascular", "Address": "1300 Sunset Drive", "Address Two": "Ste. W", "clinic Hours of Operation": "Mon - Fri: 8:00am - 4:00pm", "Phone Number": "(662) 227-9991", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Dubard", "Zip Code": 38901.0, "Latitude": 33.77132, "Longitude": -89.803019, "State": "MS", "zipcode UTC": -6.0, "name": "Sunset Cardiovascular", "address": "1300 Sunset Drive", "lat": 33.77132, "lng": -89.803019, "phone": "(662) 227-9991", "country": "United States", "city": "Dubard", "state": "MS", "postal_code": 38901.0, "category": "Cardiologist"}'::jsonb,
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
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Futheyville',
        'MS',
        '38901.0',
        'uploaded',
        'uploaded_ebaf6bb1dde1f76444d4e462443c0c13',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Futheyville", "Zip Code": 38901.0, "Latitude": 33.77132, "Longitude": -89.803019, "State": "MS", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 33.77132, "lng": -89.803019, "phone": null, "country": null, "city": "Futheyville", "state": "MS", "postal_code": 38901.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c0b2f985a7c69fecbb3c5cde4c28c537',
        'Metro North Cardiovascular',
        '1003 Northeast Loop 410',
        29.48618,
        -98.456809,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(210) 654-6000',
        NULL,
        'United States',
        'Alamo Heights',
        'TX',
        '78209.0',
        'uploaded',
        'uploaded_c0b2f985a7c69fecbb3c5cde4c28c537',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Metro North Cardiovascular", "Address": "1003 Northeast Loop 410", "Address Two": null, "clinic Hours of Operation": "Mon - Fri: 8:00am - 5:00pm", "Phone Number": "(210) 654-6000", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Alamo Heights", "Zip Code": 78209.0, "Latitude": 29.48618, "Longitude": -98.456809, "State": "TX", "zipcode UTC": -6.0, "name": "Metro North Cardiovascular", "address": "1003 Northeast Loop 410", "lat": 29.48618, "lng": -98.456809, "phone": "(210) 654-6000", "country": "United States", "city": "Alamo Heights", "state": "TX", "postal_code": 78209.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ff2ac10ab3d5df267a63b4d2a8a7e0d8',
        'nan',
        'nan',
        29.48618,
        -98.456809,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'San Antonio',
        'TX',
        '78209.0',
        'uploaded',
        'uploaded_ff2ac10ab3d5df267a63b4d2a8a7e0d8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "San Antonio", "Zip Code": 78209.0, "Latitude": 29.48618, "Longitude": -98.456809, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 29.48618, "lng": -98.456809, "phone": null, "country": null, "city": "San Antonio", "state": "TX", "postal_code": 78209.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c9848e50607461dcb19af4515b18d425',
        'Hillsboro Cardiology',
        '545 Southeast Oak Street',
        45.491024,
        -122.957452,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(503) 648-0731',
        NULL,
        'United States',
        'Hillsboro',
        'OR',
        '97123.0',
        'uploaded',
        'uploaded_c9848e50607461dcb19af4515b18d425',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Hillsboro Cardiology", "Address": "545 Southeast Oak Street", "Address Two": "Ste. C", "clinic Hours of Operation": null, "Phone Number": "(503) 648-0731", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Hillsboro", "Zip Code": 97123.0, "Latitude": 45.491024, "Longitude": -122.957452, "State": "OR", "zipcode UTC": -8.0, "name": "Hillsboro Cardiology", "address": "545 Southeast Oak Street", "lat": 45.491024, "lng": -122.957452, "phone": "(503) 648-0731", "country": "United States", "city": "Hillsboro", "state": "OR", "postal_code": 97123.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6820659c94d6c12dd6b393e72770783e',
        'South Charlotte Cardiology, P.C.',
        '11220 Elm Lane ',
        35.054546,
        -80.817927,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(704) 321-2741',
        NULL,
        'United States',
        'Charlotte',
        'NC',
        '28277.0',
        'uploaded',
        'uploaded_6820659c94d6c12dd6b393e72770783e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "South Charlotte Cardiology, P.C.", "Address": "11220 Elm Lane ", "Address Two": "Suite 200", "clinic Hours of Operation": "Mon - Thurs  9:00am - 4:30pm", "Phone Number": "(704) 321-2741", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Charlotte", "Zip Code": 28277.0, "Latitude": 35.054546, "Longitude": -80.817927, "State": "NC", "zipcode UTC": -5.0, "name": "South Charlotte Cardiology, P.C.", "address": "11220 Elm Lane ", "lat": 35.054546, "lng": -80.817927, "phone": "(704) 321-2741", "country": "United States", "city": "Charlotte", "state": "NC", "postal_code": 28277.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_43effaf143eb7f7fb88ef8f37516323e',
        'Cardiology Specialists of Orange County',
        '700 North Tustin Avenue',
        33.762117,
        -117.81828,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(714) 245-1444',
        NULL,
        'United States',
        'Cowan Heights',
        'CA',
        '92705.0',
        'uploaded',
        'uploaded_43effaf143eb7f7fb88ef8f37516323e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Specialists of Orange County", "Address": "700 North Tustin Avenue", "Address Two": null, "clinic Hours of Operation": "Monday to Friday\n9:00am \u2013 5:00pm", "Phone Number": "(714) 245-1444", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Cowan Heights", "Zip Code": 92705.0, "Latitude": 33.762117, "Longitude": -117.81828, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiology Specialists of Orange County", "address": "700 North Tustin Avenue", "lat": 33.762117, "lng": -117.81828, "phone": "(714) 245-1444", "country": "United States", "city": "Cowan Heights", "state": "CA", "postal_code": 92705.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b1caf15568a87126f3bc05324db47cc7',
        'nan',
        'nan',
        33.762117,
        -117.81828,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'North Tustin',
        'CA',
        '92705.0',
        'uploaded',
        'uploaded_b1caf15568a87126f3bc05324db47cc7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "North Tustin", "Zip Code": 92705.0, "Latitude": 33.762117, "Longitude": -117.81828, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 33.762117, "lng": -117.81828, "phone": null, "country": null, "city": "North Tustin", "state": "CA", "postal_code": 92705.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c785e22a7f76238f97e71309274f66a7',
        'Cary Cardiology',
        '300 Keisler Drive,',
        35.732,
        -78.7723,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(919) 233-0059',
        NULL,
        'United States',
        'Cary',
        'NC',
        '27518.0',
        'uploaded',
        'uploaded_c785e22a7f76238f97e71309274f66a7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cary Cardiology", "Address": "300 Keisler Drive,", "Address Two": "Ste. 204", "clinic Hours of Operation": null, "Phone Number": "(919) 233-0059", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cary", "Zip Code": 27518.0, "Latitude": 35.732, "Longitude": -78.7723, "State": "NC", "zipcode UTC": -5.0, "name": "Cary Cardiology", "address": "300 Keisler Drive,", "lat": 35.732, "lng": -78.7723, "phone": "(919) 233-0059", "country": "United States", "city": "Cary", "state": "NC", "postal_code": 27518.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_96cd7fac808e979f851887baa5e2c8c6',
        'Chestnut Hill Cardiology',
        '1722 Bethlehem Pike',
        40.107743,
        -75.213345,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(215) 233-9700',
        NULL,
        'United States',
        'Flourtown',
        'PA',
        '19031.0',
        'uploaded',
        'uploaded_96cd7fac808e979f851887baa5e2c8c6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Chestnut Hill Cardiology", "Address": "1722 Bethlehem Pike", "Address Two": null, "clinic Hours of Operation": "Mon - Fri:  8:30am - 4:30pm", "Phone Number": "(215) 233-9700", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Flourtown", "Zip Code": 19031.0, "Latitude": 40.107743, "Longitude": -75.213345, "State": "PA", "zipcode UTC": -5.0, "name": "Chestnut Hill Cardiology", "address": "1722 Bethlehem Pike", "lat": 40.107743, "lng": -75.213345, "phone": "(215) 233-9700", "country": "United States", "city": "Flourtown", "state": "PA", "postal_code": 19031.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_1b2d6b8c3181feb3ccefe61f688e8dc7',
        'Central Valley Cardiovascular Medical Group',
        '777 E Hawkeye Ave',
        37.48858,
        -120.851968,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(209) 668-8030',
        NULL,
        'United States',
        'Turlock',
        'CA',
        '95380.0',
        'uploaded',
        'uploaded_1b2d6b8c3181feb3ccefe61f688e8dc7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Central Valley Cardiovascular Medical Group", "Address": "777 E Hawkeye Ave", "Address Two": "Ste 3", "clinic Hours of Operation": "Mon-Fri: 8:00am - 5:00pm", "Phone Number": "(209) 668-8030", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Turlock", "Zip Code": 95380.0, "Latitude": 37.48858, "Longitude": -120.851968, "State": "CA", "zipcode UTC": -8.0, "name": "Central Valley Cardiovascular Medical Group", "address": "777 E Hawkeye Ave", "lat": 37.48858, "lng": -120.851968, "phone": "(209) 668-8030", "country": "United States", "city": "Turlock", "state": "CA", "postal_code": 95380.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0940d2967447fbe9146b6a7ff7e72584',
        'Central Valley Cardiovascular Medical Group',
        '312 W J St',
        37.048385,
        -120.869839,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(209) 826-4800',
        NULL,
        'United States',
        'Los Banos',
        'CA',
        '93635.0',
        'uploaded',
        'uploaded_0940d2967447fbe9146b6a7ff7e72584',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Central Valley Cardiovascular Medical Group", "Address": "312 W J St", "Address Two": "Ste 203", "clinic Hours of Operation": "Mon-Fri: 8:00am - 5:00pm", "Phone Number": "(209) 826-4800", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Los Banos", "Zip Code": 93635.0, "Latitude": 37.048385, "Longitude": -120.869839, "State": "CA", "zipcode UTC": -8.0, "name": "Central Valley Cardiovascular Medical Group", "address": "312 W J St", "lat": 37.048385, "lng": -120.869839, "phone": "(209) 826-4800", "country": "United States", "city": "Los Banos", "state": "CA", "postal_code": 93635.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8e3148c444b3d4310ecad984b3ffa859',
        'Central Valley Cardiovascular Medical Group',
        '1729 Tully Rd',
        37.671778,
        -121.012493,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(209) 668-8030',
        NULL,
        'United States',
        'Modesto',
        'CA',
        '95350.0',
        'uploaded',
        'uploaded_8e3148c444b3d4310ecad984b3ffa859',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Central Valley Cardiovascular Medical Group", "Address": "1729 Tully Rd", "Address Two": "Ste 3", "clinic Hours of Operation": "1st & 3rd Thursday: 2:00pm - 5:00pm\nEvery Friday: 8:00am - 11:00am", "Phone Number": "(209) 668-8030", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Modesto", "Zip Code": 95350.0, "Latitude": 37.671778, "Longitude": -121.012493, "State": "CA", "zipcode UTC": -8.0, "name": "Central Valley Cardiovascular Medical Group", "address": "1729 Tully Rd", "lat": 37.671778, "lng": -121.012493, "phone": "(209) 668-8030", "country": "United States", "city": "Modesto", "state": "CA", "postal_code": 95350.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_666520dbf7de6f7c27e5a73443912d26',
        'Central Valley Cardiovascular Medical Group',
        '1108 Ward Ave',
        37.477477,
        -121.14555,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(209) 668-8030',
        NULL,
        'United States',
        'Grayson',
        'CA',
        '95363.0',
        'uploaded',
        'uploaded_666520dbf7de6f7c27e5a73443912d26',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Central Valley Cardiovascular Medical Group", "Address": "1108 Ward Ave", "Address Two": "Ste 1", "clinic Hours of Operation": "1st and 3rd Monday of the Month: 8:00am - 12:00pm\n", "Phone Number": "(209) 668-8030", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Grayson", "Zip Code": 95363.0, "Latitude": 37.477477, "Longitude": -121.14555, "State": "CA", "zipcode UTC": -8.0, "name": "Central Valley Cardiovascular Medical Group", "address": "1108 Ward Ave", "lat": 37.477477, "lng": -121.14555, "phone": "(209) 668-8030", "country": "United States", "city": "Grayson", "state": "CA", "postal_code": 95363.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_18c88673c4f2bc9f4ebac7673a602df3',
        'nan',
        'nan',
        37.477477,
        -121.14555,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Patterson',
        'CA',
        '95363.0',
        'uploaded',
        'uploaded_18c88673c4f2bc9f4ebac7673a602df3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Patterson", "Zip Code": 95363.0, "Latitude": 37.477477, "Longitude": -121.14555, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 37.477477, "lng": -121.14555, "phone": null, "country": null, "city": "Patterson", "state": "CA", "postal_code": 95363.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a13aeb64427319c45d824494ee25fc42',
        'Toledo Cardiology Consultants, Inc.',
        '2409 Cherry Street',
        41.678248,
        -83.53257,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(419) 251-3700',
        NULL,
        'United States',
        'Toledo',
        'OH',
        '43608.0',
        'uploaded',
        'uploaded_a13aeb64427319c45d824494ee25fc42',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Toledo Cardiology Consultants, Inc.", "Address": "2409 Cherry Street", "Address Two": "Suite 100", "clinic Hours of Operation": "Mon - Fri: 8:00am - 4:30pm", "Phone Number": "(419) 251-3700", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Toledo", "Zip Code": 43608.0, "Latitude": 41.678248, "Longitude": -83.53257, "State": "OH", "zipcode UTC": -5.0, "name": "Toledo Cardiology Consultants, Inc.", "address": "2409 Cherry Street", "lat": 41.678248, "lng": -83.53257, "phone": "(419) 251-3700", "country": "United States", "city": "Toledo", "state": "OH", "postal_code": 43608.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ef87dd3e1587549116628f12c20e99b6',
        'Toledo Cardiology Consultants, Inc.',
        '1050 Isaac Street Drive',
        41.646398,
        -83.469331,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        'United States',
        'Oregon',
        'OH',
        '43616.0',
        'uploaded',
        'uploaded_ef87dd3e1587549116628f12c20e99b6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Toledo Cardiology Consultants, Inc.", "Address": "1050\u00a0Isaac Street Drive", "Address Two": "Suite 110", "clinic Hours of Operation": null, "Phone Number": null, "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Oregon", "Zip Code": 43616.0, "Latitude": 41.646398, "Longitude": -83.469331, "State": "OH", "zipcode UTC": -5.0, "name": "Toledo Cardiology Consultants, Inc.", "address": "1050\u00a0Isaac Street Drive", "lat": 41.646398, "lng": -83.469331, "phone": null, "country": "United States", "city": "Oregon", "state": "OH", "postal_code": 43616.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f47cc4b057c87d2b2d0b0a64b536e2f0',
        'Cardiovascular Specialists',
        '10650 W State Rd 84',
        26.110631,
        -80.274698,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(954) 382-1550',
        NULL,
        'United States',
        'Davie',
        'FL',
        '33324.0',
        'uploaded',
        'uploaded_f47cc4b057c87d2b2d0b0a64b536e2f0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Specialists", "Address": "10650 W State Rd 84", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(954) 382-1550", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Davie", "Zip Code": 33324.0, "Latitude": 26.110631, "Longitude": -80.274698, "State": "FL", "zipcode UTC": -5.0, "name": "Cardiovascular Specialists", "address": "10650 W State Rd 84", "lat": 26.110631, "lng": -80.274698, "phone": "(954) 382-1550", "country": "United States", "city": "Davie", "state": "FL", "postal_code": 33324.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_9ea9508f515a4fa7cb482e964e01ab98',
        'nan',
        'nan',
        26.110631,
        -80.274698,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Fort Lauderdale',
        'FL',
        '33324.0',
        'uploaded',
        'uploaded_9ea9508f515a4fa7cb482e964e01ab98',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Fort Lauderdale", "Zip Code": 33324.0, "Latitude": 26.110631, "Longitude": -80.274698, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 26.110631, "lng": -80.274698, "phone": null, "country": null, "city": "Fort Lauderdale", "state": "FL", "postal_code": 33324.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f22fa5ce01b93294ebde101e2fd544b4',
        'Revere Health / Heart of Dixie Cardiology',
        '1380 E Medical Center Dr',
        37.075039,
        -113.55568,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(435) 251-2900',
        NULL,
        'United States',
        'Bloomington',
        'UT',
        '84790.0',
        'uploaded',
        'uploaded_f22fa5ce01b93294ebde101e2fd544b4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Revere Health / Heart of Dixie Cardiology", "Address": "1380 E Medical Center Dr", "Address Two": "Ste. 4100", "clinic Hours of Operation": null, "Phone Number": "(435) 251-2900", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Bloomington", "Zip Code": 84790.0, "Latitude": 37.075039, "Longitude": -113.55568, "State": "UT", "zipcode UTC": -7.0, "name": "Revere Health / Heart of Dixie Cardiology", "address": "1380 E Medical Center Dr", "lat": 37.075039, "lng": -113.55568, "phone": "(435) 251-2900", "country": "United States", "city": "Bloomington", "state": "UT", "postal_code": 84790.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8727fba535e792293a205929af380e78',
        'nan',
        'nan',
        37.075039,
        -113.55568,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Bloomington Hills',
        'UT',
        '84790.0',
        'uploaded',
        'uploaded_8727fba535e792293a205929af380e78',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Bloomington Hills", "Zip Code": 84790.0, "Latitude": 37.075039, "Longitude": -113.55568, "State": "UT", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 37.075039, "lng": -113.55568, "phone": null, "country": null, "city": "Bloomington Hills", "state": "UT", "postal_code": 84790.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_074671f2607c93ec26bb0cd9275d72fc',
        'Advent Health Cardiology',
        '1004 Progress Dr',
        39.258624,
        -94.898592,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(913) 632-9940',
        NULL,
        'United States',
        'Lansing',
        'KS',
        '66043.0',
        'uploaded',
        'uploaded_074671f2607c93ec26bb0cd9275d72fc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advent Health Cardiology", "Address": "1004 Progress Dr", "Address Two": "Ste 130", "clinic Hours of Operation": "Mon-Fri:  8am-4:30pm", "Phone Number": "(913) 632-9940", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Lansing", "Zip Code": 66043.0, "Latitude": 39.258624, "Longitude": -94.898592, "State": "KS", "zipcode UTC": -6.0, "name": "Advent Health Cardiology", "address": "1004 Progress Dr", "lat": 39.258624, "lng": -94.898592, "phone": "(913) 632-9940", "country": "United States", "city": "Lansing", "state": "KS", "postal_code": 66043.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_959be7b09b9b39eaa723aac3fea61e9d',
        'nan',
        'nan',
        39.258624,
        -94.898592,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Leavenworth',
        'KS',
        '66043.0',
        'uploaded',
        'uploaded_959be7b09b9b39eaa723aac3fea61e9d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Leavenworth", "Zip Code": 66043.0, "Latitude": 39.258624, "Longitude": -94.898592, "State": "KS", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 39.258624, "lng": -94.898592, "phone": null, "country": null, "city": "Leavenworth", "state": "KS", "postal_code": 66043.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_1fa6b32a40c20f274e890cab7a29b8d6',
        'Cardiology Associates of North Mississippi ',
        '2459 N 5th St',
        33.581599,
        -88.432978,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(662) 327-3092',
        NULL,
        'United States',
        'Columbus',
        'MS',
        '39705.0',
        'uploaded',
        'uploaded_1fa6b32a40c20f274e890cab7a29b8d6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates of North Mississippi ", "Address": "2459 N 5th St", "Address Two": "Ste. 3", "clinic Hours of Operation": null, "Phone Number": "(662) 327-3092", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Columbus", "Zip Code": 39705.0, "Latitude": 33.581599, "Longitude": -88.432978, "State": "MS", "zipcode UTC": -6.0, "name": "Cardiology Associates of North Mississippi ", "address": "2459 N 5th St", "lat": 33.581599, "lng": -88.432978, "phone": "(662) 327-3092", "country": "United States", "city": "Columbus", "state": "MS", "postal_code": 39705.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f47b21af68b0987713b871fa6c88978c',
        'Florida Cardiovascular Specialists',
        '711 W Main St',
        28.797245,
        -81.884662,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(352) 326-1731',
        NULL,
        'United States',
        'Leesburg',
        'FL',
        '34748.0',
        'uploaded',
        'uploaded_f47b21af68b0987713b871fa6c88978c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Florida Cardiovascular Specialists", "Address": "711 W Main St", "Address Two": null, "clinic Hours of Operation": "Mon - Thu:  8:30am - 5:00pm\nFri:  8:30am - 4:00pm", "Phone Number": "(352) 326-1731", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Leesburg", "Zip Code": 34748.0, "Latitude": 28.797245, "Longitude": -81.884662, "State": "FL", "zipcode UTC": -5.0, "name": "Florida Cardiovascular Specialists", "address": "711 W Main St", "lat": 28.797245, "lng": -81.884662, "phone": "(352) 326-1731", "country": "United States", "city": "Leesburg", "state": "FL", "postal_code": 34748.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_acc824d3fef348936f78b270f27dec5d',
        'Cape Fear Cardiology Associates, PA',
        '3634 Cape Center Dr',
        35.02844,
        -78.970374,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(910) 485-6470',
        NULL,
        'United States',
        'Fayetteville',
        'NC',
        '28304.0',
        'uploaded',
        'uploaded_acc824d3fef348936f78b270f27dec5d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cape Fear Cardiology Associates, PA", "Address": "3634 Cape Center Dr", "Address Two": null, "clinic Hours of Operation": "Mon - Fri:  8:00am - 5:00pm", "Phone Number": "(910) 485-6470", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Fayetteville", "Zip Code": 28304.0, "Latitude": 35.02844, "Longitude": -78.970374, "State": "NC", "zipcode UTC": -5.0, "name": "Cape Fear Cardiology Associates, PA", "address": "3634 Cape Center Dr", "lat": 35.02844, "lng": -78.970374, "phone": "(910) 485-6470", "country": "United States", "city": "Fayetteville", "state": "NC", "postal_code": 28304.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b1231d4ce2007df1a88e4a59be1ec9ca',
        'Ferncreek Cardiology, PA',
        '3650 Cape Center Dr',
        35.02844,
        -78.970374,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(910) 483-0049 x3',
        NULL,
        'United States',
        'Fayetteville',
        'NC',
        '28304.0',
        'uploaded',
        'uploaded_b1231d4ce2007df1a88e4a59be1ec9ca',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Ferncreek Cardiology, PA", "Address": "3650 Cape Center Dr", "Address Two": null, "clinic Hours of Operation": "Mon - Fri:  8:00am - 5:00pm", "Phone Number": "(910) 483-0049 x3", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Fayetteville", "Zip Code": 28304.0, "Latitude": 35.02844, "Longitude": -78.970374, "State": "NC", "zipcode UTC": -5.0, "name": "Ferncreek Cardiology, PA", "address": "3650 Cape Center Dr", "lat": 35.02844, "lng": -78.970374, "phone": "(910) 483-0049 x3", "country": "United States", "city": "Fayetteville", "state": "NC", "postal_code": 28304.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_78d4bbfef90abe38300fd3cb3098d612',
        'Cardiology Care Consultants',
        '4301 N Mesa',
        31.775458,
        -106.494509,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(915) 542-2352',
        NULL,
        'United States',
        'El Paso',
        'TX',
        '79902.0',
        'uploaded',
        'uploaded_78d4bbfef90abe38300fd3cb3098d612',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Care Consultants", "Address": "4301 N Mesa", "Address Two": "Ste 101", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(915) 542-2352", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "El Paso", "Zip Code": 79902.0, "Latitude": 31.775458, "Longitude": -106.494509, "State": "TX", "zipcode UTC": -7.0, "name": "Cardiology Care Consultants", "address": "4301 N Mesa", "lat": 31.775458, "lng": -106.494509, "phone": "(915) 542-2352", "country": "United States", "city": "El Paso", "state": "TX", "postal_code": 79902.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_104a0f3305b619731b4b9d9352215f5b',
        'Coulis Cardiology',
        '1414 N Taylor Dr',
        43.736145,
        -87.728934,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(920) 458-9800 x103',
        NULL,
        'United States',
        'Sheboygan',
        'WI',
        '53081.0',
        'uploaded',
        'uploaded_104a0f3305b619731b4b9d9352215f5b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Coulis Cardiology", "Address": "1414 N Taylor Dr", "Address Two": "Ste 100", "clinic Hours of Operation": null, "Phone Number": "(920) 458-9800 x103", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Sheboygan", "Zip Code": 53081.0, "Latitude": 43.736145, "Longitude": -87.728934, "State": "WI", "zipcode UTC": -6.0, "name": "Coulis Cardiology", "address": "1414 N Taylor Dr", "lat": 43.736145, "lng": -87.728934, "phone": "(920) 458-9800 x103", "country": "United States", "city": "Sheboygan", "state": "WI", "postal_code": 53081.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_d45ca5db5628e306b4fa58b52a6b3a6e',
        'Cardiology Associates of North Mississippi ',
        '2892 South Lamar Blvd',
        34.345016,
        -89.507353,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(662) 234-7441',
        NULL,
        'United States',
        'Lafayette',
        'MS',
        '38655.0',
        'uploaded',
        'uploaded_d45ca5db5628e306b4fa58b52a6b3a6e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates of North Mississippi ", "Address": "2892 South Lamar Blvd", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(662) 234-7441", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Lafayette", "Zip Code": 38655.0, "Latitude": 34.345016, "Longitude": -89.507353, "State": "MS", "zipcode UTC": -6.0, "name": "Cardiology Associates of North Mississippi ", "address": "2892 South Lamar Blvd", "lat": 34.345016, "lng": -89.507353, "phone": "(662) 234-7441", "country": "United States", "city": "Lafayette", "state": "MS", "postal_code": 38655.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8ce1c2c6b1bea6b4ce0504451ba7e07a',
        'nan',
        'nan',
        34.345016,
        -89.507353,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Lafayette Springs',
        'MS',
        '38655.0',
        'uploaded',
        'uploaded_8ce1c2c6b1bea6b4ce0504451ba7e07a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Lafayette Springs", "Zip Code": 38655.0, "Latitude": 34.345016, "Longitude": -89.507353, "State": "MS", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 34.345016, "lng": -89.507353, "phone": null, "country": null, "city": "Lafayette Springs", "state": "MS", "postal_code": 38655.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6e4f22bdf9662dc3a94554580d3394e0',
        'Cardiology Associates of North Mississippi ',
        '801 Stark Rd',
        33.450215,
        -88.823831,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(662) 324-1475',
        NULL,
        'United States',
        'Adaton',
        'MS',
        '39759.0',
        'uploaded',
        'uploaded_6e4f22bdf9662dc3a94554580d3394e0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates of North Mississippi ", "Address": "801 Stark Rd", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(662) 324-1475", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Adaton", "Zip Code": 39759.0, "Latitude": 33.450215, "Longitude": -88.823831, "State": "MS", "zipcode UTC": -6.0, "name": "Cardiology Associates of North Mississippi ", "address": "801 Stark Rd", "lat": 33.450215, "lng": -88.823831, "phone": "(662) 324-1475", "country": "United States", "city": "Adaton", "state": "MS", "postal_code": 39759.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b5fe0d6371cd98b454928ac1462ce4d8',
        'nan',
        'nan',
        33.450215,
        -88.823831,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Bells School',
        'MS',
        '39759.0',
        'uploaded',
        'uploaded_b5fe0d6371cd98b454928ac1462ce4d8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Bells School", "Zip Code": 39759.0, "Latitude": 33.450215, "Longitude": -88.823831, "State": "MS", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 33.450215, "lng": -88.823831, "phone": null, "country": null, "city": "Bells School", "state": "MS", "postal_code": 39759.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6cac2b8a69bd4dbe092d228afdca88d3',
        'Cardiology Associates of North Mississippi ',
        '499 Gloster Creek Village',
        34.23615,
        -88.756655,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(662) 620-6801',
        NULL,
        'United States',
        'Ballardsville',
        'MS',
        '38801.0',
        'uploaded',
        'uploaded_6cac2b8a69bd4dbe092d228afdca88d3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Associates of North Mississippi ", "Address": "499 Gloster Creek Village", "Address Two": "Ste A-2", "clinic Hours of Operation": null, "Phone Number": "(662) 620-6801", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Ballardsville", "Zip Code": 38801.0, "Latitude": 34.23615, "Longitude": -88.756655, "State": "MS", "zipcode UTC": -6.0, "name": "Cardiology Associates of North Mississippi ", "address": "499 Gloster Creek Village", "lat": 34.23615, "lng": -88.756655, "phone": "(662) 620-6801", "country": "United States", "city": "Ballardsville", "state": "MS", "postal_code": 38801.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b20abae2503cb0393ba709ca66a2d441',
        'nan',
        'nan',
        34.23615,
        -88.756655,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Bissell',
        'MS',
        '38801.0',
        'uploaded',
        'uploaded_b20abae2503cb0393ba709ca66a2d441',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Bissell", "Zip Code": 38801.0, "Latitude": 34.23615, "Longitude": -88.756655, "State": "MS", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 34.23615, "lng": -88.756655, "phone": null, "country": null, "city": "Bissell", "state": "MS", "postal_code": 38801.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_3b45ec543cd27e0a3fad29d295b17c27',
        'CARDIOLOGY CONSULTANTS, PC',
        '701 University Blvd E',
        33.193818,
        -87.56843,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(205) 752-0694',
        NULL,
        'United States',
        'Tuscaloosa',
        'AL',
        '35401.0',
        'uploaded',
        'uploaded_3b45ec543cd27e0a3fad29d295b17c27',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "CARDIOLOGY CONSULTANTS, PC", "Address": "701 University Blvd E", "Address Two": "Ste 400", "clinic Hours of Operation": "Mon - Fri:  8:00am - 5:00pm", "Phone Number": "(205) 752-0694", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Tuscaloosa", "Zip Code": 35401.0, "Latitude": 33.193818, "Longitude": -87.56843, "State": "AL", "zipcode UTC": -6.0, "name": "CARDIOLOGY CONSULTANTS, PC", "address": "701 University Blvd E", "lat": 33.193818, "lng": -87.56843, "phone": "(205) 752-0694", "country": "United States", "city": "Tuscaloosa", "state": "AL", "postal_code": 35401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4cb81b6097a6f326274b9d540862725d',
        'nan',
        'nan',
        33.193818,
        -87.56843,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Veterans Hospital',
        'AL',
        '35401.0',
        'uploaded',
        'uploaded_4cb81b6097a6f326274b9d540862725d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Veterans Hospital", "Zip Code": 35401.0, "Latitude": 33.193818, "Longitude": -87.56843, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 33.193818, "lng": -87.56843, "phone": null, "country": null, "city": "Veterans Hospital", "state": "AL", "postal_code": 35401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b29f1314de215cff5127bde0a9a037a0',
        'Cardiology Specialists of Orange County',
        '16300 Sand Canyon Ave',
        33.659639,
        -117.739481,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(949) 753-9150',
        NULL,
        'United States',
        'Irvine',
        'CA',
        '92618.0',
        'uploaded',
        'uploaded_b29f1314de215cff5127bde0a9a037a0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Specialists of Orange County", "Address": "16300 Sand Canyon Ave", "Address Two": "Suite 801", "clinic Hours of Operation": "Monday to Friday\n9:00am \u2013 5:00pm", "Phone Number": "(949) 753-9150", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Irvine", "Zip Code": 92618.0, "Latitude": 33.659639, "Longitude": -117.739481, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiology Specialists of Orange County", "address": "16300 Sand Canyon Ave", "lat": 33.659639, "lng": -117.739481, "phone": "(949) 753-9150", "country": "United States", "city": "Irvine", "state": "CA", "postal_code": 92618.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_924f752f86cdc66b650e02c900278b8a',
        'Cardiology Specialists of Orange County',
        '361 Hospital Rd',
        33.619221,
        -117.930873,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(949) 706-2903',
        NULL,
        'United States',
        'Newport Beach',
        'CA',
        '92663.0',
        'uploaded',
        'uploaded_924f752f86cdc66b650e02c900278b8a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Specialists of Orange County", "Address": "361 Hospital Rd", "Address Two": "Suite 523", "clinic Hours of Operation": "Monday to Friday\n9:00am \u2013 5:00pm", "Phone Number": "(949) 706-2903", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Newport Beach", "Zip Code": 92663.0, "Latitude": 33.619221, "Longitude": -117.930873, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiology Specialists of Orange County", "address": "361 Hospital Rd", "lat": 33.619221, "lng": -117.930873, "phone": "(949) 706-2903", "country": "United States", "city": "Newport Beach", "state": "CA", "postal_code": 92663.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_99019e590e1c07b8f47863456e7cbb15',
        'Cascade Cardiology, LLC',
        '777 Commercial St. SE',
        44.926644,
        -122.986942,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(503) 485-4787',
        NULL,
        'United States',
        'Salem',
        'OR',
        '97301.0',
        'uploaded',
        'uploaded_99019e590e1c07b8f47863456e7cbb15',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cascade Cardiology, LLC", "Address": "777 Commercial St. SE", "Address Two": "Ste 130", "clinic Hours of Operation": "Mon-Fri:  8am to 5pm", "Phone Number": "(503) 485-4787", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Salem", "Zip Code": 97301.0, "Latitude": 44.926644, "Longitude": -122.986942, "State": "OR", "zipcode UTC": -8.0, "name": "Cascade Cardiology, LLC", "address": "777 Commercial St. SE", "lat": 44.926644, "lng": -122.986942, "phone": "(503) 485-4787", "country": "United States", "city": "Salem", "state": "OR", "postal_code": 97301.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6bd245375be6c72908ea58b948691252',
        'Foothill Cardiology Medical Group, Inc.',
        '625 S. Fair Oaks Ave',
        34.137138,
        -118.16497,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(626) 793-2885',
        NULL,
        'United States',
        'Pasadena',
        'CA',
        '91105.0',
        'uploaded',
        'uploaded_6bd245375be6c72908ea58b948691252',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Foothill Cardiology Medical Group, Inc.", "Address": "625 S. Fair Oaks Ave", "Address Two": "Ste 215", "clinic Hours of Operation": null, "Phone Number": "(626) 793-2885", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Pasadena", "Zip Code": 91105.0, "Latitude": 34.137138, "Longitude": -118.16497, "State": "CA", "zipcode UTC": -8.0, "name": "Foothill Cardiology Medical Group, Inc.", "address": "625 S. Fair Oaks Ave", "lat": 34.137138, "lng": -118.16497, "phone": "(626) 793-2885", "country": "United States", "city": "Pasadena", "state": "CA", "postal_code": 91105.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_871ef58babb667eeda980e411ad85f7a',
        'Foothill Cardiology Medical Group, Inc.',
        '289 W Huntington Dr',
        34.126957,
        -118.052167,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(626) 254-0074',
        NULL,
        'United States',
        'Arcadia',
        'CA',
        '91007.0',
        'uploaded',
        'uploaded_871ef58babb667eeda980e411ad85f7a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Foothill Cardiology Medical Group, Inc.", "Address": "289 W Huntington Dr", "Address Two": "Ste 401", "clinic Hours of Operation": null, "Phone Number": "(626) 254-0074", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Arcadia", "Zip Code": 91007.0, "Latitude": 34.126957, "Longitude": -118.052167, "State": "CA", "zipcode UTC": -8.0, "name": "Foothill Cardiology Medical Group, Inc.", "address": "289 W Huntington Dr", "lat": 34.126957, "lng": -118.052167, "phone": "(626) 254-0074", "country": "United States", "city": "Arcadia", "state": "CA", "postal_code": 91007.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_2f4b007f2b5285e6b4e2d8270e7e293a',
        'Foothill Cardiology Medical Group, Inc.',
        '235 E. Badillo St',
        34.085809,
        -117.886944,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(626) 915-4700',
        NULL,
        'United States',
        'Covina',
        'CA',
        '91723.0',
        'uploaded',
        'uploaded_2f4b007f2b5285e6b4e2d8270e7e293a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Foothill Cardiology Medical Group, Inc.", "Address": "235 E. Badillo St", "Address Two": null, "clinic Hours of Operation": "opens 9am", "Phone Number": "(626) 915-4700", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Covina", "Zip Code": 91723.0, "Latitude": 34.085809, "Longitude": -117.886944, "State": "CA", "zipcode UTC": -8.0, "name": "Foothill Cardiology Medical Group, Inc.", "address": "235 E. Badillo St", "lat": 34.085809, "lng": -117.886944, "phone": "(626) 915-4700", "country": "United States", "city": "Covina", "state": "CA", "postal_code": 91723.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0ff73354c569ac49c7d9e49fb9335f1a',
        'Foothill Cardiology Medical Group, Inc.',
        '625 S Fair Oaks Ave',
        34.137138,
        -118.16497,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(626) 793-4139',
        NULL,
        'United States',
        'Pasadena',
        'CA',
        '91105.0',
        'uploaded',
        'uploaded_0ff73354c569ac49c7d9e49fb9335f1a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Foothill Cardiology Medical Group, Inc.", "Address": "625 S Fair Oaks Ave", "Address Two": "Ste 215", "clinic Hours of Operation": null, "Phone Number": "(626) 793-4139", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Pasadena", "Zip Code": 91105.0, "Latitude": 34.137138, "Longitude": -118.16497, "State": "CA", "zipcode UTC": -8.0, "name": "Foothill Cardiology Medical Group, Inc.", "address": "625 S Fair Oaks Ave", "lat": 34.137138, "lng": -118.16497, "phone": "(626) 793-4139", "country": "United States", "city": "Pasadena", "state": "CA", "postal_code": 91105.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_cece4ddc73ef18eccad6853cc7cea1fd',
        'Northwest Regional Cardiology: Wawrzynski Paul, MD',
        '2602 Wilmington Rd',
        41.038205,
        -80.345392,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(724) 657-3204',
        NULL,
        'United States',
        'Castle',
        'PA',
        '16105.0',
        'uploaded',
        'uploaded_cece4ddc73ef18eccad6853cc7cea1fd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Northwest Regional Cardiology: Wawrzynski Paul, MD", "Address": "2602 Wilmington Rd", "Address Two": "#200", "clinic Hours of Operation": null, "Phone Number": "(724) 657-3204", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Castle", "Zip Code": 16105.0, "Latitude": 41.038205, "Longitude": -80.345392, "State": "PA", "zipcode UTC": -5.0, "name": "Northwest Regional Cardiology: Wawrzynski Paul, MD", "address": "2602 Wilmington Rd", "lat": 41.038205, "lng": -80.345392, "phone": "(724) 657-3204", "country": "United States", "city": "Castle", "state": "PA", "postal_code": 16105.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5e8de699018172b7f8fdf4090d9cb7e4',
        'nan',
        'nan',
        41.038205,
        -80.345392,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Neshannock',
        'PA',
        '16105.0',
        'uploaded',
        'uploaded_5e8de699018172b7f8fdf4090d9cb7e4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Neshannock", "Zip Code": 16105.0, "Latitude": 41.038205, "Longitude": -80.345392, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 41.038205, "lng": -80.345392, "phone": null, "country": null, "city": "Neshannock", "state": "PA", "postal_code": 16105.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_d1a8d6b2f8ea7bfb4e2a8a3e695d6f24',
        'Roseville Cardiology Medical Associates',
        '685 Twelve Bridges Road',
        38.902873,
        -121.297958,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(916) 782-2146',
        NULL,
        'United States',
        'Lincoln',
        'CA',
        '95648.0',
        'uploaded',
        'uploaded_d1a8d6b2f8ea7bfb4e2a8a3e695d6f24',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Roseville Cardiology Medical Associates", "Address": "685 Twelve Bridges Road", "Address Two": "Ste. D", "clinic Hours of Operation": null, "Phone Number": "(916) 782-2146", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Lincoln", "Zip Code": 95648.0, "Latitude": 38.902873, "Longitude": -121.297958, "State": "CA", "zipcode UTC": -8.0, "name": "Roseville Cardiology Medical Associates", "address": "685 Twelve Bridges Road", "lat": 38.902873, "lng": -121.297958, "phone": "(916) 782-2146", "country": "United States", "city": "Lincoln", "state": "CA", "postal_code": 95648.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_11e91a60a0deefc187fb5c5950c9d6f7',
        'Roseville Cardiology Medical Associates',
        '11971 Heritage Oaks Way',
        38.909605,
        -121.079711,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(916) 782-2146 x301',
        NULL,
        'United States',
        'Auburn',
        'CA',
        '95603.0',
        'uploaded',
        'uploaded_11e91a60a0deefc187fb5c5950c9d6f7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Roseville Cardiology Medical Associates", "Address": "11971 Heritage Oaks Way", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(916) 782-2146 x301", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Auburn", "Zip Code": 95603.0, "Latitude": 38.909605, "Longitude": -121.079711, "State": "CA", "zipcode UTC": -8.0, "name": "Roseville Cardiology Medical Associates", "address": "11971 Heritage Oaks Way", "lat": 38.909605, "lng": -121.079711, "phone": "(916) 782-2146 x301", "country": "United States", "city": "Auburn", "state": "CA", "postal_code": 95603.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_cb84ed4af8e6e8f74e1fa5482d5b13e2',
        'nan',
        'nan',
        38.909605,
        -121.079711,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Christian Valley',
        'CA',
        '95603.0',
        'uploaded',
        'uploaded_cb84ed4af8e6e8f74e1fa5482d5b13e2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Christian Valley", "Zip Code": 95603.0, "Latitude": 38.909605, "Longitude": -121.079711, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 38.909605, "lng": -121.079711, "phone": null, "country": null, "city": "Christian Valley", "state": "CA", "postal_code": 95603.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_63ae1fc28b1895ac1bbc2dce8650aacb',
        'Pioneer Valley Cardiology Associates',
        '2 Medical Center Drive',
        42.120193,
        -72.606103,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(413) 748-7154',
        NULL,
        'United States',
        'Brightwood',
        'MA',
        '1107.0',
        'uploaded',
        'uploaded_63ae1fc28b1895ac1bbc2dce8650aacb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pioneer Valley Cardiology Associates", "Address": "2 Medical Center Drive", "Address Two": "Suite 410", "clinic Hours of Operation": "Mon-Fri:  7:30am-4:30pm", "Phone Number": "(413) 748-7154", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Brightwood", "Zip Code": 1107.0, "Latitude": 42.120193, "Longitude": -72.606103, "State": "MA", "zipcode UTC": -5.0, "name": "Pioneer Valley Cardiology Associates", "address": "2 Medical Center Drive", "lat": 42.120193, "lng": -72.606103, "phone": "(413) 748-7154", "country": "United States", "city": "Brightwood", "state": "MA", "postal_code": 1107.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_22e256308b14a801166a289269feb0d8',
        'nan',
        'nan',
        42.120193,
        -72.606103,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Spfld',
        'MA',
        '1107.0',
        'uploaded',
        'uploaded_22e256308b14a801166a289269feb0d8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Spfld", "Zip Code": 1107.0, "Latitude": 42.120193, "Longitude": -72.606103, "State": "MA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 42.120193, "lng": -72.606103, "phone": null, "country": null, "city": "Spfld", "state": "MA", "postal_code": 1107.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c0f6f80845689881ce2471a103308300',
        'Coastal Cardiology',
        '1941 Johnson Ave',
        35.262548,
        -120.651966,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(805) 782-8844',
        NULL,
        'United States',
        'San Luis Obispo',
        'CA',
        '93401.0',
        'uploaded',
        'uploaded_c0f6f80845689881ce2471a103308300',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Coastal Cardiology", "Address": "1941 Johnson Ave", "Address Two": "Ste 101", "clinic Hours of Operation": null, "Phone Number": "(805) 782-8844", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Luis Obispo", "Zip Code": 93401.0, "Latitude": 35.262548, "Longitude": -120.651966, "State": "CA", "zipcode UTC": -8.0, "name": "Coastal Cardiology", "address": "1941 Johnson Ave", "lat": 35.262548, "lng": -120.651966, "phone": "(805) 782-8844", "country": "United States", "city": "San Luis Obispo", "state": "CA", "postal_code": 93401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_684adaa15a63c32936403225d06fba1a',
        'nan',
        'nan',
        35.262548,
        -120.651966,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Sn Luis Obisp',
        'CA',
        '93401.0',
        'uploaded',
        'uploaded_684adaa15a63c32936403225d06fba1a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Sn Luis Obisp", "Zip Code": 93401.0, "Latitude": 35.262548, "Longitude": -120.651966, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 35.262548, "lng": -120.651966, "phone": null, "country": null, "city": "Sn Luis Obisp", "state": "CA", "postal_code": 93401.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b1b0e5a2337bfd5931f9e4e40d5faf25',
        'Pacific Cardiology Associates',
        '27206 Calaroga Ave',
        37.635582,
        -122.104187,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(510) 887-2202',
        NULL,
        'United States',
        'Hayward',
        'CA',
        '94545.0',
        'uploaded',
        'uploaded_b1b0e5a2337bfd5931f9e4e40d5faf25',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiology Associates", "Address": "27206 Calaroga Ave", "Address Two": "#101", "clinic Hours of Operation": "Thursdays only", "Phone Number": "(510) 887-2202", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Hayward", "Zip Code": 94545.0, "Latitude": 37.635582, "Longitude": -122.104187, "State": "CA", "zipcode UTC": -8.0, "name": "Pacific Cardiology Associates", "address": "27206 Calaroga Ave", "lat": 37.635582, "lng": -122.104187, "phone": "(510) 887-2202", "country": "United States", "city": "Hayward", "state": "CA", "postal_code": 94545.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c167fc051aedd569d361db1eb3591cfb',
        'Pacific Cardiology Associates',
        '3155 Kearney Street',
        38.337243,
        -122.300275,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(510) 790-2202',
        NULL,
        'United States',
        'Napa',
        'CA',
        '94558.0',
        'uploaded',
        'uploaded_c167fc051aedd569d361db1eb3591cfb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiology Associates", "Address": "3155 Kearney Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri:  9am-5pm", "Phone Number": "(510) 790-2202", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Napa", "Zip Code": 94558.0, "Latitude": 38.337243, "Longitude": -122.300275, "State": "CA", "zipcode UTC": -8.0, "name": "Pacific Cardiology Associates", "address": "3155 Kearney Street", "lat": 38.337243, "lng": -122.300275, "phone": "(510) 790-2202", "country": "United States", "city": "Napa", "state": "CA", "postal_code": 94558.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_df80c38cde3684b3fbd1bf06d7e689d7',
        'nan',
        'nan',
        38.337243,
        -122.300275,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Spanish Flat',
        'CA',
        '94558.0',
        'uploaded',
        'uploaded_df80c38cde3684b3fbd1bf06d7e689d7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Spanish Flat", "Zip Code": 94558.0, "Latitude": 38.337243, "Longitude": -122.300275, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 38.337243, "lng": -122.300275, "phone": null, "country": null, "city": "Spanish Flat", "state": "CA", "postal_code": 94558.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_169a2c5a0d4ef71619f3529b1b494dec',
        'Cardiovascular Institute of San Diego (CVISD)',
        '765 Medical Center Court',
        32.608799,
        -117.060701,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(619) 616-2100',
        NULL,
        'United States',
        'Chula Vista',
        'CA',
        '91911.0',
        'uploaded',
        'uploaded_169a2c5a0d4ef71619f3529b1b494dec',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Institute of San Diego (CVISD)", "Address": "765 Medical Center Court", "Address Two": "#211", "clinic Hours of Operation": "Monday to Friday:\u00a08:00 AM to 5:00 PM\nSaturday and Evening:\u00a0By Appointment Only\n\n", "Phone Number": "(619) 616-2100", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Chula Vista", "Zip Code": 91911.0, "Latitude": 32.608799, "Longitude": -117.060701, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Institute of San Diego (CVISD)", "address": "765 Medical Center Court", "lat": 32.608799, "lng": -117.060701, "phone": "(619) 616-2100", "country": "United States", "city": "Chula Vista", "state": "CA", "postal_code": 91911.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_b87c91f3e07408c33783031764467685',
        'Cardiovascular Institute of San Diego (CVISD)',
        '292 Euclid Ave',
        32.706954,
        -117.0542,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(619) 616-2100',
        NULL,
        'United States',
        'San Diego',
        'CA',
        '92114.0',
        'uploaded',
        'uploaded_b87c91f3e07408c33783031764467685',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Institute of San Diego (CVISD)", "Address": "292 Euclid Ave", "Address Two": "#210", "clinic Hours of Operation": "Monday to Friday:\u00a08:00 AM to 5:00 PM\nSaturday and Evening:\u00a0By Appointment Only\n", "Phone Number": "(619) 616-2100", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Diego", "Zip Code": 92114.0, "Latitude": 32.706954, "Longitude": -117.0542, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Institute of San Diego (CVISD)", "address": "292 Euclid Ave", "lat": 32.706954, "lng": -117.0542, "phone": "(619) 616-2100", "country": "United States", "city": "San Diego", "state": "CA", "postal_code": 92114.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_1866c52f3c38418371f56ad3ee298eb9',
        'Cardiovascular Institute of San Diego (CVISD)',
        '955 Boardwalk',
        33.122029,
        -117.156058,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(760) 798-8855',
        NULL,
        'United States',
        'San Marcos',
        'CA',
        '92078.0',
        'uploaded',
        'uploaded_1866c52f3c38418371f56ad3ee298eb9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Institute of San Diego (CVISD)", "Address": "955 Boardwalk", "Address Two": "Suite 100", "clinic Hours of Operation": "Monday to Friday:\u00a08:00 AM to 5:00 PM\nSaturday and Evening:\u00a0By Appointment Only", "Phone Number": "(760) 798-8855", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Marcos", "Zip Code": 92078.0, "Latitude": 33.122029, "Longitude": -117.156058, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Institute of San Diego (CVISD)", "address": "955 Boardwalk", "lat": 33.122029, "lng": -117.156058, "phone": "(760) 798-8855", "country": "United States", "city": "San Marcos", "state": "CA", "postal_code": 92078.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_83300efbc6216205d574dfad710629eb',
        'Cardiovascular Institute of San Diego (CVISD)',
        '1625 E Main Street',
        32.8201,
        -116.912344,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(619) 486-6512',
        NULL,
        'United States',
        'Bostonia',
        'CA',
        '92021.0',
        'uploaded',
        'uploaded_83300efbc6216205d574dfad710629eb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Institute of San Diego (CVISD)", "Address": "1625 E Main Street", "Address Two": "Suite #201", "clinic Hours of Operation": "Monday to Friday:\u00a08:00 AM to 5:00 PM\nSaturday and Evening:\u00a0By Appointment Only\n", "Phone Number": "(619) 486-6512", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Bostonia", "Zip Code": 92021.0, "Latitude": 32.8201, "Longitude": -116.912344, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Institute of San Diego (CVISD)", "address": "1625 E Main Street", "lat": 32.8201, "lng": -116.912344, "phone": "(619) 486-6512", "country": "United States", "city": "Bostonia", "state": "CA", "postal_code": 92021.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4a0515d637030f5f8a9847a7a551c02b',
        'nan',
        'nan',
        32.8201,
        -116.912344,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Crest',
        'CA',
        '92021.0',
        'uploaded',
        'uploaded_4a0515d637030f5f8a9847a7a551c02b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Crest", "Zip Code": 92021.0, "Latitude": 32.8201, "Longitude": -116.912344, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 32.8201, "lng": -116.912344, "phone": null, "country": null, "city": "Crest", "state": "CA", "postal_code": 92021.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_115aff6ab5d13c335b9a4983ff326a91',
        'CleanHeart Cardiology',
        '1800 Western Ave',
        34.12051,
        -117.317601,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(909) 713-2323',
        NULL,
        'United States',
        'San Bernardino',
        'CA',
        '92411.0',
        'uploaded',
        'uploaded_115aff6ab5d13c335b9a4983ff326a91',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "CleanHeart Cardiology", "Address": "1800 Western Ave", "Address Two": "#302", "clinic Hours of Operation": "Mon-Thurs:  9am-5pm\nFri:  9am-1pm\nSat-Sun:  CLOSED", "Phone Number": "(909) 713-2323", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Bernardino", "Zip Code": 92411.0, "Latitude": 34.12051, "Longitude": -117.317601, "State": "CA", "zipcode UTC": -8.0, "name": "CleanHeart Cardiology", "address": "1800 Western Ave", "lat": 34.12051, "lng": -117.317601, "phone": "(909) 713-2323", "country": "United States", "city": "San Bernardino", "state": "CA", "postal_code": 92411.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_543f827432a1aca4a42d548a45cb3816',
        'nan',
        'nan',
        34.12051,
        -117.317601,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Sn Bernrdno',
        'CA',
        '92411.0',
        'uploaded',
        'uploaded_543f827432a1aca4a42d548a45cb3816',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Sn Bernrdno", "Zip Code": 92411.0, "Latitude": 34.12051, "Longitude": -117.317601, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 34.12051, "lng": -117.317601, "phone": null, "country": null, "city": "Sn Bernrdno", "state": "CA", "postal_code": 92411.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_94ac5bf0fc1fcd42238bec861aa2bd9c',
        'Cardiocare',
        '900 17th St NW',
        38.897567,
        -77.041958,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(301) 656-5050',
        NULL,
        'United States',
        'Washington',
        'DC',
        '20006.0',
        'uploaded',
        'uploaded_94ac5bf0fc1fcd42238bec861aa2bd9c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiocare", "Address": "900 17th St NW", "Address Two": "#1250", "clinic Hours of Operation": "Mon-Fri:  8am-4:30pm", "Phone Number": "(301) 656-5050", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Washington", "Zip Code": 20006.0, "Latitude": 38.897567, "Longitude": -77.041958, "State": "DC", "zipcode UTC": -5.0, "name": "Cardiocare", "address": "900 17th St NW", "lat": 38.897567, "lng": -77.041958, "phone": "(301) 656-5050", "country": "United States", "city": "Washington", "state": "DC", "postal_code": 20006.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5c48ee6549768072279adb7ac7f33a2e',
        'Cardiology Now',
        '401 W Hampden Ave',
        39.646847,
        -104.990769,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(303) 789-1400',
        NULL,
        'United States',
        'Cherry Hills',
        'CO',
        '80110.0',
        'uploaded',
        'uploaded_5c48ee6549768072279adb7ac7f33a2e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Now", "Address": "401 W Hampden Ave", "Address Two": "Suite 260", "clinic Hours of Operation": "Mon-Fri:  8am-5pm\nSat-Sun:  CLOSED", "Phone Number": "(303) 789-1400", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Cherry Hills", "Zip Code": 80110.0, "Latitude": 39.646847, "Longitude": -104.990769, "State": "CO", "zipcode UTC": -7.0, "name": "Cardiology Now", "address": "401 W Hampden Ave", "lat": 39.646847, "lng": -104.990769, "phone": "(303) 789-1400", "country": "United States", "city": "Cherry Hills", "state": "CO", "postal_code": 80110.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_aff55cd88d602c5562551fb6cb3d0bfd',
        'nan',
        'nan',
        39.646847,
        -104.990769,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Cherry Hills Village',
        'CO',
        '80110.0',
        'uploaded',
        'uploaded_aff55cd88d602c5562551fb6cb3d0bfd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Cherry Hills Village", "Zip Code": 80110.0, "Latitude": 39.646847, "Longitude": -104.990769, "State": "CO", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 39.646847, "lng": -104.990769, "phone": null, "country": null, "city": "Cherry Hills Village", "state": "CO", "postal_code": 80110.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5eec98efe2e6a4dad2af430592a722cf',
        'Tulsa Cardiovascular Center of Excellence | Matthew J. Comstock, D.O.',
        '11912 S Norwood Ave',
        36.025405,
        -95.929535,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(918) 943-5303',
        NULL,
        'United States',
        'Tulsa',
        'OK',
        '74137.0',
        'uploaded',
        'uploaded_5eec98efe2e6a4dad2af430592a722cf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Tulsa Cardiovascular Center of Excellence | Matthew J. Comstock, D.O.", "Address": "11912 S Norwood Ave", "Address Two": "Ste. 110", "clinic Hours of Operation": "Monday - Friday: 8:00 AM - 5:00 PM", "Phone Number": "(918) 943-5303", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Tulsa", "Zip Code": 74137.0, "Latitude": 36.025405, "Longitude": -95.929535, "State": "OK", "zipcode UTC": -6.0, "name": "Tulsa Cardiovascular Center of Excellence | Matthew J. Comstock, D.O.", "address": "11912 S Norwood Ave", "lat": 36.025405, "lng": -95.929535, "phone": "(918) 943-5303", "country": "United States", "city": "Tulsa", "state": "OK", "postal_code": 74137.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_de7c6de2871721d6554955ee8f780243',
        'Baton Rouge Cardiology',
        '1731 Lutcher Ave',
        30.04401,
        -90.699569,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(225) 769-0933 x2',
        NULL,
        'United States',
        'Lutcher',
        'LA',
        '70071.0',
        'uploaded',
        'uploaded_de7c6de2871721d6554955ee8f780243',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Baton Rouge Cardiology", "Address": "1731 Lutcher Ave", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(225) 769-0933 x2", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Lutcher", "Zip Code": 70071.0, "Latitude": 30.04401, "Longitude": -90.699569, "State": "LA", "zipcode UTC": -6.0, "name": "Baton Rouge Cardiology", "address": "1731 Lutcher Ave", "lat": 30.04401, "lng": -90.699569, "phone": "(225) 769-0933 x2", "country": "United States", "city": "Lutcher", "state": "LA", "postal_code": 70071.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_5a89f6319b72e3c7205ae700cd0f805a',
        'Upstate Cardiology',
        '3970 Grandview Dr',
        34.709869,
        -82.283853,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(864) 688-1550',
        NULL,
        'United States',
        'Simpsonville',
        'SC',
        '29680.0',
        'uploaded',
        'uploaded_5a89f6319b72e3c7205ae700cd0f805a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Upstate Cardiology", "Address": "3970 Grandview Dr", "Address Two": "Suite 2300", "clinic Hours of Operation": "Monday-Friday: 8AM - 5PM", "Phone Number": "(864) 688-1550", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Simpsonville", "Zip Code": 29680.0, "Latitude": 34.709869, "Longitude": -82.283853, "State": "SC", "zipcode UTC": -5.0, "name": "Upstate Cardiology", "address": "3970 Grandview Dr", "lat": 34.709869, "lng": -82.283853, "phone": "(864) 688-1550", "country": "United States", "city": "Simpsonville", "state": "SC", "postal_code": 29680.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_fc787afdbe816ac234b5b87b15ca3057',
        'Pacific Cardiovascular Associates Medical Group, Inc.',
        '24022 Calle De La Plata',
        33.602823,
        -117.712959,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(877) 430-7337',
        NULL,
        'United States',
        'Aliso Viejo',
        'CA',
        '92653.0',
        'uploaded',
        'uploaded_fc787afdbe816ac234b5b87b15ca3057',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiovascular Associates Medical Group, Inc.", "Address": "24022 Calle De La Plata", "Address Two": "Suite 500", "clinic Hours of Operation": "Mon-Fri:  8am-5pm", "Phone Number": "(877) 430-7337", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Aliso Viejo", "Zip Code": 92653.0, "Latitude": 33.602823, "Longitude": -117.712959, "State": "CA", "zipcode UTC": -8.0, "name": "Pacific Cardiovascular Associates Medical Group, Inc.", "address": "24022 Calle De La Plata", "lat": 33.602823, "lng": -117.712959, "phone": "(877) 430-7337", "country": "United States", "city": "Aliso Viejo", "state": "CA", "postal_code": 92653.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_095e18b27e7338c3d6b3542f1b7ef6dc',
        'nan',
        'nan',
        33.602823,
        -117.712959,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Laguna Beach',
        'CA',
        '92653.0',
        'uploaded',
        'uploaded_095e18b27e7338c3d6b3542f1b7ef6dc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Laguna Beach", "Zip Code": 92653.0, "Latitude": 33.602823, "Longitude": -117.712959, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 33.602823, "lng": -117.712959, "phone": null, "country": null, "city": "Laguna Beach", "state": "CA", "postal_code": 92653.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_d4a5ebe96db8503e841993a9492f8398',
        'Pacific Cardiovascular Associates Medical Group, Inc.',
        '1325 N Rose Drive',
        33.883314,
        -117.854467,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(877) 430-7337 x8271',
        NULL,
        'United States',
        'Placentia',
        'CA',
        '92870.0',
        'uploaded',
        'uploaded_d4a5ebe96db8503e841993a9492f8398',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiovascular Associates Medical Group, Inc.", "Address": "1325 N Rose Drive", "Address Two": "Suite 206", "clinic Hours of Operation": "Mon-Fri:  8am-5pm", "Phone Number": "(877) 430-7337 x8271", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Placentia", "Zip Code": 92870.0, "Latitude": 33.883314, "Longitude": -117.854467, "State": "CA", "zipcode UTC": -8.0, "name": "Pacific Cardiovascular Associates Medical Group, Inc.", "address": "1325 N Rose Drive", "lat": 33.883314, "lng": -117.854467, "phone": "(877) 430-7337 x8271", "country": "United States", "city": "Placentia", "state": "CA", "postal_code": 92870.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_43beb9c08dfecf0c725e96a8417648e4',
        'Pacific Cardiovascular Associates Medical Group, Inc.',
        '681 S Parker St',
        33.787266,
        -117.874949,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(877) 430-7337 x8271',
        NULL,
        'United States',
        'Orange',
        'CA',
        '92868.0',
        'uploaded',
        'uploaded_43beb9c08dfecf0c725e96a8417648e4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiovascular Associates Medical Group, Inc.", "Address": "681 S Parker St", "Address Two": "Suite 100", "clinic Hours of Operation": "Mon-Fri:  8am-5pm", "Phone Number": "(877) 430-7337 x8271", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Orange", "Zip Code": 92868.0, "Latitude": 33.787266, "Longitude": -117.874949, "State": "CA", "zipcode UTC": -8.0, "name": "Pacific Cardiovascular Associates Medical Group, Inc.", "address": "681 S Parker St", "lat": 33.787266, "lng": -117.874949, "phone": "(877) 430-7337 x8271", "country": "United States", "city": "Orange", "state": "CA", "postal_code": 92868.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6b645c7c65039c1df1e9de414b8427b8',
        'Pacific Cardiovascular Associates Medical Group, Inc.',
        '710 N Euclid St',
        33.844814,
        -117.953817,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(877) 430-7337 x8271',
        NULL,
        'United States',
        'Anaheim',
        'CA',
        '92801.0',
        'uploaded',
        'uploaded_6b645c7c65039c1df1e9de414b8427b8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiovascular Associates Medical Group, Inc.", "Address": "710 N Euclid St", "Address Two": "Suite 214", "clinic Hours of Operation": "Mon-Fri:  8am-5pm", "Phone Number": "(877) 430-7337 x8271", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Anaheim", "Zip Code": 92801.0, "Latitude": 33.844814, "Longitude": -117.953817, "State": "CA", "zipcode UTC": -8.0, "name": "Pacific Cardiovascular Associates Medical Group, Inc.", "address": "710 N Euclid St", "lat": 33.844814, "lng": -117.953817, "phone": "(877) 430-7337 x8271", "country": "United States", "city": "Anaheim", "state": "CA", "postal_code": 92801.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_e46e17ad19be2879e8fbb070d8ed0868',
        'Pacific Cardiovascular Associates Medical Group, Inc.',
        '3070 Bristol Street',
        33.677224,
        -117.908637,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(877) 430-7337',
        NULL,
        'United States',
        'Costa Mesa',
        'CA',
        '92626.0',
        'uploaded',
        'uploaded_e46e17ad19be2879e8fbb070d8ed0868',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiovascular Associates Medical Group, Inc.", "Address": "3070 Bristol Street", "Address Two": "Suite 190", "clinic Hours of Operation": null, "Phone Number": "(877) 430-7337", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Costa Mesa", "Zip Code": 92626.0, "Latitude": 33.677224, "Longitude": -117.908637, "State": "CA", "zipcode UTC": -8.0, "name": "Pacific Cardiovascular Associates Medical Group, Inc.", "address": "3070 Bristol Street", "lat": 33.677224, "lng": -117.908637, "phone": "(877) 430-7337", "country": "United States", "city": "Costa Mesa", "state": "CA", "postal_code": 92626.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_85cd9f54dc9f39d79110e1572a32b391',
        'Cardiovascular Medicine of Cleveland',
        '21500 Lorain Rd.',
        41.441697,
        -81.85738,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(440) 356-6666',
        NULL,
        'United States',
        'Cleveland',
        'OH',
        '44126.0',
        'uploaded',
        'uploaded_85cd9f54dc9f39d79110e1572a32b391',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Medicine of Cleveland", "Address": "21500 Lorain Rd.", "Address Two": null, "clinic Hours of Operation": "Monday - Thursday: 9:00AM - 5:00PM", "Phone Number": "(440) 356-6666", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cleveland", "Zip Code": 44126.0, "Latitude": 41.441697, "Longitude": -81.85738, "State": "OH", "zipcode UTC": -5.0, "name": "Cardiovascular Medicine of Cleveland", "address": "21500 Lorain Rd.", "lat": 41.441697, "lng": -81.85738, "phone": "(440) 356-6666", "country": "United States", "city": "Cleveland", "state": "OH", "postal_code": 44126.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_2fea920fa8435199e7a9165040476fe2',
        'nan',
        'nan',
        41.441697,
        -81.85738,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Fairview Park',
        'OH',
        '44126.0',
        'uploaded',
        'uploaded_2fea920fa8435199e7a9165040476fe2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Fairview Park", "Zip Code": 44126.0, "Latitude": 41.441697, "Longitude": -81.85738, "State": "OH", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 41.441697, "lng": -81.85738, "phone": null, "country": null, "city": "Fairview Park", "state": "OH", "postal_code": 44126.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_071d527cc78382c2472b88072e0da3f2',
        'Pacific Cardiovascular Associates Medical Group, Inc.',
        '4281 Katella Ave, Suite 109',
        33.794028,
        -118.07218,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(877) 430-7337',
        NULL,
        'United States',
        'Los Alamitos',
        'CA',
        '90720.0',
        'uploaded',
        'uploaded_071d527cc78382c2472b88072e0da3f2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiovascular Associates Medical Group, Inc.", "Address": "4281 Katella Ave, Suite 109", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(877) 430-7337", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Los Alamitos", "Zip Code": 90720.0, "Latitude": 33.794028, "Longitude": -118.07218, "State": "CA", "zipcode UTC": -8.0, "name": "Pacific Cardiovascular Associates Medical Group, Inc.", "address": "4281 Katella Ave, Suite 109", "lat": 33.794028, "lng": -118.07218, "phone": "(877) 430-7337", "country": "United States", "city": "Los Alamitos", "state": "CA", "postal_code": 90720.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c628a014e3d964b54bdcfeffe2fcd7a3',
        'nan',
        'nan',
        33.794028,
        -118.07218,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Rossmoor',
        'CA',
        '90720.0',
        'uploaded',
        'uploaded_c628a014e3d964b54bdcfeffe2fcd7a3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Rossmoor", "Zip Code": 90720.0, "Latitude": 33.794028, "Longitude": -118.07218, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 33.794028, "lng": -118.07218, "phone": null, "country": null, "city": "Rossmoor", "state": "CA", "postal_code": 90720.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f79debaa78e337b7c9b6f46616970381',
        'Northstate Cardiology ',
        '198 Cohasset Rd',
        39.745973,
        -121.842599,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(530) 342-0123',
        NULL,
        'United States',
        'Chico',
        'CA',
        '95926.0',
        'uploaded',
        'uploaded_f79debaa78e337b7c9b6f46616970381',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Northstate Cardiology ", "Address": "198 Cohasset Rd", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(530) 342-0123", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Chico", "Zip Code": 95926.0, "Latitude": 39.745973, "Longitude": -121.842599, "State": "CA", "zipcode UTC": -8.0, "name": "Northstate Cardiology ", "address": "198 Cohasset Rd", "lat": 39.745973, "lng": -121.842599, "phone": "(530) 342-0123", "country": "United States", "city": "Chico", "state": "CA", "postal_code": 95926.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_d017c8e160eec0015f939e1e39efa7cf',
        'Northstate Cardiology ',
        '2860 Olive Hwy',
        39.491076,
        -121.494688,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(530) 534-6517',
        NULL,
        'United States',
        'Oroville',
        'CA',
        '95966.0',
        'uploaded',
        'uploaded_d017c8e160eec0015f939e1e39efa7cf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Northstate Cardiology ", "Address": "2860 Olive Hwy", "Address Two": "Suite B", "clinic Hours of Operation": null, "Phone Number": "(530) 534-6517", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Oroville", "Zip Code": 95966.0, "Latitude": 39.491076, "Longitude": -121.494688, "State": "CA", "zipcode UTC": -8.0, "name": "Northstate Cardiology ", "address": "2860 Olive Hwy", "lat": 39.491076, "lng": -121.494688, "phone": "(530) 534-6517", "country": "United States", "city": "Oroville", "state": "CA", "postal_code": 95966.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_32ea1f19ec5d537a8434a9fb7688a10c',
        'Fairbanks Cardiology',
        '1626 30th Ave',
        64.83507,
        -147.72045,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(907) 374-0432',
        NULL,
        'United States',
        'Coldfoot',
        'AK',
        '99701.0',
        'uploaded',
        'uploaded_32ea1f19ec5d537a8434a9fb7688a10c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Fairbanks Cardiology", "Address": "1626 30th Ave", "Address Two": null, "clinic Hours of Operation": "8:00 AM - 4:00 PM- \nClosed for lunch from 12:00 PM-1:00 PM", "Phone Number": "(907) 374-0432", "Country": "United States", "Time Zone Display": "AKDT - Alaskan Daylight Time", "City": "Coldfoot", "Zip Code": 99701.0, "Latitude": 64.83507, "Longitude": -147.72045, "State": "AK", "zipcode UTC": -9.0, "name": "Fairbanks Cardiology", "address": "1626 30th Ave", "lat": 64.83507, "lng": -147.72045, "phone": "(907) 374-0432", "country": "United States", "city": "Coldfoot", "state": "AK", "postal_code": 99701.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_959819563da41e6e88e21c54da8e93c9',
        'nan',
        'nan',
        64.83507,
        -147.72045,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Fairbanks',
        'AK',
        '99701.0',
        'uploaded',
        'uploaded_959819563da41e6e88e21c54da8e93c9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "AKDT - Alaskan Daylight Time", "City": "Fairbanks", "Zip Code": 99701.0, "Latitude": 64.83507, "Longitude": -147.72045, "State": "AK", "zipcode UTC": -9.0, "name": null, "address": null, "lat": 64.83507, "lng": -147.72045, "phone": null, "country": null, "city": "Fairbanks", "state": "AK", "postal_code": 99701.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_3e618a341e4adefe459696ba889d7b54',
        'Cardiology Center of Amarillo',
        '6200 I-40 West',
        35.204652,
        -101.883534,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(806) 354-9764',
        NULL,
        'United States',
        'Amarillo',
        'TX',
        '79106.0',
        'uploaded',
        'uploaded_3e618a341e4adefe459696ba889d7b54',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology Center of Amarillo", "Address": "6200 I-40 West", "Address Two": null, "clinic Hours of Operation": "Monday - Thursday 7:30am\u20135pm\nFriday 7:30am\u20131pm\n\nClinic phones are answered by staff during the following hours:\n\nMonday - Thursday 8am\u20135pm\nFriday 8am\u20131pm", "Phone Number": "(806) 354-9764", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Amarillo", "Zip Code": 79106.0, "Latitude": 35.204652, "Longitude": -101.883534, "State": "TX", "zipcode UTC": -6.0, "name": "Cardiology Center of Amarillo", "address": "6200 I-40 West", "lat": 35.204652, "lng": -101.883534, "phone": "(806) 354-9764", "country": "United States", "city": "Amarillo", "state": "TX", "postal_code": 79106.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ac7265fa38d9c0f9ba82da92a7530970',
        'CardioVascular Health Clinic',
        '3200 Quall Springs PKWY #200',
        35.612359,
        -97.571522,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(405) 701-9880',
        NULL,
        'United States',
        'Oklahoma City',
        'OK',
        '73134.0',
        'uploaded',
        'uploaded_ac7265fa38d9c0f9ba82da92a7530970',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "CardioVascular Health Clinic", "Address": "3200 Quall Springs PKWY #200", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(405) 701-9880", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Oklahoma City", "Zip Code": 73134.0, "Latitude": 35.612359, "Longitude": -97.571522, "State": "OK", "zipcode UTC": -6.0, "name": "CardioVascular Health Clinic", "address": "3200 Quall Springs PKWY #200", "lat": 35.612359, "lng": -97.571522, "phone": "(405) 701-9880", "country": "United States", "city": "Oklahoma City", "state": "OK", "postal_code": 73134.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_67cb4bba04db7704f432174a6f326f03',
        'Baton Rouge Cardiology',
        '8888 Summa Ave',
        30.403341,
        -91.080357,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(225) 769-0933',
        NULL,
        'United States',
        'Baton Rouge',
        'LA',
        '70809.0',
        'uploaded',
        'uploaded_67cb4bba04db7704f432174a6f326f03',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Baton Rouge Cardiology", "Address": "8888 Summa Ave", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(225) 769-0933", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Baton Rouge", "Zip Code": 70809.0, "Latitude": 30.403341, "Longitude": -91.080357, "State": "LA", "zipcode UTC": -6.0, "name": "Baton Rouge Cardiology", "address": "8888 Summa Ave", "lat": 30.403341, "lng": -91.080357, "phone": "(225) 769-0933", "country": "United States", "city": "Baton Rouge", "state": "LA", "postal_code": 70809.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_e0fe4eba9524e2afa17650a7145f1d19',
        'Cardiovascular Diagnostic Center',
        '402 McMillian Road',
        32.526944,
        -92.159908,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(318) 338-3540',
        NULL,
        'United States',
        'Cheniere',
        'LA',
        '71291.0',
        'uploaded',
        'uploaded_e0fe4eba9524e2afa17650a7145f1d19',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Diagnostic Center", "Address": "402 McMillian Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri: 8:00 AM - 5:00 PM \nSat-Sun: CLOSED", "Phone Number": "(318) 338-3540", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Cheniere", "Zip Code": 71291.0, "Latitude": 32.526944, "Longitude": -92.159908, "State": "LA", "zipcode UTC": -6.0, "name": "Cardiovascular Diagnostic Center", "address": "402 McMillian Road", "lat": 32.526944, "lng": -92.159908, "phone": "(318) 338-3540", "country": "United States", "city": "Cheniere", "state": "LA", "postal_code": 71291.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f61e5667eda1b454e01002c8c7ef67b6',
        'nan',
        'nan',
        32.526944,
        -92.159908,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Dean Chapel',
        'LA',
        '71291.0',
        'uploaded',
        'uploaded_f61e5667eda1b454e01002c8c7ef67b6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Dean Chapel", "Zip Code": 71291.0, "Latitude": 32.526944, "Longitude": -92.159908, "State": "LA", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.526944, "lng": -92.159908, "phone": null, "country": null, "city": "Dean Chapel", "state": "LA", "postal_code": 71291.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0d5b1e001fc6e305fa6ffb32ebbaa8cb',
        'Carolina Cardiology Vascular Service',
        '1 Wellness Blvd',
        34.120487,
        -81.196861,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(803) 419-4235',
        NULL,
        'United States',
        'Irmo',
        'SC',
        '29063.0',
        'uploaded',
        'uploaded_0d5b1e001fc6e305fa6ffb32ebbaa8cb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Carolina Cardiology Vascular Service", "Address": "1 Wellness Blvd", "Address Two": "Suite 106", "clinic Hours of Operation": null, "Phone Number": "(803) 419-4235", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Irmo", "Zip Code": 29063.0, "Latitude": 34.120487, "Longitude": -81.196861, "State": "SC", "zipcode UTC": -5.0, "name": "Carolina Cardiology Vascular Service", "address": "1 Wellness Blvd", "lat": 34.120487, "lng": -81.196861, "phone": "(803) 419-4235", "country": "United States", "city": "Irmo", "state": "SC", "postal_code": 29063.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_43d30c961e4713e47e358af32076be31',
        'El Paso Cardiology Associates',
        '7450 Remeon Cir',
        31.848055,
        -106.544871,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(915) 532-6767',
        NULL,
        'United States',
        'El Paso',
        'TX',
        '79912.0',
        'uploaded',
        'uploaded_43d30c961e4713e47e358af32076be31',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "El Paso Cardiology Associates", "Address": "7450 Remeon Cir", "Address Two": null, "clinic Hours of Operation": "Mon-Fri: 8:00 AM - 5:00 PM\nSat-Sun: CLOSED", "Phone Number": "(915) 532-6767", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "El Paso", "Zip Code": 79912.0, "Latitude": 31.848055, "Longitude": -106.544871, "State": "TX", "zipcode UTC": -7.0, "name": "El Paso Cardiology Associates", "address": "7450 Remeon Cir", "lat": 31.848055, "lng": -106.544871, "phone": "(915) 532-6767", "country": "United States", "city": "El Paso", "state": "TX", "postal_code": 79912.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_abe61a1fea8b353d0fb6d4ae56c1be55',
        'Cardiovascular Medicine, P.C.',
        '1236 E. Rusholme St',
        41.538582,
        -90.562237,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(563) 324-2992',
        NULL,
        'United States',
        'Davenport',
        'IA',
        '52803.0',
        'uploaded',
        'uploaded_abe61a1fea8b353d0fb6d4ae56c1be55',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Medicine, P.C.", "Address": "1236 E. Rusholme St", "Address Two": null, "clinic Hours of Operation": "MON-FRI: 8:00 AM - 5:00 PM \nSAT-SUN: CLOSED", "Phone Number": "(563) 324-2992", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Davenport", "Zip Code": 52803.0, "Latitude": 41.538582, "Longitude": -90.562237, "State": "IA", "zipcode UTC": -6.0, "name": "Cardiovascular Medicine, P.C.", "address": "1236 E. Rusholme St", "lat": 41.538582, "lng": -90.562237, "phone": "(563) 324-2992", "country": "United States", "city": "Davenport", "state": "IA", "postal_code": 52803.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_8bb957752290da32d2766fd209fa4db0',
        'Dallas Cardiology PLLC',
        '1081 Kinwest Parkway',
        32.916865,
        -96.973492,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(972) 972-4252',
        NULL,
        'United States',
        'Irving',
        'TX',
        '75063.0',
        'uploaded',
        'uploaded_8bb957752290da32d2766fd209fa4db0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Dallas Cardiology PLLC", "Address": "1081 Kinwest Parkway", "Address Two": "Suite 110", "clinic Hours of Operation": null, "Phone Number": "(972) 972-4252", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Irving", "Zip Code": 75063.0, "Latitude": 32.916865, "Longitude": -96.973492, "State": "TX", "zipcode UTC": -6.0, "name": "Dallas Cardiology PLLC", "address": "1081 Kinwest Parkway", "lat": 32.916865, "lng": -96.973492, "phone": "(972) 972-4252", "country": "United States", "city": "Irving", "state": "TX", "postal_code": 75063.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_286fc6e18295b9ec1fa482f268bebeac',
        'Dallas Cardiology PLLC',
        '560 West Main Street',
        33.04867,
        -96.993217,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(972) 972-4252',
        NULL,
        'United States',
        'Lewisville',
        'TX',
        '75057.0',
        'uploaded',
        'uploaded_286fc6e18295b9ec1fa482f268bebeac',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Dallas Cardiology PLLC", "Address": "560 West Main Street", "Address Two": "Suite 205", "clinic Hours of Operation": null, "Phone Number": "(972) 972-4252", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Lewisville", "Zip Code": 75057.0, "Latitude": 33.04867, "Longitude": -96.993217, "State": "TX", "zipcode UTC": -6.0, "name": "Dallas Cardiology PLLC", "address": "560 West Main Street", "lat": 33.04867, "lng": -96.993217, "phone": "(972) 972-4252", "country": "United States", "city": "Lewisville", "state": "TX", "postal_code": 75057.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_f902f2be11f202102d8964e150a6a05c',
        'East Bay Cardiovascular & Medical Specialists',
        '1532 150th Avenue',
        37.703427,
        -122.128005,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(510) 351-6363',
        NULL,
        'United States',
        'San Leandro',
        'CA',
        '94578.0',
        'uploaded',
        'uploaded_f902f2be11f202102d8964e150a6a05c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "East Bay Cardiovascular & Medical Specialists", "Address": "1532 150th Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri: 9am-5:30pm\n\nSat/Sun: CLOSED", "Phone Number": "(510) 351-6363", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Leandro", "Zip Code": 94578.0, "Latitude": 37.703427, "Longitude": -122.128005, "State": "CA", "zipcode UTC": -8.0, "name": "East Bay Cardiovascular & Medical Specialists", "address": "1532 150th Avenue", "lat": 37.703427, "lng": -122.128005, "phone": "(510) 351-6363", "country": "United States", "city": "San Leandro", "state": "CA", "postal_code": 94578.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_75810c0adab626d4e75890b9066387db',
        'Cardiovascular Institute of San Diego (CVISD)',
        '412 Washington St',
        32.746018,
        -117.167152,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(619) 255-4455',
        NULL,
        'United States',
        'San Diego',
        'CA',
        '92103.0',
        'uploaded',
        'uploaded_75810c0adab626d4e75890b9066387db',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Institute of San Diego (CVISD)", "Address": "412 Washington St", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(619) 255-4455", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Diego", "Zip Code": 92103.0, "Latitude": 32.746018, "Longitude": -117.167152, "State": "CA", "zipcode UTC": -8.0, "name": "Cardiovascular Institute of San Diego (CVISD)", "address": "412 Washington St", "lat": 32.746018, "lng": -117.167152, "phone": "(619) 255-4455", "country": "United States", "city": "San Diego", "state": "CA", "postal_code": 92103.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_4c761ac6723a3e05f237311de8f758b6',
        'Cardiology of Virginia',
        '13572 Waterford Place',
        37.427988,
        -77.648689,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(804) 560-8782',
        NULL,
        'United States',
        'Midlothian',
        'VA',
        '23112.0',
        'uploaded',
        'uploaded_4c761ac6723a3e05f237311de8f758b6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiology of Virginia", "Address": "13572 Waterford Place", "Address Two": null, "clinic Hours of Operation": "Mon-Fri - 8-5:30\nSat/Sun - CLOSED", "Phone Number": "(804) 560-8782", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Midlothian", "Zip Code": 23112.0, "Latitude": 37.427988, "Longitude": -77.648689, "State": "VA", "zipcode UTC": -5.0, "name": "Cardiology of Virginia", "address": "13572 Waterford Place", "lat": 37.427988, "lng": -77.648689, "phone": "(804) 560-8782", "country": "United States", "city": "Midlothian", "state": "VA", "postal_code": 23112.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_6ee3ec824e93e0aae7dedcccae054ae9',
        'Desert Cardiovascular Consultants',
        '5785 South Fort Apache Road A-100',
        36.049095,
        -115.28485,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(702) 822-2273',
        NULL,
        'United States',
        'Las Vegas',
        'NV',
        '89148.0',
        'uploaded',
        'uploaded_6ee3ec824e93e0aae7dedcccae054ae9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Desert Cardiovascular Consultants", "Address": "5785 South Fort Apache Road A-100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri: 8:00 AM - 5:00 PM\nSat-Sun: CLOSED", "Phone Number": "(702) 822-2273", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Las Vegas", "Zip Code": 89148.0, "Latitude": 36.049095, "Longitude": -115.28485, "State": "NV", "zipcode UTC": -8.0, "name": "Desert Cardiovascular Consultants", "address": "5785 South Fort Apache Road A-100", "lat": 36.049095, "lng": -115.28485, "phone": "(702) 822-2273", "country": "United States", "city": "Las Vegas", "state": "NV", "postal_code": 89148.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_c78180a167f35b1bfd2d4361b0d3e9e9',
        'Cardiovascular Medicine, P.C.',
        '1100 36th Avenue',
        41.490333,
        -90.50006,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(563) 888-0495',
        NULL,
        'United States',
        'Moline',
        'IL',
        '61265.0',
        'uploaded',
        'uploaded_c78180a167f35b1bfd2d4361b0d3e9e9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Medicine, P.C.", "Address": "1100 36th Avenue", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(563) 888-0495", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Moline", "Zip Code": 61265.0, "Latitude": 41.490333, "Longitude": -90.50006, "State": "IL", "zipcode UTC": -6.0, "name": "Cardiovascular Medicine, P.C.", "address": "1100 36th Avenue", "lat": 41.490333, "lng": -90.50006, "phone": "(563) 888-0495", "country": "United States", "city": "Moline", "state": "IL", "postal_code": 61265.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a3d5b93f7396b3bdb562d70da51ea9cb',
        'nan',
        'nan',
        41.490333,
        -90.50006,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Quad City Airport',
        'IL',
        '61265.0',
        'uploaded',
        'uploaded_a3d5b93f7396b3bdb562d70da51ea9cb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Quad City Airport", "Zip Code": 61265.0, "Latitude": 41.490333, "Longitude": -90.50006, "State": "IL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 41.490333, "lng": -90.50006, "phone": null, "country": null, "city": "Quad City Airport", "state": "IL", "postal_code": 61265.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_1b1867c11eab21675ee8ca01b265e86c',
        'Specialists in Cardiovascular Medicine PC',
        '125 Daugherty Dr',
        40.431034,
        -79.765267,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(412) 856-4666',
        NULL,
        'United States',
        'Monroeville',
        'PA',
        '15146.0',
        'uploaded',
        'uploaded_1b1867c11eab21675ee8ca01b265e86c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Specialists in Cardiovascular Medicine PC", "Address": "125 Daugherty Dr", "Address Two": "#301", "clinic Hours of Operation": "Mon 08:00 am - 04:00 pm\nTue 09:00 am - 05:00 pm\nWed 08:00 am - 04:00 pm\nThu 09:00 am - 05:00 pm\nFri 08:00 am - 04:00 pm\nSat Closed\nSun Closed", "Phone Number": "(412) 856-4666", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Monroeville", "Zip Code": 15146.0, "Latitude": 40.431034, "Longitude": -79.765267, "State": "PA", "zipcode UTC": -5.0, "name": "Specialists in Cardiovascular Medicine PC", "address": "125 Daugherty Dr", "lat": 40.431034, "lng": -79.765267, "phone": "(412) 856-4666", "country": "United States", "city": "Monroeville", "state": "PA", "postal_code": 15146.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_08ee6ee2af87a7c678a4a00bd30b6ffa',
        'Pacific Cardiovascular Associates Medical Group, Inc.',
        '2699 Atlantic Blvd',
        33.801767,
        -118.1858,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(877) 430-7337',
        NULL,
        'United States',
        'Long Beach',
        'CA',
        '90806.0',
        'uploaded',
        'uploaded_08ee6ee2af87a7c678a4a00bd30b6ffa',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiovascular Associates Medical Group, Inc.", "Address": "2699 Atlantic Blvd", "Address Two": null, "clinic Hours of Operation": "\t\u2022\tMonday - 8:00 AM - 5:00 PM\n\t\u2022\tTuesday - 8:00 AM - 5:00 PM\n\t\u2022\tWednesday - 8:00 AM - 5:00 PM\n\t\u2022\tThursday - 8:00 AM - 5:00 PM\n\t\u2022\tFriday - 8:00 AM - 5:00 PM\n\t\u2022\tSaturday - 8:00 AM - 12:00 PM*\n\t\u2022\tSunday - Closed", "Phone Number": "(877) 430-7337", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Long Beach", "Zip Code": 90806.0, "Latitude": 33.801767, "Longitude": -118.1858, "State": "CA", "zipcode UTC": -8.0, "name": "Pacific Cardiovascular Associates Medical Group, Inc.", "address": "2699 Atlantic Blvd", "lat": 33.801767, "lng": -118.1858, "phone": "(877) 430-7337", "country": "United States", "city": "Long Beach", "state": "CA", "postal_code": 90806.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_e6b97ef3c2f338b377e2a837c0b7bccc',
        'National Park Cardiology Associates',
        '1900 Malvern Ave #102',
        34.506487,
        -93.019419,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(501) 625-3400',
        NULL,
        'United States',
        'Blue Springs',
        'AR',
        '71901.0',
        'uploaded',
        'uploaded_e6b97ef3c2f338b377e2a837c0b7bccc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "National Park Cardiology Associates", "Address": "1900 Malvern Ave #102", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(501) 625-3400", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Blue Springs", "Zip Code": 71901.0, "Latitude": 34.506487, "Longitude": -93.019419, "State": "AR", "zipcode UTC": -6.0, "name": "National Park Cardiology Associates", "address": "1900 Malvern Ave #102", "lat": 34.506487, "lng": -93.019419, "phone": "(501) 625-3400", "country": "United States", "city": "Blue Springs", "state": "AR", "postal_code": 71901.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_db560cef605f7336e0ce87154ee8d212',
        'nan',
        'nan',
        34.506487,
        -93.019419,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Central City',
        'AR',
        '71901.0',
        'uploaded',
        'uploaded_db560cef605f7336e0ce87154ee8d212',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Central City", "Zip Code": 71901.0, "Latitude": 34.506487, "Longitude": -93.019419, "State": "AR", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 34.506487, "lng": -93.019419, "phone": null, "country": null, "city": "Central City", "state": "AR", "postal_code": 71901.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_fb99432f61324f1389a00329fe7dc4f7',
        'Texas Cardiology Associates - Dr. Neil Nghi Phung',
        '275 W Campbell Rd ',
        32.969523,
        -96.740939,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(214) 393-6877',
        NULL,
        'United States',
        'Buckingham',
        'TX',
        '75080.0',
        'uploaded',
        'uploaded_fb99432f61324f1389a00329fe7dc4f7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Texas Cardiology Associates - Dr. Neil Nghi Phung", "Address": "275 W Campbell Rd ", "Address Two": "Ste 120 ", "clinic Hours of Operation": null, "Phone Number": "(214) 393-6877", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Buckingham", "Zip Code": 75080.0, "Latitude": 32.969523, "Longitude": -96.740939, "State": "TX", "zipcode UTC": -6.0, "name": "Texas Cardiology Associates - Dr. Neil Nghi Phung", "address": "275 W Campbell Rd ", "lat": 32.969523, "lng": -96.740939, "phone": "(214) 393-6877", "country": "United States", "city": "Buckingham", "state": "TX", "postal_code": 75080.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_9bddaf234388f6af21cf39bdfd42b829',
        'nan',
        'nan',
        32.969523,
        -96.740939,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Richardson',
        'TX',
        '75080.0',
        'uploaded',
        'uploaded_9bddaf234388f6af21cf39bdfd42b829',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Richardson", "Zip Code": 75080.0, "Latitude": 32.969523, "Longitude": -96.740939, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.969523, "lng": -96.740939, "phone": null, "country": null, "city": "Richardson", "state": "TX", "postal_code": 75080.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_ad9a3ee7b70146cefc3a7976f2830e93',
        'Wisconsin Cardiology Associates',
        '11725 N Port Washington Rd Suite 250',
        43.223907,
        -87.950858,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(414) 207-4333',
        NULL,
        'United States',
        'Mequon',
        'WI',
        '53092.0',
        'uploaded',
        'uploaded_ad9a3ee7b70146cefc3a7976f2830e93',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Wisconsin Cardiology Associates", "Address": "11725 N Port Washington Rd Suite 250", "Address Two": null, "clinic Hours of Operation": "Monday: 9:00 am to 5:00 pm \nTuesday-Wednesday: 8:00 am to 4:00 pm\nThursday: 10:00 am to 6:00 pm \nFriday: 8:00 am to 4:00 pm \nSaturday-Sunday: Closed", "Phone Number": "(414) 207-4333", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Mequon", "Zip Code": 53092.0, "Latitude": 43.223907, "Longitude": -87.950858, "State": "WI", "zipcode UTC": -6.0, "name": "Wisconsin Cardiology Associates", "address": "11725 N Port Washington Rd Suite 250", "lat": 43.223907, "lng": -87.950858, "phone": "(414) 207-4333", "country": "United States", "city": "Mequon", "state": "WI", "postal_code": 53092.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_a3bb12527fc812d7a27d7c6eee3b39b2',
        'nan',
        'nan',
        43.223907,
        -87.950858,
        ARRAY['Cardiologist'],
        'Cardiologist',
        NULL,
        NULL,
        NULL,
        'Thiensville',
        'WI',
        '53092.0',
        'uploaded',
        'uploaded_a3bb12527fc812d7a27d7c6eee3b39b2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Thiensville", "Zip Code": 53092.0, "Latitude": 43.223907, "Longitude": -87.950858, "State": "WI", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 43.223907, "lng": -87.950858, "phone": null, "country": null, "city": "Thiensville", "state": "WI", "postal_code": 53092.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_51a6b10fafbb0ff5fbe6f11c60441eb2',
        'West Michigan Cardiology',
        '709 S Greenville W Dr',
        43.1791,
        -85.265333,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(616) 754-9146',
        NULL,
        'United States',
        'Greenville',
        'MI',
        '48838.0',
        'uploaded',
        'uploaded_51a6b10fafbb0ff5fbe6f11c60441eb2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "West Michigan Cardiology", "Address": "709 S Greenville W Dr", "Address Two": null, "clinic Hours of Operation": "Monday \u2014 Friday: 8:00am - 4:00pm\nSaturday - Sunday: Closed \n\nLunch Breaks: 12:00pm - 1:00pm", "Phone Number": "(616) 754-9146", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Greenville", "Zip Code": 48838.0, "Latitude": 43.1791, "Longitude": -85.265333, "State": "MI", "zipcode UTC": -5.0, "name": "West Michigan Cardiology", "address": "709 S Greenville W Dr", "lat": 43.1791, "lng": -85.265333, "phone": "(616) 754-9146", "country": "United States", "city": "Greenville", "state": "MI", "postal_code": 48838.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_0facfab534acdb1b4814823a5426758c',
        'Cardiovascular Institute of the South',
        '441 Heymann Blvd',
        30.185867,
        -92.047069,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(337) 289-8429',
        NULL,
        'United States',
        'Lafayette',
        'LA',
        '70503.0',
        'uploaded',
        'uploaded_0facfab534acdb1b4814823a5426758c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Cardiovascular Institute of the South", "Address": "441 Heymann Blvd", "Address Two": null, "clinic Hours of Operation": "Monday - Friday\n7:30am - 5:00pm", "Phone Number": "(337) 289-8429", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Lafayette", "Zip Code": 70503.0, "Latitude": 30.185867, "Longitude": -92.047069, "State": "LA", "zipcode UTC": -6.0, "name": "Cardiovascular Institute of the South", "address": "441 Heymann Blvd", "lat": 30.185867, "lng": -92.047069, "phone": "(337) 289-8429", "country": "United States", "city": "Lafayette", "state": "LA", "postal_code": 70503.0, "category": "Cardiologist"}'::jsonb,
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
        'uploaded_25532f74a09f919307a4edaf5d01760a',
        'Pacific Cardiovascular Associates Medical Group, Inc.',
        '701 E. 28th Street',
        33.801767,
        -118.1858,
        ARRAY['Cardiologist'],
        'Cardiologist',
        '(877) 430-7337',
        NULL,
        'United States',
        'Long Beach',
        'CA',
        '90806.0',
        'uploaded',
        'uploaded_25532f74a09f919307a4edaf5d01760a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pacific Cardiovascular Associates Medical Group, Inc.", "Address": "701 E. 28th Street", "Address Two": "Suite 202", "clinic Hours of Operation": null, "Phone Number": "(877) 430-7337", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Long Beach", "Zip Code": 90806.0, "Latitude": 33.801767, "Longitude": -118.1858, "State": "CA", "zipcode UTC": -8.0, "name": "Pacific Cardiovascular Associates Medical Group, Inc.", "address": "701 E. 28th Street", "lat": 33.801767, "lng": -118.1858, "phone": "(877) 430-7337", "country": "United States", "city": "Long Beach", "state": "CA", "postal_code": 90806.0, "category": "Cardiologist"}'::jsonb,
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
    
