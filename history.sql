/* 2025-05-25 23:24:37 [42 ms] */ 
CREATE Table rangers
(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(100) NOT NULL
);
/* 2025-05-25 23:25:34 [7 ms] */ 
INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');
/* 2025-05-25 23:25:47 [4 ms] */ 
SELECT * FROM rangers LIMIT 100;
/* 2025-05-25 23:26:59 [11 ms] */ 
DROP TABLE rangers;
/* 2025-05-25 23:28:14 [10 ms] */ 
CREATE Table rangers
(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(100) NOT NULL
);
/* 2025-05-25 23:28:15 [6 ms] */ 
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');
/* 2025-05-25 23:28:18 [1 ms] */ 
SELECT * FROM rangers LIMIT 100;
/* 2025-05-25 23:29:48 [4 ms] */ 
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);
/* 2025-05-25 23:29:49 [4 ms] */ 
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
/* 2025-05-25 23:29:57 [2 ms] */ 
SELECT * FROM species LIMIT 100;
/* 2025-05-25 23:30:50 [12 ms] */ 
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(150) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT
);
/* 2025-05-25 23:31:21 [10 ms] */ 
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);
/* 2025-05-25 23:31:22 [2 ms] */ 
SELECT * FROM sightings LIMIT 100;
