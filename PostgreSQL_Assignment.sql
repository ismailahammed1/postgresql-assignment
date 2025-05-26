-- rangers table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');
-- -- species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL)

INSERT INTO species ( common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
-- sightings table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT NOT NULL,
    ranger_id INT NOT NULL,
    location VARCHAR(100) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT,
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);
-- DROP table sightings

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

-- DROP table species

SELECT * FROM rangers;

SELECT * FROM species;

SELECT * FROM sightings;

-- problem 1
INSERT INTO rangers (name, region) VALUES ('Derek Fox', 'Coastal Plains');
-- problem 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;

--problem 3 
SELECT * FROM sightings
    WHERE location LIKE '%Pass%'

-- problem 4
SELECT r.name AS ranger_name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
HAVING COUNT(s.sighting_id) > 0;

-- problem 5
SELECT common_name as c
FROM species s
LEFT JOIN sightings si ON s.species_id = si.species_id
WHERE si.sighting_id IS NULL;
-- problem 6

SELECT s.common_name, si.sighting_time,
       r.name AS ranger_name
    FROM species s
    JOIN sightings si ON s.species_id = si.species_id
    JOIN rangers r ON si.ranger_id = r.ranger_id
    ORDER BY si.sighting_time DESC  
    LIMIT 2;

-- problem 7

UPDATE species
SET conservation_status = 'Historic'
WHERE EXTRACT(YEAR FROM discovery_date) < 1800;

-- SELECT * FROM sightings
-- problem 8
SELECT sighting_id, sighting_time,  
       CASE 
         WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
         WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
         ELSE 'Evening'
       END AS time_of_day
FROM sightings;


DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);







