-- Batch: Imaging
-- Source: /Users/alexayvazian/CascadeProjects/Network-Map/occu-med-map/data/imaging-dedup.xlsx
-- Total records: 371
-- Generated: 2026-06-16 03:03:18.787641


    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_e62b4ae467372376d1887d929b146abc',
        'Valley Regional Imaging',
        '3186 Village Drive, Ste. 101',
        35.042389,
        -78.841241,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(910) 323-2209',
        NULL,
        'United States',
        'E Fayettevill',
        'NC',
        '28301.0',
        'uploaded',
        'uploaded_e62b4ae467372376d1887d929b146abc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Valley Regional Imaging", "Address": "3186 Village Drive, Ste. 101", "Address Two": null, "clinic Hours of Operation": "Mon-Thurs: 7:00 AM - 7:00 PM\nFri: 7:00 AM - 5:00PM\nSat: 8:00 AM - 12:00 PM\nSun: CLOSED", "Phone Number": "(910) 323-2209", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "E Fayettevill", "Zip Code": 28301.0, "Latitude": 35.042389, "Longitude": -78.841241, "State": "NC", "zipcode UTC": -5.0, "name": "Valley Regional Imaging", "address": "3186 Village Drive, Ste. 101", "lat": 35.042389, "lng": -78.841241, "phone": "(910) 323-2209", "country": "United States", "city": "E Fayettevill", "state": "NC", "postal_code": 28301.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_bc5511698cdf3250819931950ced09b3',
        'nan',
        'nan',
        35.042389,
        -78.841241,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'E Fayetteville',
        'NC',
        '28301.0',
        'uploaded',
        'uploaded_bc5511698cdf3250819931950ced09b3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "E Fayetteville", "Zip Code": 28301.0, "Latitude": 35.042389, "Longitude": -78.841241, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 35.042389, "lng": -78.841241, "phone": null, "country": null, "city": "E Fayetteville", "state": "NC", "postal_code": 28301.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b1e5d2e174238546a931db1ab2f9e48c',
        'Imaging Center',
        '2930 Squalicum Way, Ste. 101',
        48.747578,
        -122.485086,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(360) 647-2422',
        NULL,
        'United States',
        'Bellingham',
        'WA',
        '98225.0',
        'uploaded',
        'uploaded_b1e5d2e174238546a931db1ab2f9e48c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Imaging Center", "Address": "2930 Squalicum Way, Ste. 101", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(360) 647-2422", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Bellingham", "Zip Code": 98225.0, "Latitude": 48.747578, "Longitude": -122.485086, "State": "WA", "zipcode UTC": -8.0, "name": "Imaging Center", "address": "2930 Squalicum Way, Ste. 101", "lat": 48.747578, "lng": -122.485086, "phone": "(360) 647-2422", "country": "United States", "city": "Bellingham", "state": "WA", "postal_code": 98225.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
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
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Chuckanut", "Zip Code": 98225.0, "Latitude": 48.747578, "Longitude": -122.485086, "State": "WA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 48.747578, "lng": -122.485086, "phone": null, "country": null, "city": "Chuckanut", "state": "WA", "postal_code": 98225.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_81e829b2dac4e796025e071efb1f2b15',
        'Florida Radiology Imaging',
        '235 East Princeton Street, Ste. 100',
        28.577723,
        -81.393108,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(407) 303-1414',
        NULL,
        'United States',
        'Orlando',
        'FL',
        '32804.0',
        'uploaded',
        'uploaded_81e829b2dac4e796025e071efb1f2b15',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Florida Radiology Imaging", "Address": "235 East Princeton Street, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm", "Phone Number": "(407) 303-1414", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Orlando", "Zip Code": 32804.0, "Latitude": 28.577723, "Longitude": -81.393108, "State": "FL", "zipcode UTC": -5.0, "name": "Florida Radiology Imaging", "address": "235 East Princeton Street, Ste. 100", "lat": 28.577723, "lng": -81.393108, "phone": "(407) 303-1414", "country": "United States", "city": "Orlando", "state": "FL", "postal_code": 32804.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5dd70877793321795c1b0a61ab885d47',
        'Florida Radiology Imaging',
        '8000 Red Bug Lake Road, Ste. 120',
        28.656375,
        -81.21026,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(407) 977-7460',
        NULL,
        'United States',
        'Oviedo',
        'FL',
        '32765.0',
        'uploaded',
        'uploaded_5dd70877793321795c1b0a61ab885d47',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Florida Radiology Imaging", "Address": "8000 Red Bug Lake Road, Ste. 120", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm", "Phone Number": "(407) 977-7460", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Oviedo", "Zip Code": 32765.0, "Latitude": 28.656375, "Longitude": -81.21026, "State": "FL", "zipcode UTC": -5.0, "name": "Florida Radiology Imaging", "address": "8000 Red Bug Lake Road, Ste. 120", "lat": 28.656375, "lng": -81.21026, "phone": "(407) 977-7460", "country": "United States", "city": "Oviedo", "state": "FL", "postal_code": 32765.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6bb229db0b828d4106574c44b166e057',
        'Florida Radiology Imaging',
        '775 Primera Boulevard, Ste. 1030',
        28.758133,
        -81.339929,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(407) 333-9766',
        NULL,
        'United States',
        'Heathrow',
        'FL',
        '32746.0',
        'uploaded',
        'uploaded_6bb229db0b828d4106574c44b166e057',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Florida Radiology Imaging", "Address": "775 Primera Boulevard, Ste. 1030", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm", "Phone Number": "(407) 333-9766", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Heathrow", "Zip Code": 32746.0, "Latitude": 28.758133, "Longitude": -81.339929, "State": "FL", "zipcode UTC": -5.0, "name": "Florida Radiology Imaging", "address": "775 Primera Boulevard, Ste. 1030", "lat": 28.758133, "lng": -81.339929, "phone": "(407) 333-9766", "country": "United States", "city": "Heathrow", "state": "FL", "postal_code": 32746.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_fc28b84ddf87c4ae4c1a1bcdeb1b6c12',
        'nan',
        'nan',
        28.758133,
        -81.339929,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Lake Mary',
        'FL',
        '32746.0',
        'uploaded',
        'uploaded_fc28b84ddf87c4ae4c1a1bcdeb1b6c12',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lake Mary", "Zip Code": 32746.0, "Latitude": 28.758133, "Longitude": -81.339929, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 28.758133, "lng": -81.339929, "phone": null, "country": null, "city": "Lake Mary", "state": "FL", "postal_code": 32746.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_20c7c594346dd43bd840748b55fd924a',
        'Florida Radiology Imaging',
        '12301 Lake Underhill Road, Ste. 113',
        28.542132,
        -81.184045,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(407) 949-6444',
        NULL,
        'United States',
        'Alafaya',
        'FL',
        '32828.0',
        'uploaded',
        'uploaded_20c7c594346dd43bd840748b55fd924a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Florida Radiology Imaging", "Address": "12301 Lake Underhill Road, Ste. 113", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:30pm", "Phone Number": "(407) 949-6444", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Alafaya", "Zip Code": 32828.0, "Latitude": 28.542132, "Longitude": -81.184045, "State": "FL", "zipcode UTC": -5.0, "name": "Florida Radiology Imaging", "address": "12301 Lake Underhill Road, Ste. 113", "lat": 28.542132, "lng": -81.184045, "phone": "(407) 949-6444", "country": "United States", "city": "Alafaya", "state": "FL", "postal_code": 32828.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_e8f0a75b896a1984a0ce4d983f031b89',
        'nan',
        'nan',
        28.542132,
        -81.184045,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Orlando',
        'FL',
        '32828.0',
        'uploaded',
        'uploaded_e8f0a75b896a1984a0ce4d983f031b89',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Orlando", "Zip Code": 32828.0, "Latitude": 28.542132, "Longitude": -81.184045, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 28.542132, "lng": -81.184045, "phone": null, "country": null, "city": "Orlando", "state": "FL", "postal_code": 32828.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_911aec1b288c2b2edb7e120f9719c7ed',
        'Desoto Imaging Specialists',
        '7420 Guthrie Drive North, Ste. 105',
        34.96848,
        -89.997932,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(662) 349-4321',
        NULL,
        'United States',
        'Southaven',
        'MS',
        '38671.0',
        'uploaded',
        'uploaded_911aec1b288c2b2edb7e120f9719c7ed',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Desoto Imaging Specialists", "Address": "7420 Guthrie Drive North, Ste. 105", "Address Two": null, "clinic Hours of Operation": "Mon - Fri: 8:00am - 4:30pm", "Phone Number": "(662) 349-4321", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Southaven", "Zip Code": 38671.0, "Latitude": 34.96848, "Longitude": -89.997932, "State": "MS", "zipcode UTC": -6.0, "name": "Desoto Imaging Specialists", "address": "7420 Guthrie Drive North, Ste. 105", "lat": 34.96848, "lng": -89.997932, "phone": "(662) 349-4321", "country": "United States", "city": "Southaven", "state": "MS", "postal_code": 38671.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4063c3087ef0aa304db3ba0dc638414b',
        'InSight Imaging Camelback',
        '5040 North 15th Avenue, Ste. 401',
        33.50689,
        -112.102621,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(602) 274-9811',
        NULL,
        'United States',
        'Phoenix',
        'AZ',
        '85015.0',
        'uploaded',
        'uploaded_4063c3087ef0aa304db3ba0dc638414b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "InSight Imaging Camelback", "Address": "5040 North 15th Avenue, Ste. 401", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(602) 274-9811", "Country": "United States", "Time Zone Display": "MST - Mountain Standard Time", "City": "Phoenix", "Zip Code": 85015.0, "Latitude": 33.50689, "Longitude": -112.102621, "State": "AZ", "zipcode UTC": -7.0, "name": "InSight Imaging Camelback", "address": "5040 North 15th Avenue, Ste. 401", "lat": 33.50689, "lng": -112.102621, "phone": "(602) 274-9811", "country": "United States", "city": "Phoenix", "state": "AZ", "postal_code": 85015.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_43a3b4ff30038ac5159a7ebe70068692',
        'Radiology Imaging Associates',
        '230 West Dares Beach Road',
        38.535116,
        -76.584328,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(301) 855-9754',
        NULL,
        'United States',
        'Dares Beach',
        'MD',
        '20678.0',
        'uploaded',
        'uploaded_43a3b4ff30038ac5159a7ebe70068692',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Radiology Imaging Associates", "Address": "230 West Dares Beach Road", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(301) 855-9754", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dares Beach", "Zip Code": 20678.0, "Latitude": 38.535116, "Longitude": -76.584328, "State": "MD", "zipcode UTC": -5.0, "name": "Radiology Imaging Associates", "address": "230 West Dares Beach Road", "lat": 38.535116, "lng": -76.584328, "phone": "(301) 855-9754", "country": "United States", "city": "Dares Beach", "state": "MD", "postal_code": 20678.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b0e69347d87ff9beccd81d9db53332cf',
        'nan',
        'nan',
        38.535116,
        -76.584328,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Pr Frederick',
        'MD',
        '20678.0',
        'uploaded',
        'uploaded_b0e69347d87ff9beccd81d9db53332cf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Pr Frederick", "Zip Code": 20678.0, "Latitude": 38.535116, "Longitude": -76.584328, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 38.535116, "lng": -76.584328, "phone": null, "country": null, "city": "Pr Frederick", "state": "MD", "postal_code": 20678.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_faf860c377f94007e8305fbe22f429ee',
        'AAR: Woodrige Imaging Center',
        '1600 N Beauregard St',
        38.837312,
        -77.120648,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(703) 494-3309',
        NULL,
        'United States',
        'Alexandria',
        'VA',
        '22311.0',
        'uploaded',
        'uploaded_faf860c377f94007e8305fbe22f429ee',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "AAR: Woodrige Imaging Center", "Address": "1600 N Beauregard St", "Address Two": "Ste 200", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(703) 494-3309", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Alexandria", "Zip Code": 22311.0, "Latitude": 38.837312, "Longitude": -77.120648, "State": "VA", "zipcode UTC": -5.0, "name": "AAR: Woodrige Imaging Center", "address": "1600 N Beauregard St", "lat": 38.837312, "lng": -77.120648, "phone": "(703) 494-3309", "country": "United States", "city": "Alexandria", "state": "VA", "postal_code": 22311.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_8e5e128a0a1d75d7eadd78c0ba28fced',
        'Woodbridge Imaging Center',
        '4001 Prince William Parkway, Ste. 302',
        38.646375,
        -77.344691,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(703) 494-3309',
        NULL,
        'United States',
        'Dale City',
        'VA',
        '22193.0',
        'uploaded',
        'uploaded_8e5e128a0a1d75d7eadd78c0ba28fced',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Woodbridge Imaging Center", "Address": "4001 Prince William Parkway, Ste. 302", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 5:00pm", "Phone Number": "(703) 494-3309", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dale City", "Zip Code": 22193.0, "Latitude": 38.646375, "Longitude": -77.344691, "State": "VA", "zipcode UTC": -5.0, "name": "Woodbridge Imaging Center", "address": "4001 Prince William Parkway, Ste. 302", "lat": 38.646375, "lng": -77.344691, "phone": "(703) 494-3309", "country": "United States", "city": "Dale City", "state": "VA", "postal_code": 22193.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_1e6fbd5703420d5cbaf7c0c333c699dd',
        'nan',
        'nan',
        38.646375,
        -77.344691,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Dalecity',
        'VA',
        '22193.0',
        'uploaded',
        'uploaded_1e6fbd5703420d5cbaf7c0c333c699dd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dalecity", "Zip Code": 22193.0, "Latitude": 38.646375, "Longitude": -77.344691, "State": "VA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 38.646375, "lng": -77.344691, "phone": null, "country": null, "city": "Dalecity", "state": "VA", "postal_code": 22193.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_1b87b2331611301282163ef0eadbae30',
        'Watson Imaging',
        '3915 Watson Road',
        38.610901,
        -90.291746,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(314) 781-9711',
        NULL,
        'United States',
        'Saint Louis',
        'MO',
        '63139.0',
        'uploaded',
        'uploaded_1b87b2331611301282163ef0eadbae30',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Watson Imaging", "Address": "3915 Watson Road", "Address Two": null, "clinic Hours of Operation": "Mon-Thurs 8:00am - 5:00pm, Fri 8:00am - 4:00pm", "Phone Number": "(314) 781-9711", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Saint Louis", "Zip Code": 63139.0, "Latitude": 38.610901, "Longitude": -90.291746, "State": "MO", "zipcode UTC": -6.0, "name": "Watson Imaging", "address": "3915 Watson Road", "lat": 38.610901, "lng": -90.291746, "phone": "(314) 781-9711", "country": "United States", "city": "Saint Louis", "state": "MO", "postal_code": 63139.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6eb2eb17c501fdaf7612ed8dd9faeed0',
        'Imaging Center of Alton',
        '3 Professional Drive, Ste. A',
        38.906065,
        -90.159096,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(618) 465-4674',
        NULL,
        'United States',
        'Alton',
        'IL',
        '62002.0',
        'uploaded',
        'uploaded_6eb2eb17c501fdaf7612ed8dd9faeed0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Imaging Center of Alton", "Address": "3 Professional Drive, Ste. A", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(618) 465-4674", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Alton", "Zip Code": 62002.0, "Latitude": 38.906065, "Longitude": -90.159096, "State": "IL", "zipcode UTC": -6.0, "name": "Imaging Center of Alton", "address": "3 Professional Drive, Ste. A", "lat": 38.906065, "lng": -90.159096, "phone": "(618) 465-4674", "country": "United States", "city": "Alton", "state": "IL", "postal_code": 62002.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_45049cc2e1efb67ea2655ebb9569ea1a',
        'Center for Diagnostic Imaging',
        '10333 Clayton Road, Ste. A',
        38.618582,
        -90.436435,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(314) 567-9729',
        NULL,
        'United States',
        'Crystal Lake Park',
        'MO',
        '63131.0',
        'uploaded',
        'uploaded_45049cc2e1efb67ea2655ebb9569ea1a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Center for Diagnostic Imaging", "Address": "10333 Clayton Road, Ste. A", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(314) 567-9729", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Crystal Lake Park", "Zip Code": 63131.0, "Latitude": 38.618582, "Longitude": -90.436435, "State": "MO", "zipcode UTC": -6.0, "name": "Center for Diagnostic Imaging", "address": "10333 Clayton Road, Ste. A", "lat": 38.618582, "lng": -90.436435, "phone": "(314) 567-9729", "country": "United States", "city": "Crystal Lake Park", "state": "MO", "postal_code": 63131.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
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
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Des Peres", "Zip Code": 63131.0, "Latitude": 38.618582, "Longitude": -90.436435, "State": "MO", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 38.618582, "lng": -90.436435, "phone": null, "country": null, "city": "Des Peres", "state": "MO", "postal_code": 63131.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_2d5f411f549dd7a2d88631372cac0a07',
        'Lerman Diagnostic Imaging',
        '6511 Fort Hamilton Parkway',
        40.632449,
        -73.996299,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(718) 491-4545',
        NULL,
        'United States',
        'Brooklyn',
        'NY',
        '11219.0',
        'uploaded',
        'uploaded_2d5f411f549dd7a2d88631372cac0a07',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Lerman Diagnostic Imaging", "Address": "6511 Fort Hamilton Parkway", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(718) 491-4545", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Brooklyn", "Zip Code": 11219.0, "Latitude": 40.632449, "Longitude": -73.996299, "State": "NY", "zipcode UTC": -5.0, "name": "Lerman Diagnostic Imaging", "address": "6511 Fort Hamilton Parkway", "lat": 40.632449, "lng": -73.996299, "phone": "(718) 491-4545", "country": "United States", "city": "Brooklyn", "state": "NY", "postal_code": 11219.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_afde1548debac7a25f53601abcd110ef',
        'Mid-Atlantic Imaging Centers',
        '750 McGuire Place, Ste. A',
        37.053346,
        -76.459483,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(757) 223-5059',
        NULL,
        'United States',
        'N N',
        'VA',
        '23601.0',
        'uploaded',
        'uploaded_afde1548debac7a25f53601abcd110ef',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Mid-Atlantic Imaging Centers", "Address": "750 McGuire Place, Ste. A", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(757) 223-5059", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "N N", "Zip Code": 23601.0, "Latitude": 37.053346, "Longitude": -76.459483, "State": "VA", "zipcode UTC": -5.0, "name": "Mid-Atlantic Imaging Centers", "address": "750 McGuire Place, Ste. A", "lat": 37.053346, "lng": -76.459483, "phone": "(757) 223-5059", "country": "United States", "city": "N N", "state": "VA", "postal_code": 23601.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9c6d72ac8e8f6fd8d9fa61cb32b83059',
        'nan',
        'nan',
        37.053346,
        -76.459483,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Newport News',
        'VA',
        '23601.0',
        'uploaded',
        'uploaded_9c6d72ac8e8f6fd8d9fa61cb32b83059',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Newport News", "Zip Code": 23601.0, "Latitude": 37.053346, "Longitude": -76.459483, "State": "VA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 37.053346, "lng": -76.459483, "phone": null, "country": null, "city": "Newport News", "state": "VA", "postal_code": 23601.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_12f3339389b278b7e35917a830f56056',
        'Bon Secours Diagnostic Imaging - Greenville, SC',
        'One Marcus Drive',
        34.866801,
        -82.317392,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(864) 242-2020',
        NULL,
        'United States',
        'Greenville',
        'SC',
        '29615.0',
        'uploaded',
        'uploaded_12f3339389b278b7e35917a830f56056',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Bon Secours Diagnostic Imaging - Greenville, SC", "Address": "One Marcus Drive", "Address Two": "Suite 101", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(864) 242-2020", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Greenville", "Zip Code": 29615.0, "Latitude": 34.866801, "Longitude": -82.317392, "State": "SC", "zipcode UTC": -5.0, "name": "Bon Secours Diagnostic Imaging - Greenville, SC", "address": "One Marcus Drive", "lat": 34.866801, "lng": -82.317392, "phone": "(864) 242-2020", "country": "United States", "city": "Greenville", "state": "SC", "postal_code": 29615.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
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
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Gville", "Zip Code": 29615.0, "Latitude": 34.866801, "Longitude": -82.317392, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.866801, "lng": -82.317392, "phone": null, "country": null, "city": "Gville", "state": "SC", "postal_code": 29615.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d64f9a870a8f9f0b6c4686b4c2073f73',
        'Bon Secours Diagnostic Imaging - Greenville, SC',
        '1 Cannon Drive',
        34.798035,
        -82.392893,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(864) 242-2020',
        NULL,
        'United States',
        'Greenville',
        'SC',
        '29605.0',
        'uploaded',
        'uploaded_d64f9a870a8f9f0b6c4686b4c2073f73',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Bon Secours Diagnostic Imaging - Greenville, SC", "Address": "1 Cannon Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(864) 242-2020", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Greenville", "Zip Code": 29605.0, "Latitude": 34.798035, "Longitude": -82.392893, "State": "SC", "zipcode UTC": -5.0, "name": "Bon Secours Diagnostic Imaging - Greenville, SC", "address": "1 Cannon Drive", "lat": 34.798035, "lng": -82.392893, "phone": "(864) 242-2020", "country": "United States", "city": "Greenville", "state": "SC", "postal_code": 29605.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
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
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Gville", "Zip Code": 29605.0, "Latitude": 34.798035, "Longitude": -82.392893, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.798035, "lng": -82.392893, "phone": null, "country": null, "city": "Gville", "state": "SC", "postal_code": 29605.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4f43a0a1a82260b128c63914475f8c36',
        'Southern Illinois Imaging Associates',
        '509 Hamacher Street, Ste. 300',
        38.325969,
        -90.146063,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(618) 939-9790',
        NULL,
        'United States',
        'Burksville',
        'IL',
        '62298.0',
        'uploaded',
        'uploaded_4f43a0a1a82260b128c63914475f8c36',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Southern Illinois Imaging Associates", "Address": "509 Hamacher Street, Ste. 300", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm, Sat 8:00am - 12:00pm", "Phone Number": "(618) 939-9790", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Burksville", "Zip Code": 62298.0, "Latitude": 38.325969, "Longitude": -90.146063, "State": "IL", "zipcode UTC": -6.0, "name": "Southern Illinois Imaging Associates", "address": "509 Hamacher Street, Ste. 300", "lat": 38.325969, "lng": -90.146063, "phone": "(618) 939-9790", "country": "United States", "city": "Burksville", "state": "IL", "postal_code": 62298.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_0bde5408cf24f3b08fcefb9b000bfa55',
        'nan',
        'nan',
        38.325969,
        -90.146063,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Floraville',
        'IL',
        '62298.0',
        'uploaded',
        'uploaded_0bde5408cf24f3b08fcefb9b000bfa55',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Floraville", "Zip Code": 62298.0, "Latitude": 38.325969, "Longitude": -90.146063, "State": "IL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 38.325969, "lng": -90.146063, "phone": null, "country": null, "city": "Floraville", "state": "IL", "postal_code": 62298.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_058e21595406d914e65b54e5135d5618',
        'Advanced Diagnostic Imaging Center',
        '1728 Village Park Drive',
        33.548282,
        -80.885131,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(803) 536-1106',
        NULL,
        'United States',
        'Orangeburg',
        'SC',
        '29118.0',
        'uploaded',
        'uploaded_058e21595406d914e65b54e5135d5618',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Diagnostic Imaging Center", "Address": "1728 Village Park Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Thurs 8:00am  -5:00pm, Fri 8:00am - 1:00pm", "Phone Number": "(803) 536-1106", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Orangeburg", "Zip Code": 29118.0, "Latitude": 33.548282, "Longitude": -80.885131, "State": "SC", "zipcode UTC": -5.0, "name": "Advanced Diagnostic Imaging Center", "address": "1728 Village Park Drive", "lat": 33.548282, "lng": -80.885131, "phone": "(803) 536-1106", "country": "United States", "city": "Orangeburg", "state": "SC", "postal_code": 29118.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c5177f33b1a19d8e3d0b3904a1a92b60',
        'Midwest Center for Advanced Imaging',
        '545 Plainfield Road, Ste. E',
        41.75,
        -87.9331,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(630) 366-8196',
        NULL,
        'United States',
        'Burr Ridge',
        'IL',
        '60527.0',
        'uploaded',
        'uploaded_c5177f33b1a19d8e3d0b3904a1a92b60',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Midwest Center for Advanced Imaging", "Address": "545 Plainfield Road, Ste. E", "Address Two": null, "clinic Hours of Operation": "Mon 10:0am - 6:00pm Tue, Wed 9:00am - 5:00pm  Thur 11:00am - 7:00pm  Fri 8:30am - 3:00pm  Sat 8:30am - 1:00pm", "Phone Number": "(630) 366-8196", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Burr Ridge", "Zip Code": 60527.0, "Latitude": 41.75, "Longitude": -87.9331, "State": "IL", "zipcode UTC": -6.0, "name": "Midwest Center for Advanced Imaging", "address": "545 Plainfield Road, Ste. E", "lat": 41.75, "lng": -87.9331, "phone": "(630) 366-8196", "country": "United States", "city": "Burr Ridge", "state": "IL", "postal_code": 60527.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d5028e1a792cd1be521217c0e4e26696',
        'nan',
        'nan',
        41.75,
        -87.9331,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Burridge',
        'IL',
        '60527.0',
        'uploaded',
        'uploaded_d5028e1a792cd1be521217c0e4e26696',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Burridge", "Zip Code": 60527.0, "Latitude": 41.75, "Longitude": -87.9331, "State": "IL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 41.75, "lng": -87.9331, "phone": null, "country": null, "city": "Burridge", "state": "IL", "postal_code": 60527.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_08f827e1159803deeeb7e25a8a1096f1',
        'Bay Care Outpatient Imaging ',
        '1064 Keene Road',
        28.025395,
        -82.775348,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(727) 736-9729',
        NULL,
        'United States',
        'Dunedin',
        'FL',
        '34698.0',
        'uploaded',
        'uploaded_08f827e1159803deeeb7e25a8a1096f1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Bay Care Outpatient Imaging ", "Address": "1064 Keene Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(727) 736-9729", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dunedin", "Zip Code": 34698.0, "Latitude": 28.025395, "Longitude": -82.775348, "State": "FL", "zipcode UTC": -5.0, "name": "Bay Care Outpatient Imaging ", "address": "1064 Keene Road", "lat": 28.025395, "lng": -82.775348, "phone": "(727) 736-9729", "country": "United States", "city": "Dunedin", "state": "FL", "postal_code": 34698.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ccb533a1a84b1cf776d937f647863200',
        'Quest Imaging',
        '9602 Stockdale Highway',
        35.200467,
        -119.173998,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(661) 633-5001',
        NULL,
        'United States',
        'Bakersfield',
        'CA',
        '93311.0',
        'uploaded',
        'uploaded_ccb533a1a84b1cf776d937f647863200',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Quest Imaging", "Address": "9602 Stockdale Highway", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 6:00pm", "Phone Number": "(661) 633-5001", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Bakersfield", "Zip Code": 93311.0, "Latitude": 35.200467, "Longitude": -119.173998, "State": "CA", "zipcode UTC": -8.0, "name": "Quest Imaging", "address": "9602 Stockdale Highway", "lat": 35.200467, "lng": -119.173998, "phone": "(661) 633-5001", "country": "United States", "city": "Bakersfield", "state": "CA", "postal_code": 93311.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_81a2a0b8d803f2dd8e70c682779eefcf',
        'SDI Diagnostic Imaging Center',
        '3870 Tampa Road',
        28.042799,
        -82.677371,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 855-8282',
        NULL,
        'United States',
        'Oldsmar',
        'FL',
        '34677.0',
        'uploaded',
        'uploaded_81a2a0b8d803f2dd8e70c682779eefcf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "SDI Diagnostic Imaging Center", "Address": "3870 Tampa Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 6:00pm", "Phone Number": "(813) 855-8282", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Oldsmar", "Zip Code": 34677.0, "Latitude": 28.042799, "Longitude": -82.677371, "State": "FL", "zipcode UTC": -5.0, "name": "SDI Diagnostic Imaging Center", "address": "3870 Tampa Road", "lat": 28.042799, "lng": -82.677371, "phone": "(813) 855-8282", "country": "United States", "city": "Oldsmar", "state": "FL", "postal_code": 34677.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_bd8a0432ecd5a60277cbeb4421acfcf8',
        'SDI Diagnostic Imaging Center',
        '4516 North Armenia Avenue ',
        27.984198,
        -82.462705,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 348-6900',
        NULL,
        'United States',
        'Tampa',
        'FL',
        '33603.0',
        'uploaded',
        'uploaded_bd8a0432ecd5a60277cbeb4421acfcf8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "SDI Diagnostic Imaging Center", "Address": "4516 North Armenia Avenue ", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 6:00pm", "Phone Number": "(813) 348-6900", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Tampa", "Zip Code": 33603.0, "Latitude": 27.984198, "Longitude": -82.462705, "State": "FL", "zipcode UTC": -5.0, "name": "SDI Diagnostic Imaging Center", "address": "4516 North Armenia Avenue ", "lat": 27.984198, "lng": -82.462705, "phone": "(813) 348-6900", "country": "United States", "city": "Tampa", "state": "FL", "postal_code": 33603.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f49868f7479973fb6c341cc6cac7f069',
        'SDI Diagnostic Imaging Center',
        '2222 West Swann Avenue',
        27.936799,
        -82.469111,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 259-1900',
        NULL,
        'United States',
        'Tampa',
        'FL',
        '33606.0',
        'uploaded',
        'uploaded_f49868f7479973fb6c341cc6cac7f069',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "SDI Diagnostic Imaging Center", "Address": "2222 West Swann Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(813) 259-1900", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Tampa", "Zip Code": 33606.0, "Latitude": 27.936799, "Longitude": -82.469111, "State": "FL", "zipcode UTC": -5.0, "name": "SDI Diagnostic Imaging Center", "address": "2222 West Swann Avenue", "lat": 27.936799, "lng": -82.469111, "phone": "(813) 259-1900", "country": "United States", "city": "Tampa", "state": "FL", "postal_code": 33606.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9a20b36fc1b15c56ad18dc3d2e37b501',
        'nan',
        'nan',
        27.936799,
        -82.469111,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Univ Of Tampa',
        'FL',
        '33606.0',
        'uploaded',
        'uploaded_9a20b36fc1b15c56ad18dc3d2e37b501',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Univ Of Tampa", "Zip Code": 33606.0, "Latitude": 27.936799, "Longitude": -82.469111, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 27.936799, "lng": -82.469111, "phone": null, "country": null, "city": "Univ Of Tampa", "state": "FL", "postal_code": 33606.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3603c3d53a5b407f6ed674f07a9d6bd7',
        'Center for Medical Imaging',
        '18530 NW Cornell Road',
        45.545841,
        -122.946059,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(503) 216-8400',
        NULL,
        'United States',
        'Helvetia',
        'OR',
        '97124.0',
        'uploaded',
        'uploaded_3603c3d53a5b407f6ed674f07a9d6bd7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Center for Medical Imaging", "Address": "18530 NW Cornell Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:15am - 5:30pm", "Phone Number": "(503) 216-8400", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Helvetia", "Zip Code": 97124.0, "Latitude": 45.545841, "Longitude": -122.946059, "State": "OR", "zipcode UTC": -8.0, "name": "Center for Medical Imaging", "address": "18530 NW Cornell Road", "lat": 45.545841, "lng": -122.946059, "phone": "(503) 216-8400", "country": "United States", "city": "Helvetia", "state": "OR", "postal_code": 97124.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b1430ab3e0a24ae0b1540b3c3fd85843',
        'nan',
        'nan',
        45.545841,
        -122.946059,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Hillsboro',
        'OR',
        '97124.0',
        'uploaded',
        'uploaded_b1430ab3e0a24ae0b1540b3c3fd85843',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Hillsboro", "Zip Code": 97124.0, "Latitude": 45.545841, "Longitude": -122.946059, "State": "OR", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 45.545841, "lng": -122.946059, "phone": null, "country": null, "city": "Hillsboro", "state": "OR", "postal_code": 97124.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_8c4dd82c7b3e18456211aec8be9a343e',
        'Portland Medical Imaging',
        '10538 SE Washington Street',
        45.515674,
        -122.560879,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(503) 215-8900',
        NULL,
        'United States',
        'Portland',
        'OR',
        '97216.0',
        'uploaded',
        'uploaded_8c4dd82c7b3e18456211aec8be9a343e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Portland Medical Imaging", "Address": "10538 SE Washington Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(503) 215-8900", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Portland", "Zip Code": 97216.0, "Latitude": 45.515674, "Longitude": -122.560879, "State": "OR", "zipcode UTC": -8.0, "name": "Portland Medical Imaging", "address": "10538 SE Washington Street", "lat": 45.515674, "lng": -122.560879, "phone": "(503) 215-8900", "country": "United States", "city": "Portland", "state": "OR", "postal_code": 97216.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_e9c240a6061884940a383e4115257369',
        'RCA Advanced Imaging',
        '1750 North Hampton Road',
        32.599286,
        -96.858828,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(214) 420-5400',
        NULL,
        'United States',
        'Desoto',
        'TX',
        '75115.0',
        'uploaded',
        'uploaded_e9c240a6061884940a383e4115257369',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "RCA Advanced Imaging", "Address": "1750 North Hampton Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 9:00pm      Sat 8:00am - 5:00pm", "Phone Number": "(214) 420-5400", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Desoto", "Zip Code": 75115.0, "Latitude": 32.599286, "Longitude": -96.858828, "State": "TX", "zipcode UTC": -6.0, "name": "RCA Advanced Imaging", "address": "1750 North Hampton Road", "lat": 32.599286, "lng": -96.858828, "phone": "(214) 420-5400", "country": "United States", "city": "Desoto", "state": "TX", "postal_code": 75115.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d1d4a9870dfae40cda813bad24c36ff9',
        'Touchstone Imaging',
        '601 West Arbrook Boulevard',
        32.694666,
        -97.087488,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(817) 472-0801',
        NULL,
        'United States',
        'Arlington',
        'TX',
        '76014.0',
        'uploaded',
        'uploaded_d1d4a9870dfae40cda813bad24c36ff9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Touchstone Imaging", "Address": "601 West Arbrook Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 8:00pm       Sat 9:00am - 12:00pm", "Phone Number": "(817) 472-0801", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Arlington", "Zip Code": 76014.0, "Latitude": 32.694666, "Longitude": -97.087488, "State": "TX", "zipcode UTC": -6.0, "name": "Touchstone Imaging", "address": "601 West Arbrook Boulevard", "lat": 32.694666, "lng": -97.087488, "phone": "(817) 472-0801", "country": "United States", "city": "Arlington", "state": "TX", "postal_code": 76014.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_a694f09a5a86b889d8f904adddc23c99',
        'Touchstone Imaging',
        '1717 Precinct Line Road, Ste. 103',
        32.858398,
        -97.176812,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(817) 498-6575',
        NULL,
        'United States',
        'Hurst',
        'TX',
        '76054.0',
        'uploaded',
        'uploaded_a694f09a5a86b889d8f904adddc23c99',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Touchstone Imaging", "Address": "1717 Precinct Line Road, Ste. 103", "Address Two": null, "clinic Hours of Operation": "Mon - Fri 8:00am - 5:30pm     Sat 8:00am - 12:00pm ", "Phone Number": "(817) 498-6575", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Hurst", "Zip Code": 76054.0, "Latitude": 32.858398, "Longitude": -97.176812, "State": "TX", "zipcode UTC": -6.0, "name": "Touchstone Imaging", "address": "1717 Precinct Line Road, Ste. 103", "lat": 32.858398, "lng": -97.176812, "phone": "(817) 498-6575", "country": "United States", "city": "Hurst", "state": "TX", "postal_code": 76054.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9b4cabe83e18397e2df9ec8270faf83e',
        'Touchstone Imaging',
        '6001 Harris Parkway',
        32.670345,
        -97.414302,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(817) 294-1131',
        NULL,
        'United States',
        'Benbrook',
        'TX',
        '76132.0',
        'uploaded',
        'uploaded_9b4cabe83e18397e2df9ec8270faf83e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Touchstone Imaging", "Address": "6001 Harris Parkway", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm ", "Phone Number": "(817) 294-1131", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Benbrook", "Zip Code": 76132.0, "Latitude": 32.670345, "Longitude": -97.414302, "State": "TX", "zipcode UTC": -6.0, "name": "Touchstone Imaging", "address": "6001 Harris Parkway", "lat": 32.670345, "lng": -97.414302, "phone": "(817) 294-1131", "country": "United States", "city": "Benbrook", "state": "TX", "postal_code": 76132.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3e05bd508c2d40095c7c241ea4e7379d',
        'nan',
        'nan',
        32.670345,
        -97.414302,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Fort Worth',
        'TX',
        '76132.0',
        'uploaded',
        'uploaded_3e05bd508c2d40095c7c241ea4e7379d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Fort Worth", "Zip Code": 76132.0, "Latitude": 32.670345, "Longitude": -97.414302, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.670345, "lng": -97.414302, "phone": null, "country": null, "city": "Fort Worth", "state": "TX", "postal_code": 76132.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_69559547855f280ee7a19c7dfd1fa77b',
        'Touchstone Imaging',
        '5455 Basswood Boulevard, Ste. 550',
        32.86814,
        -97.285666,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(817) 428-5002',
        NULL,
        'United States',
        'Fort Worth',
        'TX',
        '76137.0',
        'uploaded',
        'uploaded_69559547855f280ee7a19c7dfd1fa77b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Touchstone Imaging", "Address": "5455 Basswood Boulevard, Ste. 550", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 6:00pm      Sat 9:00am - 2:00pm     ", "Phone Number": "(817) 428-5002", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Fort Worth", "Zip Code": 76137.0, "Latitude": 32.86814, "Longitude": -97.285666, "State": "TX", "zipcode UTC": -6.0, "name": "Touchstone Imaging", "address": "5455 Basswood Boulevard, Ste. 550", "lat": 32.86814, "lng": -97.285666, "phone": "(817) 428-5002", "country": "United States", "city": "Fort Worth", "state": "TX", "postal_code": 76137.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_02a78b67e8162b35be5b04b6941968de',
        'nan',
        'nan',
        32.86814,
        -97.285666,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Ft Worth',
        'TX',
        '76137.0',
        'uploaded',
        'uploaded_02a78b67e8162b35be5b04b6941968de',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Ft Worth", "Zip Code": 76137.0, "Latitude": 32.86814, "Longitude": -97.285666, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.86814, "lng": -97.285666, "phone": null, "country": null, "city": "Ft Worth", "state": "TX", "postal_code": 76137.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9b04be0d666be64dfb0d305992d9cbdf',
        'Stanislaus Surgical Hospital Precision Imaging',
        '1239 McHenry Avenue, Ste. A',
        37.673513,
        -120.955666,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(209) 491-5200 x2037',
        NULL,
        'United States',
        'Modesto',
        'CA',
        '95355.0',
        'uploaded',
        'uploaded_9b04be0d666be64dfb0d305992d9cbdf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Stanislaus Surgical Hospital Precision Imaging", "Address": "1239 McHenry Avenue, Ste. A", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 6:00pm", "Phone Number": "(209) 491-5200 x2037", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Modesto", "Zip Code": 95355.0, "Latitude": 37.673513, "Longitude": -120.955666, "State": "CA", "zipcode UTC": -8.0, "name": "Stanislaus Surgical Hospital Precision Imaging", "address": "1239 McHenry Avenue, Ste. A", "lat": 37.673513, "lng": -120.955666, "phone": "(209) 491-5200 x2037", "country": "United States", "city": "Modesto", "state": "CA", "postal_code": 95355.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ea6f1c3043db14bac1f64a6b63805655',
        'Modesto Radiology Imaging',
        '1524 McHenry Avenue, Ste. 100',
        37.671778,
        -121.012493,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(209) 577-4444',
        NULL,
        'United States',
        'Modesto',
        'CA',
        '95350.0',
        'uploaded',
        'uploaded_ea6f1c3043db14bac1f64a6b63805655',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Modesto Radiology Imaging", "Address": "1524 McHenry Avenue, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 7:00pm", "Phone Number": "(209) 577-4444", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Modesto", "Zip Code": 95350.0, "Latitude": 37.671778, "Longitude": -121.012493, "State": "CA", "zipcode UTC": -8.0, "name": "Modesto Radiology Imaging", "address": "1524 McHenry Avenue, Ste. 100", "lat": 37.671778, "lng": -121.012493, "phone": "(209) 577-4444", "country": "United States", "city": "Modesto", "state": "CA", "postal_code": 95350.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_e4ec922c9adc8939e5e4cf6a20f35aab',
        'Lowcountry Imaging Associates, LLC',
        '211 Meadow Street',
        32.89989,
        -80.671958,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(843) 782-4488',
        NULL,
        'United States',
        'Ritter',
        'SC',
        '29488.0',
        'uploaded',
        'uploaded_e4ec922c9adc8939e5e4cf6a20f35aab',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Lowcountry Imaging Associates, LLC", "Address": "211 Meadow Street", "Address Two": null, "clinic Hours of Operation": "Mon-Thur 8:00am - 5:00pm   Fri 8:00am - 1:00pm", "Phone Number": "(843) 782-4488", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ritter", "Zip Code": 29488.0, "Latitude": 32.89989, "Longitude": -80.671958, "State": "SC", "zipcode UTC": -5.0, "name": "Lowcountry Imaging Associates, LLC", "address": "211 Meadow Street", "lat": 32.89989, "lng": -80.671958, "phone": "(843) 782-4488", "country": "United States", "city": "Ritter", "state": "SC", "postal_code": 29488.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_8dec261b09028f89335b52b8a1f6b87b',
        'nan',
        'nan',
        32.89989,
        -80.671958,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Walterboro',
        'SC',
        '29488.0',
        'uploaded',
        'uploaded_8dec261b09028f89335b52b8a1f6b87b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Walterboro", "Zip Code": 29488.0, "Latitude": 32.89989, "Longitude": -80.671958, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.89989, "lng": -80.671958, "phone": null, "country": null, "city": "Walterboro", "state": "SC", "postal_code": 29488.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5c4da33103c08429f68d0b23d048dc2b',
        'Imaging Specialists of Charleston',
        '1241 Wodland Avenue',
        32.813518,
        -79.858999,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(843) 881-4020',
        NULL,
        'United States',
        'Mount Pleasant',
        'SC',
        '29464.0',
        'uploaded',
        'uploaded_5c4da33103c08429f68d0b23d048dc2b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Imaging Specialists of Charleston", "Address": "1241 Wodland Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 5:30pm\nSat/Sun: CLOSED", "Phone Number": "(843) 881-4020", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Mount Pleasant", "Zip Code": 29464.0, "Latitude": 32.813518, "Longitude": -79.858999, "State": "SC", "zipcode UTC": -5.0, "name": "Imaging Specialists of Charleston", "address": "1241 Wodland Avenue", "lat": 32.813518, "lng": -79.858999, "phone": "(843) 881-4020", "country": "United States", "city": "Mount Pleasant", "state": "SC", "postal_code": 29464.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f7ee5c6457775ac0790a74d9afdc9150',
        'nan',
        'nan',
        32.813518,
        -79.858999,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Mt Pleasant',
        'SC',
        '29464.0',
        'uploaded',
        'uploaded_f7ee5c6457775ac0790a74d9afdc9150',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Mt Pleasant", "Zip Code": 29464.0, "Latitude": 32.813518, "Longitude": -79.858999, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.813518, "lng": -79.858999, "phone": null, "country": null, "city": "Mt Pleasant", "state": "SC", "postal_code": 29464.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f42bcfa959cd51933ac84c6d0c00f68c',
        'OGH Imaging',
        '1341 I-49 South Service Road',
        30.419571,
        -92.047532,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(337) 662-0033',
        NULL,
        'United States',
        'Grand Coteau',
        'LA',
        '70541.0',
        'uploaded',
        'uploaded_f42bcfa959cd51933ac84c6d0c00f68c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "OGH Imaging", "Address": "1341 I-49 South Service Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(337) 662-0033", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Grand Coteau", "Zip Code": 70541.0, "Latitude": 30.419571, "Longitude": -92.047532, "State": "LA", "zipcode UTC": -6.0, "name": "OGH Imaging", "address": "1341 I-49 South Service Road", "lat": 30.419571, "lng": -92.047532, "phone": "(337) 662-0033", "country": "United States", "city": "Grand Coteau", "state": "LA", "postal_code": 70541.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9f6ef77bdb625995f71f1b85dc419eb2',
        'Central Maine Imaging Center',
        '287 Main Street, Ste. 100',
        44.094773,
        -70.191417,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(207) 795-2030',
        NULL,
        'United States',
        'Lewiston',
        'ME',
        '4240.0',
        'uploaded',
        'uploaded_9f6ef77bdb625995f71f1b85dc419eb2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Central Maine Imaging Center", "Address": "287 Main Street, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 7:00pm", "Phone Number": "(207) 795-2030", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lewiston", "Zip Code": 4240.0, "Latitude": 44.094773, "Longitude": -70.191417, "State": "ME", "zipcode UTC": -5.0, "name": "Central Maine Imaging Center", "address": "287 Main Street, Ste. 100", "lat": 44.094773, "lng": -70.191417, "phone": "(207) 795-2030", "country": "United States", "city": "Lewiston", "state": "ME", "postal_code": 4240.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_2290d5fa1cd98087d14c70e4165f9f49',
        'West Valley Imaging',
        '2611 W. Horizon Ridge Parkway',
        35.979863,
        -115.098958,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(702) 990-7240',
        NULL,
        'United States',
        'Henderson',
        'NV',
        '89052.0',
        'uploaded',
        'uploaded_2290d5fa1cd98087d14c70e4165f9f49',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "West Valley Imaging", "Address": "2611 W. Horizon Ridge Parkway", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(702) 990-7240", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Henderson", "Zip Code": 89052.0, "Latitude": 35.979863, "Longitude": -115.098958, "State": "NV", "zipcode UTC": -8.0, "name": "West Valley Imaging", "address": "2611 W. Horizon Ridge Parkway", "lat": 35.979863, "lng": -115.098958, "phone": "(702) 990-7240", "country": "United States", "city": "Henderson", "state": "NV", "postal_code": 89052.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_a408c2f4d481a8eca34b82283a4c302f',
        'West Valley Imaging',
        '3025 S. Rainbow Bouldvard',
        36.141119,
        -115.224934,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(702) 222-3544',
        NULL,
        'United States',
        'Las Vegas',
        'NV',
        '89146.0',
        'uploaded',
        'uploaded_a408c2f4d481a8eca34b82283a4c302f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "West Valley Imaging", "Address": "3025 S. Rainbow Bouldvard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(702) 222-3544", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Las Vegas", "Zip Code": 89146.0, "Latitude": 36.141119, "Longitude": -115.224934, "State": "NV", "zipcode UTC": -8.0, "name": "West Valley Imaging", "address": "3025 S. Rainbow Bouldvard", "lat": 36.141119, "lng": -115.224934, "phone": "(702) 222-3544", "country": "United States", "city": "Las Vegas", "state": "NV", "postal_code": 89146.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_2c78201f4f177d894d2a0c352b21fb3e',
        'Summit Imaging',
        '821 Lexington Road',
        34.432846,
        -103.225899,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(575) 763-6144',
        NULL,
        'United States',
        'Cannon Afb',
        'NM',
        '88101.0',
        'uploaded',
        'uploaded_2c78201f4f177d894d2a0c352b21fb3e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Summit Imaging", "Address": "821 Lexington Road", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(575) 763-6144", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Cannon Afb", "Zip Code": 88101.0, "Latitude": 34.432846, "Longitude": -103.225899, "State": "NM", "zipcode UTC": -7.0, "name": "Summit Imaging", "address": "821 Lexington Road", "lat": 34.432846, "lng": -103.225899, "phone": "(575) 763-6144", "country": "United States", "city": "Cannon Afb", "state": "NM", "postal_code": 88101.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5ac2d9cacebd3002dcd6c72f0e6124ce',
        'nan',
        'nan',
        34.432846,
        -103.225899,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Cannon Air Force Base',
        'NM',
        '88101.0',
        'uploaded',
        'uploaded_5ac2d9cacebd3002dcd6c72f0e6124ce',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Cannon Air Force Base", "Zip Code": 88101.0, "Latitude": 34.432846, "Longitude": -103.225899, "State": "NM", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 34.432846, "lng": -103.225899, "phone": null, "country": null, "city": "Cannon Air Force Base", "state": "NM", "postal_code": 88101.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_35374d0fd9e73087675e36e6d9d53c43',
        'MemorialCare Imaging Center',
        '675 Camino de los Mares, Ste. 1',
        33.462927,
        -117.624147,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(949) 493-8799 x5',
        NULL,
        'United States',
        'San Clemente',
        'CA',
        '92673.0',
        'uploaded',
        'uploaded_35374d0fd9e73087675e36e6d9d53c43',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MemorialCare Imaging Center", "Address": "675 Camino de los Mares, Ste. 1", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(949) 493-8799 x5", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Clemente", "Zip Code": 92673.0, "Latitude": 33.462927, "Longitude": -117.624147, "State": "CA", "zipcode UTC": -8.0, "name": "MemorialCare Imaging Center", "address": "675 Camino de los Mares, Ste. 1", "lat": 33.462927, "lng": -117.624147, "phone": "(949) 493-8799 x5", "country": "United States", "city": "San Clemente", "state": "CA", "postal_code": 92673.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_eaed91ffdf9f9b864e48f1c990b1ffb3',
        'Diagnostic Imaging Associates',
        '207 Jefferson Street',
        32.031067,
        -93.685855,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(318) 872-4610',
        NULL,
        'United States',
        'Mansfield',
        'LA',
        '71052.0',
        'uploaded',
        'uploaded_eaed91ffdf9f9b864e48f1c990b1ffb3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Diagnostic Imaging Associates", "Address": "207 Jefferson Street", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(318) 872-4610", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Mansfield", "Zip Code": 71052.0, "Latitude": 32.031067, "Longitude": -93.685855, "State": "LA", "zipcode UTC": -6.0, "name": "Diagnostic Imaging Associates", "address": "207 Jefferson Street", "lat": 32.031067, "lng": -93.685855, "phone": "(318) 872-4610", "country": "United States", "city": "Mansfield", "state": "LA", "postal_code": 71052.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_044919915f75e54a568abbbda7887d3e',
        'Western KY Technical Imaging',
        '1102 South Virginia Street',
        36.866845,
        -87.476178,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(270) 707-1141',
        NULL,
        'United States',
        'Hopkinsville',
        'KY',
        '42240.0',
        'uploaded',
        'uploaded_044919915f75e54a568abbbda7887d3e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Western KY Technical Imaging", "Address": "1102 South Virginia Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 5:00pm", "Phone Number": "(270) 707-1141", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Hopkinsville", "Zip Code": 42240.0, "Latitude": 36.866845, "Longitude": -87.476178, "State": "KY", "zipcode UTC": -6.0, "name": "Western KY Technical Imaging", "address": "1102 South Virginia Street", "lat": 36.866845, "lng": -87.476178, "phone": "(270) 707-1141", "country": "United States", "city": "Hopkinsville", "state": "KY", "postal_code": 42240.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9a8e7455d92bdb88112fd866e937d4f9',
        'Pine Bluff Imaging Center',
        '1600 West 40th Avenue',
        34.189398,
        -92.044951,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(870) 554-1710 x0',
        NULL,
        'United States',
        'Pine Bluff',
        'AR',
        '71603.0',
        'uploaded',
        'uploaded_9a8e7455d92bdb88112fd866e937d4f9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Pine Bluff Imaging Center", "Address": "1600 West 40th Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(870) 554-1710 x0", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Pine Bluff", "Zip Code": 71603.0, "Latitude": 34.189398, "Longitude": -92.044951, "State": "AR", "zipcode UTC": -6.0, "name": "Pine Bluff Imaging Center", "address": "1600 West 40th Avenue", "lat": 34.189398, "lng": -92.044951, "phone": "(870) 554-1710 x0", "country": "United States", "city": "Pine Bluff", "state": "AR", "postal_code": 71603.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_52e345f8a47daad3e68eb309ce00620d',
        'San Jose Imaging Center',
        '9872 San Jose Boulevard',
        30.192434,
        -81.605972,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(904) 268-1080',
        NULL,
        'United States',
        'Jacksonville',
        'FL',
        '32257.0',
        'uploaded',
        'uploaded_52e345f8a47daad3e68eb309ce00620d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "San Jose Imaging Center", "Address": "9872 San Jose Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(904) 268-1080", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Jacksonville", "Zip Code": 32257.0, "Latitude": 30.192434, "Longitude": -81.605972, "State": "FL", "zipcode UTC": -5.0, "name": "San Jose Imaging Center", "address": "9872 San Jose Boulevard", "lat": 30.192434, "lng": -81.605972, "phone": "(904) 268-1080", "country": "United States", "city": "Jacksonville", "state": "FL", "postal_code": 32257.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6ddffb4d357270f20725b5679525e34d',
        'nan',
        'nan',
        30.192434,
        -81.605972,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Jax',
        'FL',
        '32257.0',
        'uploaded',
        'uploaded_6ddffb4d357270f20725b5679525e34d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Jax", "Zip Code": 32257.0, "Latitude": 30.192434, "Longitude": -81.605972, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 30.192434, "lng": -81.605972, "phone": null, "country": null, "city": "Jax", "state": "FL", "postal_code": 32257.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_746b4e88efb76a798f984fdacdc631b9',
        'Virginia Physicians Imaging Center',
        '4900 Cox Road, Ste. 100',
        37.661647,
        -77.526326,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(804) 346-1741',
        NULL,
        'United States',
        'Glen Allen',
        'VA',
        '23060.0',
        'uploaded',
        'uploaded_746b4e88efb76a798f984fdacdc631b9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Virginia Physicians Imaging Center", "Address": "4900 Cox Road, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:40am - 4:00pm", "Phone Number": "(804) 346-1741", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Glen Allen", "Zip Code": 23060.0, "Latitude": 37.661647, "Longitude": -77.526326, "State": "VA", "zipcode UTC": -5.0, "name": "Virginia Physicians Imaging Center", "address": "4900 Cox Road, Ste. 100", "lat": 37.661647, "lng": -77.526326, "phone": "(804) 346-1741", "country": "United States", "city": "Glen Allen", "state": "VA", "postal_code": 23060.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_865d1906037aa2eb9d5c59bcc7790dfd',
        'nan',
        'nan',
        37.661647,
        -77.526326,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Glen Allenw',
        'VA',
        '23060.0',
        'uploaded',
        'uploaded_865d1906037aa2eb9d5c59bcc7790dfd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Glen Allenw", "Zip Code": 23060.0, "Latitude": 37.661647, "Longitude": -77.526326, "State": "VA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 37.661647, "lng": -77.526326, "phone": null, "country": null, "city": "Glen Allenw", "state": "VA", "postal_code": 23060.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7b5c07f73e4cfb698b517820fb5f4e06',
        'Women’s Imaging Center',
        '3773 Cherry Creek North Drive, Ste. 101',
        39.706535,
        -104.966986,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(303) 321-2273',
        NULL,
        'United States',
        'Denver',
        'CO',
        '80209.0',
        'uploaded',
        'uploaded_7b5c07f73e4cfb698b517820fb5f4e06',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Women\u2019s Imaging Center", "Address": "3773 Cherry Creek North Drive, Ste. 101", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:00pm", "Phone Number": "(303) 321-2273", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Denver", "Zip Code": 80209.0, "Latitude": 39.706535, "Longitude": -104.966986, "State": "CO", "zipcode UTC": -7.0, "name": "Women\u2019s Imaging Center", "address": "3773 Cherry Creek North Drive, Ste. 101", "lat": 39.706535, "lng": -104.966986, "phone": "(303) 321-2273", "country": "United States", "city": "Denver", "state": "CO", "postal_code": 80209.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_a1a1d471ec4a3a3539145c037abf03c6',
        'Appomottox Imaging',
        '930 South Avenue, Ste. 101',
        37.265403,
        -77.404389,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(804) 524-2345',
        NULL,
        'United States',
        'Colonial Heights',
        'VA',
        '23834.0',
        'uploaded',
        'uploaded_a1a1d471ec4a3a3539145c037abf03c6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Appomottox Imaging", "Address": "930 South Avenue, Ste. 101", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(804) 524-2345", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Colonial Heights", "Zip Code": 23834.0, "Latitude": 37.265403, "Longitude": -77.404389, "State": "VA", "zipcode UTC": -5.0, "name": "Appomottox Imaging", "address": "930 South Avenue, Ste. 101", "lat": 37.265403, "lng": -77.404389, "phone": "(804) 524-2345", "country": "United States", "city": "Colonial Heights", "state": "VA", "postal_code": 23834.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6a006b8dff7054801fc23b1900bc2187',
        'nan',
        'nan',
        37.265403,
        -77.404389,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Colonial Hgts',
        'VA',
        '23834.0',
        'uploaded',
        'uploaded_6a006b8dff7054801fc23b1900bc2187',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Colonial Hgts", "Zip Code": 23834.0, "Latitude": 37.265403, "Longitude": -77.404389, "State": "VA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 37.265403, "lng": -77.404389, "phone": null, "country": null, "city": "Colonial Hgts", "state": "VA", "postal_code": 23834.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_dad6057a56017ebfa15906a64fc21f18',
        'Short Pump Imaging, LLC',
        '9930 Independence Park Drive, Ste. 100',
        37.622465,
        -77.619652,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(804) 217-9729',
        NULL,
        'United States',
        'Richmond',
        'VA',
        '23233.0',
        'uploaded',
        'uploaded_dad6057a56017ebfa15906a64fc21f18',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Short Pump Imaging, LLC", "Address": "9930 Independence Park Drive, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(804) 217-9729", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Richmond", "Zip Code": 23233.0, "Latitude": 37.622465, "Longitude": -77.619652, "State": "VA", "zipcode UTC": -5.0, "name": "Short Pump Imaging, LLC", "address": "9930 Independence Park Drive, Ste. 100", "lat": 37.622465, "lng": -77.619652, "phone": "(804) 217-9729", "country": "United States", "city": "Richmond", "state": "VA", "postal_code": 23233.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5ab6341105ca41b9b685fe3644bd440a',
        'nan',
        'nan',
        37.622465,
        -77.619652,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Ridge',
        'VA',
        '23233.0',
        'uploaded',
        'uploaded_5ab6341105ca41b9b685fe3644bd440a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ridge", "Zip Code": 23233.0, "Latitude": 37.622465, "Longitude": -77.619652, "State": "VA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 37.622465, "lng": -77.619652, "phone": null, "country": null, "city": "Ridge", "state": "VA", "postal_code": 23233.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c15022933f05005983bf12c73d69c0fc',
        'Chesterfield Imaging, LLC',
        '13636 Hull Street Road',
        37.427988,
        -77.648689,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(804) 639-5489',
        NULL,
        'United States',
        'Midlothian',
        'VA',
        '23112.0',
        'uploaded',
        'uploaded_c15022933f05005983bf12c73d69c0fc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Chesterfield Imaging, LLC", "Address": "13636 Hull Street Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(804) 639-5489", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Midlothian", "Zip Code": 23112.0, "Latitude": 37.427988, "Longitude": -77.648689, "State": "VA", "zipcode UTC": -5.0, "name": "Chesterfield Imaging, LLC", "address": "13636 Hull Street Road", "lat": 37.427988, "lng": -77.648689, "phone": "(804) 639-5489", "country": "United States", "city": "Midlothian", "state": "VA", "postal_code": 23112.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b2bdc2491f53a7da8ebe88b01e655f81',
        'Advanced Medical Imaging',
        '2490 West 26th Avenue, Ste. 10A',
        39.767536,
        -105.019736,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(303) 433-9729 x1231',
        NULL,
        'United States',
        'Denver',
        'CO',
        '80211.0',
        'uploaded',
        'uploaded_b2bdc2491f53a7da8ebe88b01e655f81',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Medical Imaging", "Address": "2490 West 26th Avenue, Ste. 10A", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 5:00pm", "Phone Number": "(303) 433-9729 x1231", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Denver", "Zip Code": 80211.0, "Latitude": 39.767536, "Longitude": -105.019736, "State": "CO", "zipcode UTC": -7.0, "name": "Advanced Medical Imaging", "address": "2490 West 26th Avenue, Ste. 10A", "lat": 39.767536, "lng": -105.019736, "phone": "(303) 433-9729 x1231", "country": "United States", "city": "Denver", "state": "CO", "postal_code": 80211.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4432c2f08ec9fae8bd8f3578bf19597e',
        'Rush Breast Imaging Center',
        '1725 West Harrison Street - PB3 - 155',
        41.880682,
        -87.687704,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(312) 563-4512',
        NULL,
        'United States',
        'Chicago',
        'IL',
        '60612.0',
        'uploaded',
        'uploaded_4432c2f08ec9fae8bd8f3578bf19597e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rush Breast Imaging Center", "Address": "1725 West Harrison Street - PB3 - 155", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 4:30pm        Sat 8:00am - 12:00pm", "Phone Number": "(312) 563-4512", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Chicago", "Zip Code": 60612.0, "Latitude": 41.880682, "Longitude": -87.687704, "State": "IL", "zipcode UTC": -6.0, "name": "Rush Breast Imaging Center", "address": "1725 West Harrison Street - PB3 - 155", "lat": 41.880682, "lng": -87.687704, "phone": "(312) 563-4512", "country": "United States", "city": "Chicago", "state": "IL", "postal_code": 60612.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b1782571d721ccf352e7c29e166bb2e9',
        'nan',
        'nan',
        41.880682,
        -87.687704,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Nancy B Jefferson',
        'IL',
        '60612.0',
        'uploaded',
        'uploaded_b1782571d721ccf352e7c29e166bb2e9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Nancy B Jefferson", "Zip Code": 60612.0, "Latitude": 41.880682, "Longitude": -87.687704, "State": "IL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 41.880682, "lng": -87.687704, "phone": null, "country": null, "city": "Nancy B Jefferson", "state": "IL", "postal_code": 60612.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_16f1fe4da767d5fa4eb502ba1d13cf45',
        'Advanced Imaging & Breast Care Center',
        '420 William Street, 2nd Floor',
        41.893031,
        -87.817182,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(708) 488-2300',
        NULL,
        'United States',
        'River Forest',
        'IL',
        '60305.0',
        'uploaded',
        'uploaded_16f1fe4da767d5fa4eb502ba1d13cf45',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Imaging & Breast Care Center", "Address": "420 William Street, 2nd Floor", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 6:00pm      Sat 7:00am - 4:00pm", "Phone Number": "(708) 488-2300", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "River Forest", "Zip Code": 60305.0, "Latitude": 41.893031, "Longitude": -87.817182, "State": "IL", "zipcode UTC": -6.0, "name": "Advanced Imaging & Breast Care Center", "address": "420 William Street, 2nd Floor", "lat": 41.893031, "lng": -87.817182, "phone": "(708) 488-2300", "country": "United States", "city": "River Forest", "state": "IL", "postal_code": 60305.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4afdaff8d34a6278d10ec6ff0f63ccaf',
        'Battlefield Imaging',
        '4700 Battlefield Parkway, Ste. 100',
        34.916552,
        -85.144353,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(706) 806-1100',
        NULL,
        'United States',
        'Ringgold',
        'GA',
        '30736.0',
        'uploaded',
        'uploaded_4afdaff8d34a6278d10ec6ff0f63ccaf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Battlefield Imaging", "Address": "4700 Battlefield Parkway, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 6:00pm", "Phone Number": "(706) 806-1100", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ringgold", "Zip Code": 30736.0, "Latitude": 34.916552, "Longitude": -85.144353, "State": "GA", "zipcode UTC": -5.0, "name": "Battlefield Imaging", "address": "4700 Battlefield Parkway, Ste. 100", "lat": 34.916552, "lng": -85.144353, "phone": "(706) 806-1100", "country": "United States", "city": "Ringgold", "state": "GA", "postal_code": 30736.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5f894c70468dcf6fa400331fb7a24288',
        'Neuroskeletal Imaging Institute ',
        '255 North Skyes Creek Parkway, Ste. 102',
        28.396301,
        -80.701984,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(321) 454-6335',
        NULL,
        'United States',
        'Merritt Is',
        'FL',
        '32953.0',
        'uploaded',
        'uploaded_5f894c70468dcf6fa400331fb7a24288',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Neuroskeletal Imaging Institute ", "Address": "255 North Skyes Creek Parkway, Ste. 102", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(321) 454-6335", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Merritt Is", "Zip Code": 32953.0, "Latitude": 28.396301, "Longitude": -80.701984, "State": "FL", "zipcode UTC": -5.0, "name": "Neuroskeletal Imaging Institute ", "address": "255 North Skyes Creek Parkway, Ste. 102", "lat": 28.396301, "lng": -80.701984, "phone": "(321) 454-6335", "country": "United States", "city": "Merritt Is", "state": "FL", "postal_code": 32953.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c45014dbe40ca417c73695a79859cd5b',
        'nan',
        'nan',
        28.396301,
        -80.701984,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Merritt Island',
        'FL',
        '32953.0',
        'uploaded',
        'uploaded_c45014dbe40ca417c73695a79859cd5b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Merritt Island", "Zip Code": 32953.0, "Latitude": 28.396301, "Longitude": -80.701984, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 28.396301, "lng": -80.701984, "phone": null, "country": null, "city": "Merritt Island", "state": "FL", "postal_code": 32953.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c3f5ac9fce8c6af3b41e2a706094ff78',
        'Breast Imaging Center UMC Health System',
        '602 Indiana Avenue',
        33.62386,
        -101.880574,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(806) 775-8660',
        NULL,
        'United States',
        'Lubbock',
        'TX',
        '79415.0',
        'uploaded',
        'uploaded_c3f5ac9fce8c6af3b41e2a706094ff78',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Breast Imaging Center UMC Health System", "Address": "602 Indiana Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(806) 775-8660", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Lubbock", "Zip Code": 79415.0, "Latitude": 33.62386, "Longitude": -101.880574, "State": "TX", "zipcode UTC": -6.0, "name": "Breast Imaging Center UMC Health System", "address": "602 Indiana Avenue", "lat": 33.62386, "lng": -101.880574, "phone": "(806) 775-8660", "country": "United States", "city": "Lubbock", "state": "TX", "postal_code": 79415.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_1cece1484c2b919c174058eba3766174',
        'Columbus Diagnostic Imaging',
        '790 Creekview Drive',
        39.185341,
        -85.945609,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(812) 376-1000',
        NULL,
        'United States',
        'Columbus',
        'IN',
        '47201.0',
        'uploaded',
        'uploaded_1cece1484c2b919c174058eba3766174',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Columbus Diagnostic Imaging", "Address": "790 Creekview Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 5:30pm", "Phone Number": "(812) 376-1000", "Country": "United States", "Time Zone Display": "EST - Eastern Standard Time", "City": "Columbus", "Zip Code": 47201.0, "Latitude": 39.185341, "Longitude": -85.945609, "State": "IN", "zipcode UTC": -5.0, "name": "Columbus Diagnostic Imaging", "address": "790 Creekview Drive", "lat": 39.185341, "lng": -85.945609, "phone": "(812) 376-1000", "country": "United States", "city": "Columbus", "state": "IN", "postal_code": 47201.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b4adc61f8a58e1fce4b52e81e1c3048c',
        'Meridian Imaging',
        '1203 24th Avenue',
        32.3656,
        -88.7007,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(601) 693-5862',
        NULL,
        'United States',
        'Mdn',
        'MS',
        '39302.0',
        'uploaded',
        'uploaded_b4adc61f8a58e1fce4b52e81e1c3048c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Meridian Imaging", "Address": "1203 24th Avenue", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(601) 693-5862", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Mdn", "Zip Code": 39302.0, "Latitude": 32.3656, "Longitude": -88.7007, "State": "MS", "zipcode UTC": -6.0, "name": "Meridian Imaging", "address": "1203 24th Avenue", "lat": 32.3656, "lng": -88.7007, "phone": "(601) 693-5862", "country": "United States", "city": "Mdn", "state": "MS", "postal_code": 39302.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_789c1ce172e5d4fab6120f02db150349',
        'nan',
        'nan',
        32.3656,
        -88.7007,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Meridian',
        'MS',
        '39302.0',
        'uploaded',
        'uploaded_789c1ce172e5d4fab6120f02db150349',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Meridian", "Zip Code": 39302.0, "Latitude": 32.3656, "Longitude": -88.7007, "State": "MS", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.3656, "lng": -88.7007, "phone": null, "country": null, "city": "Meridian", "state": "MS", "postal_code": 39302.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_1170468543bb1272be0c4b15633a1b43',
        'Trident Medical Imaging',
        '555 Old Norcross Road, Ste 115',
        33.9435,
        -83.9643,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(770) 277-0501',
        NULL,
        'United States',
        'Lawrenceville',
        'GA',
        '30046.0',
        'uploaded',
        'uploaded_1170468543bb1272be0c4b15633a1b43',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Trident Medical Imaging", "Address": "555 Old Norcross Road, Ste 115", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am to 5:30pm", "Phone Number": "(770) 277-0501", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lawrenceville", "Zip Code": 30046.0, "Latitude": 33.9435, "Longitude": -83.9643, "State": "GA", "zipcode UTC": -5.0, "name": "Trident Medical Imaging", "address": "555 Old Norcross Road, Ste 115", "lat": 33.9435, "lng": -83.9643, "phone": "(770) 277-0501", "country": "United States", "city": "Lawrenceville", "state": "GA", "postal_code": 30046.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ef26df5fec018fefbdd99099c23342f0',
        'Diagnostic Imaging Services',
        '4241 VETERANS BOULEVARD, STE. 100',
        30.013985,
        -90.191285,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(504) 459-3222',
        NULL,
        'United States',
        'Metairie',
        'LA',
        '70006.0',
        'uploaded',
        'uploaded_ef26df5fec018fefbdd99099c23342f0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Diagnostic Imaging Services", "Address": "4241 VETERANS BOULEVARD, STE. 100", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(504) 459-3222", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Metairie", "Zip Code": 70006.0, "Latitude": 30.013985, "Longitude": -90.191285, "State": "LA", "zipcode UTC": -6.0, "name": "Diagnostic Imaging Services", "address": "4241 VETERANS BOULEVARD, STE. 100", "lat": 30.013985, "lng": -90.191285, "phone": "(504) 459-3222", "country": "United States", "city": "Metairie", "state": "LA", "postal_code": 70006.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_21ff981f8c9609e3a16b6136638cd501',
        'Motherload Diagnostic Imaging',
        '4301 Northstar Way',
        37.704138,
        -121.021877,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(800) 679-1477',
        NULL,
        'United States',
        'Modesto',
        'CA',
        '95356.0',
        'uploaded',
        'uploaded_21ff981f8c9609e3a16b6136638cd501',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Motherload Diagnostic Imaging", "Address": "4301 Northstar Way", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(800) 679-1477", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Modesto", "Zip Code": 95356.0, "Latitude": 37.704138, "Longitude": -121.021877, "State": "CA", "zipcode UTC": -8.0, "name": "Motherload Diagnostic Imaging", "address": "4301 Northstar Way", "lat": 37.704138, "lng": -121.021877, "phone": "(800) 679-1477", "country": "United States", "city": "Modesto", "state": "CA", "postal_code": 95356.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f62ffafc7ac789814e199045ab7b861d',
        'Mission Medical Imaging',
        '1155 Mission Street Southeast, Ste. 105',
        44.906492,
        -123.051295,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(503) 362-0254 x100',
        NULL,
        'United States',
        'Salem',
        'OR',
        '97302.0',
        'uploaded',
        'uploaded_f62ffafc7ac789814e199045ab7b861d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Mission Medical Imaging", "Address": "1155 Mission Street Southeast, Ste. 105", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 5:00pm", "Phone Number": "(503) 362-0254 x100", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Salem", "Zip Code": 97302.0, "Latitude": 44.906492, "Longitude": -123.051295, "State": "OR", "zipcode UTC": -8.0, "name": "Mission Medical Imaging", "address": "1155 Mission Street Southeast, Ste. 105", "lat": 44.906492, "lng": -123.051295, "phone": "(503) 362-0254 x100", "country": "United States", "city": "Salem", "state": "OR", "postal_code": 97302.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_dd2c0501593767a99806afeaa27cc2d4',
        'Epic Imaging East',
        '233 NE 102nd Ave',
        45.546205,
        -122.560279,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(503) 253-1105',
        NULL,
        'United States',
        'Maywood Park',
        'OR',
        '97220.0',
        'uploaded',
        'uploaded_dd2c0501593767a99806afeaa27cc2d4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Epic Imaging East", "Address": "233 NE 102nd Ave", "Address Two": null, "clinic Hours of Operation": "Mon-Fri:  7:30am-9pm\nSat:  8am-5pm", "Phone Number": "(503) 253-1105", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Maywood Park", "Zip Code": 97220.0, "Latitude": 45.546205, "Longitude": -122.560279, "State": "OR", "zipcode UTC": -8.0, "name": "Epic Imaging East", "address": "233 NE 102nd Ave", "lat": 45.546205, "lng": -122.560279, "phone": "(503) 253-1105", "country": "United States", "city": "Maywood Park", "state": "OR", "postal_code": 97220.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_683f2d44ceae5c44676c84792ffc5785',
        'nan',
        'nan',
        45.546205,
        -122.560279,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Maywood Pk',
        'OR',
        '97220.0',
        'uploaded',
        'uploaded_683f2d44ceae5c44676c84792ffc5785',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Maywood Pk", "Zip Code": 97220.0, "Latitude": 45.546205, "Longitude": -122.560279, "State": "OR", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 45.546205, "lng": -122.560279, "phone": null, "country": null, "city": "Maywood Pk", "state": "OR", "postal_code": 97220.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9c6514b39ecdc56b0b8d37c8f01e2eb2',
        'Chattahoochee Valley Imaging',
        'P.O. Box 279',
        32.777662,
        -85.176236,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(706) 884-2371',
        NULL,
        'United States',
        'Fairfax',
        'AL',
        '36854.0',
        'uploaded',
        'uploaded_9c6514b39ecdc56b0b8d37c8f01e2eb2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Chattahoochee Valley Imaging", "Address": "P.O. Box 279", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(706) 884-2371", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Fairfax", "Zip Code": 36854.0, "Latitude": 32.777662, "Longitude": -85.176236, "State": "AL", "zipcode UTC": -6.0, "name": "Chattahoochee Valley Imaging", "address": "P.O. Box 279", "lat": 32.777662, "lng": -85.176236, "phone": "(706) 884-2371", "country": "United States", "city": "Fairfax", "state": "AL", "postal_code": 36854.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
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
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Langdale", "Zip Code": 36854.0, "Latitude": 32.777662, "Longitude": -85.176236, "State": "AL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.777662, "lng": -85.176236, "phone": null, "country": null, "city": "Langdale", "state": "AL", "postal_code": 36854.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_918b8261a8bc059af0cea51f1df0e3dd',
        'Coastal Diagnostic Imaging',
        '429 Francktoun Road',
        34.781212,
        -77.375607,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(910) 937-7226',
        NULL,
        'United States',
        'Jacksonville',
        'NC',
        '28546.0',
        'uploaded',
        'uploaded_918b8261a8bc059af0cea51f1df0e3dd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Coastal Diagnostic Imaging", "Address": "429 Francktoun Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(910) 937-7226", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Jacksonville", "Zip Code": 28546.0, "Latitude": 34.781212, "Longitude": -77.375607, "State": "NC", "zipcode UTC": -5.0, "name": "Coastal Diagnostic Imaging", "address": "429 Francktoun Road", "lat": 34.781212, "lng": -77.375607, "phone": "(910) 937-7226", "country": "United States", "city": "Jacksonville", "state": "NC", "postal_code": 28546.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_51ce0dde69a26564bf701d7ab580e324',
        'Midwest Center for Advanced Imaging',
        '4355 Montgomery road',
        41.707118,
        -88.196347,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(630) 236-8300',
        NULL,
        'United States',
        'Naperville',
        'IL',
        '60564.0',
        'uploaded',
        'uploaded_51ce0dde69a26564bf701d7ab580e324',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Midwest Center for Advanced Imaging", "Address": "4355 Montgomery road", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(630) 236-8300", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Naperville", "Zip Code": 60564.0, "Latitude": 41.707118, "Longitude": -88.196347, "State": "IL", "zipcode UTC": -6.0, "name": "Midwest Center for Advanced Imaging", "address": "4355 Montgomery road", "lat": 41.707118, "lng": -88.196347, "phone": "(630) 236-8300", "country": "United States", "city": "Naperville", "state": "IL", "postal_code": 60564.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_98f3ea3ed8ed61865f8392089896c25e',
        'Utah Imaging - West Valley',
        '3715 West 4100 South, Ste. 150',
        40.688246,
        -111.998999,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(801) 924-0029',
        NULL,
        'United States',
        'Hunter',
        'UT',
        '84120.0',
        'uploaded',
        'uploaded_98f3ea3ed8ed61865f8392089896c25e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Utah Imaging - West Valley", "Address": "3715 West 4100 South, Ste. 150", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(801) 924-0029", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Hunter", "Zip Code": 84120.0, "Latitude": 40.688246, "Longitude": -111.998999, "State": "UT", "zipcode UTC": -7.0, "name": "Utah Imaging - West Valley", "address": "3715 West 4100 South, Ste. 150", "lat": 40.688246, "lng": -111.998999, "phone": "(801) 924-0029", "country": "United States", "city": "Hunter", "state": "UT", "postal_code": 84120.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9de6cade49dcd3d3c6afae7f29c39c21',
        'nan',
        'nan',
        40.688246,
        -111.998999,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Salt Lake City',
        'UT',
        '84120.0',
        'uploaded',
        'uploaded_9de6cade49dcd3d3c6afae7f29c39c21',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Salt Lake City", "Zip Code": 84120.0, "Latitude": 40.688246, "Longitude": -111.998999, "State": "UT", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 40.688246, "lng": -111.998999, "phone": null, "country": null, "city": "Salt Lake City", "state": "UT", "postal_code": 84120.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_a0ec738a17d43200a40cc45e2c75c034',
        'Blue Mountain Diagnostic Imaging',
        '1100 Southgate, Ste. 7',
        45.665146,
        -118.789007,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(541) 276-2431',
        NULL,
        'United States',
        'Cayuse',
        'OR',
        '97801.0',
        'uploaded',
        'uploaded_a0ec738a17d43200a40cc45e2c75c034',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Blue Mountain Diagnostic Imaging", "Address": "1100 Southgate, Ste. 7", "Address Two": null, "clinic Hours of Operation": "Mon-Thur 8:00am - 5:00pm     Fri 8:00am - 12:00pm", "Phone Number": "(541) 276-2431", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Cayuse", "Zip Code": 97801.0, "Latitude": 45.665146, "Longitude": -118.789007, "State": "OR", "zipcode UTC": -8.0, "name": "Blue Mountain Diagnostic Imaging", "address": "1100 Southgate, Ste. 7", "lat": 45.665146, "lng": -118.789007, "phone": "(541) 276-2431", "country": "United States", "city": "Cayuse", "state": "OR", "postal_code": 97801.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_da0ae5e8cf2affcc8a2471d105f7e6b9',
        'nan',
        'nan',
        45.665146,
        -118.789007,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Pendleton',
        'OR',
        '97801.0',
        'uploaded',
        'uploaded_da0ae5e8cf2affcc8a2471d105f7e6b9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Pendleton", "Zip Code": 97801.0, "Latitude": 45.665146, "Longitude": -118.789007, "State": "OR", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 45.665146, "lng": -118.789007, "phone": null, "country": null, "city": "Pendleton", "state": "OR", "postal_code": 97801.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_32dacec5ee01b560349f138016dea874',
        'Medical Imaging Associates of Idaho Falls',
        '2730 Channing Way',
        43.465998,
        -112.014256,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(208) 542-7100',
        NULL,
        'United States',
        'Idaho Falls',
        'ID',
        '83404.0',
        'uploaded',
        'uploaded_32dacec5ee01b560349f138016dea874',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Medical Imaging Associates of Idaho Falls", "Address": "2730 Channing Way", "Address Two": null, "clinic Hours of Operation": "24 hours", "Phone Number": "(208) 542-7100", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Idaho Falls", "Zip Code": 83404.0, "Latitude": 43.465998, "Longitude": -112.014256, "State": "ID", "zipcode UTC": -7.0, "name": "Medical Imaging Associates of Idaho Falls", "address": "2730 Channing Way", "lat": 43.465998, "lng": -112.014256, "phone": "(208) 542-7100", "country": "United States", "city": "Idaho Falls", "state": "ID", "postal_code": 83404.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3da03a47b1247235adb8bbdc0fde94a0',
        'AAR Imaging Center',
        '1660 N Beauregard St ',
        38.837312,
        -77.120648,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(703) 751-5055',
        NULL,
        'United States',
        'Alexandria',
        'VA',
        '22311.0',
        'uploaded',
        'uploaded_3da03a47b1247235adb8bbdc0fde94a0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "AAR Imaging Center", "Address": "1660 N Beauregard St ", "Address Two": "Suite 200", "clinic Hours of Operation": "Mon - Fri: 8:00am - 5:00pm", "Phone Number": "(703) 751-5055", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Alexandria", "Zip Code": 22311.0, "Latitude": 38.837312, "Longitude": -77.120648, "State": "VA", "zipcode UTC": -5.0, "name": "AAR Imaging Center", "address": "1660 N Beauregard St ", "lat": 38.837312, "lng": -77.120648, "phone": "(703) 751-5055", "country": "United States", "city": "Alexandria", "state": "VA", "postal_code": 22311.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_602025e897b5610981823bbf9e6a6fdf',
        'AAR Imaging Center',
        '4001 Prince William Parkway',
        38.646375,
        -77.344691,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(703) 494-3309',
        NULL,
        'United States',
        'Dale City',
        'VA',
        '22193.0',
        'uploaded',
        'uploaded_602025e897b5610981823bbf9e6a6fdf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "AAR Imaging Center", "Address": "4001 Prince William Parkway", "Address Two": "Ste. 302 and 302B", "clinic Hours of Operation": "Mon - Fri: 7:30am - 5:00pm\nSat: 8:00am - 12:00pm", "Phone Number": "(703) 494-3309", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dale City", "Zip Code": 22193.0, "Latitude": 38.646375, "Longitude": -77.344691, "State": "VA", "zipcode UTC": -5.0, "name": "AAR Imaging Center", "address": "4001 Prince William Parkway", "lat": 38.646375, "lng": -77.344691, "phone": "(703) 494-3309", "country": "United States", "city": "Dale City", "state": "VA", "postal_code": 22193.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f18040f0e31ae29cedf0d3465e349326',
        'Peoria Imaging',
        '6708 North Knoxville Avenue',
        40.755343,
        -89.597999,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(309) 692-7674',
        NULL,
        'United States',
        'Peoria',
        'IL',
        '61614.0',
        'uploaded',
        'uploaded_f18040f0e31ae29cedf0d3465e349326',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Peoria Imaging", "Address": "6708 North Knoxville Avenue", "Address Two": "Ste. 2", "clinic Hours of Operation": "Mon-Fri 7:00am - 6:00pm   ", "Phone Number": "(309) 692-7674", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Peoria", "Zip Code": 61614.0, "Latitude": 40.755343, "Longitude": -89.597999, "State": "IL", "zipcode UTC": -6.0, "name": "Peoria Imaging", "address": "6708 North Knoxville Avenue", "lat": 40.755343, "lng": -89.597999, "phone": "(309) 692-7674", "country": "United States", "city": "Peoria", "state": "IL", "postal_code": 61614.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c456fad1a9ae2f651db5c80501c601ef',
        'nan',
        'nan',
        40.755343,
        -89.597999,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Pottstown',
        'IL',
        '61614.0',
        'uploaded',
        'uploaded_c456fad1a9ae2f651db5c80501c601ef',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Pottstown", "Zip Code": 61614.0, "Latitude": 40.755343, "Longitude": -89.597999, "State": "IL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 40.755343, "lng": -89.597999, "phone": null, "country": null, "city": "Pottstown", "state": "IL", "postal_code": 61614.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_cc45c9257779ff11e8e3d6fd120d7493',
        'Grossman Imaging Center',
        '2001 Solar Drive',
        34.2301,
        -119.1771,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(805) 988-0616',
        NULL,
        'United States',
        'Oxnard',
        'CA',
        '93036.0',
        'uploaded',
        'uploaded_cc45c9257779ff11e8e3d6fd120d7493',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Grossman Imaging Center", "Address": "2001 Solar Drive", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(805) 988-0616", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Oxnard", "Zip Code": 93036.0, "Latitude": 34.2301, "Longitude": -119.1771, "State": "CA", "zipcode UTC": -8.0, "name": "Grossman Imaging Center", "address": "2001 Solar Drive", "lat": 34.2301, "lng": -119.1771, "phone": "(805) 988-0616", "country": "United States", "city": "Oxnard", "state": "CA", "postal_code": 93036.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_2d3e7a90b81eaa7f07ba1dba63e7f5ee',
        'Diagnostic Imaging, L.L.C.',
        '1211 West Medical Park Drive',
        33.475936,
        -82.069702,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(706) 364-2603',
        NULL,
        'United States',
        'Augusta',
        'GA',
        '30909.0',
        'uploaded',
        'uploaded_2d3e7a90b81eaa7f07ba1dba63e7f5ee',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Diagnostic Imaging, L.L.C.", "Address": "1211 West Medical Park Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm", "Phone Number": "(706) 364-2603", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Augusta", "Zip Code": 30909.0, "Latitude": 33.475936, "Longitude": -82.069702, "State": "GA", "zipcode UTC": -5.0, "name": "Diagnostic Imaging, L.L.C.", "address": "1211 West Medical Park Drive", "lat": 33.475936, "lng": -82.069702, "phone": "(706) 364-2603", "country": "United States", "city": "Augusta", "state": "GA", "postal_code": 30909.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_42917ef293be1faa5568a1fc21b728a4',
        'nan',
        'nan',
        33.475936,
        -82.069702,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Forest Hills',
        'GA',
        '30909.0',
        'uploaded',
        'uploaded_42917ef293be1faa5568a1fc21b728a4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Forest Hills", "Zip Code": 30909.0, "Latitude": 33.475936, "Longitude": -82.069702, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 33.475936, "lng": -82.069702, "phone": null, "country": null, "city": "Forest Hills", "state": "GA", "postal_code": 30909.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_83432cd22b32cac2a7091be9dfabfc4c',
        'Affiliates In Imaging',
        'P.O. Box 1109',
        37.895695,
        -122.117852,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(925) 274-4900',
        NULL,
        'United States',
        'Lafayette',
        'CA',
        '94549.0',
        'uploaded',
        'uploaded_83432cd22b32cac2a7091be9dfabfc4c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Affiliates In Imaging", "Address": "P.O. Box 1109", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 4:00pm", "Phone Number": "(925) 274-4900", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Lafayette", "Zip Code": 94549.0, "Latitude": 37.895695, "Longitude": -122.117852, "State": "CA", "zipcode UTC": -8.0, "name": "Affiliates In Imaging", "address": "P.O. Box 1109", "lat": 37.895695, "lng": -122.117852, "phone": "(925) 274-4900", "country": "United States", "city": "Lafayette", "state": "CA", "postal_code": 94549.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_8759ab9660c871a646de7dd56f446019',
        'Weinstein Imaging Associates',
        '5850 Centre Ave',
        40.468968,
        -79.918639,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(412) 441-1161',
        NULL,
        'United States',
        'East Liberty',
        'PA',
        '15206.0',
        'uploaded',
        'uploaded_8759ab9660c871a646de7dd56f446019',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Weinstein Imaging Associates", "Address": "5850 Centre Ave", "Address Two": null, "clinic Hours of Operation": "Mon - Fri:  7:30am - 4:30pm", "Phone Number": "(412) 441-1161", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "East Liberty", "Zip Code": 15206.0, "Latitude": 40.468968, "Longitude": -79.918639, "State": "PA", "zipcode UTC": -5.0, "name": "Weinstein Imaging Associates", "address": "5850 Centre Ave", "lat": 40.468968, "lng": -79.918639, "phone": "(412) 441-1161", "country": "United States", "city": "East Liberty", "state": "PA", "postal_code": 15206.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
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
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Pittsburgh", "Zip Code": 15206.0, "Latitude": 40.468968, "Longitude": -79.918639, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.468968, "lng": -79.918639, "phone": null, "country": null, "city": "Pittsburgh", "state": "PA", "postal_code": 15206.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_92d278af01714f6aa5ed332dbeeba495',
        'Weinstein Imaging Associates',
        '5500 Corporate Dr',
        40.552768,
        -80.032276,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(412) 630-2649',
        NULL,
        'United States',
        'Mc Knight',
        'PA',
        '15237.0',
        'uploaded',
        'uploaded_92d278af01714f6aa5ed332dbeeba495',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Weinstein Imaging Associates", "Address": "5500 Corporate Dr", "Address Two": "Ste 100", "clinic Hours of Operation": null, "Phone Number": "(412) 630-2649", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Mc Knight", "Zip Code": 15237.0, "Latitude": 40.552768, "Longitude": -80.032276, "State": "PA", "zipcode UTC": -5.0, "name": "Weinstein Imaging Associates", "address": "5500 Corporate Dr", "lat": 40.552768, "lng": -80.032276, "phone": "(412) 630-2649", "country": "United States", "city": "Mc Knight", "state": "PA", "postal_code": 15237.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3d1bcaa506bdffd7a631834cc5b49823',
        'nan',
        'nan',
        40.552768,
        -80.032276,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Mcknight',
        'PA',
        '15237.0',
        'uploaded',
        'uploaded_3d1bcaa506bdffd7a631834cc5b49823',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Mcknight", "Zip Code": 15237.0, "Latitude": 40.552768, "Longitude": -80.032276, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.552768, "lng": -80.032276, "phone": null, "country": null, "city": "Mcknight", "state": "PA", "postal_code": 15237.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7ccef8113e51444662f1372101c50b83',
        'Weinstein Imaging Associates',
        '1910 Cochran Rd',
        40.430822,
        -80.04453,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(412) 440-6999',
        NULL,
        'United States',
        'Pgh',
        'PA',
        '15220.0',
        'uploaded',
        'uploaded_7ccef8113e51444662f1372101c50b83',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Weinstein Imaging Associates", "Address": "1910 Cochran Rd", "Address Two": "Ste 740", "clinic Hours of Operation": null, "Phone Number": "(412) 440-6999", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Pgh", "Zip Code": 15220.0, "Latitude": 40.430822, "Longitude": -80.04453, "State": "PA", "zipcode UTC": -5.0, "name": "Weinstein Imaging Associates", "address": "1910 Cochran Rd", "lat": 40.430822, "lng": -80.04453, "phone": "(412) 440-6999", "country": "United States", "city": "Pgh", "state": "PA", "postal_code": 15220.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7373ed9249c340f673f558f6caf14df8',
        'nan',
        'nan',
        40.430822,
        -80.04453,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Pitt',
        'PA',
        '15220.0',
        'uploaded',
        'uploaded_7373ed9249c340f673f558f6caf14df8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Pitt", "Zip Code": 15220.0, "Latitude": 40.430822, "Longitude": -80.04453, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.430822, "lng": -80.04453, "phone": null, "country": null, "city": "Pitt", "state": "PA", "postal_code": 15220.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ebad54c91ad856ed2870cda6fc08d6b3',
        'Breast Imaging Specialists',
        '15195 National Ave',
        37.241193,
        -121.953402,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(408) 800-5247',
        NULL,
        'United States',
        'Los Gatos',
        'CA',
        '95032.0',
        'uploaded',
        'uploaded_ebad54c91ad856ed2870cda6fc08d6b3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Breast Imaging Specialists", "Address": "15195 National Ave", "Address Two": "#201", "clinic Hours of Operation": "Mon-Fri:  8am-5pm\nSat:  every 2nd and 4th", "Phone Number": "(408) 800-5247", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Los Gatos", "Zip Code": 95032.0, "Latitude": 37.241193, "Longitude": -121.953402, "State": "CA", "zipcode UTC": -8.0, "name": "Breast Imaging Specialists", "address": "15195 National Ave", "lat": 37.241193, "lng": -121.953402, "phone": "(408) 800-5247", "country": "United States", "city": "Los Gatos", "state": "CA", "postal_code": 95032.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7b6db4d7cfb4f21e2962f1a69e60b265',
        'Women’s Imaging',
        '6107 N. Fresno St',
        36.825582,
        -119.763581,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(559) 435-4433',
        NULL,
        'United States',
        'Fresno',
        'CA',
        '93710.0',
        'uploaded',
        'uploaded_7b6db4d7cfb4f21e2962f1a69e60b265',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Women\u2019s Imaging", "Address": "6107 N. Fresno St", "Address Two": "# 101", "clinic Hours of Operation": "Mon-Fri:  7am-5:30pm", "Phone Number": "(559) 435-4433", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Fresno", "Zip Code": 93710.0, "Latitude": 36.825582, "Longitude": -119.763581, "State": "CA", "zipcode UTC": -8.0, "name": "Women\u2019s Imaging", "address": "6107 N. Fresno St", "lat": 36.825582, "lng": -119.763581, "phone": "(559) 435-4433", "country": "United States", "city": "Fresno", "state": "CA", "postal_code": 93710.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_46be04827b699fe748a93ae6b839cfa1',
        'Preferred Imaging of Plano',
        '2205 N. Central Expressway',
        33.024721,
        -96.740389,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(972) 312-0799',
        NULL,
        'United States',
        'Plano',
        'TX',
        '75075.0',
        'uploaded',
        'uploaded_46be04827b699fe748a93ae6b839cfa1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Preferred Imaging of Plano", "Address": "2205 N. Central Expressway", "Address Two": "Suite 185", "clinic Hours of Operation": null, "Phone Number": "(972) 312-0799", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Plano", "Zip Code": 75075.0, "Latitude": 33.024721, "Longitude": -96.740389, "State": "TX", "zipcode UTC": -6.0, "name": "Preferred Imaging of Plano", "address": "2205 N. Central Expressway", "lat": 33.024721, "lng": -96.740389, "phone": "(972) 312-0799", "country": "United States", "city": "Plano", "state": "TX", "postal_code": 75075.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3df232def76e72605ac910b6f0afe3c9',
        'Houston Medical Imaging',
        '427 W 20th St',
        29.735529,
        -95.41405,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(713) 797-1919',
        NULL,
        'United States',
        'Houston',
        'TX',
        '77098.0',
        'uploaded',
        'uploaded_3df232def76e72605ac910b6f0afe3c9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Houston Medical Imaging", "Address": "427 W 20th St", "Address Two": "Ste. 401", "clinic Hours of Operation": null, "Phone Number": "(713) 797-1919", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Houston", "Zip Code": 77098.0, "Latitude": 29.735529, "Longitude": -95.41405, "State": "TX", "zipcode UTC": -6.0, "name": "Houston Medical Imaging", "address": "427 W 20th St", "lat": 29.735529, "lng": -95.41405, "phone": "(713) 797-1919", "country": "United States", "city": "Houston", "state": "TX", "postal_code": 77098.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ffadb8bead69c704a2a12aed3d1b8dc2',
        'Huntington Beach Diagnostic Imaging & Breast Center',
        '17822 Beach Blvd',
        33.725167,
        -118.005099,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(714) 842-5337',
        NULL,
        'United States',
        'Huntingtn Bch',
        'CA',
        '92647.0',
        'uploaded',
        'uploaded_ffadb8bead69c704a2a12aed3d1b8dc2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Huntington Beach Diagnostic Imaging & Breast Center", "Address": "17822 Beach Blvd", "Address Two": "Ste 101", "clinic Hours of Operation": null, "Phone Number": "(714) 842-5337", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Huntingtn Bch", "Zip Code": 92647.0, "Latitude": 33.725167, "Longitude": -118.005099, "State": "CA", "zipcode UTC": -8.0, "name": "Huntington Beach Diagnostic Imaging & Breast Center", "address": "17822 Beach Blvd", "lat": 33.725167, "lng": -118.005099, "phone": "(714) 842-5337", "country": "United States", "city": "Huntingtn Bch", "state": "CA", "postal_code": 92647.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5aef1224e1e2659e15988a72fda46d14',
        'nan',
        'nan',
        33.725167,
        -118.005099,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Huntington Beach',
        'CA',
        '92647.0',
        'uploaded',
        'uploaded_5aef1224e1e2659e15988a72fda46d14',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Huntington Beach", "Zip Code": 92647.0, "Latitude": 33.725167, "Longitude": -118.005099, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 33.725167, "lng": -118.005099, "phone": null, "country": null, "city": "Huntington Beach", "state": "CA", "postal_code": 92647.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_056f736a86b00ff2e6983262002ded32',
        'Hazleton Imaging',
        '101 S Church St',
        40.958434,
        -75.985196,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(570) 501-7226',
        NULL,
        'United States',
        'Hazle Township',
        'PA',
        '18201.0',
        'uploaded',
        'uploaded_056f736a86b00ff2e6983262002ded32',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Hazleton Imaging", "Address": "101 S Church St", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(570) 501-7226", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hazle Township", "Zip Code": 18201.0, "Latitude": 40.958434, "Longitude": -75.985196, "State": "PA", "zipcode UTC": -5.0, "name": "Hazleton Imaging", "address": "101 S Church St", "lat": 40.958434, "lng": -75.985196, "phone": "(570) 501-7226", "country": "United States", "city": "Hazle Township", "state": "PA", "postal_code": 18201.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d1355805111ebc1af8976b39008ef00b',
        'nan',
        'nan',
        40.958434,
        -75.985196,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Hazle Townshp',
        'PA',
        '18201.0',
        'uploaded',
        'uploaded_d1355805111ebc1af8976b39008ef00b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hazle Townshp", "Zip Code": 18201.0, "Latitude": 40.958434, "Longitude": -75.985196, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.958434, "lng": -75.985196, "phone": null, "country": null, "city": "Hazle Townshp", "state": "PA", "postal_code": 18201.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_006e8110518059e49c9da8373c328790',
        'Utah Imaging Associates',
        '1433 N 1075 W',
        40.988347,
        -111.888476,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(801) 298-1300',
        NULL,
        'United States',
        'Farmington',
        'UT',
        '84025.0',
        'uploaded',
        'uploaded_006e8110518059e49c9da8373c328790',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Utah Imaging Associates", "Address": "1433 N 1075 W", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(801) 298-1300", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Farmington", "Zip Code": 84025.0, "Latitude": 40.988347, "Longitude": -111.888476, "State": "UT", "zipcode UTC": -7.0, "name": "Utah Imaging Associates", "address": "1433 N 1075 W", "lat": 40.988347, "lng": -111.888476, "phone": "(801) 298-1300", "country": "United States", "city": "Farmington", "state": "UT", "postal_code": 84025.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_0714fe4a14b490e39a6240c805f3b908',
        'Imaging Center of Columbus',
        '2526 N 5th St',
        33.581599,
        -88.432978,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(662) 328-8402',
        NULL,
        'United States',
        'Columbus',
        'MS',
        '39705.0',
        'uploaded',
        'uploaded_0714fe4a14b490e39a6240c805f3b908',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Imaging Center of Columbus", "Address": "2526 N 5th St", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(662) 328-8402", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Columbus", "Zip Code": 39705.0, "Latitude": 33.581599, "Longitude": -88.432978, "State": "MS", "zipcode UTC": -6.0, "name": "Imaging Center of Columbus", "address": "2526 N 5th St", "lat": 33.581599, "lng": -88.432978, "phone": "(662) 328-8402", "country": "United States", "city": "Columbus", "state": "MS", "postal_code": 39705.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_daf30253ddfa18d04b20cb76c66c54d9',
        'Women’s Imaging & Intervention',
        '17050 Pilkington Rd',
        45.41387,
        -122.72492,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(503) 305-5432',
        NULL,
        'United States',
        'Lake Grove',
        'OR',
        '97035.0',
        'uploaded',
        'uploaded_daf30253ddfa18d04b20cb76c66c54d9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Women\u2019s Imaging & Intervention", "Address": "17050 Pilkington Rd", "Address Two": "Ste 130", "clinic Hours of Operation": "Mon-Fri:  8am-5pm", "Phone Number": "(503) 305-5432", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Lake Grove", "Zip Code": 97035.0, "Latitude": 45.41387, "Longitude": -122.72492, "State": "OR", "zipcode UTC": -8.0, "name": "Women\u2019s Imaging & Intervention", "address": "17050 Pilkington Rd", "lat": 45.41387, "lng": -122.72492, "phone": "(503) 305-5432", "country": "United States", "city": "Lake Grove", "state": "OR", "postal_code": 97035.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_a7fe27b630ddeb50c59cd776f3efa295',
        'nan',
        'nan',
        45.41387,
        -122.72492,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Lake Oswego',
        'OR',
        '97035.0',
        'uploaded',
        'uploaded_a7fe27b630ddeb50c59cd776f3efa295',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Lake Oswego", "Zip Code": 97035.0, "Latitude": 45.41387, "Longitude": -122.72492, "State": "OR", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 45.41387, "lng": -122.72492, "phone": null, "country": null, "city": "Lake Oswego", "state": "OR", "postal_code": 97035.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_665e25989257cf237b3e33e1c348cd65',
        'Evans Imaging Center',
        '4350 Evans Town Center Dr',
        33.551145,
        -82.139498,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(706) 868-3940',
        NULL,
        'United States',
        'Evans',
        'GA',
        '30809.0',
        'uploaded',
        'uploaded_665e25989257cf237b3e33e1c348cd65',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Evans Imaging Center", "Address": "4350 Evans Town Center Dr", "Address Two": "Ste 1000", "clinic Hours of Operation": "Mon-Fri:  8am-5pm", "Phone Number": "(706) 868-3940", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Evans", "Zip Code": 30809.0, "Latitude": 33.551145, "Longitude": -82.139498, "State": "GA", "zipcode UTC": -5.0, "name": "Evans Imaging Center", "address": "4350 Evans Town Center Dr", "lat": 33.551145, "lng": -82.139498, "phone": "(706) 868-3940", "country": "United States", "city": "Evans", "state": "GA", "postal_code": 30809.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_0b10afeb67af97b7e1a3da63a95a836d',
        'Avestée Women''s Imaging Center',
        '303 W Sunset',
        29.48618,
        -98.456809,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(210) 826-2666',
        NULL,
        'United States',
        'Alamo Heights',
        'TX',
        '78209.0',
        'uploaded',
        'uploaded_0b10afeb67af97b7e1a3da63a95a836d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Avest\u00e9e Women''s Imaging Center", "Address": "303 W Sunset", "Address Two": "Suite 200", "clinic Hours of Operation": "Mon-Fri:  7:30am-5:30pm\nSat-Sun:  CLOSED", "Phone Number": "(210) 826-2666", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Alamo Heights", "Zip Code": 78209.0, "Latitude": 29.48618, "Longitude": -98.456809, "State": "TX", "zipcode UTC": -6.0, "name": "Avest\u00e9e Women''s Imaging Center", "address": "303 W Sunset", "lat": 29.48618, "lng": -98.456809, "phone": "(210) 826-2666", "country": "United States", "city": "Alamo Heights", "state": "TX", "postal_code": 78209.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
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
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "San Antonio", "Zip Code": 78209.0, "Latitude": 29.48618, "Longitude": -98.456809, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 29.48618, "lng": -98.456809, "phone": null, "country": null, "city": "San Antonio", "state": "TX", "postal_code": 78209.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b6e18e6ab706aeacba26d3237a46856e',
        'Sonoma Imaging Medical Associates',
        'P.O. Box 3222',
        40.583488,
        -124.143677,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(707) 261-7805',
        NULL,
        'United States',
        'Fortuna',
        'CA',
        '95540.0',
        'uploaded',
        'uploaded_b6e18e6ab706aeacba26d3237a46856e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Sonoma Imaging Medical Associates", "Address": "P.O. Box 3222", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(707) 261-7805", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Fortuna", "Zip Code": 95540.0, "Latitude": 40.583488, "Longitude": -124.143677, "State": "CA", "zipcode UTC": -8.0, "name": "Sonoma Imaging Medical Associates", "address": "P.O. Box 3222", "lat": 40.583488, "lng": -124.143677, "phone": "(707) 261-7805", "country": "United States", "city": "Fortuna", "state": "CA", "postal_code": 95540.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6de0a881a533792cc62de2b7d710d953',
        'Envision Imaging',
        '4601 Matlock Rd',
        32.65392,
        -97.087243,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(817) 375-3170',
        NULL,
        'United States',
        'Arlington',
        'TX',
        '76018.0',
        'uploaded',
        'uploaded_6de0a881a533792cc62de2b7d710d953',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Envision Imaging", "Address": "4601 Matlock Rd", "Address Two": null, "clinic Hours of Operation": "Mon-Fri:  8am-4pm\nSat:  8am-noon", "Phone Number": "(817) 375-3170", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Arlington", "Zip Code": 76018.0, "Latitude": 32.65392, "Longitude": -97.087243, "State": "TX", "zipcode UTC": -6.0, "name": "Envision Imaging", "address": "4601 Matlock Rd", "lat": 32.65392, "lng": -97.087243, "phone": "(817) 375-3170", "country": "United States", "city": "Arlington", "state": "TX", "postal_code": 76018.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7920af6733475dafd1fac2257f037dd6',
        'Bay Imaging Consultants Medical Group, Inc.',
        '2125 Oak Grove Road',
        37.91878,
        -122.026188,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        'United States',
        'Walnut Creek',
        'CA',
        '94598.0',
        'uploaded',
        'uploaded_7920af6733475dafd1fac2257f037dd6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Bay Imaging Consultants Medical Group, Inc.", "Address": "2125 Oak Grove Road", "Address Two": "Suite 200", "clinic Hours of Operation": null, "Phone Number": null, "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Walnut Creek", "Zip Code": 94598.0, "Latitude": 37.91878, "Longitude": -122.026188, "State": "CA", "zipcode UTC": -8.0, "name": "Bay Imaging Consultants Medical Group, Inc.", "address": "2125 Oak Grove Road", "lat": 37.91878, "lng": -122.026188, "phone": null, "country": "United States", "city": "Walnut Creek", "state": "CA", "postal_code": 94598.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d8bec233a2421ac53af5dbcafdbce652',
        'Women''s Imaging Specialists',
        '115 Eagle Spring Dr',
        33.547578,
        -84.218093,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(678) 904-7209',
        NULL,
        'United States',
        'Stockbridge',
        'GA',
        '30281.0',
        'uploaded',
        'uploaded_d8bec233a2421ac53af5dbcafdbce652',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Women''s Imaging Specialists", "Address": "115 Eagle Spring Dr", "Address Two": "Suite 100", "clinic Hours of Operation": null, "Phone Number": "(678) 904-7209", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Stockbridge", "Zip Code": 30281.0, "Latitude": 33.547578, "Longitude": -84.218093, "State": "GA", "zipcode UTC": -5.0, "name": "Women''s Imaging Specialists", "address": "115 Eagle Spring Dr", "lat": 33.547578, "lng": -84.218093, "phone": "(678) 904-7209", "country": "United States", "city": "Stockbridge", "state": "GA", "postal_code": 30281.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f68218cdf11fa1e817e355b30d7fbc3e',
        'Women''s Imaging Specialists',
        '1360 Caducesu Way',
        33.849286,
        -83.412329,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(678) 801-9862',
        NULL,
        'United States',
        'Watkinsville',
        'GA',
        '30677.0',
        'uploaded',
        'uploaded_f68218cdf11fa1e817e355b30d7fbc3e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Women''s Imaging Specialists", "Address": "1360 Caducesu Way", "Address Two": "Bldg 400, Suite 101", "clinic Hours of Operation": null, "Phone Number": "(678) 801-9862", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Watkinsville", "Zip Code": 30677.0, "Latitude": 33.849286, "Longitude": -83.412329, "State": "GA", "zipcode UTC": -5.0, "name": "Women''s Imaging Specialists", "address": "1360 Caducesu Way", "lat": 33.849286, "lng": -83.412329, "phone": "(678) 801-9862", "country": "United States", "city": "Watkinsville", "state": "GA", "postal_code": 30677.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_46327317151fcc8d77cb58d3dd398046',
        'Women''s Imaging Specialists',
        '601 Professional Drive',
        33.949054,
        -83.985658,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        'United States',
        'Lawrenceville',
        'GA',
        '30045.0',
        'uploaded',
        'uploaded_46327317151fcc8d77cb58d3dd398046',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Women''s Imaging Specialists", "Address": "601 Professional Drive", "Address Two": "Suite 160", "clinic Hours of Operation": null, "Phone Number": null, "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lawrenceville", "Zip Code": 30045.0, "Latitude": 33.949054, "Longitude": -83.985658, "State": "GA", "zipcode UTC": -5.0, "name": "Women''s Imaging Specialists", "address": "601 Professional Drive", "lat": 33.949054, "lng": -83.985658, "phone": null, "country": "United States", "city": "Lawrenceville", "state": "GA", "postal_code": 30045.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c519dd08306ce7ffa4a1786645a0f8da',
        'Women''s Imaging Specialists',
        '3970 Deputy Bill Cantrell Memorial Rd',
        nan,
        nan,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(706) 406-8300',
        NULL,
        'United States',
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_c519dd08306ce7ffa4a1786645a0f8da',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Women''s Imaging Specialists", "Address": "3970 Deputy Bill Cantrell Memorial Rd", "Address Two": "Suite 204", "clinic Hours of Operation": null, "Phone Number": "(706) 406-8300", "Country": "United States", "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "Women''s Imaging Specialists", "address": "3970 Deputy Bill Cantrell Memorial Rd", "lat": null, "lng": null, "phone": "(706) 406-8300", "country": "United States", "city": null, "state": null, "postal_code": null, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_bf7ba154e04632c4d774311ec86dd53a',
        'Women''s Imaging Specialists',
        '2505 Panola Rd',
        33.750257,
        -84.096402,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(706) 450-9099',
        NULL,
        'United States',
        'Lithonia',
        'GA',
        '30058.0',
        'uploaded',
        'uploaded_bf7ba154e04632c4d774311ec86dd53a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Women''s Imaging Specialists", "Address": "2505 Panola Rd", "Address Two": "Suite B", "clinic Hours of Operation": null, "Phone Number": "(706) 450-9099", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lithonia", "Zip Code": 30058.0, "Latitude": 33.750257, "Longitude": -84.096402, "State": "GA", "zipcode UTC": -5.0, "name": "Women''s Imaging Specialists", "address": "2505 Panola Rd", "lat": 33.750257, "lng": -84.096402, "phone": "(706) 450-9099", "country": "United States", "city": "Lithonia", "state": "GA", "postal_code": 30058.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b4ca2382c245ea6366e93eb172502f10',
        'Women''s Imaging Specialists',
        '203 Oakside Lane',
        34.228478,
        -84.504025,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(706) 445-6099',
        NULL,
        'United States',
        'Canton',
        'GA',
        '30114.0',
        'uploaded',
        'uploaded_b4ca2382c245ea6366e93eb172502f10',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Women''s Imaging Specialists", "Address": "203 Oakside Lane", "Address Two": "Suite C", "clinic Hours of Operation": null, "Phone Number": "(706) 445-6099", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Canton", "Zip Code": 30114.0, "Latitude": 34.228478, "Longitude": -84.504025, "State": "GA", "zipcode UTC": -5.0, "name": "Women''s Imaging Specialists", "address": "203 Oakside Lane", "lat": 34.228478, "lng": -84.504025, "phone": "(706) 445-6099", "country": "United States", "city": "Canton", "state": "GA", "postal_code": 30114.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f7a086a4180eb260cd12e27b532a7bbe',
        'nan',
        'nan',
        34.228478,
        -84.504025,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Holly Springs',
        'GA',
        '30114.0',
        'uploaded',
        'uploaded_f7a086a4180eb260cd12e27b532a7bbe',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Holly Springs", "Zip Code": 30114.0, "Latitude": 34.228478, "Longitude": -84.504025, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.228478, "lng": -84.504025, "phone": null, "country": null, "city": "Holly Springs", "state": "GA", "postal_code": 30114.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_dcfe8b547b7dfeded274a7edee7e7a59',
        'Houston Medical Imaging',
        '9230 Katy Fwy',
        29.798877,
        -95.496299,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        'United States',
        'Hilshire Village',
        'TX',
        '77055.0',
        'uploaded',
        'uploaded_dcfe8b547b7dfeded274a7edee7e7a59',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Houston Medical Imaging", "Address": "9230 Katy Fwy", "Address Two": "#440", "clinic Hours of Operation": null, "Phone Number": null, "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Hilshire Village", "Zip Code": 77055.0, "Latitude": 29.798877, "Longitude": -95.496299, "State": "TX", "zipcode UTC": -6.0, "name": "Houston Medical Imaging", "address": "9230 Katy Fwy", "lat": 29.798877, "lng": -95.496299, "phone": null, "country": "United States", "city": "Hilshire Village", "state": "TX", "postal_code": 77055.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_21a148de6a9aa5cf620db4068bca0c29',
        'nan',
        'nan',
        29.798877,
        -95.496299,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Houston',
        'TX',
        '77055.0',
        'uploaded',
        'uploaded_21a148de6a9aa5cf620db4068bca0c29',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Houston", "Zip Code": 77055.0, "Latitude": 29.798877, "Longitude": -95.496299, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 29.798877, "lng": -95.496299, "phone": null, "country": null, "city": "Houston", "state": "TX", "postal_code": 77055.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6e79a08105e0fdc5df66302450bbbac5',
        'Precision Imaging Centers - Jacksonville',
        '7860 Gate Parkway',
        30.206922,
        -81.546043,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(904) 996-8100',
        NULL,
        'United States',
        'Jacksonville',
        'FL',
        '32256.0',
        'uploaded',
        'uploaded_6e79a08105e0fdc5df66302450bbbac5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Precision Imaging Centers - Jacksonville", "Address": "7860 Gate Parkway", "Address Two": "Suite 123", "clinic Hours of Operation": "Monday through Saturday:  8:00 AM - 4:00 PM\nSunday:  CLOSED", "Phone Number": "(904) 996-8100", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Jacksonville", "Zip Code": 32256.0, "Latitude": 30.206922, "Longitude": -81.546043, "State": "FL", "zipcode UTC": -5.0, "name": "Precision Imaging Centers - Jacksonville", "address": "7860 Gate Parkway", "lat": 30.206922, "lng": -81.546043, "phone": "(904) 996-8100", "country": "United States", "city": "Jacksonville", "state": "FL", "postal_code": 32256.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d7dca4d0badf402921f923d8f5b93759',
        'nan',
        'nan',
        30.206922,
        -81.546043,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Jax',
        'FL',
        '32256.0',
        'uploaded',
        'uploaded_d7dca4d0badf402921f923d8f5b93759',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Jax", "Zip Code": 32256.0, "Latitude": 30.206922, "Longitude": -81.546043, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 30.206922, "lng": -81.546043, "phone": null, "country": null, "city": "Jax", "state": "FL", "postal_code": 32256.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_86dbeae15185fd4d12062d5b5ae6e22a',
        'Baaxten Imaging Center',
        '3819 N Expressway 77/83',
        25.928274,
        -97.516189,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(956) 435-9948',
        NULL,
        'United States',
        'Acacia Lake',
        'TX',
        '78520.0',
        'uploaded',
        'uploaded_86dbeae15185fd4d12062d5b5ae6e22a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Baaxten Imaging Center", "Address": "3819 N Expressway 77/83", "Address Two": "Suite 3", "clinic Hours of Operation": null, "Phone Number": "(956) 435-9948", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Acacia Lake", "Zip Code": 78520.0, "Latitude": 25.928274, "Longitude": -97.516189, "State": "TX", "zipcode UTC": -6.0, "name": "Baaxten Imaging Center", "address": "3819 N Expressway 77/83", "lat": 25.928274, "lng": -97.516189, "phone": "(956) 435-9948", "country": "United States", "city": "Acacia Lake", "state": "TX", "postal_code": 78520.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4e5fa56e74673ad0dd0073d6108fc14c',
        'nan',
        'nan',
        25.928274,
        -97.516189,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Boca Chica',
        'TX',
        '78520.0',
        'uploaded',
        'uploaded_4e5fa56e74673ad0dd0073d6108fc14c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Boca Chica", "Zip Code": 78520.0, "Latitude": 25.928274, "Longitude": -97.516189, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 25.928274, "lng": -97.516189, "phone": null, "country": null, "city": "Boca Chica", "state": "TX", "postal_code": 78520.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_183b07ba701eae7b63bcbf555670ca28',
        'Baaxten Imaging Center',
        '2302 S 77 Sunshine Strip',
        26.206602,
        -97.687767,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        'United States',
        'Adams Gardens',
        'TX',
        '78550.0',
        'uploaded',
        'uploaded_183b07ba701eae7b63bcbf555670ca28',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Baaxten Imaging Center", "Address": "2302 S 77 Sunshine Strip", "Address Two": "#101", "clinic Hours of Operation": null, "Phone Number": null, "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Adams Gardens", "Zip Code": 78550.0, "Latitude": 26.206602, "Longitude": -97.687767, "State": "TX", "zipcode UTC": -6.0, "name": "Baaxten Imaging Center", "address": "2302 S 77 Sunshine Strip", "lat": 26.206602, "lng": -97.687767, "phone": null, "country": "United States", "city": "Adams Gardens", "state": "TX", "postal_code": 78550.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3c7e70321c7a9482a8d5f8e0c8aafb75',
        'nan',
        'nan',
        26.206602,
        -97.687767,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Arroyo',
        'TX',
        '78550.0',
        'uploaded',
        'uploaded_3c7e70321c7a9482a8d5f8e0c8aafb75',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Arroyo", "Zip Code": 78550.0, "Latitude": 26.206602, "Longitude": -97.687767, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 26.206602, "lng": -97.687767, "phone": null, "country": null, "city": "Arroyo", "state": "TX", "postal_code": 78550.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_499565b8b90ae124a0a60b6a83f9d723',
        'American Health Imaging',
        '361 Woodruff Road',
        34.825592,
        -82.340997,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(864) 775-5004',
        NULL,
        'United States',
        'Batesville',
        'SC',
        '29607.0',
        'uploaded',
        'uploaded_499565b8b90ae124a0a60b6a83f9d723',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "American Health Imaging", "Address": "361 Woodruff Road", "Address Two": null, "clinic Hours of Operation": "Closes 4:30PM", "Phone Number": "(864) 775-5004", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Batesville", "Zip Code": 29607.0, "Latitude": 34.825592, "Longitude": -82.340997, "State": "SC", "zipcode UTC": -5.0, "name": "American Health Imaging", "address": "361 Woodruff Road", "lat": 34.825592, "lng": -82.340997, "phone": "(864) 775-5004", "country": "United States", "city": "Batesville", "state": "SC", "postal_code": 29607.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
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
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Greenville", "Zip Code": 29607.0, "Latitude": 34.825592, "Longitude": -82.340997, "State": "SC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.825592, "lng": -82.340997, "phone": null, "country": null, "city": "Greenville", "state": "SC", "postal_code": 29607.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_731bb90addfedb3f89b5945d4559b528',
        'Austin Breast Imaging',
        '12319 N. MoPac Expressway',
        30.384204,
        -97.703924,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(512) 776-1000',
        NULL,
        'United States',
        'Austin',
        'TX',
        '78758.0',
        'uploaded',
        'uploaded_731bb90addfedb3f89b5945d4559b528',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Austin Breast Imaging", "Address": "12319 N. MoPac Expressway", "Address Two": "Plaza North, Building C, Suite 320", "clinic Hours of Operation": "Monday - Thursday:  8:00 AM - 5:00 PM\nFriday:  8:00 AM - 4:00 PM", "Phone Number": "(512) 776-1000", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Austin", "Zip Code": 78758.0, "Latitude": 30.384204, "Longitude": -97.703924, "State": "TX", "zipcode UTC": -6.0, "name": "Austin Breast Imaging", "address": "12319 N. MoPac Expressway", "lat": 30.384204, "lng": -97.703924, "phone": "(512) 776-1000", "country": "United States", "city": "Austin", "state": "TX", "postal_code": 78758.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4df43200d3430da8923a210638e7e10a',
        'Advanced Imaging',
        '1699 Golden Springs Road',
        33.651673,
        -85.758955,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(256) 835-0835',
        NULL,
        'United States',
        'Anniston',
        'AL',
        '36207.0',
        'uploaded',
        'uploaded_4df43200d3430da8923a210638e7e10a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Imaging", "Address": "1699 Golden Springs Road", "Address Two": null, "clinic Hours of Operation": "Monday - Thursday: 7:30 AM - 4:30 PM\nFriday: 7:30 AM - 2:00PM", "Phone Number": "(256) 835-0835", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Anniston", "Zip Code": 36207.0, "Latitude": 33.651673, "Longitude": -85.758955, "State": "AL", "zipcode UTC": -6.0, "name": "Advanced Imaging", "address": "1699 Golden Springs Road", "lat": 33.651673, "lng": -85.758955, "phone": "(256) 835-0835", "country": "United States", "city": "Anniston", "state": "AL", "postal_code": 36207.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_2b1a9015d0ab9847197791b2259b69ce',
        'Bon Secours Diagnostic Imaging - Greenville, SC',
        '2 Innovation Drive',
        34.825592,
        -82.340997,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(864) 400-3601',
        NULL,
        'United States',
        'Batesville',
        'SC',
        '29607.0',
        'uploaded',
        'uploaded_2b1a9015d0ab9847197791b2259b69ce',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Bon Secours Diagnostic Imaging - Greenville, SC", "Address": "2 Innovation Drive", "Address Two": "Suite 350", "clinic Hours of Operation": null, "Phone Number": "(864) 400-3601", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Batesville", "Zip Code": 29607.0, "Latitude": 34.825592, "Longitude": -82.340997, "State": "SC", "zipcode UTC": -5.0, "name": "Bon Secours Diagnostic Imaging - Greenville, SC", "address": "2 Innovation Drive", "lat": 34.825592, "lng": -82.340997, "phone": "(864) 400-3601", "country": "United States", "city": "Batesville", "state": "SC", "postal_code": 29607.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_68a2bbfbd30462fd7eb28cd7663916db',
        'Envision Imaging',
        '801 W Road to Six Flags',
        32.752048,
        -97.135143,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(817) 374-4444',
        NULL,
        'United States',
        'Arlington',
        'TX',
        '76012.0',
        'uploaded',
        'uploaded_68a2bbfbd30462fd7eb28cd7663916db',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Envision Imaging", "Address": "801 W Road to Six Flags", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(817) 374-4444", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Arlington", "Zip Code": 76012.0, "Latitude": 32.752048, "Longitude": -97.135143, "State": "TX", "zipcode UTC": -6.0, "name": "Envision Imaging", "address": "801 W Road to Six Flags", "lat": 32.752048, "lng": -97.135143, "phone": "(817) 374-4444", "country": "United States", "city": "Arlington", "state": "TX", "postal_code": 76012.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_fa22d2683144a11690653d4b97eeae8d',
        'Desert Imaging',
        '122 W Castellano Dr',
        31.848055,
        -106.544871,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(915) 577-0100',
        NULL,
        'United States',
        'El Paso',
        'TX',
        '79912.0',
        'uploaded',
        'uploaded_fa22d2683144a11690653d4b97eeae8d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Desert Imaging", "Address": "122 W Castellano Dr", "Address Two": null, "clinic Hours of Operation": "Mon-Fri: 7 AM - 10 PM\nSat: 7AM - 9PM\nSun: CLOSED", "Phone Number": "(915) 577-0100", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "El Paso", "Zip Code": 79912.0, "Latitude": 31.848055, "Longitude": -106.544871, "State": "TX", "zipcode UTC": -7.0, "name": "Desert Imaging", "address": "122 W Castellano Dr", "lat": 31.848055, "lng": -106.544871, "phone": "(915) 577-0100", "country": "United States", "city": "El Paso", "state": "TX", "postal_code": 79912.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_1adfb6a67038f2aa910c43700d8da7c9',
        'TPMG Medical Imaging',
        '860 Omni Boulevard',
        37.078196,
        -76.494468,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(757) 873-0484',
        NULL,
        'United States',
        'Newport News',
        'VA',
        '23606.0',
        'uploaded',
        'uploaded_1adfb6a67038f2aa910c43700d8da7c9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "TPMG Medical Imaging", "Address": "860 Omni Boulevard", "Address Two": "Suite 109", "clinic Hours of Operation": "Mon-Fri: 8am-5pm\n\nSat/Sun - CLOSED", "Phone Number": "(757) 873-0484", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Newport News", "Zip Code": 23606.0, "Latitude": 37.078196, "Longitude": -76.494468, "State": "VA", "zipcode UTC": -5.0, "name": "TPMG Medical Imaging", "address": "860 Omni Boulevard", "lat": 37.078196, "lng": -76.494468, "phone": "(757) 873-0484", "country": "United States", "city": "Newport News", "state": "VA", "postal_code": 23606.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_e12a6273c539c685c72ffd73922a5f74',
        'TPMG Medical Imaging',
        '5424 Discovery Park Boulevard, Building B, Suite 102',
        37.322936,
        -76.757931,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(757) 707-3510',
        NULL,
        'United States',
        'Williamsburg',
        'VA',
        '23188.0',
        'uploaded',
        'uploaded_e12a6273c539c685c72ffd73922a5f74',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "TPMG Medical Imaging", "Address": "5424 Discovery Park Boulevard, Building B, Suite 102", "Address Two": null, "clinic Hours of Operation": "Mon-Fri: 8am-5pm\n\nSat/Sun - CLOSED", "Phone Number": "(757) 707-3510", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Williamsburg", "Zip Code": 23188.0, "Latitude": 37.322936, "Longitude": -76.757931, "State": "VA", "zipcode UTC": -5.0, "name": "TPMG Medical Imaging", "address": "5424 Discovery Park Boulevard, Building B, Suite 102", "lat": 37.322936, "lng": -76.757931, "phone": "(757) 707-3510", "country": "United States", "city": "Williamsburg", "state": "VA", "postal_code": 23188.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
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
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Wlmg", "Zip Code": 23188.0, "Latitude": 37.322936, "Longitude": -76.757931, "State": "VA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 37.322936, "lng": -76.757931, "phone": null, "country": null, "city": "Wlmg", "state": "VA", "postal_code": 23188.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4f65d7c8204ba263566fef68c29dd518',
        'TRA Medical Imaging ',
        '500 Lilly Road Northeast',
        47.069339,
        -122.872496,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(360) 413-8383',
        NULL,
        'United States',
        'Lacey',
        'WA',
        '98506.0',
        'uploaded',
        'uploaded_4f65d7c8204ba263566fef68c29dd518',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "TRA Medical Imaging ", "Address": "500 Lilly Road Northeast", "Address Two": "#160", "clinic Hours of Operation": null, "Phone Number": "(360) 413-8383", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Lacey", "Zip Code": 98506.0, "Latitude": 47.069339, "Longitude": -122.872496, "State": "WA", "zipcode UTC": -8.0, "name": "TRA Medical Imaging ", "address": "500 Lilly Road Northeast", "lat": 47.069339, "lng": -122.872496, "phone": "(360) 413-8383", "country": "United States", "city": "Lacey", "state": "WA", "postal_code": 98506.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_df15997279193ee86a9ad6176714f3e1',
        'nan',
        'nan',
        47.069339,
        -122.872496,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Olympia',
        'WA',
        '98506.0',
        'uploaded',
        'uploaded_df15997279193ee86a9ad6176714f3e1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Olympia", "Zip Code": 98506.0, "Latitude": 47.069339, "Longitude": -122.872496, "State": "WA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 47.069339, "lng": -122.872496, "phone": null, "country": null, "city": "Olympia", "state": "WA", "postal_code": 98506.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4928c40ffbcebaa8f234f3ee73673c7a',
        'TRA Medical Imaging ',
        '4700 Point Fosdick Drive NW',
        47.301252,
        -122.605626,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(866) 761-4200',
        NULL,
        'United States',
        'Arletta',
        'WA',
        '98335.0',
        'uploaded',
        'uploaded_4928c40ffbcebaa8f234f3ee73673c7a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "TRA Medical Imaging ", "Address": "4700 Point Fosdick Drive NW", "Address Two": "Suite 100", "clinic Hours of Operation": null, "Phone Number": "(866) 761-4200", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Arletta", "Zip Code": 98335.0, "Latitude": 47.301252, "Longitude": -122.605626, "State": "WA", "zipcode UTC": -8.0, "name": "TRA Medical Imaging ", "address": "4700 Point Fosdick Drive NW", "lat": 47.301252, "lng": -122.605626, "phone": "(866) 761-4200", "country": "United States", "city": "Arletta", "state": "WA", "postal_code": 98335.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_517e23a0fcb9f5b9df47e302a9a85219',
        'nan',
        'nan',
        47.301252,
        -122.605626,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Artondale',
        'WA',
        '98335.0',
        'uploaded',
        'uploaded_517e23a0fcb9f5b9df47e302a9a85219',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Artondale", "Zip Code": 98335.0, "Latitude": 47.301252, "Longitude": -122.605626, "State": "WA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 47.301252, "lng": -122.605626, "phone": null, "country": null, "city": "Artondale", "state": "WA", "postal_code": 98335.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4db8defafbd3ccb7f2a27e7a79fc1cd1',
        'TRA Medical Imaging ',
        '2502 South Union Avenue ',
        47.248953,
        -122.465992,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(253) 761-4200',
        NULL,
        'United States',
        'Tacoma',
        'WA',
        '98405.0',
        'uploaded',
        'uploaded_4db8defafbd3ccb7f2a27e7a79fc1cd1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "TRA Medical Imaging ", "Address": "2502 South Union Avenue ", "Address Two": "Suite 110", "clinic Hours of Operation": null, "Phone Number": "(253) 761-4200", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Tacoma", "Zip Code": 98405.0, "Latitude": 47.248953, "Longitude": -122.465992, "State": "WA", "zipcode UTC": -8.0, "name": "TRA Medical Imaging ", "address": "2502 South Union Avenue ", "lat": 47.248953, "lng": -122.465992, "phone": "(253) 761-4200", "country": "United States", "city": "Tacoma", "state": "WA", "postal_code": 98405.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_beadf7502a39d8abe4134e46875a947d',
        'TRA Medical Imaging ',
        '5919 100th Street Southwest',
        47.16632,
        -122.508443,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(253) 761-4200',
        NULL,
        'United States',
        'Lakewood',
        'WA',
        '98499.0',
        'uploaded',
        'uploaded_beadf7502a39d8abe4134e46875a947d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "TRA Medical Imaging ", "Address": "5919 100th Street Southwest", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(253) 761-4200", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Lakewood", "Zip Code": 98499.0, "Latitude": 47.16632, "Longitude": -122.508443, "State": "WA", "zipcode UTC": -8.0, "name": "TRA Medical Imaging ", "address": "5919 100th Street Southwest", "lat": 47.16632, "lng": -122.508443, "phone": "(253) 761-4200", "country": "United States", "city": "Lakewood", "state": "WA", "postal_code": 98499.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_a0f2e678a56da6c235877bbf3d94c3e5',
        'nan',
        'nan',
        47.16632,
        -122.508443,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Mc Chord Afb',
        'WA',
        '98499.0',
        'uploaded',
        'uploaded_a0f2e678a56da6c235877bbf3d94c3e5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Mc Chord Afb", "Zip Code": 98499.0, "Latitude": 47.16632, "Longitude": -122.508443, "State": "WA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 47.16632, "lng": -122.508443, "phone": null, "country": null, "city": "Mc Chord Afb", "state": "WA", "postal_code": 98499.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_52fa03d521459b10198dca483230cbb4',
        'TRA Medical Imaging ',
        '122 3rd street Northeast',
        47.304221,
        -122.216029,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(866) 761-4200',
        NULL,
        'United States',
        'Auburn',
        'WA',
        '98002.0',
        'uploaded',
        'uploaded_52fa03d521459b10198dca483230cbb4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "TRA Medical Imaging ", "Address": "122 3rd street Northeast", "Address Two": "Suite 101A", "clinic Hours of Operation": null, "Phone Number": "(866) 761-4200", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Auburn", "Zip Code": 98002.0, "Latitude": 47.304221, "Longitude": -122.216029, "State": "WA", "zipcode UTC": -8.0, "name": "TRA Medical Imaging ", "address": "122 3rd street Northeast", "lat": 47.304221, "lng": -122.216029, "phone": "(866) 761-4200", "country": "United States", "city": "Auburn", "state": "WA", "postal_code": 98002.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_98b9e36657c200ecd0603f38ca7b6e4f',
        'Longhorn Imaging Center',
        '3101 Highway 71 East',
        30.120443,
        -97.309913,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(512) 444-8900',
        NULL,
        'United States',
        'Bastrop',
        'TX',
        '78602.0',
        'uploaded',
        'uploaded_98b9e36657c200ecd0603f38ca7b6e4f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Longhorn Imaging Center", "Address": "3101 Highway 71 East", "Address Two": "Suite 108", "clinic Hours of Operation": null, "Phone Number": "(512) 444-8900", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Bastrop", "Zip Code": 78602.0, "Latitude": 30.120443, "Longitude": -97.309913, "State": "TX", "zipcode UTC": -6.0, "name": "Longhorn Imaging Center", "address": "3101 Highway 71 East", "lat": 30.120443, "lng": -97.309913, "phone": "(512) 444-8900", "country": "United States", "city": "Bastrop", "state": "TX", "postal_code": 78602.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5213159ca4a02f514a7bbc4dfb1e5244',
        'nan',
        'nan',
        30.120443,
        -97.309913,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Calvin',
        'TX',
        '78602.0',
        'uploaded',
        'uploaded_5213159ca4a02f514a7bbc4dfb1e5244',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Calvin", "Zip Code": 78602.0, "Latitude": 30.120443, "Longitude": -97.309913, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 30.120443, "lng": -97.309913, "phone": null, "country": null, "city": "Calvin", "state": "TX", "postal_code": 78602.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_e984a2e64d1ce19aff84af5072a4db06',
        'Phoenix Medical Imaging',
        '8877 W Union Hills Drive',
        33.689869,
        -112.248386,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(602) 845-9038',
        NULL,
        'United States',
        'Peoria',
        'AZ',
        '85382.0',
        'uploaded',
        'uploaded_e984a2e64d1ce19aff84af5072a4db06',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Phoenix Medical Imaging", "Address": "8877 W Union Hills Drive", "Address Two": "Suite 160", "clinic Hours of Operation": "Mon-Sat - 8am-5pm\nSun - Closed", "Phone Number": "(602) 845-9038", "Country": "United States", "Time Zone Display": "MST - Mountain Standard Time", "City": "Peoria", "Zip Code": 85382.0, "Latitude": 33.689869, "Longitude": -112.248386, "State": "AZ", "zipcode UTC": -7.0, "name": "Phoenix Medical Imaging", "address": "8877 W Union Hills Drive", "lat": 33.689869, "lng": -112.248386, "phone": "(602) 845-9038", "country": "United States", "city": "Peoria", "state": "AZ", "postal_code": 85382.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_fb1c97244b3701db628bd0b0943f9399',
        'Envision Imaging',
        '490 US-80',
        32.803646,
        -96.569654,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(972) 798-4009',
        NULL,
        'United States',
        'Mesquite',
        'TX',
        '75182.0',
        'uploaded',
        'uploaded_fb1c97244b3701db628bd0b0943f9399',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Envision Imaging", "Address": "490 US-80", "Address Two": "Suite 300", "clinic Hours of Operation": null, "Phone Number": "(972) 798-4009", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Mesquite", "Zip Code": 75182.0, "Latitude": 32.803646, "Longitude": -96.569654, "State": "TX", "zipcode UTC": -6.0, "name": "Envision Imaging", "address": "490 US-80", "lat": 32.803646, "lng": -96.569654, "phone": "(972) 798-4009", "country": "United States", "city": "Mesquite", "state": "TX", "postal_code": 75182.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5f029b843e55ab20a0a81df271254861',
        'nan',
        'nan',
        32.803646,
        -96.569654,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Sunnyvale',
        'TX',
        '75182.0',
        'uploaded',
        'uploaded_5f029b843e55ab20a0a81df271254861',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Sunnyvale", "Zip Code": 75182.0, "Latitude": 32.803646, "Longitude": -96.569654, "State": "TX", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.803646, "lng": -96.569654, "phone": null, "country": null, "city": "Sunnyvale", "state": "TX", "postal_code": 75182.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f4b4e019049614ca2eac52c8381643bd',
        'Natchitoches Imaging Center',
        '105 East 5th Street',
        31.751287,
        -93.090215,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(318) 214-4518',
        NULL,
        'United States',
        'Cypress',
        'LA',
        '71457.0',
        'uploaded',
        'uploaded_f4b4e019049614ca2eac52c8381643bd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Natchitoches Imaging Center", "Address": "105 East 5th Street", "Address Two": null, "clinic Hours of Operation": "Mon-Fri - 8am-5pm\n\nSat/SUn - closed", "Phone Number": "(318) 214-4518", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Cypress", "Zip Code": 71457.0, "Latitude": 31.751287, "Longitude": -93.090215, "State": "LA", "zipcode UTC": -6.0, "name": "Natchitoches Imaging Center", "address": "105 East 5th Street", "lat": 31.751287, "lng": -93.090215, "phone": "(318) 214-4518", "country": "United States", "city": "Cypress", "state": "LA", "postal_code": 71457.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_0160561ec43c5ad07016b9e4308aeff8',
        'nan',
        'nan',
        31.751287,
        -93.090215,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Hagewood',
        'LA',
        '71457.0',
        'uploaded',
        'uploaded_0160561ec43c5ad07016b9e4308aeff8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Hagewood", "Zip Code": 71457.0, "Latitude": 31.751287, "Longitude": -93.090215, "State": "LA", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 31.751287, "lng": -93.090215, "phone": null, "country": null, "city": "Hagewood", "state": "LA", "postal_code": 71457.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_fb56f0165f3ef9f139f7a168a2708e06',
        'Community Imaging Center',
        '9669 E 146th St',
        40.050109,
        -85.998151,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(317) 621-6100',
        NULL,
        'United States',
        'Noblesville',
        'IN',
        '46060.0',
        'uploaded',
        'uploaded_fb56f0165f3ef9f139f7a168a2708e06',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Community Imaging Center", "Address": "9669 E 146th St", "Address Two": "Ste 140", "clinic Hours of Operation": "7am-7pm, Mon-Fri. ", "Phone Number": "(317) 621-6100", "Country": "United States", "Time Zone Display": "EST - Eastern Standard Time", "City": "Noblesville", "Zip Code": 46060.0, "Latitude": 40.050109, "Longitude": -85.998151, "State": "IN", "zipcode UTC": -5.0, "name": "Community Imaging Center", "address": "9669 E 146th St", "lat": 40.050109, "lng": -85.998151, "phone": "(317) 621-6100", "country": "United States", "city": "Noblesville", "state": "IN", "postal_code": 46060.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_cf420a6e0dbadc9eaa960c331fdc3b49',
        'nan',
        'nan',
        40.050109,
        -85.998151,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Strawtown',
        'IN',
        '46060.0',
        'uploaded',
        'uploaded_cf420a6e0dbadc9eaa960c331fdc3b49',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EST - Eastern Standard Time", "City": "Strawtown", "Zip Code": 46060.0, "Latitude": 40.050109, "Longitude": -85.998151, "State": "IN", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.050109, "lng": -85.998151, "phone": null, "country": null, "city": "Strawtown", "state": "IN", "postal_code": 46060.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_55342ea146af6e8f3fd34fa8197a4529',
        'Community Imaging Center',
        '19800 East Street',
        40.041325,
        -86.152621,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(317) 355-4680',
        NULL,
        'United States',
        'Westfield',
        'IN',
        '46074.0',
        'uploaded',
        'uploaded_55342ea146af6e8f3fd34fa8197a4529',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Community Imaging Center", "Address": "19800 East Street", "Address Two": "Suite 120", "clinic Hours of Operation": "8am-4:30pm, Mon-Fri.", "Phone Number": "(317) 355-4680", "Country": "United States", "Time Zone Display": "EST - Eastern Standard Time", "City": "Westfield", "Zip Code": 46074.0, "Latitude": 40.041325, "Longitude": -86.152621, "State": "IN", "zipcode UTC": -5.0, "name": "Community Imaging Center", "address": "19800 East Street", "lat": 40.041325, "lng": -86.152621, "phone": "(317) 355-4680", "country": "United States", "city": "Westfield", "state": "IN", "postal_code": 46074.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9f2d75dfc2ba6d087f822bc8ced01805',
        'Shin Imaging ',
        '5832 Beach Boulevard ',
        33.875714,
        -117.994044,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(714) 578-8882',
        NULL,
        'United States',
        'Buena Park',
        'CA',
        '90621.0',
        'uploaded',
        'uploaded_9f2d75dfc2ba6d087f822bc8ced01805',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Shin Imaging ", "Address": "5832 Beach Boulevard ", "Address Two": "Suite #104", "clinic Hours of Operation": "Mon-Fri - 6am-9:30pm\n\nsat/sun - 8am-9:30pm", "Phone Number": "(714) 578-8882", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Buena Park", "Zip Code": 90621.0, "Latitude": 33.875714, "Longitude": -117.994044, "State": "CA", "zipcode UTC": -8.0, "name": "Shin Imaging ", "address": "5832 Beach Boulevard ", "lat": 33.875714, "lng": -117.994044, "phone": "(714) 578-8882", "country": "United States", "city": "Buena Park", "state": "CA", "postal_code": 90621.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7fef963ef2c096c76f1897cb9d51e88d',
        'Ashley Ridge Imaging Center',
        '463 Ashley Ridge Boulevard ',
        32.426104,
        -93.745428,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(318) 869-4747',
        NULL,
        'United States',
        'Cedar Grove',
        'LA',
        '71106.0',
        'uploaded',
        'uploaded_7fef963ef2c096c76f1897cb9d51e88d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Ashley Ridge Imaging Center", "Address": "463 Ashley Ridge Boulevard ", "Address Two": "Suite 200", "clinic Hours of Operation": "Mon-Fri - 8am-5pm", "Phone Number": "(318) 869-4747", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Cedar Grove", "Zip Code": 71106.0, "Latitude": 32.426104, "Longitude": -93.745428, "State": "LA", "zipcode UTC": -6.0, "name": "Ashley Ridge Imaging Center", "address": "463 Ashley Ridge Boulevard ", "lat": 32.426104, "lng": -93.745428, "phone": "(318) 869-4747", "country": "United States", "city": "Cedar Grove", "state": "LA", "postal_code": 71106.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_771beb6016ac51326c7742e9fd278f64',
        'nan',
        'nan',
        32.426104,
        -93.745428,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Forbing',
        'LA',
        '71106.0',
        'uploaded',
        'uploaded_771beb6016ac51326c7742e9fd278f64',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Forbing", "Zip Code": 71106.0, "Latitude": 32.426104, "Longitude": -93.745428, "State": "LA", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 32.426104, "lng": -93.745428, "phone": null, "country": null, "city": "Forbing", "state": "LA", "postal_code": 71106.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_12443155797147f0cef5980eae6bdb72',
        'High Field Imaging',
        '995 Greentree Road',
        40.430822,
        -80.04453,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(412) 920-0100',
        NULL,
        'United States',
        'Pgh',
        'PA',
        '15220.0',
        'uploaded',
        'uploaded_12443155797147f0cef5980eae6bdb72',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "High Field Imaging", "Address": "995 Greentree Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri - 8am-4pm\nSaturday - 9am-2pm\nSunday - closed", "Phone Number": "(412) 920-0100", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Pgh", "Zip Code": 15220.0, "Latitude": 40.430822, "Longitude": -80.04453, "State": "PA", "zipcode UTC": -5.0, "name": "High Field Imaging", "address": "995 Greentree Road", "lat": 40.430822, "lng": -80.04453, "phone": "(412) 920-0100", "country": "United States", "city": "Pgh", "state": "PA", "postal_code": 15220.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_e71595d032236dc55bb223a66e2bc1f4',
        'MH Imaging',
        '2500 W Layton',
        42.953915,
        -87.945708,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(262) 261-9423',
        NULL,
        'United States',
        'Greenfield',
        'WI',
        '53221.0',
        'uploaded',
        'uploaded_e71595d032236dc55bb223a66e2bc1f4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "MH Imaging", "Address": "2500 W Layton", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(262) 261-9423", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Greenfield", "Zip Code": 53221.0, "Latitude": 42.953915, "Longitude": -87.945708, "State": "WI", "zipcode UTC": -6.0, "name": "MH Imaging", "address": "2500 W Layton", "lat": 42.953915, "lng": -87.945708, "phone": "(262) 261-9423", "country": "United States", "city": "Greenfield", "state": "WI", "postal_code": 53221.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_8ffc35f7cbbe5145d29e9ad0a75a94b2',
        'nan',
        'nan',
        42.953915,
        -87.945708,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Milwaukee',
        'WI',
        '53221.0',
        'uploaded',
        'uploaded_8ffc35f7cbbe5145d29e9ad0a75a94b2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Milwaukee", "Zip Code": 53221.0, "Latitude": 42.953915, "Longitude": -87.945708, "State": "WI", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 42.953915, "lng": -87.945708, "phone": null, "country": null, "city": "Milwaukee", "state": "WI", "postal_code": 53221.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_74daeb36900f756fff3f92be48fd054e',
        'LivingWell Radiology - West End Imaging',
        '2371 New Holt Road',
        37.066543,
        -88.656875,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(270) 442-8272',
        NULL,
        'United States',
        'Avondale',
        'KY',
        '42001.0',
        'uploaded',
        'uploaded_74daeb36900f756fff3f92be48fd054e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "LivingWell Radiology - West End Imaging", "Address": "2371 New Holt Road", "Address Two": null, "clinic Hours of Operation": "MON_FRI - 7am - 5pm\nsat/sun - closed", "Phone Number": "(270) 442-8272", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Avondale", "Zip Code": 42001.0, "Latitude": 37.066543, "Longitude": -88.656875, "State": "KY", "zipcode UTC": -6.0, "name": "LivingWell Radiology - West End Imaging", "address": "2371 New Holt Road", "lat": 37.066543, "lng": -88.656875, "phone": "(270) 442-8272", "country": "United States", "city": "Avondale", "state": "KY", "postal_code": 42001.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ae59a09280e896df1445420208ff29e4',
        'nan',
        'nan',
        37.066543,
        -88.656875,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Barkley Regional Airport',
        'KY',
        '42001.0',
        'uploaded',
        'uploaded_ae59a09280e896df1445420208ff29e4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Barkley Regional Airport", "Zip Code": 42001.0, "Latitude": 37.066543, "Longitude": -88.656875, "State": "KY", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 37.066543, "lng": -88.656875, "phone": null, "country": null, "city": "Barkley Regional Airport", "state": "KY", "postal_code": 42001.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_20f14fb9f44feba3834ca5b4e7951d9b',
        'Carolinas Imaging Service',
        '4525 Cameron Valley Parkway',
        35.170094,
        -80.798575,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(704) 333-3794',
        NULL,
        'United States',
        'Charlotte',
        'NC',
        '28211.0',
        'uploaded',
        'uploaded_20f14fb9f44feba3834ca5b4e7951d9b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Carolinas Imaging Service", "Address": "4525 Cameron Valley Parkway", "Address Two": "Suite 1000-B", "clinic Hours of Operation": "Mon-Fri - 7am-9pm\nsat/sun - 7am-7pm", "Phone Number": "(704) 333-3794", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Charlotte", "Zip Code": 28211.0, "Latitude": 35.170094, "Longitude": -80.798575, "State": "NC", "zipcode UTC": -5.0, "name": "Carolinas Imaging Service", "address": "4525 Cameron Valley Parkway", "lat": 35.170094, "lng": -80.798575, "phone": "(704) 333-3794", "country": "United States", "city": "Charlotte", "state": "NC", "postal_code": 28211.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_66690fc42fff9ee808308d7600c84c43',
        'Midwest Diagnostic Imaging ',
        '5463 Elizabeth Lake Road',
        42.642764,
        -83.402737,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(248) 681-2000',
        NULL,
        'United States',
        'Waterford',
        'MI',
        '48327.0',
        'uploaded',
        'uploaded_66690fc42fff9ee808308d7600c84c43',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Midwest Diagnostic Imaging ", "Address": "5463 Elizabeth Lake Road", "Address Two": null, "clinic Hours of Operation": "Monday thru Friday 9:00AM to 5:00PM", "Phone Number": "(248) 681-2000", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Waterford", "Zip Code": 48327.0, "Latitude": 42.642764, "Longitude": -83.402737, "State": "MI", "zipcode UTC": -5.0, "name": "Midwest Diagnostic Imaging ", "address": "5463 Elizabeth Lake Road", "lat": 42.642764, "lng": -83.402737, "phone": "(248) 681-2000", "country": "United States", "city": "Waterford", "state": "MI", "postal_code": 48327.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_1bf4049758ed714a09ef20b82348ce5e',
        'nan',
        'nan',
        42.642764,
        -83.402737,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Waterford Township',
        'MI',
        '48327.0',
        'uploaded',
        'uploaded_1bf4049758ed714a09ef20b82348ce5e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Waterford Township", "Zip Code": 48327.0, "Latitude": 42.642764, "Longitude": -83.402737, "State": "MI", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 42.642764, "lng": -83.402737, "phone": null, "country": null, "city": "Waterford Township", "state": "MI", "postal_code": 48327.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_a41797ec422a6a5c643b32530fc26679',
        'Derry Imaging',
        '15 Durham Road',
        43.190984,
        -70.887878,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(603) 537-1350',
        NULL,
        'United States',
        'Dover',
        'NH',
        '3820.0',
        'uploaded',
        'uploaded_a41797ec422a6a5c643b32530fc26679',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Derry Imaging", "Address": "15 Durham Road", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(603) 537-1350", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dover", "Zip Code": 3820.0, "Latitude": 43.190984, "Longitude": -70.887878, "State": "NH", "zipcode UTC": -5.0, "name": "Derry Imaging", "address": "15 Durham Road", "lat": 43.190984, "lng": -70.887878, "phone": "(603) 537-1350", "country": "United States", "city": "Dover", "state": "NH", "postal_code": 3820.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6aa6b344aa6a16b033c20f8a23e9debf',
        'American Health Imaging - Augusta',
        '3152 Perimeter Pkwy',
        33.475936,
        -82.069702,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(706) 364-2603',
        NULL,
        'United States',
        'Augusta',
        'GA',
        '30909.0',
        'uploaded',
        'uploaded_6aa6b344aa6a16b033c20f8a23e9debf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "American Health Imaging - Augusta", "Address": "3152 Perimeter Pkwy", "Address Two": "Bld 2, Unit B", "clinic Hours of Operation": "Mon - Fri (MR) 7:00AM - 10:00PM \n\nMon - Fri (CT, US) 8:00AM - 5:00PM\n\nSat - MR only 8:00AM - 5:00PM ", "Phone Number": "(706) 364-2603", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Augusta", "Zip Code": 30909.0, "Latitude": 33.475936, "Longitude": -82.069702, "State": "GA", "zipcode UTC": -5.0, "name": "American Health Imaging - Augusta", "address": "3152 Perimeter Pkwy", "lat": 33.475936, "lng": -82.069702, "phone": "(706) 364-2603", "country": "United States", "city": "Augusta", "state": "GA", "postal_code": 30909.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_fa75b5dd249ddb2970f2e91ca9f41124',
        'Sunflower Imaging',
        '13213 W 21st Ct N',
        37.692778,
        -97.495907,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(316) 358-7110',
        NULL,
        'United States',
        'Wichita',
        'KS',
        '67235.0',
        'uploaded',
        'uploaded_fa75b5dd249ddb2970f2e91ca9f41124',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Sunflower Imaging", "Address": "13213 W 21st Ct N", "Address Two": "Suite 103", "clinic Hours of Operation": "Mon-Sat: 7:30 AM - 7:30 PM \nSun: CLOSED", "Phone Number": "(316) 358-7110", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Wichita", "Zip Code": 67235.0, "Latitude": 37.692778, "Longitude": -97.495907, "State": "KS", "zipcode UTC": -6.0, "name": "Sunflower Imaging", "address": "13213 W 21st Ct N", "lat": 37.692778, "lng": -97.495907, "phone": "(316) 358-7110", "country": "United States", "city": "Wichita", "state": "KS", "postal_code": 67235.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_a70b7f4f2c413cedb1689602040024b9',
        'McKenzie Medical Imaging & Mammography',
        '960 N. 16th St,',
        44.061057,
        -123.017699,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(541) 726-4694',
        NULL,
        'United States',
        'Spfd',
        'OR',
        '97477.0',
        'uploaded',
        'uploaded_a70b7f4f2c413cedb1689602040024b9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "McKenzie Medical Imaging & Mammography", "Address": "960 N. 16th St,", "Address Two": " Suite 10", "clinic Hours of Operation": null, "Phone Number": "(541) 726-4694", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Spfd", "Zip Code": 97477.0, "Latitude": 44.061057, "Longitude": -123.017699, "State": "OR", "zipcode UTC": -8.0, "name": "McKenzie Medical Imaging & Mammography", "address": "960 N. 16th St,", "lat": 44.061057, "lng": -123.017699, "phone": "(541) 726-4694", "country": "United States", "city": "Spfd", "state": "OR", "postal_code": 97477.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_cd76fb9438f51a9e1406dfc2390523b8',
        'nan',
        'nan',
        44.061057,
        -123.017699,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Spfld',
        'OR',
        '97477.0',
        'uploaded',
        'uploaded_cd76fb9438f51a9e1406dfc2390523b8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Spfld", "Zip Code": 97477.0, "Latitude": 44.061057, "Longitude": -123.017699, "State": "OR", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 44.061057, "lng": -123.017699, "phone": null, "country": null, "city": "Spfld", "state": "OR", "postal_code": 97477.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c2b69f30fbef2a9dbee91583f155a691',
        'Elite Imaging',
        '1713 S FM',
        33.263039,
        -97.556573,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(940) 627-2570',
        NULL,
        'United States',
        'Decatur',
        'TX',
        '76234.0',
        'uploaded',
        'uploaded_c2b69f30fbef2a9dbee91583f155a691',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Elite Imaging", "Address": "1713 S FM", "Address Two": "Suite 103B", "clinic Hours of Operation": null, "Phone Number": "(940) 627-2570", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Decatur", "Zip Code": 76234.0, "Latitude": 33.263039, "Longitude": -97.556573, "State": "TX", "zipcode UTC": -6.0, "name": "Elite Imaging", "address": "1713 S FM", "lat": 33.263039, "lng": -97.556573, "phone": "(940) 627-2570", "country": "United States", "city": "Decatur", "state": "TX", "postal_code": 76234.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6c80fa3527395031c3a9feaf1a977fa6',
        'Colorado Springs Imaging',
        '6005 Delmonico Dr. ',
        38.925451,
        -104.852551,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(719) 260-6500',
        NULL,
        'United States',
        'Co Spgs',
        'CO',
        '80919.0',
        'uploaded',
        'uploaded_6c80fa3527395031c3a9feaf1a977fa6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Colorado Springs Imaging", "Address": "6005 Delmonico Dr. ", "Address Two": "Suite #180", "clinic Hours of Operation": null, "Phone Number": "(719) 260-6500", "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Co Spgs", "Zip Code": 80919.0, "Latitude": 38.925451, "Longitude": -104.852551, "State": "CO", "zipcode UTC": -7.0, "name": "Colorado Springs Imaging", "address": "6005 Delmonico Dr. ", "lat": 38.925451, "lng": -104.852551, "phone": "(719) 260-6500", "country": "United States", "city": "Co Spgs", "state": "CO", "postal_code": 80919.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_97cd42906a8887d7de01ac7b20cb5e10',
        'nan',
        'nan',
        38.925451,
        -104.852551,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Colorado Spgs',
        'CO',
        '80919.0',
        'uploaded',
        'uploaded_97cd42906a8887d7de01ac7b20cb5e10',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Colorado Spgs", "Zip Code": 80919.0, "Latitude": 38.925451, "Longitude": -104.852551, "State": "CO", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 38.925451, "lng": -104.852551, "phone": null, "country": null, "city": "Colorado Spgs", "state": "CO", "postal_code": 80919.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_538761df1f729e368f1981252b7097bc',
        'Marine Park Radiology',
        '2270 Kimall Street, Ste. 102',
        40.618561,
        -73.921604,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(718) 253-6616',
        NULL,
        'United States',
        'Brooklyn',
        'NY',
        '11234.0',
        'uploaded',
        'uploaded_538761df1f729e368f1981252b7097bc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Marine Park Radiology", "Address": "2270 Kimall Street, Ste. 102", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:30am - 5:00pm, Sat 8:00am - as needed (Walk-In)", "Phone Number": "(718) 253-6616", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Brooklyn", "Zip Code": 11234.0, "Latitude": 40.618561, "Longitude": -73.921604, "State": "NY", "zipcode UTC": -5.0, "name": "Marine Park Radiology", "address": "2270 Kimall Street, Ste. 102", "lat": 40.618561, "lng": -73.921604, "phone": "(718) 253-6616", "country": "United States", "city": "Brooklyn", "state": "NY", "postal_code": 11234.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b89e582b3b165d4269656efb5ac5bcaa',
        'American Radiology Services, Inc.',
        '130 Hospital Road, Ste. L110',
        38.535116,
        -76.584328,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(443) 436-1001',
        NULL,
        'United States',
        'Dares Beach',
        'MD',
        '20678.0',
        'uploaded',
        'uploaded_b89e582b3b165d4269656efb5ac5bcaa',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "American Radiology Services, Inc.", "Address": "130 Hospital Road, Ste. L110", "Address Two": null, "clinic Hours of Operation": "Mon-Thurs 7:00am - 6:00pm, Sat 8:00am - 12:00pm", "Phone Number": "(443) 436-1001", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dares Beach", "Zip Code": 20678.0, "Latitude": 38.535116, "Longitude": -76.584328, "State": "MD", "zipcode UTC": -5.0, "name": "American Radiology Services, Inc.", "address": "130 Hospital Road, Ste. L110", "lat": 38.535116, "lng": -76.584328, "phone": "(443) 436-1001", "country": "United States", "city": "Dares Beach", "state": "MD", "postal_code": 20678.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c1b804cf19a481c34e4488c663ac7a1e',
        'Community Radiology Associates',
        '9131 Piscataway Road, Ste. 370',
        38.753264,
        -76.899139,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(888) 601-0943',
        NULL,
        'United States',
        'Clinton',
        'MD',
        '20735.0',
        'uploaded',
        'uploaded_c1b804cf19a481c34e4488c663ac7a1e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Community Radiology Associates", "Address": "9131 Piscataway Road, Ste. 370", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(888) 601-0943", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Clinton", "Zip Code": 20735.0, "Latitude": 38.753264, "Longitude": -76.899139, "State": "MD", "zipcode UTC": -5.0, "name": "Community Radiology Associates", "address": "9131 Piscataway Road, Ste. 370", "lat": 38.753264, "lng": -76.899139, "phone": "(888) 601-0943", "country": "United States", "city": "Clinton", "state": "MD", "postal_code": 20735.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_89c363ed52e411259e0b2e0829c84d33',
        'Advanced Radiology',
        '203 Hospital Drive, Ste. 100',
        39.164158,
        -76.630608,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 918-3260',
        NULL,
        'United States',
        'Glen Burnie',
        'MD',
        '21061.0',
        'uploaded',
        'uploaded_89c363ed52e411259e0b2e0829c84d33',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "203 Hospital Drive, Ste. 100", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(410) 918-3260", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Glen Burnie", "Zip Code": 21061.0, "Latitude": 39.164158, "Longitude": -76.630608, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "203 Hospital Drive, Ste. 100", "lat": 39.164158, "lng": -76.630608, "phone": "(410) 918-3260", "country": "United States", "city": "Glen Burnie", "state": "MD", "postal_code": 21061.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_58bbe2fdb70b92c1ae2e3a8ab0ac9b57',
        'nan',
        'nan',
        39.164158,
        -76.630608,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Glenburnie',
        'MD',
        '21061.0',
        'uploaded',
        'uploaded_58bbe2fdb70b92c1ae2e3a8ab0ac9b57',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Glenburnie", "Zip Code": 21061.0, "Latitude": 39.164158, "Longitude": -76.630608, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.164158, "lng": -76.630608, "phone": null, "country": null, "city": "Glenburnie", "state": "MD", "postal_code": 21061.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_219b7abc5a0942a88444e1db20ccd9e5',
        'Advanced Radiology',
        '1209 York Road, Ste. 100 ',
        39.435789,
        -76.636147,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 580-2240',
        NULL,
        'United States',
        'Lutherville',
        'MD',
        '21093.0',
        'uploaded',
        'uploaded_219b7abc5a0942a88444e1db20ccd9e5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "1209 York Road, Ste. 100 ", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(410) 580-2240", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lutherville", "Zip Code": 21093.0, "Latitude": 39.435789, "Longitude": -76.636147, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "1209 York Road, Ste. 100 ", "lat": 39.435789, "lng": -76.636147, "phone": "(410) 580-2240", "country": "United States", "city": "Lutherville", "state": "MD", "postal_code": 21093.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_02f78c1f289bf9f5efb127bce2aaa50e',
        'nan',
        'nan',
        39.435789,
        -76.636147,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Lutherville Timonium',
        'MD',
        '21093.0',
        'uploaded',
        'uploaded_02f78c1f289bf9f5efb127bce2aaa50e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lutherville Timonium", "Zip Code": 21093.0, "Latitude": 39.435789, "Longitude": -76.636147, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.435789, "lng": -76.636147, "phone": null, "country": null, "city": "Lutherville Timonium", "state": "MD", "postal_code": 21093.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7d6998c0a59d7393d1b7ec7642929042',
        'Advanced Radiology',
        '7501 Osler Drive, Ste. 204B',
        39.405606,
        -76.626483,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 580-6000',
        NULL,
        'United States',
        'Baltimore',
        'MD',
        '21204.0',
        'uploaded',
        'uploaded_7d6998c0a59d7393d1b7ec7642929042',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "7501 Osler Drive, Ste. 204B", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(410) 580-6000", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Baltimore", "Zip Code": 21204.0, "Latitude": 39.405606, "Longitude": -76.626483, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "7501 Osler Drive, Ste. 204B", "lat": 39.405606, "lng": -76.626483, "phone": "(410) 580-6000", "country": "United States", "city": "Baltimore", "state": "MD", "postal_code": 21204.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_2b6bd16a2261d10deeaa87e14c75eab2',
        'nan',
        'nan',
        39.405606,
        -76.626483,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Eudowood',
        'MD',
        '21204.0',
        'uploaded',
        'uploaded_2b6bd16a2261d10deeaa87e14c75eab2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Eudowood", "Zip Code": 21204.0, "Latitude": 39.405606, "Longitude": -76.626483, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.405606, "lng": -76.626483, "phone": null, "country": null, "city": "Eudowood", "state": "MD", "postal_code": 21204.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_85ac1c3bea2bae6eebe3ae5b3b324cd6',
        'Advanced Radiology',
        '1430 Progress Way, Ste. 108',
        39.39667,
        -76.965001,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 549-6717',
        NULL,
        'United States',
        'Eldersburg',
        'MD',
        '21784.0',
        'uploaded',
        'uploaded_85ac1c3bea2bae6eebe3ae5b3b324cd6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "1430 Progress Way, Ste. 108", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(410) 549-6717", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Eldersburg", "Zip Code": 21784.0, "Latitude": 39.39667, "Longitude": -76.965001, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "1430 Progress Way, Ste. 108", "lat": 39.39667, "lng": -76.965001, "phone": "(410) 549-6717", "country": "United States", "city": "Eldersburg", "state": "MD", "postal_code": 21784.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_64dc714645d09b36ca874ca1f8b545d7',
        'nan',
        'nan',
        39.39667,
        -76.965001,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Gaither',
        'MD',
        '21784.0',
        'uploaded',
        'uploaded_64dc714645d09b36ca874ca1f8b545d7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Gaither", "Zip Code": 21784.0, "Latitude": 39.39667, "Longitude": -76.965001, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.39667, "lng": -76.965001, "phone": null, "country": null, "city": "Gaither", "state": "MD", "postal_code": 21784.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_fcc73e50b74930af056ad7da20b9dfc6',
        'Advanced Radiology',
        '193 Stoner Avenue, Ste. 200',
        39.563901,
        -76.989264,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 876-9898',
        NULL,
        'United States',
        'Carrollton',
        'MD',
        '21157.0',
        'uploaded',
        'uploaded_fcc73e50b74930af056ad7da20b9dfc6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "193 Stoner Avenue, Ste. 200", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(410) 876-9898", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Carrollton", "Zip Code": 21157.0, "Latitude": 39.563901, "Longitude": -76.989264, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "193 Stoner Avenue, Ste. 200", "lat": 39.563901, "lng": -76.989264, "phone": "(410) 876-9898", "country": "United States", "city": "Carrollton", "state": "MD", "postal_code": 21157.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4b36c9ffec8902b7eac08776ca253c7a',
        'nan',
        'nan',
        39.563901,
        -76.989264,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Westminster',
        'MD',
        '21157.0',
        'uploaded',
        'uploaded_4b36c9ffec8902b7eac08776ca253c7a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Westminster", "Zip Code": 21157.0, "Latitude": 39.563901, "Longitude": -76.989264, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.563901, "lng": -76.989264, "phone": null, "country": null, "city": "Westminster", "state": "MD", "postal_code": 21157.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_468ac58da274389e80e5f3f9d8de9889',
        'Advanced Radiology',
        '7556 Teague Road, Ste. 200',
        39.167708,
        -76.717064,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(443) 729-8100',
        NULL,
        'United States',
        'Hanover',
        'MD',
        '21076.0',
        'uploaded',
        'uploaded_468ac58da274389e80e5f3f9d8de9889',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "7556 Teague Road, Ste. 200", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(443) 729-8100", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hanover", "Zip Code": 21076.0, "Latitude": 39.167708, "Longitude": -76.717064, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "7556 Teague Road, Ste. 200", "lat": 39.167708, "lng": -76.717064, "phone": "(443) 729-8100", "country": "United States", "city": "Hanover", "state": "MD", "postal_code": 21076.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d09c36a0e8c5a6bdaecadce941ebe741',
        'nan',
        'nan',
        39.167708,
        -76.717064,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Harmans',
        'MD',
        '21076.0',
        'uploaded',
        'uploaded_d09c36a0e8c5a6bdaecadce941ebe741',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Harmans", "Zip Code": 21076.0, "Latitude": 39.167708, "Longitude": -76.717064, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.167708, "lng": -76.717064, "phone": null, "country": null, "city": "Harmans", "state": "MD", "postal_code": 21076.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_30fec2d3b49f7ad9636e844704ff7a91',
        'Advanced Radiology',
        '888 Bestgate Road',
        38.997511,
        -76.498039,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 573-3900',
        NULL,
        'United States',
        'Annapolis',
        'MD',
        '21401.0',
        'uploaded',
        'uploaded_30fec2d3b49f7ad9636e844704ff7a91',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "888 Bestgate Road", "Address Two": "Ste. 101", "clinic Hours of Operation": null, "Phone Number": "(410) 573-3900", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Annapolis", "Zip Code": 21401.0, "Latitude": 38.997511, "Longitude": -76.498039, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "888 Bestgate Road", "lat": 38.997511, "lng": -76.498039, "phone": "(410) 573-3900", "country": "United States", "city": "Annapolis", "state": "MD", "postal_code": 21401.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3e9660520a37d3039bec70ab1fbe9397',
        'nan',
        'nan',
        38.997511,
        -76.498039,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Cape Saint Claire',
        'MD',
        '21401.0',
        'uploaded',
        'uploaded_3e9660520a37d3039bec70ab1fbe9397',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cape Saint Claire", "Zip Code": 21401.0, "Latitude": 38.997511, "Longitude": -76.498039, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 38.997511, "lng": -76.498039, "phone": null, "country": null, "city": "Cape Saint Claire", "state": "MD", "postal_code": 21401.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_020bc45b8cdb28cf45d4c817a6ba6d5a',
        'Advanced Radiology',
        '1576 Merritt Boulevard, Ste. 1',
        39.263162,
        -76.5082,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 918-3150',
        NULL,
        'United States',
        'Baltimore',
        'MD',
        '21222.0',
        'uploaded',
        'uploaded_020bc45b8cdb28cf45d4c817a6ba6d5a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "1576 Merritt Boulevard, Ste. 1", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(410) 918-3150", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Baltimore", "Zip Code": 21222.0, "Latitude": 39.263162, "Longitude": -76.5082, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "1576 Merritt Boulevard, Ste. 1", "lat": 39.263162, "lng": -76.5082, "phone": "(410) 918-3150", "country": "United States", "city": "Baltimore", "state": "MD", "postal_code": 21222.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_787ae5dafa64aa0b8ba61d8bf5797c42',
        'nan',
        'nan',
        39.263162,
        -76.5082,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Dundalk',
        'MD',
        '21222.0',
        'uploaded',
        'uploaded_787ae5dafa64aa0b8ba61d8bf5797c42',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dundalk", "Zip Code": 21222.0, "Latitude": 39.263162, "Longitude": -76.5082, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.263162, "lng": -76.5082, "phone": null, "country": null, "city": "Dundalk", "state": "MD", "postal_code": 21222.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_36e959bef6142c5472a8df722e2e791e',
        'Advanced Radiology',
        '9105 Franklin Square Drive, Ste. 102',
        39.33224,
        -76.503657,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 918-3400',
        NULL,
        'United States',
        'Baltimore',
        'MD',
        '21237.0',
        'uploaded',
        'uploaded_36e959bef6142c5472a8df722e2e791e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "9105 Franklin Square Drive, Ste. 102", "Address Two": null, "clinic Hours of Operation": "Mon-Fri: 5:30am-9:30pm\nSat: 7:00am\u20132:30pm\nSun: 6:30am\u20133:00pm", "Phone Number": "(410) 918-3400", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Baltimore", "Zip Code": 21237.0, "Latitude": 39.33224, "Longitude": -76.503657, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "9105 Franklin Square Drive, Ste. 102", "lat": 39.33224, "lng": -76.503657, "phone": "(410) 918-3400", "country": "United States", "city": "Baltimore", "state": "MD", "postal_code": 21237.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_47b2319af844e72f393bd4edbfa38e73',
        'nan',
        'nan',
        39.33224,
        -76.503657,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Rosedale',
        'MD',
        '21237.0',
        'uploaded',
        'uploaded_47b2319af844e72f393bd4edbfa38e73',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Rosedale", "Zip Code": 21237.0, "Latitude": 39.33224, "Longitude": -76.503657, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.33224, "lng": -76.503657, "phone": null, "country": null, "city": "Rosedale", "state": "MD", "postal_code": 21237.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_500dd41f51e21117a9cd8bb0636528db',
        'Advanced Radiology',
        '4211 Blakely Avenue, Ste. 100',
        39.389457,
        -76.487096,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 918-3350',
        NULL,
        'United States',
        'Baltimore',
        'MD',
        '21236.0',
        'uploaded',
        'uploaded_500dd41f51e21117a9cd8bb0636528db',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "4211 Blakely Avenue, Ste. 100", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(410) 918-3350", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Baltimore", "Zip Code": 21236.0, "Latitude": 39.389457, "Longitude": -76.487096, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "4211 Blakely Avenue, Ste. 100", "lat": 39.389457, "lng": -76.487096, "phone": "(410) 918-3350", "country": "United States", "city": "Baltimore", "state": "MD", "postal_code": 21236.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_0f3a9e47285e85f0db90df379407c872',
        'nan',
        'nan',
        39.389457,
        -76.487096,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Nottingham',
        'MD',
        '21236.0',
        'uploaded',
        'uploaded_0f3a9e47285e85f0db90df379407c872',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Nottingham", "Zip Code": 21236.0, "Latitude": 39.389457, "Longitude": -76.487096, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.389457, "lng": -76.487096, "phone": null, "country": null, "city": "Nottingham", "state": "MD", "postal_code": 21236.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d23e5eca1bac131f6c6fd0ab71621d4b',
        'Advanced Radiology',
        '1700 Reisterstown Road, Ste 112 & 119',
        39.376879,
        -76.7287,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 580-2100',
        NULL,
        'United States',
        'Baltimore',
        'MD',
        '21208.0',
        'uploaded',
        'uploaded_d23e5eca1bac131f6c6fd0ab71621d4b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "1700 Reisterstown Road, Ste 112 & 119", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(410) 580-2100", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Baltimore", "Zip Code": 21208.0, "Latitude": 39.376879, "Longitude": -76.7287, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "1700 Reisterstown Road, Ste 112 & 119", "lat": 39.376879, "lng": -76.7287, "phone": "(410) 580-2100", "country": "United States", "city": "Baltimore", "state": "MD", "postal_code": 21208.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
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
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Pikesville", "Zip Code": 21208.0, "Latitude": 39.376879, "Longitude": -76.7287, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.376879, "lng": -76.7287, "phone": null, "country": null, "city": "Pikesville", "state": "MD", "postal_code": 21208.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_da88e5f968cd11970eb563ebfc771768',
        'Advanced Radiology',
        '6701 North Charles Street, Ste. 3103',
        39.405606,
        -76.626483,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 580-2300',
        NULL,
        'United States',
        'Baltimore',
        'MD',
        '21204.0',
        'uploaded',
        'uploaded_da88e5f968cd11970eb563ebfc771768',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "6701 North Charles Street, Ste. 3103", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(410) 580-2300", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Baltimore", "Zip Code": 21204.0, "Latitude": 39.405606, "Longitude": -76.626483, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "6701 North Charles Street, Ste. 3103", "lat": 39.405606, "lng": -76.626483, "phone": "(410) 580-2300", "country": "United States", "city": "Baltimore", "state": "MD", "postal_code": 21204.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7513ce1cdf33e0065bc4d0c4815a14b0',
        'Advanced Radiology',
        '104 Plumtree Road, Ste. 106',
        39.532212,
        -76.307544,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 515-4000',
        NULL,
        'United States',
        'Bel Air',
        'MD',
        '21015.0',
        'uploaded',
        'uploaded_7513ce1cdf33e0065bc4d0c4815a14b0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "104 Plumtree Road, Ste. 106", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(410) 515-4000", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Bel Air", "Zip Code": 21015.0, "Latitude": 39.532212, "Longitude": -76.307544, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "104 Plumtree Road, Ste. 106", "lat": 39.532212, "lng": -76.307544, "phone": "(410) 515-4000", "country": "United States", "city": "Bel Air", "state": "MD", "postal_code": 21015.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_76ae2dff316c8942f7fb647aee77e8f2',
        'Advanced Radiology',
        '4801 Dorsey Hall Drive, Ste. 101 ',
        39.276305,
        -76.860822,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(443) 436-1600',
        NULL,
        'United States',
        'Ellicott',
        'MD',
        '21042.0',
        'uploaded',
        'uploaded_76ae2dff316c8942f7fb647aee77e8f2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Advanced Radiology", "Address": "4801 Dorsey Hall Drive, Ste. 101 ", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(443) 436-1600", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ellicott", "Zip Code": 21042.0, "Latitude": 39.276305, "Longitude": -76.860822, "State": "MD", "zipcode UTC": -5.0, "name": "Advanced Radiology", "address": "4801 Dorsey Hall Drive, Ste. 101 ", "lat": 39.276305, "lng": -76.860822, "phone": "(443) 436-1600", "country": "United States", "city": "Ellicott", "state": "MD", "postal_code": 21042.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_75ddcefd7be607b62b24c49b8c232b94',
        'nan',
        'nan',
        39.276305,
        -76.860822,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Ellicott City',
        'MD',
        '21042.0',
        'uploaded',
        'uploaded_75ddcefd7be607b62b24c49b8c232b94',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ellicott City", "Zip Code": 21042.0, "Latitude": 39.276305, "Longitude": -76.860822, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.276305, "lng": -76.860822, "phone": null, "country": null, "city": "Ellicott City", "state": "MD", "postal_code": 21042.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5a3aa57fe357b34fce17bea99e487769',
        'Rose Radiology',
        '7239 Highway 310 South',
        27.8796,
        -82.3299,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 677-2020',
        NULL,
        'United States',
        'Riverview',
        'FL',
        '33578.0',
        'uploaded',
        'uploaded_5a3aa57fe357b34fce17bea99e487769',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "7239 Highway 310 South", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(813) 677-2020", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Riverview", "Zip Code": 33578.0, "Latitude": 27.8796, "Longitude": -82.3299, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "7239 Highway 310 South", "lat": 27.8796, "lng": -82.3299, "phone": "(813) 677-2020", "country": "United States", "city": "Riverview", "state": "FL", "postal_code": 33578.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9d802af91d4133887de9f090a57338f1',
        'Rose Radiology',
        '4551 4th Street North',
        27.816977,
        -82.627951,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(727) 525-3800',
        NULL,
        'United States',
        'Saint Petersburg',
        'FL',
        '33703.0',
        'uploaded',
        'uploaded_9d802af91d4133887de9f090a57338f1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "4551 4th Street North", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am 5:00pm ", "Phone Number": "(727) 525-3800", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Saint Petersburg", "Zip Code": 33703.0, "Latitude": 27.816977, "Longitude": -82.627951, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "4551 4th Street North", "lat": 27.816977, "lng": -82.627951, "phone": "(727) 525-3800", "country": "United States", "city": "Saint Petersburg", "state": "FL", "postal_code": 33703.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_468c22cd353e2d2d238efcded02f9a46',
        'nan',
        'nan',
        27.816977,
        -82.627951,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'St Petersburg',
        'FL',
        '33703.0',
        'uploaded',
        'uploaded_468c22cd353e2d2d238efcded02f9a46',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "St Petersburg", "Zip Code": 33703.0, "Latitude": 27.816977, "Longitude": -82.627951, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 27.816977, "lng": -82.627951, "phone": null, "country": null, "city": "St Petersburg", "state": "FL", "postal_code": 33703.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_08b5bcb48b32229e69f9c3354ae580e8',
        'Rose Radiology',
        '13787 South Belcher Road, Ste. 300',
        27.906088,
        -82.755305,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(727) 531-5444',
        NULL,
        'United States',
        'Largo',
        'FL',
        '33771.0',
        'uploaded',
        'uploaded_08b5bcb48b32229e69f9c3354ae580e8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "13787 South Belcher Road, Ste. 300", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm ", "Phone Number": "(727) 531-5444", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Largo", "Zip Code": 33771.0, "Latitude": 27.906088, "Longitude": -82.755305, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "13787 South Belcher Road, Ste. 300", "lat": 27.906088, "lng": -82.755305, "phone": "(727) 531-5444", "country": "United States", "city": "Largo", "state": "FL", "postal_code": 33771.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f1f90f6e3a44c42ae6698bb83b31932c',
        'Rose Radiology',
        '10910 SR 70, Ste. 103',
        27.434755,
        -82.402115,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(941) 755-5257',
        NULL,
        'United States',
        'Bradenton',
        'FL',
        '34202.0',
        'uploaded',
        'uploaded_f1f90f6e3a44c42ae6698bb83b31932c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "10910 SR 70, Ste. 103", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(941) 755-5257", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Bradenton", "Zip Code": 34202.0, "Latitude": 27.434755, "Longitude": -82.402115, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "10910 SR 70, Ste. 103", "lat": 27.434755, "lng": -82.402115, "phone": "(941) 755-5257", "country": "United States", "city": "Bradenton", "state": "FL", "postal_code": 34202.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4e769c83917db380988768d0700073b1',
        'nan',
        'nan',
        27.434755,
        -82.402115,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Lakewood Ranch',
        'FL',
        '34202.0',
        'uploaded',
        'uploaded_4e769c83917db380988768d0700073b1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lakewood Ranch", "Zip Code": 34202.0, "Latitude": 27.434755, "Longitude": -82.402115, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 27.434755, "lng": -82.402115, "phone": null, "country": null, "city": "Lakewood Ranch", "state": "FL", "postal_code": 34202.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_71a3ef34f08ebd16554f8bde151f1703',
        'Rose Radiology',
        '8462 Northcliffe Boulevard',
        28.470236,
        -82.597418,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(352) 688-7377',
        NULL,
        'United States',
        'Brooksville',
        'FL',
        '34606.0',
        'uploaded',
        'uploaded_71a3ef34f08ebd16554f8bde151f1703',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "8462 Northcliffe Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(352) 688-7377", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Brooksville", "Zip Code": 34606.0, "Latitude": 28.470236, "Longitude": -82.597418, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "8462 Northcliffe Boulevard", "lat": 28.470236, "lng": -82.597418, "phone": "(352) 688-7377", "country": "United States", "city": "Brooksville", "state": "FL", "postal_code": 34606.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_656dc883ebd07c4384005a552da111e9',
        'nan',
        'nan',
        28.470236,
        -82.597418,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Spring Hill',
        'FL',
        '34606.0',
        'uploaded',
        'uploaded_656dc883ebd07c4384005a552da111e9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Spring Hill", "Zip Code": 34606.0, "Latitude": 28.470236, "Longitude": -82.597418, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 28.470236, "lng": -82.597418, "phone": null, "country": null, "city": "Spring Hill", "state": "FL", "postal_code": 34606.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_96060b53f8acdc5f43820d0838f0d286',
        'Rose Radiology',
        '2144 Duck Slough Boulevard, Ste. 102',
        28.209833,
        -82.669736,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(727) 375-8880',
        NULL,
        'United States',
        'New Port Richey',
        'FL',
        '34655.0',
        'uploaded',
        'uploaded_96060b53f8acdc5f43820d0838f0d286',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "2144 Duck Slough Boulevard, Ste. 102", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(727) 375-8880", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "New Port Richey", "Zip Code": 34655.0, "Latitude": 28.209833, "Longitude": -82.669736, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "2144 Duck Slough Boulevard, Ste. 102", "lat": 28.209833, "lng": -82.669736, "phone": "(727) 375-8880", "country": "United States", "city": "New Port Richey", "state": "FL", "postal_code": 34655.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f3d46fddf188b06893127378a93ddee4',
        'nan',
        'nan',
        28.209833,
        -82.669736,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'New Prt Rchy',
        'FL',
        '34655.0',
        'uploaded',
        'uploaded_f3d46fddf188b06893127378a93ddee4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "New Prt Rchy", "Zip Code": 34655.0, "Latitude": 28.209833, "Longitude": -82.669736, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 28.209833, "lng": -82.669736, "phone": null, "country": null, "city": "New Prt Rchy", "state": "FL", "postal_code": 34655.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_fc031a75e483c3433d566d7ec63051bb',
        'Rose Radiology',
        '27662 Cashford Circle',
        28.187356,
        -82.316019,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 788-2500',
        NULL,
        'United States',
        'Zephyrhi',
        'FL',
        '33543.0',
        'uploaded',
        'uploaded_fc031a75e483c3433d566d7ec63051bb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "27662 Cashford Circle", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am- 5:00pm", "Phone Number": "(813) 788-2500", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Zephyrhi", "Zip Code": 33543.0, "Latitude": 28.187356, "Longitude": -82.316019, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "27662 Cashford Circle", "lat": 28.187356, "lng": -82.316019, "phone": "(813) 788-2500", "country": "United States", "city": "Zephyrhi", "state": "FL", "postal_code": 33543.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_22c203ef324ee337ee0ee686ba1328b1',
        'nan',
        'nan',
        28.187356,
        -82.316019,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Wesley C',
        'FL',
        '33543.0',
        'uploaded',
        'uploaded_22c203ef324ee337ee0ee686ba1328b1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Wesley C", "Zip Code": 33543.0, "Latitude": 28.187356, "Longitude": -82.316019, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 28.187356, "lng": -82.316019, "phone": null, "country": null, "city": "Wesley C", "state": "FL", "postal_code": 33543.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d0b0e337ab6f3e7264bfc5273094f6d7',
        'Rose Radiology',
        '2605 West Kennedy Boulevard',
        27.943549,
        -82.506566,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 876-7200',
        NULL,
        'United States',
        'Tampa',
        'FL',
        '33609.0',
        'uploaded',
        'uploaded_d0b0e337ab6f3e7264bfc5273094f6d7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "2605 West Kennedy Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(813) 876-7200", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Tampa", "Zip Code": 33609.0, "Latitude": 27.943549, "Longitude": -82.506566, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "2605 West Kennedy Boulevard", "lat": 27.943549, "lng": -82.506566, "phone": "(813) 876-7200", "country": "United States", "city": "Tampa", "state": "FL", "postal_code": 33609.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_585311ee98da8e210b73e044a97e748d',
        'Rose Radiology',
        '5107 North Armenia Ave',
        27.984198,
        -82.462705,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 637-2906',
        NULL,
        'United States',
        'Tampa',
        'FL',
        '33603.0',
        'uploaded',
        'uploaded_585311ee98da8e210b73e044a97e748d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "5107 North Armenia Ave", "Address Two": "Ste B", "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(813) 637-2906", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Tampa", "Zip Code": 33603.0, "Latitude": 27.984198, "Longitude": -82.462705, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "5107 North Armenia Ave", "lat": 27.984198, "lng": -82.462705, "phone": "(813) 637-2906", "country": "United States", "city": "Tampa", "state": "FL", "postal_code": 33603.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_4eafd4201203a2f315ab6a1fceac0158',
        'Rose Radiology',
        '4917 Clark Road',
        27.285142,
        -82.47363,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(941) 927-7711',
        NULL,
        'United States',
        'Sarasota',
        'FL',
        '34233.0',
        'uploaded',
        'uploaded_4eafd4201203a2f315ab6a1fceac0158',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "4917 Clark Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(941) 927-7711", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Sarasota", "Zip Code": 34233.0, "Latitude": 27.285142, "Longitude": -82.47363, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "4917 Clark Road", "lat": 27.285142, "lng": -82.47363, "phone": "(941) 927-7711", "country": "United States", "city": "Sarasota", "state": "FL", "postal_code": 34233.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ea6134e186be78c10b3d2fdd57b44e5a',
        'Rose Radiology',
        '122 Oakfield Drive',
        27.911201,
        -82.294803,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 655-1144',
        NULL,
        'United States',
        'Brandon',
        'FL',
        '33511.0',
        'uploaded',
        'uploaded_ea6134e186be78c10b3d2fdd57b44e5a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "122 Oakfield Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(813) 655-1144", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Brandon", "Zip Code": 33511.0, "Latitude": 27.911201, "Longitude": -82.294803, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "122 Oakfield Drive", "lat": 27.911201, "lng": -82.294803, "phone": "(813) 655-1144", "country": "United States", "city": "Brandon", "state": "FL", "postal_code": 33511.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f4b7598bed0b2e57a44c285b523f40c0',
        'Rose Radiology',
        '4133 Woodlands Parkway',
        28.099485,
        -82.695329,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(727) 781-3888',
        NULL,
        'United States',
        'Palm Harbor',
        'FL',
        '34685.0',
        'uploaded',
        'uploaded_f4b7598bed0b2e57a44c285b523f40c0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "4133 Woodlands Parkway", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(727) 781-3888", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Palm Harbor", "Zip Code": 34685.0, "Latitude": 28.099485, "Longitude": -82.695329, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "4133 Woodlands Parkway", "lat": 28.099485, "lng": -82.695329, "phone": "(727) 781-3888", "country": "United States", "city": "Palm Harbor", "state": "FL", "postal_code": 34685.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_1a9b43ef994ce38a86a83ad100f35071',
        'Rose Radiology',
        '6900 Gall Boulevard',
        28.2385,
        -82.1809,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 783-6736',
        NULL,
        'United States',
        'Zephyrhills',
        'FL',
        '33542.0',
        'uploaded',
        'uploaded_1a9b43ef994ce38a86a83ad100f35071',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "6900 Gall Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(813) 783-6736", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Zephyrhills", "Zip Code": 33542.0, "Latitude": 28.2385, "Longitude": -82.1809, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "6900 Gall Boulevard", "lat": 28.2385, "lng": -82.1809, "phone": "(813) 783-6736", "country": "United States", "city": "Zephyrhills", "state": "FL", "postal_code": 33542.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c76a5fe6dd08b61d8942f8b703676d2f',
        'Kern Radiology Medical Group',
        '2301 Bahamas Drive',
        35.340759,
        -119.064973,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(661) 326-9600',
        NULL,
        'United States',
        'Bakersfield',
        'CA',
        '93309.0',
        'uploaded',
        'uploaded_c76a5fe6dd08b61d8942f8b703676d2f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Kern Radiology Medical Group", "Address": "2301 Bahamas Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(661) 326-9600", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Bakersfield", "Zip Code": 93309.0, "Latitude": 35.340759, "Longitude": -119.064973, "State": "CA", "zipcode UTC": -8.0, "name": "Kern Radiology Medical Group", "address": "2301 Bahamas Drive", "lat": 35.340759, "lng": -119.064973, "phone": "(661) 326-9600", "country": "United States", "city": "Bakersfield", "state": "CA", "postal_code": 93309.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_8321c8dd2508984609e2d0abb90c5808',
        'Kern Radiology Medical Group',
        '3838 San Dimas, Ste. A-120',
        35.381408,
        -119.019358,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(661) 326-9600',
        NULL,
        'United States',
        'Bakersfield',
        'CA',
        '93301.0',
        'uploaded',
        'uploaded_8321c8dd2508984609e2d0abb90c5808',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Kern Radiology Medical Group", "Address": "3838 San Dimas, Ste. A-120", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(661) 326-9600", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Bakersfield", "Zip Code": 93301.0, "Latitude": 35.381408, "Longitude": -119.019358, "State": "CA", "zipcode UTC": -8.0, "name": "Kern Radiology Medical Group", "address": "3838 San Dimas, Ste. A-120", "lat": 35.381408, "lng": -119.019358, "phone": "(661) 326-9600", "country": "United States", "city": "Bakersfield", "state": "CA", "postal_code": 93301.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_956e11dbed765ba0f0a7bc83d627bd1f',
        'Truxtun Radiology',
        '4000 Empire Drive, Ste. 100',
        35.340759,
        -119.064973,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(661) 325-6800',
        NULL,
        'United States',
        'Bakersfield',
        'CA',
        '93309.0',
        'uploaded',
        'uploaded_956e11dbed765ba0f0a7bc83d627bd1f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Truxtun Radiology", "Address": "4000 Empire Drive, Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm ", "Phone Number": "(661) 325-6800", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Bakersfield", "Zip Code": 93309.0, "Latitude": 35.340759, "Longitude": -119.064973, "State": "CA", "zipcode UTC": -8.0, "name": "Truxtun Radiology", "address": "4000 Empire Drive, Ste. 100", "lat": 35.340759, "lng": -119.064973, "phone": "(661) 325-6800", "country": "United States", "city": "Bakersfield", "state": "CA", "postal_code": 93309.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d51408e6d3d83a264b8acda41efa7f73',
        'Truxtun Radiology',
        '9900 Stockdale Highway',
        35.200467,
        -119.173998,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(616) 325-6800',
        NULL,
        'United States',
        'Bakersfield',
        'CA',
        '93311.0',
        'uploaded',
        'uploaded_d51408e6d3d83a264b8acda41efa7f73',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Truxtun Radiology", "Address": "9900 Stockdale Highway", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(616) 325-6800", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Bakersfield", "Zip Code": 93311.0, "Latitude": 35.200467, "Longitude": -119.173998, "State": "CA", "zipcode UTC": -8.0, "name": "Truxtun Radiology", "address": "9900 Stockdale Highway", "lat": 35.200467, "lng": -119.173998, "phone": "(616) 325-6800", "country": "United States", "city": "Bakersfield", "state": "CA", "postal_code": 93311.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9d7a03b4bd3c71c54da9b15cff11c6c4',
        'Vancouver Radiologists',
        '505 NE 87th Avenue, Ste. LL50',
        45.62104,
        -122.579473,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(360) 254-4914',
        NULL,
        'United States',
        'Vancouver',
        'WA',
        '98664.0',
        'uploaded',
        'uploaded_9d7a03b4bd3c71c54da9b15cff11c6c4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Vancouver Radiologists", "Address": "505 NE 87th Avenue, Ste. LL50", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 6:00pm    Sat 9:00am - 1:00pm", "Phone Number": "(360) 254-4914", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Vancouver", "Zip Code": 98664.0, "Latitude": 45.62104, "Longitude": -122.579473, "State": "WA", "zipcode UTC": -8.0, "name": "Vancouver Radiologists", "address": "505 NE 87th Avenue, Ste. LL50", "lat": 45.62104, "lng": -122.579473, "phone": "(360) 254-4914", "country": "United States", "city": "Vancouver", "state": "WA", "postal_code": 98664.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_709fae06162f2b4283c1d16da494a16c',
        'Bay Radiology Associates',
        '330 West 23rd Street. Ste. A',
        30.195424,
        -85.664587,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(850) 763-2451',
        NULL,
        'United States',
        'Panama City',
        'FL',
        '32405.0',
        'uploaded',
        'uploaded_709fae06162f2b4283c1d16da494a16c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Bay Radiology Associates", "Address": "330 West 23rd Street. Ste. A", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(850) 763-2451", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Panama City", "Zip Code": 32405.0, "Latitude": 30.195424, "Longitude": -85.664587, "State": "FL", "zipcode UTC": -6.0, "name": "Bay Radiology Associates", "address": "330 West 23rd Street. Ste. A", "lat": 30.195424, "lng": -85.664587, "phone": "(850) 763-2451", "country": "United States", "city": "Panama City", "state": "FL", "postal_code": 32405.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_07ecd857832fab078db75aea34e04127',
        'Hawaii Radiologic Associates',
        '670 Ponahawai Street',
        19.713562,
        -155.098428,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(808) 969-8010',
        NULL,
        'United States',
        'Hilo',
        'HI',
        '96720.0',
        'uploaded',
        'uploaded_07ecd857832fab078db75aea34e04127',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Hawaii Radiologic Associates", "Address": "670 Ponahawai Street", "Address Two": "Suite 110", "clinic Hours of Operation": "Mon-Fri 7:30am - 4:00pm", "Phone Number": "(808) 969-8010", "Country": "United States", "Time Zone Display": "HAST - Hawaiian Standard Time", "City": "Hilo", "Zip Code": 96720.0, "Latitude": 19.713562, "Longitude": -155.098428, "State": "HI", "zipcode UTC": -10.0, "name": "Hawaii Radiologic Associates", "address": "670 Ponahawai Street", "lat": 19.713562, "lng": -155.098428, "phone": "(808) 969-8010", "country": "United States", "city": "Hilo", "state": "HI", "postal_code": 96720.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_30e7907fcfc65ca428f35568f4ca742c',
        'M & S Radiology Associates',
        '215 East Quincy Ste. 100',
        29.438032,
        -98.481143,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(210) 351-0784',
        NULL,
        'United States',
        'San Antonio',
        'TX',
        '78215.0',
        'uploaded',
        'uploaded_30e7907fcfc65ca428f35568f4ca742c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "M & S Radiology Associates", "Address": "215 East Quincy Ste. 100", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 6:30pm      Sat 8:00am - 12:00pm", "Phone Number": "(210) 351-0784", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "San Antonio", "Zip Code": 78215.0, "Latitude": 29.438032, "Longitude": -98.481143, "State": "TX", "zipcode UTC": -6.0, "name": "M & S Radiology Associates", "address": "215 East Quincy Ste. 100", "lat": 29.438032, "lng": -98.481143, "phone": "(210) 351-0784", "country": "United States", "city": "San Antonio", "state": "TX", "postal_code": 78215.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_82ce672f30923452f10cf7c12271997e',
        'Monument Radiology',
        '7231 Forest Avenue, Ste. 102',
        37.581696,
        -77.517095,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(804) 288-8321 x13',
        NULL,
        'United States',
        'Richmond',
        'VA',
        '23226.0',
        'uploaded',
        'uploaded_82ce672f30923452f10cf7c12271997e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Monument Radiology", "Address": "7231 Forest Avenue, Ste. 102", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(804) 288-8321 x13", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Richmond", "Zip Code": 23226.0, "Latitude": 37.581696, "Longitude": -77.517095, "State": "VA", "zipcode UTC": -5.0, "name": "Monument Radiology", "address": "7231 Forest Avenue, Ste. 102", "lat": 37.581696, "lng": -77.517095, "phone": "(804) 288-8321 x13", "country": "United States", "city": "Richmond", "state": "VA", "postal_code": 23226.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_fee6c62355b638555d90dcea1e52a5e9',
        'nan',
        'nan',
        37.581696,
        -77.517095,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Westhampton',
        'VA',
        '23226.0',
        'uploaded',
        'uploaded_fee6c62355b638555d90dcea1e52a5e9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Westhampton", "Zip Code": 23226.0, "Latitude": 37.581696, "Longitude": -77.517095, "State": "VA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 37.581696, "lng": -77.517095, "phone": null, "country": null, "city": "Westhampton", "state": "VA", "postal_code": 23226.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d55afa95f8d02a459681ea3718360276',
        'Tower Radiology Centers',
        '2324 Oak Myrtly Lane',
        28.26658,
        -82.342229,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 874-3177',
        NULL,
        'United States',
        'Zephyrhi',
        'FL',
        '33544.0',
        'uploaded',
        'uploaded_d55afa95f8d02a459681ea3718360276',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Tower Radiology Centers", "Address": "2324 Oak Myrtly Lane", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:30pm", "Phone Number": "(813) 874-3177", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Zephyrhi", "Zip Code": 33544.0, "Latitude": 28.26658, "Longitude": -82.342229, "State": "FL", "zipcode UTC": -5.0, "name": "Tower Radiology Centers", "address": "2324 Oak Myrtly Lane", "lat": 28.26658, "lng": -82.342229, "phone": "(813) 874-3177", "country": "United States", "city": "Zephyrhi", "state": "FL", "postal_code": 33544.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5cc58153902af62624b10dcb8c79ed06',
        'nan',
        'nan',
        28.26658,
        -82.342229,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Wesley C',
        'FL',
        '33544.0',
        'uploaded',
        'uploaded_5cc58153902af62624b10dcb8c79ed06',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Wesley C", "Zip Code": 33544.0, "Latitude": 28.26658, "Longitude": -82.342229, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 28.26658, "lng": -82.342229, "phone": null, "country": null, "city": "Wesley C", "state": "FL", "postal_code": 33544.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5ad41a7d607b82dfd767b6dec0802022',
        'Tower Radiology Centers',
        '17503 North Dale Mabry Highway',
        28.143,
        -82.4752,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 874-3177',
        NULL,
        'United States',
        'Lutz',
        'FL',
        '33548.0',
        'uploaded',
        'uploaded_5ad41a7d607b82dfd767b6dec0802022',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Tower Radiology Centers", "Address": "17503 North Dale Mabry Highway", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am -5:00pm", "Phone Number": "(813) 874-3177", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Lutz", "Zip Code": 33548.0, "Latitude": 28.143, "Longitude": -82.4752, "State": "FL", "zipcode UTC": -5.0, "name": "Tower Radiology Centers", "address": "17503 North Dale Mabry Highway", "lat": 28.143, "lng": -82.4752, "phone": "(813) 874-3177", "country": "United States", "city": "Lutz", "state": "FL", "postal_code": 33548.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_77c9989f1c379303fd8e6e5022512738',
        'Tower Radiology Centers',
        '3069 Grand Pavillion Drive',
        28.077994,
        -82.449891,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 874-3177',
        NULL,
        'United States',
        'Tampa',
        'FL',
        '33613.0',
        'uploaded',
        'uploaded_77c9989f1c379303fd8e6e5022512738',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Tower Radiology Centers", "Address": "3069 Grand Pavillion Drive", "Address Two": null, "clinic Hours of Operation": "Mon-zfri 7:00am - 6:00pm", "Phone Number": "(813) 874-3177", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Tampa", "Zip Code": 33613.0, "Latitude": 28.077994, "Longitude": -82.449891, "State": "FL", "zipcode UTC": -5.0, "name": "Tower Radiology Centers", "address": "3069 Grand Pavillion Drive", "lat": 28.077994, "lng": -82.449891, "phone": "(813) 874-3177", "country": "United States", "city": "Tampa", "state": "FL", "postal_code": 33613.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c6daade41d921610b93cb54f395bf815',
        'Tower Radiology Centers',
        '1449 N. Dale Mabry HWY, Ste. 150',
        28.071502,
        -82.493923,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 874-3177',
        NULL,
        'United States',
        'Carrollwood',
        'FL',
        '33618.0',
        'uploaded',
        'uploaded_c6daade41d921610b93cb54f395bf815',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Tower Radiology Centers", "Address": "1449 N. Dale Mabry HWY, Ste. 150", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 5:00pm       Sat 8:00am - 2:00pm", "Phone Number": "(813) 874-3177", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Carrollwood", "Zip Code": 33618.0, "Latitude": 28.071502, "Longitude": -82.493923, "State": "FL", "zipcode UTC": -5.0, "name": "Tower Radiology Centers", "address": "1449 N. Dale Mabry HWY, Ste. 150", "lat": 28.071502, "lng": -82.493923, "phone": "(813) 874-3177", "country": "United States", "city": "Carrollwood", "state": "FL", "postal_code": 33618.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_07d4bf1ff1b8acc0e25dbd233862e925',
        'nan',
        'nan',
        28.071502,
        -82.493923,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Tampa',
        'FL',
        '33618.0',
        'uploaded',
        'uploaded_07d4bf1ff1b8acc0e25dbd233862e925',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Tampa", "Zip Code": 33618.0, "Latitude": 28.071502, "Longitude": -82.493923, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 28.071502, "lng": -82.493923, "phone": null, "country": null, "city": "Tampa", "state": "FL", "postal_code": 33618.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_117fde6a13102c2a390d4704d135e515',
        'Tower Radiology Centers',
        '4719 North Habana Avenue ',
        28.006247,
        -82.506322,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 874-3177',
        NULL,
        'United States',
        'Tampa',
        'FL',
        '33614.0',
        'uploaded',
        'uploaded_117fde6a13102c2a390d4704d135e515',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Tower Radiology Centers", "Address": "4719 North Habana Avenue ", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:45am - 5:00pm       Sat 7:30am - 2:00pm", "Phone Number": "(813) 874-3177", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Tampa", "Zip Code": 33614.0, "Latitude": 28.006247, "Longitude": -82.506322, "State": "FL", "zipcode UTC": -5.0, "name": "Tower Radiology Centers", "address": "4719 North Habana Avenue ", "lat": 28.006247, "lng": -82.506322, "phone": "(813) 874-3177", "country": "United States", "city": "Tampa", "state": "FL", "postal_code": 33614.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_60dfd432dc6593e98b6d957b2e6e612f',
        'Tower Radiology Centers',
        '2106 South Lois Avenue',
        27.92085,
        -82.509166,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 874-3177',
        NULL,
        'United States',
        'Palma Ceia',
        'FL',
        '33629.0',
        'uploaded',
        'uploaded_60dfd432dc6593e98b6d957b2e6e612f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Tower Radiology Centers", "Address": "2106 South Lois Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:00am - 5:00pm", "Phone Number": "(813) 874-3177", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Palma Ceia", "Zip Code": 33629.0, "Latitude": 27.92085, "Longitude": -82.509166, "State": "FL", "zipcode UTC": -5.0, "name": "Tower Radiology Centers", "address": "2106 South Lois Avenue", "lat": 27.92085, "lng": -82.509166, "phone": "(813) 874-3177", "country": "United States", "city": "Palma Ceia", "state": "FL", "postal_code": 33629.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3aa1544cc185ea9763b7b8615f347169',
        'nan',
        'nan',
        27.92085,
        -82.509166,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Tampa',
        'FL',
        '33629.0',
        'uploaded',
        'uploaded_3aa1544cc185ea9763b7b8615f347169',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Tampa", "Zip Code": 33629.0, "Latitude": 27.92085, "Longitude": -82.509166, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 27.92085, "lng": -82.509166, "phone": null, "country": null, "city": "Tampa", "state": "FL", "postal_code": 33629.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_be66d0b6d618af0cb25d18af80f369e1',
        'Tower Radiology Centers',
        '3350 Bell Shoals Road',
        27.911201,
        -82.294803,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 847-3177',
        NULL,
        'United States',
        'Brandon',
        'FL',
        '33511.0',
        'uploaded',
        'uploaded_be66d0b6d618af0cb25d18af80f369e1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Tower Radiology Centers", "Address": "3350 Bell Shoals Road", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 5:00pm", "Phone Number": "(813) 847-3177", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Brandon", "Zip Code": 33511.0, "Latitude": 27.911201, "Longitude": -82.294803, "State": "FL", "zipcode UTC": -5.0, "name": "Tower Radiology Centers", "address": "3350 Bell Shoals Road", "lat": 27.911201, "lng": -82.294803, "phone": "(813) 847-3177", "country": "United States", "city": "Brandon", "state": "FL", "postal_code": 33511.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7024b68fb9877b6e03d65a59ba70cc04',
        'Tower Radiology Centers',
        '500 Vonderburg Drive, Ste. 111',
        27.911201,
        -82.294803,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 874-3177',
        NULL,
        'United States',
        'Brandon',
        'FL',
        '33511.0',
        'uploaded',
        'uploaded_7024b68fb9877b6e03d65a59ba70cc04',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Tower Radiology Centers", "Address": "500 Vonderburg Drive, Ste. 111", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 7:30am - 5:30pm", "Phone Number": "(813) 874-3177", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Brandon", "Zip Code": 33511.0, "Latitude": 27.911201, "Longitude": -82.294803, "State": "FL", "zipcode UTC": -5.0, "name": "Tower Radiology Centers", "address": "500 Vonderburg Drive, Ste. 111", "lat": 27.911201, "lng": -82.294803, "phone": "(813) 874-3177", "country": "United States", "city": "Brandon", "state": "FL", "postal_code": 33511.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_995797f18956630748799e050512a8aa',
        'IHS Radiology Medical Group, Inc.  ',
        '3601 Vista Way',
        33.195354,
        -117.282322,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(858) 658-6545',
        NULL,
        'United States',
        'Oceanside',
        'CA',
        '92056.0',
        'uploaded',
        'uploaded_995797f18956630748799e050512a8aa',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "IHS Radiology Medical Group, Inc.  ", "Address": "3601 Vista Way", "Address Two": "Bldg A, Ste 101 & 102", "clinic Hours of Operation": "Mon-Sat 7:00am - 5:00pm     ", "Phone Number": "(858) 658-6545", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Oceanside", "Zip Code": 92056.0, "Latitude": 33.195354, "Longitude": -117.282322, "State": "CA", "zipcode UTC": -8.0, "name": "IHS Radiology Medical Group, Inc.  ", "address": "3601 Vista Way", "lat": 33.195354, "lng": -117.282322, "phone": "(858) 658-6545", "country": "United States", "city": "Oceanside", "state": "CA", "postal_code": 92056.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_82278bcdf0b851fdd1d6360cfe2324a3',
        'IHS Radiology Medical Group, Inc.  ',
        '25150 Hancock Ave',
        33.568617,
        -117.25264,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(951) 600-4848',
        NULL,
        'United States',
        'Murrieta',
        'CA',
        '92562.0',
        'uploaded',
        'uploaded_82278bcdf0b851fdd1d6360cfe2324a3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "IHS Radiology Medical Group, Inc.  ", "Address": "25150 Hancock Ave", "Address Two": "Ste 105", "clinic Hours of Operation": "Mon-Sat 7:00am - 5:00pm", "Phone Number": "(951) 600-4848", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Murrieta", "Zip Code": 92562.0, "Latitude": 33.568617, "Longitude": -117.25264, "State": "CA", "zipcode UTC": -8.0, "name": "IHS Radiology Medical Group, Inc.  ", "address": "25150 Hancock Ave", "lat": 33.568617, "lng": -117.25264, "phone": "(951) 600-4848", "country": "United States", "city": "Murrieta", "state": "CA", "postal_code": 92562.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_903fcfd19624dc2dde84a07d295dafd8',
        'nan',
        'nan',
        33.568617,
        -117.25264,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Murrieta Hot Springs',
        'CA',
        '92562.0',
        'uploaded',
        'uploaded_903fcfd19624dc2dde84a07d295dafd8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Murrieta Hot Springs", "Zip Code": 92562.0, "Latitude": 33.568617, "Longitude": -117.25264, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 33.568617, "lng": -117.25264, "phone": null, "country": null, "city": "Murrieta Hot Springs", "state": "CA", "postal_code": 92562.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_08ff879f9c387612d8e9214214451179',
        'IHS Radiology Medical Group, Inc.  ',
        '333 H Street',
        32.638654,
        -117.066861,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(619) 409-9119',
        NULL,
        'United States',
        'Chula Vista',
        'CA',
        '91910.0',
        'uploaded',
        'uploaded_08ff879f9c387612d8e9214214451179',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "IHS Radiology Medical Group, Inc.  ", "Address": "333 H Street", "Address Two": "Ste 1095 & 3050", "clinic Hours of Operation": "Mon-Sat 7:00am - 5:00pm", "Phone Number": "(619) 409-9119", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Chula Vista", "Zip Code": 91910.0, "Latitude": 32.638654, "Longitude": -117.066861, "State": "CA", "zipcode UTC": -8.0, "name": "IHS Radiology Medical Group, Inc.  ", "address": "333 H Street", "lat": 32.638654, "lng": -117.066861, "phone": "(619) 409-9119", "country": "United States", "city": "Chula Vista", "state": "CA", "postal_code": 91910.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d189c219e0e497dae2a32def2d9a6cbf',
        'IHS Radiology Medical Group, Inc.  ',
        '6386 Alvarado Court',
        32.794449,
        -117.072215,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(619) 229-2299',
        NULL,
        'United States',
        'San Diego',
        'CA',
        '92120.0',
        'uploaded',
        'uploaded_d189c219e0e497dae2a32def2d9a6cbf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "IHS Radiology Medical Group, Inc.  ", "Address": "6386 Alvarado Court", "Address Two": "Ste. 107", "clinic Hours of Operation": "Mon-Sat 7:00am - 5:00pm", "Phone Number": "(619) 229-2299", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Diego", "Zip Code": 92120.0, "Latitude": 32.794449, "Longitude": -117.072215, "State": "CA", "zipcode UTC": -8.0, "name": "IHS Radiology Medical Group, Inc.  ", "address": "6386 Alvarado Court", "lat": 32.794449, "lng": -117.072215, "phone": "(619) 229-2299", "country": "United States", "city": "San Diego", "state": "CA", "postal_code": 92120.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_26468b0cab97eb0ac4e4a23f670a24e1',
        'IHS Radiology Medical Group, Inc.  ',
        '12620 Monte Vista Rd',
        32.973645,
        -117.037013,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(858) 487-9729',
        NULL,
        'United States',
        'Poway',
        'CA',
        '92064.0',
        'uploaded',
        'uploaded_26468b0cab97eb0ac4e4a23f670a24e1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "IHS Radiology Medical Group, Inc.  ", "Address": "12620 Monte Vista Rd", "Address Two": "Ste A", "clinic Hours of Operation": "Mon-Sat 7:00am -5:00pm", "Phone Number": "(858) 487-9729", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Poway", "Zip Code": 92064.0, "Latitude": 32.973645, "Longitude": -117.037013, "State": "CA", "zipcode UTC": -8.0, "name": "IHS Radiology Medical Group, Inc.  ", "address": "12620 Monte Vista Rd", "lat": 32.973645, "lng": -117.037013, "phone": "(858) 487-9729", "country": "United States", "city": "Poway", "state": "CA", "postal_code": 92064.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c865cdc9ac85454c41e59a3242856632',
        'IHS Radiology Medical Group, Inc.  ',
        '4150 Regents Park Row',
        32.838761,
        -117.261591,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(858) 622-6464',
        NULL,
        'United States',
        'La Jolla',
        'CA',
        '92037.0',
        'uploaded',
        'uploaded_c865cdc9ac85454c41e59a3242856632',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "IHS Radiology Medical Group, Inc.  ", "Address": "4150 Regents Park Row", "Address Two": "Ste 195", "clinic Hours of Operation": "Mon-Sat 7:00am - 5:00pm", "Phone Number": "(858) 622-6464", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "La Jolla", "Zip Code": 92037.0, "Latitude": 32.838761, "Longitude": -117.261591, "State": "CA", "zipcode UTC": -8.0, "name": "IHS Radiology Medical Group, Inc.  ", "address": "4150 Regents Park Row", "lat": 32.838761, "lng": -117.261591, "phone": "(858) 622-6464", "country": "United States", "city": "La Jolla", "state": "CA", "postal_code": 92037.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_38d7daef65c007832206b52f9ce4e1ca',
        'IHS Radiology Medical Group, Inc.  ',
        '1200 Garden View Rd',
        33.053092,
        -117.268555,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(760) 632-9729',
        NULL,
        'United States',
        'Encinitas',
        'CA',
        '92024.0',
        'uploaded',
        'uploaded_38d7daef65c007832206b52f9ce4e1ca',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "IHS Radiology Medical Group, Inc.  ", "Address": "1200 Garden View Rd", "Address Two": "Ste 110", "clinic Hours of Operation": "Mon-Sat 7:00am - 5:00pm", "Phone Number": "(760) 632-9729", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Encinitas", "Zip Code": 92024.0, "Latitude": 33.053092, "Longitude": -117.268555, "State": "CA", "zipcode UTC": -8.0, "name": "IHS Radiology Medical Group, Inc.  ", "address": "1200 Garden View Rd", "lat": 33.053092, "lng": -117.268555, "phone": "(760) 632-9729", "country": "United States", "city": "Encinitas", "state": "CA", "postal_code": 92024.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_ebe93d5abd80aae998ff1f28128cec53',
        'nan',
        'nan',
        33.053092,
        -117.268555,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Leucadia',
        'CA',
        '92024.0',
        'uploaded',
        'uploaded_ebe93d5abd80aae998ff1f28128cec53',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Leucadia", "Zip Code": 92024.0, "Latitude": 33.053092, "Longitude": -117.268555, "State": "CA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 33.053092, "lng": -117.268555, "phone": null, "country": null, "city": "Leucadia", "state": "CA", "postal_code": 92024.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_bcdfec46624bdadd7584227dd85f4fdc',
        'Radiology Chartered',
        '1789 Shawano Avenue',
        44.530892,
        -88.044828,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(920) 499-1428',
        NULL,
        'United States',
        'Green Bay',
        'WI',
        '54303.0',
        'uploaded',
        'uploaded_bcdfec46624bdadd7584227dd85f4fdc',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Radiology Chartered", "Address": "1789 Shawano Avenue", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(920) 499-1428", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Green Bay", "Zip Code": 54303.0, "Latitude": 44.530892, "Longitude": -88.044828, "State": "WI", "zipcode UTC": -6.0, "name": "Radiology Chartered", "address": "1789 Shawano Avenue", "lat": 44.530892, "lng": -88.044828, "phone": "(920) 499-1428", "country": "United States", "city": "Green Bay", "state": "WI", "postal_code": 54303.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_929a825abc072d13988ba8338154aa95',
        'nan',
        'nan',
        44.530892,
        -88.044828,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Howard',
        'WI',
        '54303.0',
        'uploaded',
        'uploaded_929a825abc072d13988ba8338154aa95',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Howard", "Zip Code": 54303.0, "Latitude": 44.530892, "Longitude": -88.044828, "State": "WI", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 44.530892, "lng": -88.044828, "phone": null, "country": null, "city": "Howard", "state": "WI", "postal_code": 54303.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b7f116ff4d2d47eb91f4ffb58076b516',
        'South Sound Radiology',
        '1108 Basich Boulevard',
        46.972965,
        -123.819235,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(360) 533-0400',
        NULL,
        'United States',
        'Aberdeen',
        'WA',
        '98520.0',
        'uploaded',
        'uploaded_b7f116ff4d2d47eb91f4ffb58076b516',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "South Sound Radiology", "Address": "1108 Basich Boulevard", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(360) 533-0400", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Aberdeen", "Zip Code": 98520.0, "Latitude": 46.972965, "Longitude": -123.819235, "State": "WA", "zipcode UTC": -8.0, "name": "South Sound Radiology", "address": "1108 Basich Boulevard", "lat": 46.972965, "lng": -123.819235, "phone": "(360) 533-0400", "country": "United States", "city": "Aberdeen", "state": "WA", "postal_code": 98520.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_db84e62606260bbafac1d6711c1871a4',
        'nan',
        'nan',
        46.972965,
        -123.819235,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Aberdeen Gardens',
        'WA',
        '98520.0',
        'uploaded',
        'uploaded_db84e62606260bbafac1d6711c1871a4',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Aberdeen Gardens", "Zip Code": 98520.0, "Latitude": 46.972965, "Longitude": -123.819235, "State": "WA", "zipcode UTC": -8.0, "name": null, "address": null, "lat": 46.972965, "lng": -123.819235, "phone": null, "country": null, "city": "Aberdeen Gardens", "state": "WA", "postal_code": 98520.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_72da1988b407def8fb5cb9f969a14240',
        'Mountain Radiology',
        'PO Box 2010',
        39.5454,
        -107.3258,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        'United States',
        'Glenwood',
        'CO',
        '81602.0',
        'uploaded',
        'uploaded_72da1988b407def8fb5cb9f969a14240',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Mountain Radiology", "Address": "PO Box 2010", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": "United States", "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Glenwood", "Zip Code": 81602.0, "Latitude": 39.5454, "Longitude": -107.3258, "State": "CO", "zipcode UTC": -7.0, "name": "Mountain Radiology", "address": "PO Box 2010", "lat": 39.5454, "lng": -107.3258, "phone": null, "country": "United States", "city": "Glenwood", "state": "CO", "postal_code": 81602.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_0de8350a321a80d2cd0d0645352bcc86',
        'nan',
        'nan',
        39.5454,
        -107.3258,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Glenwood Spgs',
        'CO',
        '81602.0',
        'uploaded',
        'uploaded_0de8350a321a80d2cd0d0645352bcc86',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "MDT - Mountain Daylight Time", "City": "Glenwood Spgs", "Zip Code": 81602.0, "Latitude": 39.5454, "Longitude": -107.3258, "State": "CO", "zipcode UTC": -7.0, "name": null, "address": null, "lat": 39.5454, "lng": -107.3258, "phone": null, "country": null, "city": "Glenwood Spgs", "state": "CO", "postal_code": 81602.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_e5a545bc2ac1742e47aec70788254252',
        'Onslow Radiology Center',
        '299 Doctors Drive',
        34.781212,
        -77.375607,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(910) 577-1171',
        NULL,
        'United States',
        'Jacksonville',
        'NC',
        '28546.0',
        'uploaded',
        'uploaded_e5a545bc2ac1742e47aec70788254252',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Onslow Radiology Center", "Address": "299 Doctors Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(910) 577-1171", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Jacksonville", "Zip Code": 28546.0, "Latitude": 34.781212, "Longitude": -77.375607, "State": "NC", "zipcode UTC": -5.0, "name": "Onslow Radiology Center", "address": "299 Doctors Drive", "lat": 34.781212, "lng": -77.375607, "phone": "(910) 577-1171", "country": "United States", "city": "Jacksonville", "state": "NC", "postal_code": 28546.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_1aa5265b6f11a1f4f54b7fc6be916b44',
        'Salem Radiology Consultants',
        '2925 Ryan Drive Southeast',
        44.926644,
        -122.986942,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(503) 399-1264',
        NULL,
        'United States',
        'Salem',
        'OR',
        '97301.0',
        'uploaded',
        'uploaded_1aa5265b6f11a1f4f54b7fc6be916b44',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Salem Radiology Consultants", "Address": "2925 Ryan Drive Southeast", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(503) 399-1264", "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "Salem", "Zip Code": 97301.0, "Latitude": 44.926644, "Longitude": -122.986942, "State": "OR", "zipcode UTC": -8.0, "name": "Salem Radiology Consultants", "address": "2925 Ryan Drive Southeast", "lat": 44.926644, "lng": -122.986942, "phone": "(503) 399-1264", "country": "United States", "city": "Salem", "state": "OR", "postal_code": 97301.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7148192f126196907b3eea93bd66e8a8',
        'Wayne Radiologists',
        '2700 Medical Office Place',
        35.377069,
        -77.924638,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(919) 734-1866',
        NULL,
        'United States',
        'Goldsboro',
        'NC',
        '27534.0',
        'uploaded',
        'uploaded_7148192f126196907b3eea93bd66e8a8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Wayne Radiologists", "Address": "2700 Medical Office Place", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 5:00pm", "Phone Number": "(919) 734-1866", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Goldsboro", "Zip Code": 27534.0, "Latitude": 35.377069, "Longitude": -77.924638, "State": "NC", "zipcode UTC": -5.0, "name": "Wayne Radiologists", "address": "2700 Medical Office Place", "lat": 35.377069, "lng": -77.924638, "phone": "(919) 734-1866", "country": "United States", "city": "Goldsboro", "state": "NC", "postal_code": 27534.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_2e0e4704debcc768c7b521b251a60e64',
        'Summit Radiology Services',
        '960 Joe Frank Harris Parkway Southeast',
        34.167327,
        -84.827641,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(770) 607-7339',
        NULL,
        'United States',
        'Cartersville',
        'GA',
        '30120.0',
        'uploaded',
        'uploaded_2e0e4704debcc768c7b521b251a60e64',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Summit Radiology Services", "Address": "960 Joe Frank Harris Parkway Southeast", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(770) 607-7339", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cartersville", "Zip Code": 30120.0, "Latitude": 34.167327, "Longitude": -84.827641, "State": "GA", "zipcode UTC": -5.0, "name": "Summit Radiology Services", "address": "960 Joe Frank Harris Parkway Southeast", "lat": 34.167327, "lng": -84.827641, "phone": "(770) 607-7339", "country": "United States", "city": "Cartersville", "state": "GA", "postal_code": 30120.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_779042bce21180c7c6020021d3d1a08d',
        'nan',
        'nan',
        34.167327,
        -84.827641,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Euharlee',
        'GA',
        '30120.0',
        'uploaded',
        'uploaded_779042bce21180c7c6020021d3d1a08d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Euharlee", "Zip Code": 30120.0, "Latitude": 34.167327, "Longitude": -84.827641, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.167327, "lng": -84.827641, "phone": null, "country": null, "city": "Euharlee", "state": "GA", "postal_code": 30120.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_eac68771024dd55b5f1d7f46776fda2a',
        'Memorial Health Radiology',
        '4700 Waters Avenue',
        32.043058,
        -81.121833,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(912) 350-8436',
        NULL,
        'United States',
        'Garden City',
        'GA',
        '31405.0',
        'uploaded',
        'uploaded_eac68771024dd55b5f1d7f46776fda2a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Memorial Health Radiology", "Address": "4700 Waters Avenue", "Address Two": null, "clinic Hours of Operation": "Mon-Fri 8:00am - 4:00pm", "Phone Number": "(912) 350-8436", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Garden City", "Zip Code": 31405.0, "Latitude": 32.043058, "Longitude": -81.121833, "State": "GA", "zipcode UTC": -5.0, "name": "Memorial Health Radiology", "address": "4700 Waters Avenue", "lat": 32.043058, "lng": -81.121833, "phone": "(912) 350-8436", "country": "United States", "city": "Garden City", "state": "GA", "postal_code": 31405.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
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
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
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
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Garden Cty", "Zip Code": 31405.0, "Latitude": 32.043058, "Longitude": -81.121833, "State": "GA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 32.043058, "lng": -81.121833, "phone": null, "country": null, "city": "Garden Cty", "state": "GA", "postal_code": 31405.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_512f7443e4c274daacaeb88c73f6e472',
        'RADNET, Inc. - American Radiology Associates',
        '8820 Columbia 100 Parkway, Ste. 100',
        39.207523,
        -76.825277,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(443) 436-4100',
        NULL,
        'United States',
        'Columbia',
        'MD',
        '21045.0',
        'uploaded',
        'uploaded_512f7443e4c274daacaeb88c73f6e472',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "RADNET, Inc. - American Radiology Associates", "Address": "8820 Columbia 100 Parkway, Ste. 100", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(443) 436-4100", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Columbia", "Zip Code": 21045.0, "Latitude": 39.207523, "Longitude": -76.825277, "State": "MD", "zipcode UTC": -5.0, "name": "RADNET, Inc. - American Radiology Associates", "address": "8820 Columbia 100 Parkway, Ste. 100", "lat": 39.207523, "lng": -76.825277, "phone": "(443) 436-4100", "country": "United States", "city": "Columbia", "state": "MD", "postal_code": 21045.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6311494e5aee1183d5e2c75a8899a1bf',
        'RADNET, Inc. - American Radiology Associates',
        '21 Crossroads Drive, Ste. 100',
        39.419105,
        -76.783886,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(443) 663-2100',
        NULL,
        'United States',
        'Garrison',
        'MD',
        '21117.0',
        'uploaded',
        'uploaded_6311494e5aee1183d5e2c75a8899a1bf',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "RADNET, Inc. - American Radiology Associates", "Address": "21 Crossroads Drive, Ste. 100", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(443) 663-2100", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Garrison", "Zip Code": 21117.0, "Latitude": 39.419105, "Longitude": -76.783886, "State": "MD", "zipcode UTC": -5.0, "name": "RADNET, Inc. - American Radiology Associates", "address": "21 Crossroads Drive, Ste. 100", "lat": 39.419105, "lng": -76.783886, "phone": "(443) 663-2100", "country": "United States", "city": "Garrison", "state": "MD", "postal_code": 21117.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_964e50162b070089d4abf22c92d2da10',
        'nan',
        'nan',
        39.419105,
        -76.783886,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Owings Mills',
        'MD',
        '21117.0',
        'uploaded',
        'uploaded_964e50162b070089d4abf22c92d2da10',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Owings Mills", "Zip Code": 21117.0, "Latitude": 39.419105, "Longitude": -76.783886, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.419105, "lng": -76.783886, "phone": null, "country": null, "city": "Owings Mills", "state": "MD", "postal_code": 21117.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c2e71cfd42726f7d9934bd3ca2bdb32b',
        'RADNET, Inc. - Community Radiology Associates',
        '18111 Prince Philip Drive, Ste. T-20',
        39.155449,
        -77.074876,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(301) 774-3400',
        NULL,
        'United States',
        'Olney',
        'MD',
        '20832.0',
        'uploaded',
        'uploaded_c2e71cfd42726f7d9934bd3ca2bdb32b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "RADNET, Inc. - Community Radiology Associates", "Address": "18111 Prince Philip Drive, Ste. T-20", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(301) 774-3400", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Olney", "Zip Code": 20832.0, "Latitude": 39.155449, "Longitude": -77.074876, "State": "MD", "zipcode UTC": -5.0, "name": "RADNET, Inc. - Community Radiology Associates", "address": "18111 Prince Philip Drive, Ste. T-20", "lat": 39.155449, "lng": -77.074876, "phone": "(301) 774-3400", "country": "United States", "city": "Olney", "state": "MD", "postal_code": 20832.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_0655073d09b522e3893e2d95b0d7ee8f',
        'Fairfax Radiological Consultants',
        '100 Elden Stret',
        38.977109,
        -77.385278,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(703) 481-9400',
        NULL,
        'United States',
        'Herndon',
        'VA',
        '20170.0',
        'uploaded',
        'uploaded_0655073d09b522e3893e2d95b0d7ee8f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Fairfax Radiological Consultants", "Address": "100 Elden Stret", "Address Two": "Ste. 16", "clinic Hours of Operation": "Mon-Fri 7:00am - 5:00pm", "Phone Number": "(703) 481-9400", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Herndon", "Zip Code": 20170.0, "Latitude": 38.977109, "Longitude": -77.385278, "State": "VA", "zipcode UTC": -5.0, "name": "Fairfax Radiological Consultants", "address": "100 Elden Stret", "lat": 38.977109, "lng": -77.385278, "phone": "(703) 481-9400", "country": "United States", "city": "Herndon", "state": "VA", "postal_code": 20170.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_57169d7b558f210eb9b0bdd74e9608e3',
        'Bright Light Radiology',
        '31 Arlington Heights Road',
        42.005978,
        -87.998474,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(847) 439-2315',
        NULL,
        'United States',
        'Elk Grove Village',
        'IL',
        '60007.0',
        'uploaded',
        'uploaded_57169d7b558f210eb9b0bdd74e9608e3',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Bright Light Radiology", "Address": "31 Arlington Heights Road", "Address Two": null, "clinic Hours of Operation": "Mon 8:30am - 8:00pm           Tue-Fri 8:30am - 4:00pm       Sat 8:00am - 12:00pm", "Phone Number": "(847) 439-2315", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Elk Grove Village", "Zip Code": 60007.0, "Latitude": 42.005978, "Longitude": -87.998474, "State": "IL", "zipcode UTC": -6.0, "name": "Bright Light Radiology", "address": "31 Arlington Heights Road", "lat": 42.005978, "lng": -87.998474, "phone": "(847) 439-2315", "country": "United States", "city": "Elk Grove Village", "state": "IL", "postal_code": 60007.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d0339f5dfe2cb11f1a720ee1ad65e462',
        'nan',
        'nan',
        42.005978,
        -87.998474,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Elk Grove Vlg',
        'IL',
        '60007.0',
        'uploaded',
        'uploaded_d0339f5dfe2cb11f1a720ee1ad65e462',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Elk Grove Vlg", "Zip Code": 60007.0, "Latitude": 42.005978, "Longitude": -87.998474, "State": "IL", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 42.005978, "lng": -87.998474, "phone": null, "country": null, "city": "Elk Grove Vlg", "state": "IL", "postal_code": 60007.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_0c19cf0353f7d367ca6e5b50b2259e2c',
        'Kenosha Radiology Center',
        '10117 74th Street',
        42.559823,
        -87.878781,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(262) 697-7770',
        NULL,
        'United States',
        'Kenosha',
        'WI',
        '53142.0',
        'uploaded',
        'uploaded_0c19cf0353f7d367ca6e5b50b2259e2c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Kenosha Radiology Center", "Address": "10117 74th Street", "Address Two": "Ste. 150", "clinic Hours of Operation": "Mon-Fri 7:00am - 7:00pm", "Phone Number": "(262) 697-7770", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Kenosha", "Zip Code": 53142.0, "Latitude": 42.559823, "Longitude": -87.878781, "State": "WI", "zipcode UTC": -6.0, "name": "Kenosha Radiology Center", "address": "10117 74th Street", "lat": 42.559823, "lng": -87.878781, "phone": "(262) 697-7770", "country": "United States", "city": "Kenosha", "state": "WI", "postal_code": 53142.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_df9c2885a352e45b874b3e75de3d965e',
        'nan',
        'nan',
        42.559823,
        -87.878781,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Pleasant Prairie',
        'WI',
        '53142.0',
        'uploaded',
        'uploaded_df9c2885a352e45b874b3e75de3d965e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Pleasant Prairie", "Zip Code": 53142.0, "Latitude": 42.559823, "Longitude": -87.878781, "State": "WI", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 42.559823, "lng": -87.878781, "phone": null, "country": null, "city": "Pleasant Prairie", "state": "WI", "postal_code": 53142.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5109354d2b470b5b1df15d92ffb957f7',
        'Redwood Radiology Group',
        '1375 University St',
        nan,
        nan,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(707) 431-6500',
        NULL,
        'United States',
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_5109354d2b470b5b1df15d92ffb957f7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Redwood Radiology Group", "Address": "1375 University St", "Address Two": null, "clinic Hours of Operation": "24 Hours", "Phone Number": "(707) 431-6500", "Country": "United States", "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "Redwood Radiology Group", "address": "1375 University St", "lat": null, "lng": null, "phone": "(707) 431-6500", "country": "United States", "city": null, "state": null, "postal_code": null, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9952cd6e121b5fd32b6c2072c9c6c385',
        'Radiology Associates of Eastern Oklahoma',
        '3330 NW 56th St',
        35.517857,
        -97.572844,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(405) 945-4740',
        NULL,
        'United States',
        'Oklahoma City',
        'OK',
        '73112.0',
        'uploaded',
        'uploaded_9952cd6e121b5fd32b6c2072c9c6c385',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Radiology Associates of Eastern Oklahoma", "Address": "3330 NW 56th St", "Address Two": "Ste 206", "clinic Hours of Operation": "Mon - Fri: 7:30am - 4:30pm", "Phone Number": "(405) 945-4740", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Oklahoma City", "Zip Code": 73112.0, "Latitude": 35.517857, "Longitude": -97.572844, "State": "OK", "zipcode UTC": -6.0, "name": "Radiology Associates of Eastern Oklahoma", "address": "3330 NW 56th St", "lat": 35.517857, "lng": -97.572844, "phone": "(405) 945-4740", "country": "United States", "city": "Oklahoma City", "state": "OK", "postal_code": 73112.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_1dd2ba7f0e85d2449a478b0f4a298eb1',
        'Washington Radiology Associates, P.C.',
        '21351 Ridgetop Circle',
        39.004276,
        -77.434426,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(571) 434-0141',
        NULL,
        'United States',
        'Dulles',
        'VA',
        '20166.0',
        'uploaded',
        'uploaded_1dd2ba7f0e85d2449a478b0f4a298eb1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "21351 Ridgetop Circle", "Address Two": "Ste 100 and 150", "clinic Hours of Operation": "Mon - Fri:  8:00am - 5:00pm", "Phone Number": "(571) 434-0141", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Dulles", "Zip Code": 20166.0, "Latitude": 39.004276, "Longitude": -77.434426, "State": "VA", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "21351 Ridgetop Circle", "lat": 39.004276, "lng": -77.434426, "phone": "(571) 434-0141", "country": "United States", "city": "Dulles", "state": "VA", "postal_code": 20166.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_29df69dfcb38573889b91723aa83dfeb',
        'nan',
        'nan',
        39.004276,
        -77.434426,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Sterling',
        'VA',
        '20166.0',
        'uploaded',
        'uploaded_29df69dfcb38573889b91723aa83dfeb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Sterling", "Zip Code": 20166.0, "Latitude": 39.004276, "Longitude": -77.434426, "State": "VA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.004276, "lng": -77.434426, "phone": null, "country": null, "city": "Sterling", "state": "VA", "postal_code": 20166.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_a6f7f887804f3e8cb7aa574ff5d18833',
        'Rose Radiology',
        '27662 Cashford Cir',
        28.187356,
        -82.316019,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(813) 788-2500',
        NULL,
        'United States',
        'Zephyrhi',
        'FL',
        '33543.0',
        'uploaded',
        'uploaded_a6f7f887804f3e8cb7aa574ff5d18833',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Rose Radiology", "Address": "27662 Cashford Cir", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(813) 788-2500", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Zephyrhi", "Zip Code": 33543.0, "Latitude": 28.187356, "Longitude": -82.316019, "State": "FL", "zipcode UTC": -5.0, "name": "Rose Radiology", "address": "27662 Cashford Cir", "lat": 28.187356, "lng": -82.316019, "phone": "(813) 788-2500", "country": "United States", "city": "Zephyrhi", "state": "FL", "postal_code": 33543.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_bc369f1e5172983fc080b6d780cf8c6c',
        'Radiology and MRI of Bethlehem',
        '5325 Northgate Dr',
        40.645665,
        -75.369261,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(610) 691-8931',
        NULL,
        'United States',
        'Bethlehem',
        'PA',
        '18017.0',
        'uploaded',
        'uploaded_bc369f1e5172983fc080b6d780cf8c6c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Radiology and MRI of Bethlehem", "Address": "5325 Northgate Dr", "Address Two": "Ste 100", "clinic Hours of Operation": null, "Phone Number": "(610) 691-8931", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Bethlehem", "Zip Code": 18017.0, "Latitude": 40.645665, "Longitude": -75.369261, "State": "PA", "zipcode UTC": -5.0, "name": "Radiology and MRI of Bethlehem", "address": "5325 Northgate Dr", "lat": 40.645665, "lng": -75.369261, "phone": "(610) 691-8931", "country": "United States", "city": "Bethlehem", "state": "PA", "postal_code": 18017.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_cbdcc0a418739eef4307581f4196687a',
        'nan',
        'nan',
        40.645665,
        -75.369261,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Butztown',
        'PA',
        '18017.0',
        'uploaded',
        'uploaded_cbdcc0a418739eef4307581f4196687a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Butztown", "Zip Code": 18017.0, "Latitude": 40.645665, "Longitude": -75.369261, "State": "PA", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.645665, "lng": -75.369261, "phone": null, "country": null, "city": "Butztown", "state": "PA", "postal_code": 18017.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c02ed43db3e2efbabb326fc960d543eb',
        'IHS Radiology Medical Group, Inc.  ',
        '150 W Washington St',
        32.746018,
        -117.167152,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        'United States',
        'San Diego',
        'CA',
        '92103.0',
        'uploaded',
        'uploaded_c02ed43db3e2efbabb326fc960d543eb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "IHS Radiology Medical Group, Inc.  ", "Address": "150 W Washington St", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": "United States", "Time Zone Display": "PDT - Pacific Daylight Time", "City": "San Diego", "Zip Code": 92103.0, "Latitude": 32.746018, "Longitude": -117.167152, "State": "CA", "zipcode UTC": -8.0, "name": "IHS Radiology Medical Group, Inc.  ", "address": "150 W Washington St", "lat": 32.746018, "lng": -117.167152, "phone": null, "country": "United States", "city": "San Diego", "state": "CA", "postal_code": 92103.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_29df4c263612a5bcc5f102e159beefa1',
        'Muscatine Radiology',
        '2104 Cedarwood Drive',
        41.427901,
        -91.046393,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(563) 263-3400',
        NULL,
        'United States',
        'Muscatine',
        'IA',
        '52761.0',
        'uploaded',
        'uploaded_29df4c263612a5bcc5f102e159beefa1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Muscatine Radiology", "Address": "2104 Cedarwood Drive", "Address Two": "Suite #100", "clinic Hours of Operation": "Mon-Fri: 8am-5pm\n", "Phone Number": "(563) 263-3400", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Muscatine", "Zip Code": 52761.0, "Latitude": 41.427901, "Longitude": -91.046393, "State": "IA", "zipcode UTC": -6.0, "name": "Muscatine Radiology", "address": "2104 Cedarwood Drive", "lat": 41.427901, "lng": -91.046393, "phone": "(563) 263-3400", "country": "United States", "city": "Muscatine", "state": "IA", "postal_code": 52761.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_15283085554964d9bf49527da6e49c3a',
        'Brown & Radiology Associates',
        '1125 Troupe St',
        33.474136,
        -82.010187,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(706) 737-4275',
        NULL,
        'United States',
        'Augusta',
        'GA',
        '30904.0',
        'uploaded',
        'uploaded_15283085554964d9bf49527da6e49c3a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Brown & Radiology Associates", "Address": "1125 Troupe St", "Address Two": null, "clinic Hours of Operation": "Mon-Fri:  8am-5pm", "Phone Number": "(706) 737-4275", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Augusta", "Zip Code": 30904.0, "Latitude": 33.474136, "Longitude": -82.010187, "State": "GA", "zipcode UTC": -5.0, "name": "Brown & Radiology Associates", "address": "1125 Troupe St", "lat": 33.474136, "lng": -82.010187, "phone": "(706) 737-4275", "country": "United States", "city": "Augusta", "state": "GA", "postal_code": 30904.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c89aea7b24f3f61795ddf3e6096a5bd5',
        'Mecklenburg Radiology Associates',
        'P.O. BOX 221249',
        35.1663,
        -80.7959,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(704) 926-1811',
        NULL,
        'United States',
        'Charlotte',
        'NC',
        '28222.0',
        'uploaded',
        'uploaded_c89aea7b24f3f61795ddf3e6096a5bd5',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Mecklenburg Radiology Associates", "Address": "P.O. BOX 221249", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(704) 926-1811", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Charlotte", "Zip Code": 28222.0, "Latitude": 35.1663, "Longitude": -80.7959, "State": "NC", "zipcode UTC": -5.0, "name": "Mecklenburg Radiology Associates", "address": "P.O. BOX 221249", "lat": 35.1663, "lng": -80.7959, "phone": "(704) 926-1811", "country": "United States", "city": "Charlotte", "state": "NC", "postal_code": 28222.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_caa7d03a998033f587d8b50c9b43ee40',
        'POM MRI & Radiology Center',
        '4331 N Federal Highway',
        26.191111,
        -80.108462,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(954) 900-2020',
        NULL,
        'United States',
        'Fort Lauderdale',
        'FL',
        '33308.0',
        'uploaded',
        'uploaded_caa7d03a998033f587d8b50c9b43ee40',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "POM MRI & Radiology Center", "Address": "4331 N Federal Highway", "Address Two": "Suite 200", "clinic Hours of Operation": "Mon:  CLOSED\nTues:  7am-noon\nWed-Fri:  7am-7pm\nSat-Sun:  CLOSED", "Phone Number": "(954) 900-2020", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Fort Lauderdale", "Zip Code": 33308.0, "Latitude": 26.191111, "Longitude": -80.108462, "State": "FL", "zipcode UTC": -5.0, "name": "POM MRI & Radiology Center", "address": "4331 N Federal Highway", "lat": 26.191111, "lng": -80.108462, "phone": "(954) 900-2020", "country": "United States", "city": "Fort Lauderdale", "state": "FL", "postal_code": 33308.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d8ec27d514aed05188a8d29c10f5b604',
        'nan',
        'nan',
        26.191111,
        -80.108462,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Ft Lauderdale',
        'FL',
        '33308.0',
        'uploaded',
        'uploaded_d8ec27d514aed05188a8d29c10f5b604',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ft Lauderdale", "Zip Code": 33308.0, "Latitude": 26.191111, "Longitude": -80.108462, "State": "FL", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 26.191111, "lng": -80.108462, "phone": null, "country": null, "city": "Ft Lauderdale", "state": "FL", "postal_code": 33308.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_694a8d4f5990f0afc546fff740f15a55',
        'Windsor Radiology',
        '300 Princeton Hightstown Rd',
        40.292358,
        -74.609029,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(609) 426-9200',
        NULL,
        'United States',
        'Princeton Jct',
        'NJ',
        '8550.0',
        'uploaded',
        'uploaded_694a8d4f5990f0afc546fff740f15a55',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Windsor Radiology", "Address": "300 Princeton Hightstown Rd", "Address Two": null, "clinic Hours of Operation": "Monday: 7AM-8PM\nTuesday: 7AM-5PM\nWednesday: 7AM-8PM\nThursday: 7AM-8PM\nFriday: 7AM-5PM\nSaturday: 8AM-2PM\nSunday: Closed", "Phone Number": "(609) 426-9200", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Princeton Jct", "Zip Code": 8550.0, "Latitude": 40.292358, "Longitude": -74.609029, "State": "NJ", "zipcode UTC": -5.0, "name": "Windsor Radiology", "address": "300 Princeton Hightstown Rd", "lat": 40.292358, "lng": -74.609029, "phone": "(609) 426-9200", "country": "United States", "city": "Princeton Jct", "state": "NJ", "postal_code": 8550.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_448a656d06a720c42a712795dae12a32',
        'nan',
        'nan',
        40.292358,
        -74.609029,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Princeton Junction',
        'NJ',
        '8550.0',
        'uploaded',
        'uploaded_448a656d06a720c42a712795dae12a32',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Princeton Junction", "Zip Code": 8550.0, "Latitude": 40.292358, "Longitude": -74.609029, "State": "NJ", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 40.292358, "lng": -74.609029, "phone": null, "country": null, "city": "Princeton Junction", "state": "NJ", "postal_code": 8550.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_8628bc1f0ccc9446bcb6a7e421ebb885',
        'Womens Radiology',
        '1621 N. Mills Ave',
        28.557579,
        -81.35244,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(407) 841-0822',
        NULL,
        'United States',
        'Orlando',
        'FL',
        '32803.0',
        'uploaded',
        'uploaded_8628bc1f0ccc9446bcb6a7e421ebb885',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Womens Radiology", "Address": "1621 N. Mills Ave", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(407) 841-0822", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Orlando", "Zip Code": 32803.0, "Latitude": 28.557579, "Longitude": -81.35244, "State": "FL", "zipcode UTC": -5.0, "name": "Womens Radiology", "address": "1621 N. Mills Ave", "lat": 28.557579, "lng": -81.35244, "phone": "(407) 841-0822", "country": "United States", "city": "Orlando", "state": "FL", "postal_code": 32803.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_e227bdcacf29cbfe3ed028c1f122b9ea',
        'Womens Radiology',
        '1718 S. Orange Ave',
        28.51483,
        -81.36054,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(407) 841-0822',
        NULL,
        'United States',
        'Orlando',
        'FL',
        '32806.0',
        'uploaded',
        'uploaded_e227bdcacf29cbfe3ed028c1f122b9ea',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Womens Radiology", "Address": "1718 S. Orange Ave", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(407) 841-0822", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Orlando", "Zip Code": 32806.0, "Latitude": 28.51483, "Longitude": -81.36054, "State": "FL", "zipcode UTC": -5.0, "name": "Womens Radiology", "address": "1718 S. Orange Ave", "lat": 28.51483, "lng": -81.36054, "phone": "(407) 841-0822", "country": "United States", "city": "Orlando", "state": "FL", "postal_code": 32806.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_766b8835c04be22df552f3014153b1c6',
        'Radiology Consultants of Iowa (RCI)',
        '1948 First Avenue NE',
        42.021016,
        -91.65231,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(319) 364-0121',
        NULL,
        'United States',
        'Cedar Rapids',
        'IA',
        '52402.0',
        'uploaded',
        'uploaded_766b8835c04be22df552f3014153b1c6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Radiology Consultants of Iowa (RCI)", "Address": "1948 First Avenue NE", "Address Two": null, "clinic Hours of Operation": "Mon-Fri: 7:30 a.m. \u2013 5 p.m.", "Phone Number": "(319) 364-0121", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Cedar Rapids", "Zip Code": 52402.0, "Latitude": 42.021016, "Longitude": -91.65231, "State": "IA", "zipcode UTC": -6.0, "name": "Radiology Consultants of Iowa (RCI)", "address": "1948 First Avenue NE", "lat": 42.021016, "lng": -91.65231, "phone": "(319) 364-0121", "country": "United States", "city": "Cedar Rapids", "state": "IA", "postal_code": 52402.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_fcda9ea0e23cb73237d171a37736c293',
        'Delaney Radiology',
        '1025 Medical Center Drive',
        34.235219,
        -77.941346,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(910) 762-3882',
        NULL,
        'United States',
        'Cape Fear',
        'NC',
        '28401.0',
        'uploaded',
        'uploaded_fcda9ea0e23cb73237d171a37736c293',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Delaney Radiology", "Address": "1025 Medical Center Drive", "Address Two": null, "clinic Hours of Operation": "Mon-Fri -  7:30am-5:30pm\nSaturday - Appts only\nSunday - 7:30am-5:30pm", "Phone Number": "(910) 762-3882", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Cape Fear", "Zip Code": 28401.0, "Latitude": 34.235219, "Longitude": -77.941346, "State": "NC", "zipcode UTC": -5.0, "name": "Delaney Radiology", "address": "1025 Medical Center Drive", "lat": 34.235219, "lng": -77.941346, "phone": "(910) 762-3882", "country": "United States", "city": "Cape Fear", "state": "NC", "postal_code": 28401.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_98b76b91c7fd6241034c21e3370ca48d',
        'nan',
        'nan',
        34.235219,
        -77.941346,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Wilm',
        'NC',
        '28401.0',
        'uploaded',
        'uploaded_98b76b91c7fd6241034c21e3370ca48d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Wilm", "Zip Code": 28401.0, "Latitude": 34.235219, "Longitude": -77.941346, "State": "NC", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 34.235219, "lng": -77.941346, "phone": null, "country": null, "city": "Wilm", "state": "NC", "postal_code": 28401.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_861000b1ab8833213e4d2f888d8f66a6',
        'Washington Radiology Associates, P.C.',
        '1005 North Glebe Road',
        38.885337,
        -77.09512,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(703) 280-1410',
        NULL,
        'United States',
        'Arlington',
        'VA',
        '22201.0',
        'uploaded',
        'uploaded_861000b1ab8833213e4d2f888d8f66a6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "1005 North Glebe Road", "Address Two": "Suite 110", "clinic Hours of Operation": null, "Phone Number": "(703) 280-1410", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Arlington", "Zip Code": 22201.0, "Latitude": 38.885337, "Longitude": -77.09512, "State": "VA", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "1005 North Glebe Road", "lat": 38.885337, "lng": -77.09512, "phone": "(703) 280-1410", "country": "United States", "city": "Arlington", "state": "VA", "postal_code": 22201.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6edd0320315c5c11b2e89f591e48a872',
        'Washington Radiology Associates, P.C.',
        '3022 Williams Drive',
        38.859675,
        -77.261671,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(703) 698-8800',
        NULL,
        'United States',
        'Fairfax',
        'VA',
        '22031.0',
        'uploaded',
        'uploaded_6edd0320315c5c11b2e89f591e48a872',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "3022 Williams Drive", "Address Two": "Suite 200", "clinic Hours of Operation": null, "Phone Number": "(703) 698-8800", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Fairfax", "Zip Code": 22031.0, "Latitude": 38.859675, "Longitude": -77.261671, "State": "VA", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "3022 Williams Drive", "lat": 38.859675, "lng": -77.261671, "phone": "(703) 698-8800", "country": "United States", "city": "Fairfax", "state": "VA", "postal_code": 22031.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_761734c6231340db0ce02683f018f3db',
        'Washington Radiology Associates, P.C.',
        '2141 K Street NorthWest',
        38.900394,
        -77.051265,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(202) 223-9722',
        NULL,
        'United States',
        'Washington',
        'DC',
        '20037.0',
        'uploaded',
        'uploaded_761734c6231340db0ce02683f018f3db',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "2141 K Street NorthWest", "Address Two": "Ste 900", "clinic Hours of Operation": null, "Phone Number": "(202) 223-9722", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Washington", "Zip Code": 20037.0, "Latitude": 38.900394, "Longitude": -77.051265, "State": "DC", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "2141 K Street NorthWest", "lat": 38.900394, "lng": -77.051265, "phone": "(202) 223-9722", "country": "United States", "city": "Washington", "state": "DC", "postal_code": 20037.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d5e5c8e7809c4ee3b27c01b91a972019',
        'Washington Radiology Associates, P.C.',
        '3301 New Mexico Avenue NW',
        38.94081,
        -77.087232,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(202) 966-0606',
        NULL,
        'United States',
        'Washington',
        'DC',
        '20016.0',
        'uploaded',
        'uploaded_d5e5c8e7809c4ee3b27c01b91a972019',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "3301 New Mexico Avenue NW", "Address Two": "Suite 132", "clinic Hours of Operation": null, "Phone Number": "(202) 966-0606", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Washington", "Zip Code": 20016.0, "Latitude": 38.94081, "Longitude": -77.087232, "State": "DC", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "3301 New Mexico Avenue NW", "lat": 38.94081, "lng": -77.087232, "phone": "(202) 966-0606", "country": "United States", "city": "Washington", "state": "DC", "postal_code": 20016.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7f5ba3c6ad728b678112176b8ff2d51a',
        'Washington Radiology Associates, P.C.',
        '100 Fulford Ave',
        39.536057,
        -76.349578,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 838-6767',
        NULL,
        'United States',
        'Bel Air',
        'MD',
        '21014.0',
        'uploaded',
        'uploaded_7f5ba3c6ad728b678112176b8ff2d51a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "100 Fulford Ave", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(410) 838-6767", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Bel Air", "Zip Code": 21014.0, "Latitude": 39.536057, "Longitude": -76.349578, "State": "MD", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "100 Fulford Ave", "lat": 39.536057, "lng": -76.349578, "phone": "(410) 838-6767", "country": "United States", "city": "Bel Air", "state": "MD", "postal_code": 21014.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c7a443adcb6122ff3eefa83eacbe7621',
        'Washington Radiology Associates, P.C.',
        '314 Franklin Avenue',
        38.343166,
        -75.190824,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 641-9560',
        NULL,
        'United States',
        'Berlin',
        'MD',
        '21811.0',
        'uploaded',
        'uploaded_c7a443adcb6122ff3eefa83eacbe7621',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "314 Franklin Avenue", "Address Two": "Ste 406", "clinic Hours of Operation": null, "Phone Number": "(410) 641-9560", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Berlin", "Zip Code": 21811.0, "Latitude": 38.343166, "Longitude": -75.190824, "State": "MD", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "314 Franklin Avenue", "lat": 38.343166, "lng": -75.190824, "phone": "(410) 641-9560", "country": "United States", "city": "Berlin", "state": "MD", "postal_code": 21811.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_dc652412733785ff7b733b99b3ee79f7',
        'nan',
        'nan',
        38.343166,
        -75.190824,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Ocean Pines',
        'MD',
        '21811.0',
        'uploaded',
        'uploaded_dc652412733785ff7b733b99b3ee79f7',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Ocean Pines", "Zip Code": 21811.0, "Latitude": 38.343166, "Longitude": -75.190824, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 38.343166, "lng": -75.190824, "phone": null, "country": null, "city": "Ocean Pines", "state": "MD", "postal_code": 21811.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6a58b8a51791144e9f4841ca6ba481f9',
        'Washington Radiology Associates, P.C.',
        '10215 Fernwood Road',
        38.996842,
        -77.135196,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(301) 564-1053',
        NULL,
        'United States',
        'Bethesda',
        'MD',
        '20817.0',
        'uploaded',
        'uploaded_6a58b8a51791144e9f4841ca6ba481f9',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "10215 Fernwood Road", "Address Two": "Ste 103", "clinic Hours of Operation": null, "Phone Number": "(301) 564-1053", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Bethesda", "Zip Code": 20817.0, "Latitude": 38.996842, "Longitude": -77.135196, "State": "MD", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "10215 Fernwood Road", "lat": 38.996842, "lng": -77.135196, "phone": "(301) 564-1053", "country": "United States", "city": "Bethesda", "state": "MD", "postal_code": 20817.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b9dcd01ee96c6af083e98983db341a16',
        'nan',
        'nan',
        38.996842,
        -77.135196,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Westlake',
        'MD',
        '20817.0',
        'uploaded',
        'uploaded_b9dcd01ee96c6af083e98983db341a16',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Westlake", "Zip Code": 20817.0, "Latitude": 38.996842, "Longitude": -77.135196, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 38.996842, "lng": -77.135196, "phone": null, "country": null, "city": "Westlake", "state": "MD", "postal_code": 20817.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_bec6686523bb67fe6c76fc045443acfa',
        'Washington Radiology Associates, P.C.',
        '4445 Willard Avenue',
        38.97986,
        -77.080791,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(301) 654-4242',
        NULL,
        'United States',
        'Bethesda',
        'MD',
        '20815.0',
        'uploaded',
        'uploaded_bec6686523bb67fe6c76fc045443acfa',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "4445 Willard Avenue", "Address Two": "Suite 200", "clinic Hours of Operation": null, "Phone Number": "(301) 654-4242", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Bethesda", "Zip Code": 20815.0, "Latitude": 38.97986, "Longitude": -77.080791, "State": "MD", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "4445 Willard Avenue", "lat": 38.97986, "lng": -77.080791, "phone": "(301) 654-4242", "country": "United States", "city": "Bethesda", "state": "MD", "postal_code": 20815.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b73bd2205d3131eda06091aeaf195483',
        'nan',
        'nan',
        38.97986,
        -77.080791,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Chevy Chase',
        'MD',
        '20815.0',
        'uploaded',
        'uploaded_b73bd2205d3131eda06091aeaf195483',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Chevy Chase", "Zip Code": 20815.0, "Latitude": 38.97986, "Longitude": -77.080791, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 38.97986, "lng": -77.080791, "phone": null, "country": null, "city": "Chevy Chase", "state": "MD", "postal_code": 20815.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_78eab15449662f07c2f5125db46b346f',
        'Washington Radiology Associates, P.C.',
        '2 Colgate Drive',
        39.574606,
        -76.390228,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 879-9636',
        NULL,
        'United States',
        'Forest Hill',
        'MD',
        '21050.0',
        'uploaded',
        'uploaded_78eab15449662f07c2f5125db46b346f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "2 Colgate Drive", "Address Two": "Suite 204", "clinic Hours of Operation": null, "Phone Number": "(410) 879-9636", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Forest Hill", "Zip Code": 21050.0, "Latitude": 39.574606, "Longitude": -76.390228, "State": "MD", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "2 Colgate Drive", "lat": 39.574606, "lng": -76.390228, "phone": "(410) 879-9636", "country": "United States", "city": "Forest Hill", "state": "MD", "postal_code": 21050.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d39bcde2a66627468ed6bf3fc802e3ba',
        'Washington Radiology Associates, P.C.',
        '20410 Observation Drive',
        39.191769,
        -77.243299,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(301) 298-1426',
        NULL,
        'United States',
        'Germantown',
        'MD',
        '20876.0',
        'uploaded',
        'uploaded_d39bcde2a66627468ed6bf3fc802e3ba',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "20410 Observation Drive", "Address Two": "Suite 203", "clinic Hours of Operation": null, "Phone Number": "(301) 298-1426", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Germantown", "Zip Code": 20876.0, "Latitude": 39.191769, "Longitude": -77.243299, "State": "MD", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "20410 Observation Drive", "lat": 39.191769, "lng": -77.243299, "phone": "(301) 298-1426", "country": "United States", "city": "Germantown", "state": "MD", "postal_code": 20876.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5a855bdf96238037cfb9df4669c550e2',
        'Washington Radiology Associates, P.C.',
        '7701 Greenbelt Road',
        39.00391,
        -76.880057,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(301) 464-6400',
        NULL,
        'United States',
        'Greenbelt',
        'MD',
        '20770.0',
        'uploaded',
        'uploaded_5a855bdf96238037cfb9df4669c550e2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "7701 Greenbelt Road", "Address Two": "suite 102", "clinic Hours of Operation": null, "Phone Number": "(301) 464-6400", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Greenbelt", "Zip Code": 20770.0, "Latitude": 39.00391, "Longitude": -76.880057, "State": "MD", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "7701 Greenbelt Road", "lat": 39.00391, "lng": -76.880057, "phone": "(301) 464-6400", "country": "United States", "city": "Greenbelt", "state": "MD", "postal_code": 20770.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_49a756657617652658a354977c80cc80',
        'Washington Radiology Associates, P.C.',
        '1185 Imperial Drive',
        39.633946,
        -77.73025,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(301) 733-1477',
        NULL,
        'United States',
        'Hagerstown',
        'MD',
        '21740.0',
        'uploaded',
        'uploaded_49a756657617652658a354977c80cc80',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "1185 Imperial Drive", "Address Two": "Ste 100", "clinic Hours of Operation": null, "Phone Number": "(301) 733-1477", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Hagerstown", "Zip Code": 21740.0, "Latitude": 39.633946, "Longitude": -77.73025, "State": "MD", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "1185 Imperial Drive", "lat": 39.633946, "lng": -77.73025, "phone": "(301) 733-1477", "country": "United States", "city": "Hagerstown", "state": "MD", "postal_code": 21740.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3109c28e95e7ff27657287a808de7215',
        'Washington Radiology Associates, P.C.',
        '3300 Olney Sandy Spring Road',
        39.155449,
        -77.074876,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(301) 260-2971',
        NULL,
        'United States',
        'Olney',
        'MD',
        '20832.0',
        'uploaded',
        'uploaded_3109c28e95e7ff27657287a808de7215',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "3300 Olney Sandy Spring Road", "Address Two": "Suite 200", "clinic Hours of Operation": null, "Phone Number": "(301) 260-2971", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Olney", "Zip Code": 20832.0, "Latitude": 39.155449, "Longitude": -77.074876, "State": "MD", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "3300 Olney Sandy Spring Road", "lat": 39.155449, "lng": -77.074876, "phone": "(301) 260-2971", "country": "United States", "city": "Olney", "state": "MD", "postal_code": 20832.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_2c50f4f661cc09e505422b4fce67a621',
        'Washington Radiology Associates, P.C.',
        '12505 Park Potomac Avenue',
        39.035028,
        -77.199959,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(240) 223-4700',
        NULL,
        'United States',
        'Potomac',
        'MD',
        '20854.0',
        'uploaded',
        'uploaded_2c50f4f661cc09e505422b4fce67a621',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "12505 Park Potomac Avenue", "Address Two": "Suite 120", "clinic Hours of Operation": null, "Phone Number": "(240) 223-4700", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Potomac", "Zip Code": 20854.0, "Latitude": 39.035028, "Longitude": -77.199959, "State": "MD", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "12505 Park Potomac Avenue", "lat": 39.035028, "lng": -77.199959, "phone": "(240) 223-4700", "country": "United States", "city": "Potomac", "state": "MD", "postal_code": 20854.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_8aa10c887a7a64f75e799b778bfd230b',
        'nan',
        'nan',
        39.035028,
        -77.199959,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Rockville',
        'MD',
        '20854.0',
        'uploaded',
        'uploaded_8aa10c887a7a64f75e799b778bfd230b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Rockville", "Zip Code": 20854.0, "Latitude": 39.035028, "Longitude": -77.199959, "State": "MD", "zipcode UTC": -5.0, "name": null, "address": null, "lat": 39.035028, "lng": -77.199959, "phone": null, "country": null, "city": "Rockville", "state": "MD", "postal_code": 20854.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_195e41b97d1b062150d3ac544f34cc6a',
        'Washington Radiology Associates, P.C.',
        '1820 Sweetbay Drive',
        38.359332,
        -75.569315,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(410) 546-3390',
        NULL,
        'United States',
        'Salisbury',
        'MD',
        '21804.0',
        'uploaded',
        'uploaded_195e41b97d1b062150d3ac544f34cc6a',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Washington Radiology Associates, P.C.", "Address": "1820 Sweetbay Drive", "Address Two": "Suite 102", "clinic Hours of Operation": null, "Phone Number": "(410) 546-3390", "Country": "United States", "Time Zone Display": "EDT - Eastern Daylight Time", "City": "Salisbury", "Zip Code": 21804.0, "Latitude": 38.359332, "Longitude": -75.569315, "State": "MD", "zipcode UTC": -5.0, "name": "Washington Radiology Associates, P.C.", "address": "1820 Sweetbay Drive", "lat": 38.359332, "lng": -75.569315, "phone": "(410) 546-3390", "country": "United States", "city": "Salisbury", "state": "MD", "postal_code": 21804.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5cc9f334f28252f1ed76ca9833d028e2',
        'Premier Radiology',
        '1840 Medical Center Pkwy',
        35.896645,
        -86.424254,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 896-1234',
        NULL,
        'United States',
        'Mboro',
        'TN',
        '37129.0',
        'uploaded',
        'uploaded_5cc9f334f28252f1ed76ca9833d028e2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "1840 Medical Center Pkwy", "Address Two": "Seton Suite 101", "clinic Hours of Operation": "Monday-Friday: 8am - 5pm\nSaturday-Sunday: Closed", "Phone Number": "(615) 896-1234", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Mboro", "Zip Code": 37129.0, "Latitude": 35.896645, "Longitude": -86.424254, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "1840 Medical Center Pkwy", "lat": 35.896645, "lng": -86.424254, "phone": "(615) 896-1234", "country": "United States", "city": "Mboro", "state": "TN", "postal_code": 37129.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_dc5c3e508bf59103d168ecb5bb586de1',
        'nan',
        'nan',
        35.896645,
        -86.424254,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Murfreesboro',
        'TN',
        '37129.0',
        'uploaded',
        'uploaded_dc5c3e508bf59103d168ecb5bb586de1',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Murfreesboro", "Zip Code": 37129.0, "Latitude": 35.896645, "Longitude": -86.424254, "State": "TN", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 35.896645, "lng": -86.424254, "phone": null, "country": null, "city": "Murfreesboro", "state": "TN", "postal_code": 37129.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_248560db8ee0e6473833fce750dffd66',
        'Premier Radiology',
        '28 White Bridge Pike',
        36.113558,
        -86.862079,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 356-3999',
        NULL,
        'United States',
        'Nashville',
        'TN',
        '37205.0',
        'uploaded',
        'uploaded_248560db8ee0e6473833fce750dffd66',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "28 White Bridge Pike", "Address Two": "Suite 111", "clinic Hours of Operation": null, "Phone Number": "(615) 356-3999", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Nashville", "Zip Code": 37205.0, "Latitude": 36.113558, "Longitude": -86.862079, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "28 White Bridge Pike", "lat": 36.113558, "lng": -86.862079, "phone": "(615) 356-3999", "country": "United States", "city": "Nashville", "state": "TN", "postal_code": 37205.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3b1a6298b97d877b7161c6ee1944e664',
        'Premier Radiology',
        '5700 Temple Road',
        36.065032,
        -86.946746,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 986-5993',
        NULL,
        'United States',
        'Bellevue',
        'TN',
        '37221.0',
        'uploaded',
        'uploaded_3b1a6298b97d877b7161c6ee1944e664',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "5700 Temple Road", "Address Two": "Suite 102", "clinic Hours of Operation": null, "Phone Number": "(615) 986-5993", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Bellevue", "Zip Code": 37221.0, "Latitude": 36.065032, "Longitude": -86.946746, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "5700 Temple Road", "lat": 36.065032, "lng": -86.946746, "phone": "(615) 986-5993", "country": "United States", "city": "Bellevue", "state": "TN", "postal_code": 37221.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_f64466d814199d2606ef0e7804471545',
        'nan',
        'nan',
        36.065032,
        -86.946746,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Nashville',
        'TN',
        '37221.0',
        'uploaded',
        'uploaded_f64466d814199d2606ef0e7804471545',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Nashville", "Zip Code": 37221.0, "Latitude": 36.065032, "Longitude": -86.946746, "State": "TN", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 36.065032, "lng": -86.946746, "phone": null, "country": null, "city": "Nashville", "state": "TN", "postal_code": 37221.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_66ba5ed562d88f1595d75e90ea6a5bce',
        'Premier Radiology',
        '5700 Temple Rd',
        36.065032,
        -86.946746,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 986-5993',
        NULL,
        'United States',
        'Bellevue',
        'TN',
        '37221.0',
        'uploaded',
        'uploaded_66ba5ed562d88f1595d75e90ea6a5bce',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "5700 Temple Rd", "Address Two": "Suite 102", "clinic Hours of Operation": null, "Phone Number": "(615) 986-5993", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Bellevue", "Zip Code": 37221.0, "Latitude": 36.065032, "Longitude": -86.946746, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "5700 Temple Rd", "lat": 36.065032, "lng": -86.946746, "phone": "(615) 986-5993", "country": "United States", "city": "Bellevue", "state": "TN", "postal_code": 37221.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9c55778eb2a4b7ae3819448e130dc444',
        'Premier Radiology',
        '789 Old Hickory Blvd',
        36.007373,
        -86.791217,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 832-9551',
        NULL,
        'United States',
        'Brentwood',
        'TN',
        '37027.0',
        'uploaded',
        'uploaded_9c55778eb2a4b7ae3819448e130dc444',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "789 Old Hickory Blvd", "Address Two": "Suite 201", "clinic Hours of Operation": null, "Phone Number": "(615) 832-9551", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Brentwood", "Zip Code": 37027.0, "Latitude": 36.007373, "Longitude": -86.791217, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "789 Old Hickory Blvd", "lat": 36.007373, "lng": -86.791217, "phone": "(615) 832-9551", "country": "United States", "city": "Brentwood", "state": "TN", "postal_code": 37027.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_985201f89ab60fd0dc0dce9698593f08',
        'Premier Radiology',
        '1210 Briarville Rd',
        36.264069,
        -86.705661,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 986-6411',
        NULL,
        'United States',
        'Am Qui',
        'TN',
        '37115.0',
        'uploaded',
        'uploaded_985201f89ab60fd0dc0dce9698593f08',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "1210 Briarville Rd", "Address Two": "Suite 206", "clinic Hours of Operation": null, "Phone Number": "(615) 986-6411", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Am Qui", "Zip Code": 37115.0, "Latitude": 36.264069, "Longitude": -86.705661, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "1210 Briarville Rd", "lat": 36.264069, "lng": -86.705661, "phone": "(615) 986-6411", "country": "United States", "city": "Am Qui", "state": "TN", "postal_code": 37115.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_864857d45c5660636489bd60718af861',
        'nan',
        'nan',
        36.264069,
        -86.705661,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Madison',
        'TN',
        '37115.0',
        'uploaded',
        'uploaded_864857d45c5660636489bd60718af861',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Madison", "Zip Code": 37115.0, "Latitude": 36.264069, "Longitude": -86.705661, "State": "TN", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 36.264069, "lng": -86.705661, "phone": null, "country": null, "city": "Madison", "state": "TN", "postal_code": 37115.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_128d721432ce8d13b8fb478a8534bbbd',
        'Premier Radiology',
        '980 Professional Park Dr',
        36.528448,
        -87.341426,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(931) 436-9307',
        NULL,
        'United States',
        'Clarksville',
        'TN',
        '37040.0',
        'uploaded',
        'uploaded_128d721432ce8d13b8fb478a8534bbbd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "980 Professional Park Dr", "Address Two": "Suite 220", "clinic Hours of Operation": null, "Phone Number": "(931) 436-9307", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Clarksville", "Zip Code": 37040.0, "Latitude": 36.528448, "Longitude": -87.341426, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "980 Professional Park Dr", "lat": 36.528448, "lng": -87.341426, "phone": "(931) 436-9307", "country": "United States", "city": "Clarksville", "state": "TN", "postal_code": 37040.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3431bec47ba91d46c25e0d18a8f27793',
        'Premier Radiology',
        '3310 Aspen Grove Dr',
        35.921811,
        -86.795204,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 771-0171',
        NULL,
        'United States',
        'Franklin',
        'TN',
        '37067.0',
        'uploaded',
        'uploaded_3431bec47ba91d46c25e0d18a8f27793',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "3310 Aspen Grove Dr", "Address Two": "Suite 113", "clinic Hours of Operation": null, "Phone Number": "(615) 771-0171", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Franklin", "Zip Code": 37067.0, "Latitude": 35.921811, "Longitude": -86.795204, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "3310 Aspen Grove Dr", "lat": 35.921811, "lng": -86.795204, "phone": "(615) 771-0171", "country": "United States", "city": "Franklin", "state": "TN", "postal_code": 37067.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d49c2f197457f4582f4e624593aa21e6',
        'Premier Radiology',
        '110 St Blaise Rd',
        36.388997,
        -86.454802,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 467-4640',
        NULL,
        'United States',
        'Gallatin',
        'TN',
        '37066.0',
        'uploaded',
        'uploaded_d49c2f197457f4582f4e624593aa21e6',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "110 St Blaise Rd", "Address Two": "Suite 140", "clinic Hours of Operation": null, "Phone Number": "(615) 467-4640", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Gallatin", "Zip Code": 37066.0, "Latitude": 36.388997, "Longitude": -86.454802, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "110 St Blaise Rd", "lat": 36.388997, "lng": -86.454802, "phone": "(615) 467-4640", "country": "United States", "city": "Gallatin", "state": "TN", "postal_code": 37066.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_8ca33a33ad3397ec22aa9466d8781e05',
        'Premier Radiology',
        '2323 Crestmoor Rd',
        36.098408,
        -86.825221,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 467-1045',
        NULL,
        'United States',
        'Nashville',
        'TN',
        '37215.0',
        'uploaded',
        'uploaded_8ca33a33ad3397ec22aa9466d8781e05',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "2323 Crestmoor Rd", "Address Two": "Suite 100", "clinic Hours of Operation": null, "Phone Number": "(615) 467-1045", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Nashville", "Zip Code": 37215.0, "Latitude": 36.098408, "Longitude": -86.825221, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "2323 Crestmoor Rd", "lat": 36.098408, "lng": -86.825221, "phone": "(615) 467-1045", "country": "United States", "city": "Nashville", "state": "TN", "postal_code": 37215.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6780809cbc62b5624352ce20a4beb01c',
        'Premier Radiology',
        '262 New Shackle Island Rd',
        36.311047,
        -86.611736,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 986-6050',
        NULL,
        'United States',
        'Hendersonville',
        'TN',
        '37075.0',
        'uploaded',
        'uploaded_6780809cbc62b5624352ce20a4beb01c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "262 New Shackle Island Rd", "Address Two": "Suite 101", "clinic Hours of Operation": null, "Phone Number": "(615) 986-6050", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Hendersonville", "Zip Code": 37075.0, "Latitude": 36.311047, "Longitude": -86.611736, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "262 New Shackle Island Rd", "lat": 36.311047, "lng": -86.611736, "phone": "(615) 986-6050", "country": "United States", "city": "Hendersonville", "state": "TN", "postal_code": 37075.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_86cf78b75b1f5335e6638005e6d2a1fa',
        'nan',
        'nan',
        36.311047,
        -86.611736,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Hendersonvlle',
        'TN',
        '37075.0',
        'uploaded',
        'uploaded_86cf78b75b1f5335e6638005e6d2a1fa',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Hendersonvlle", "Zip Code": 37075.0, "Latitude": 36.311047, "Longitude": -86.611736, "State": "TN", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 36.311047, "lng": -86.611736, "phone": null, "country": null, "city": "Hendersonvlle", "state": "TN", "postal_code": 37075.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_60ddb4bdd49a806391e1d6676ce9784e',
        'Premier Radiology',
        '5045 Old Hickory Boulevard, Suite 100, Hermitage, Tn 37076',
        nan,
        nan,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 884-7674',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_60ddb4bdd49a806391e1d6676ce9784e',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "5045 Old Hickory Boulevard, Suite 100, Hermitage, Tn 37076", "Address Two": "Suite E", "clinic Hours of Operation": null, "Phone Number": "(615) 884-7674", "Country": null, "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "Premier Radiology", "address": "5045 Old Hickory Boulevard, Suite 100, Hermitage, Tn 37076", "lat": null, "lng": null, "phone": "(615) 884-7674", "country": null, "city": null, "state": null, "postal_code": null, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_c22ead21c4c0af92c9e625b42e64a6ef',
        'Premier Radiology',
        '101 Physician’s Way, Suite 113, Lebanon, Tn 37090',
        36.147433,
        -86.31061,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 467-1062',
        NULL,
        'United States',
        'Lebanon',
        'TN',
        '37090.0',
        'uploaded',
        'uploaded_c22ead21c4c0af92c9e625b42e64a6ef',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "101 Physician\u2019s Way, Suite 113, Lebanon, Tn 37090", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(615) 467-1062", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Lebanon", "Zip Code": 37090.0, "Latitude": 36.147433, "Longitude": -86.31061, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "101 Physician\u2019s Way, Suite 113, Lebanon, Tn 37090", "lat": 36.147433, "lng": -86.31061, "phone": "(615) 467-1062", "country": "United States", "city": "Lebanon", "state": "TN", "postal_code": 37090.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_aa19f8b36bcbb2c095ee84e60523f837',
        'Premier Radiology',
        '6130 Nolensville Pike, Suite 102, Nashville, Tn 37211',
        nan,
        nan,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 986-7026',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_aa19f8b36bcbb2c095ee84e60523f837',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "6130 Nolensville Pike, Suite 102, Nashville, Tn 37211", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(615) 986-7026", "Country": null, "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "Premier Radiology", "address": "6130 Nolensville Pike, Suite 102, Nashville, Tn 37211", "lat": null, "lng": null, "phone": "(615) 986-7026", "country": null, "city": null, "state": null, "postal_code": null, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5f9012f82d5bfb6a047303fe41af2cdb',
        'Premier Radiology',
        '5002 Crossings Circle, Suite 140, Mt. Juliet, Tn 37122',
        nan,
        nan,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 773-7237',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_5f9012f82d5bfb6a047303fe41af2cdb',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "5002 Crossings Circle, Suite 140, Mt. Juliet, Tn 37122", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(615) 773-7237", "Country": null, "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "Premier Radiology", "address": "5002 Crossings Circle, Suite 140, Mt. Juliet, Tn 37122", "lat": null, "lng": null, "phone": "(615) 773-7237", "country": null, "city": null, "state": null, "postal_code": null, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_979e62b5a96e32c95006e233b9435655',
        'Premier Radiology',
        '1840 Medical Center Parkway, Suite 101, Murfreesboro, Tn 37129',
        nan,
        nan,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 896-1234',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_979e62b5a96e32c95006e233b9435655',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "1840 Medical Center Parkway, Suite 101, Murfreesboro, Tn 37129", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(615) 896-1234", "Country": null, "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "Premier Radiology", "address": "1840 Medical Center Parkway, Suite 101, Murfreesboro, Tn 37129", "lat": null, "lng": null, "phone": "(615) 896-1234", "country": null, "city": null, "state": null, "postal_code": null, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_1641ddba432fd0879a154f02412d3961',
        'Premier Radiology',
        '1800 Charlotte Avenue',
        36.152607,
        -86.789271,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 329-4840',
        NULL,
        'United States',
        'Nashville',
        'TN',
        '37203.0',
        'uploaded',
        'uploaded_1641ddba432fd0879a154f02412d3961',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "1800 Charlotte Avenue", "Address Two": null, "clinic Hours of Operation": "Monday-Friday: 7:30\u202fAM\u20134:30\u202fPM\nSaturday-Sunday: Closed\n", "Phone Number": "(615) 329-4840", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Nashville", "Zip Code": 37203.0, "Latitude": 36.152607, "Longitude": -86.789271, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "1800 Charlotte Avenue", "lat": 36.152607, "lng": -86.789271, "phone": "(615) 329-4840", "country": "United States", "city": "Nashville", "state": "TN", "postal_code": 37203.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_7d3208246b6cbf9dc808e5a377384e52',
        'Premier Radiology',
        '2723 New Salem Highway, Suite 103, Murfreesboro, Tn 37128',
        nan,
        nan,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 986-6055',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_7d3208246b6cbf9dc808e5a377384e52',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "2723 New Salem Highway, Suite 103, Murfreesboro, Tn 37128", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(615) 986-6055", "Country": null, "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "Premier Radiology", "address": "2723 New Salem Highway, Suite 103, Murfreesboro, Tn 37128", "lat": null, "lng": null, "phone": "(615) 986-6055", "country": null, "city": null, "state": null, "postal_code": null, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_249b063e8e14684c26bb9f5363bbd9b2',
        'Premier Radiology',
        '300 20th Ave N',
        36.152607,
        -86.789271,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 986-6047',
        NULL,
        'United States',
        'Nashville',
        'TN',
        '37203.0',
        'uploaded',
        'uploaded_249b063e8e14684c26bb9f5363bbd9b2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "300 20th Ave N", "Address Two": " STE 202", "clinic Hours of Operation": "Monday-Friday:  8\u202fAM\u20135\u202fPM\nSaturday-Sunday: Closed ", "Phone Number": "(615) 986-6047", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Nashville", "Zip Code": 37203.0, "Latitude": 36.152607, "Longitude": -86.789271, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "300 20th Ave N", "lat": 36.152607, "lng": -86.789271, "phone": "(615) 986-6047", "country": "United States", "city": "Nashville", "state": "TN", "postal_code": 37203.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_72560b119f53cdacf297e20975db36d0',
        'Premier Radiology',
        '4230 Harding Pike, Suite 220, Nashville, Tn 37205',
        nan,
        nan,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 467-1050',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_72560b119f53cdacf297e20975db36d0',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "4230 Harding Pike, Suite 220, Nashville, Tn 37205", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(615) 467-1050", "Country": null, "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "Premier Radiology", "address": "4230 Harding Pike, Suite 220, Nashville, Tn 37205", "lat": null, "lng": null, "phone": "(615) 467-1050", "country": null, "city": null, "state": null, "postal_code": null, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_1a4fad4843b464001b4581720efd5280',
        'Premier Radiology',
        '741 President Place, Suite 100, Smyrna, Tn 37167',
        nan,
        nan,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 220-0674',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_1a4fad4843b464001b4581720efd5280',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "741 President Place, Suite 100, Smyrna, Tn 37167", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(615) 220-0674", "Country": null, "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "Premier Radiology", "address": "741 President Place, Suite 100, Smyrna, Tn 37167", "lat": null, "lng": null, "phone": "(615) 220-0674", "country": null, "city": null, "state": null, "postal_code": null, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_544a1f81eb546be210e7a40ea077f72f',
        'Premier Radiology',
        '3754 Murfreesboro Pike, Suite 102, Antioch, Tn 37013',
        nan,
        nan,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 467-4642',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        'uploaded',
        'uploaded_544a1f81eb546be210e7a40ea077f72f',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "3754 Murfreesboro Pike, Suite 102, Antioch, Tn 37013", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(615) 467-4642", "Country": null, "Time Zone Display": null, "City": null, "Zip Code": null, "Latitude": null, "Longitude": null, "State": null, "zipcode UTC": null, "name": "Premier Radiology", "address": "3754 Murfreesboro Pike, Suite 102, Antioch, Tn 37013", "lat": null, "lng": null, "phone": "(615) 467-4642", "country": null, "city": null, "state": null, "postal_code": null, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_d757c572c1f7fe9b249089db29483e7b',
        'Premier Radiology',
        '5045 Old Hickory Blvd',
        36.180507,
        -86.60111,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 884-7674',
        NULL,
        'United States',
        'Hermitage',
        'TN',
        '37076.0',
        'uploaded',
        'uploaded_d757c572c1f7fe9b249089db29483e7b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "5045 Old Hickory Blvd", "Address Two": "Ste 100", "clinic Hours of Operation": null, "Phone Number": "(615) 884-7674", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Hermitage", "Zip Code": 37076.0, "Latitude": 36.180507, "Longitude": -86.60111, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "5045 Old Hickory Blvd", "lat": 36.180507, "lng": -86.60111, "phone": "(615) 884-7674", "country": "United States", "city": "Hermitage", "state": "TN", "postal_code": 37076.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_82d8be054be44b96c64242829f3ce3b2',
        'Premier Radiology',
        '101 Physician''s Way',
        36.147433,
        -86.31061,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 467-1062',
        NULL,
        'United States',
        'Lebanon',
        'TN',
        '37090.0',
        'uploaded',
        'uploaded_82d8be054be44b96c64242829f3ce3b2',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "101 Physician''s Way", "Address Two": "Ste 113", "clinic Hours of Operation": null, "Phone Number": "(615) 467-1062", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Lebanon", "Zip Code": 37090.0, "Latitude": 36.147433, "Longitude": -86.31061, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "101 Physician''s Way", "lat": 36.147433, "lng": -86.31061, "phone": "(615) 467-1062", "country": "United States", "city": "Lebanon", "state": "TN", "postal_code": 37090.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_6be1e3014dd32249427d356409a15dbd',
        'Premier Radiology',
        '6130 Nolensville Pk',
        36.079259,
        -86.725843,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 986-7026',
        NULL,
        'United States',
        'Nashville',
        'TN',
        '37211.0',
        'uploaded',
        'uploaded_6be1e3014dd32249427d356409a15dbd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "6130 Nolensville Pk", "Address Two": "Ste 102", "clinic Hours of Operation": null, "Phone Number": "(615) 986-7026", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Nashville", "Zip Code": 37211.0, "Latitude": 36.079259, "Longitude": -86.725843, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "6130 Nolensville Pk", "lat": 36.079259, "lng": -86.725843, "phone": "(615) 986-7026", "country": "United States", "city": "Nashville", "state": "TN", "postal_code": 37211.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_3ddced688fba194d7cb333f9fb3b7a37',
        'nan',
        'nan',
        36.079259,
        -86.725843,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Woodbine',
        'TN',
        '37211.0',
        'uploaded',
        'uploaded_3ddced688fba194d7cb333f9fb3b7a37',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Woodbine", "Zip Code": 37211.0, "Latitude": 36.079259, "Longitude": -86.725843, "State": "TN", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 36.079259, "lng": -86.725843, "phone": null, "country": null, "city": "Woodbine", "state": "TN", "postal_code": 37211.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_81fa70a1684d3861dd54929ca9c279e8',
        'Premier Radiology',
        '5002 Crossings Cir',
        36.195016,
        -86.497326,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 773-7237',
        NULL,
        'United States',
        'Mount Juliet',
        'TN',
        '37122.0',
        'uploaded',
        'uploaded_81fa70a1684d3861dd54929ca9c279e8',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "5002 Crossings Cir", "Address Two": "Ste 140", "clinic Hours of Operation": null, "Phone Number": "(615) 773-7237", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Mount Juliet", "Zip Code": 37122.0, "Latitude": 36.195016, "Longitude": -86.497326, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "5002 Crossings Cir", "lat": 36.195016, "lng": -86.497326, "phone": "(615) 773-7237", "country": "United States", "city": "Mount Juliet", "state": "TN", "postal_code": 37122.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_08f0c8f12c75cfaf2dcf9842eef6bc54',
        'Premier Radiology',
        '1800 Charlotte Ave',
        36.152607,
        -86.789271,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 329-4840',
        NULL,
        'United States',
        'Nashville',
        'TN',
        '37203.0',
        'uploaded',
        'uploaded_08f0c8f12c75cfaf2dcf9842eef6bc54',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "1800 Charlotte Ave", "Address Two": null, "clinic Hours of Operation": null, "Phone Number": "(615) 329-4840", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Nashville", "Zip Code": 37203.0, "Latitude": 36.152607, "Longitude": -86.789271, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "1800 Charlotte Ave", "lat": 36.152607, "lng": -86.789271, "phone": "(615) 329-4840", "country": "United States", "city": "Nashville", "state": "TN", "postal_code": 37203.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b5f709f450eaefc0a999100315b9540c',
        'Premier Radiology',
        '2723 New Salem Hwy',
        35.813319,
        -86.445502,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 986-6055',
        NULL,
        'United States',
        'Mboro',
        'TN',
        '37128.0',
        'uploaded',
        'uploaded_b5f709f450eaefc0a999100315b9540c',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "2723 New Salem Hwy", "Address Two": "Ste 103", "clinic Hours of Operation": null, "Phone Number": "(615) 986-6055", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Mboro", "Zip Code": 37128.0, "Latitude": 35.813319, "Longitude": -86.445502, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "2723 New Salem Hwy", "lat": 35.813319, "lng": -86.445502, "phone": "(615) 986-6055", "country": "United States", "city": "Mboro", "state": "TN", "postal_code": 37128.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_9808e81c48a1484adfbca062684d25cd',
        'nan',
        'nan',
        35.813319,
        -86.445502,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Murfreesboro',
        'TN',
        '37128.0',
        'uploaded',
        'uploaded_9808e81c48a1484adfbca062684d25cd',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Murfreesboro", "Zip Code": 37128.0, "Latitude": 35.813319, "Longitude": -86.445502, "State": "TN", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 35.813319, "lng": -86.445502, "phone": null, "country": null, "city": "Murfreesboro", "state": "TN", "postal_code": 37128.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_b7fd7218ec3b5f7000eb06a19512eb7d',
        'Premier Radiology',
        '4230 Harding Pike',
        36.113558,
        -86.862079,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 467-1050',
        NULL,
        'United States',
        'Nashville',
        'TN',
        '37205.0',
        'uploaded',
        'uploaded_b7fd7218ec3b5f7000eb06a19512eb7d',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "4230 Harding Pike", "Address Two": "Ste 220", "clinic Hours of Operation": null, "Phone Number": "(615) 467-1050", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Nashville", "Zip Code": 37205.0, "Latitude": 36.113558, "Longitude": -86.862079, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "4230 Harding Pike", "lat": 36.113558, "lng": -86.862079, "phone": "(615) 467-1050", "country": "United States", "city": "Nashville", "state": "TN", "postal_code": 37205.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_14cc462e820ece4e71da44144c84b226',
        'Premier Radiology',
        '741 President Pl',
        35.968513,
        -86.522317,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 220-0674',
        NULL,
        'United States',
        'Smyrna',
        'TN',
        '37167.0',
        'uploaded',
        'uploaded_14cc462e820ece4e71da44144c84b226',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "741 President Pl", "Address Two": "Ste 100", "clinic Hours of Operation": null, "Phone Number": "(615) 220-0674", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Smyrna", "Zip Code": 37167.0, "Latitude": 35.968513, "Longitude": -86.522317, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "741 President Pl", "lat": 35.968513, "lng": -86.522317, "phone": "(615) 220-0674", "country": "United States", "city": "Smyrna", "state": "TN", "postal_code": 37167.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_5961683699d1a48a1eae42a130ae2655',
        'Premier Radiology',
        '3754 Murfreesboro Pike',
        36.055115,
        -86.64782,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        '(615) 467-4642',
        NULL,
        'United States',
        'Antioch',
        'TN',
        '37013.0',
        'uploaded',
        'uploaded_5961683699d1a48a1eae42a130ae2655',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": "Premier Radiology", "Address": "3754 Murfreesboro Pike", "Address Two": "Ste 102", "clinic Hours of Operation": null, "Phone Number": "(615) 467-4642", "Country": "United States", "Time Zone Display": "CDT - Central Daylight Time", "City": "Antioch", "Zip Code": 37013.0, "Latitude": 36.055115, "Longitude": -86.64782, "State": "TN", "zipcode UTC": -6.0, "name": "Premier Radiology", "address": "3754 Murfreesboro Pike", "lat": 36.055115, "lng": -86.64782, "phone": "(615) 467-4642", "country": "United States", "city": "Antioch", "state": "TN", "postal_code": 37013.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    

    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        'uploaded_512039521223a3596b4eff7fb1b6028b',
        'nan',
        'nan',
        36.055115,
        -86.64782,
        ARRAY['Radiology Imaging Center'],
        'Radiology Imaging Center',
        NULL,
        NULL,
        NULL,
        'Cane Ridge',
        'TN',
        '37013.0',
        'uploaded',
        'uploaded_512039521223a3596b4eff7fb1b6028b',
        'uploaded',
        0.95,
        '{"Clinic / Provider Name": null, "Address": null, "Address Two": null, "clinic Hours of Operation": null, "Phone Number": null, "Country": null, "Time Zone Display": "CDT - Central Daylight Time", "City": "Cane Ridge", "Zip Code": 37013.0, "Latitude": 36.055115, "Longitude": -86.64782, "State": "TN", "zipcode UTC": -6.0, "name": null, "address": null, "lat": 36.055115, "lng": -86.64782, "phone": null, "country": null, "city": "Cane Ridge", "state": "TN", "postal_code": 37013.0, "category": "Radiology Imaging Center"}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    
