-- queries.sql
-- Complete each mission by writing your SQL query below the instructions.
-- Don't forget to end each query with a semicolon ;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1;

SELECT regions.name, regions.country, observations.species_id, COUNT(*) FROM regions
JOIN observations ON regions.id=observations.region_id
WHERE observations.species_id GROUP BY region_id ORDER BY COUNT(*) DESC
;

--MISSION 2;

SELECT strftime('%m',observation_date) as mes,COUNT(count) FROM observations
GROUP BY mes ORDER BY COUNT(count) DESC
;


-- MISSION 3;

SELECT COUNT(observations.species_id), species.common_name, species.scientific_name FROM species
JOIN observations ON species.id = observations.species_id
GROUP BY observations.species_id, species.common_name, species.scientific_name
HAVING COUNT(observations.species_id) BETWEEN 1 AND 4
ORDER BY COUNT(observations.species_id) ASC
;

-- MISSION 4;

SELECT regions.country,regions.name,species.common_name,COUNT(*) FROM regions
JOIN observations ON regions.id=observations.region_id
JOIN species ON observations.species_id=species.id
WHERE observations.species_id>0  GROUP BY regions.country ORDER BY COUNT(*) DESC
;


-- MISSION 5;

SELECT COUNT(observations.species_id), species.common_name, species.scientific_name FROM species
JOIN observations ON species.id=observations.species_id
WHERE observations.species_id>0
GROUP by observations.species_id
ORDER BY COUNT(observations.species_id) DESC 
;



-- MISSION 6;

SELECT observer, COUNT(species_id) FROM observations
GROUP by observer
ORDER BY COUNT(species_id) DESC
;


-- MISSION 7;

SELECT species.common_name, species.scientific_name FROM species
LEFT JOIN observations ON species.id=observations.species_id
WHERE observations.species_id IS NULL
ORDER BY common_name
;


-- MISSION 8;

SELECT observation_date, COUNT(species_id) FROM observations
GROUP by observation_date
ORDER BY COUNT(species_id) DESC
;
