/*
MySQL Countries
Objetivos: Practica consultas SQL.
*/

USE world;
SELECT * FROM countries;
SELECT * FROM languages;
SELECT * FROM cities WHERE country_id=9;
/* SELECT name, language, percentage 
FROM countries, languages 
WHERE language='Slovene'; */

-- Consulta 1
SELECT name, language, percentage
FROM countries
JOIN languages ON countries.code = languages.country_code
WHERE languages.language = 'Slovene'
ORDER BY languages.percentage DESC;

-- Consulta 2
SELECT c.name AS name, COUNT(ci.id) AS cities
FROM countries c
JOIN cities ci ON c.code = ci.country_code
GROUP BY c.name
ORDER BY cities DESC;

-- Consulta 3
SELECT ci.name AS city, ci.population AS population
FROM countries c
JOIN cities ci ON c.code = ci.country_code
WHERE c.name = 'Mexico' AND ci.population > 50000
ORDER BY population DESC;

-- Consulta 4
SELECT c.name AS name, l.language AS language, l.percentage AS percentage 
FROM countries c
JOIN languages l ON c.code = l.country_code
WHERE l.percentage > 89
ORDER BY percentage DESC;

-- Consulta 5
SELECT c.name AS Country_name, c.surface_area AS Surface, c.population AS Population
FROM countries c
WHERE c.surface_area < 501 AND c.population > 100000
ORDER BY c.population DESC;

-- Consulta 6
SELECT c.name AS name, c.government_form AS government, c.capital AS capital, c.life_expectancy AS life_expectancy
FROM countries c
WHERE c.government_form = "Constitutional Monarchy" AND c.capital > 200 AND c.life_expectancy > 75
ORDER BY c.name ASC;

-- Consulta 7
SELECT c.name AS name_country, ci.name AS name_city, ci.district AS district, ci.population AS population
FROM countries c
JOIN cities ci ON c.code = ci.country_code
WHERE ci.district = "Buenos Aires" AND ci.population > 500000;

-- Consulta 8
SELECT c.region AS region_name, COUNT(c.id) AS countries
FROM countries c
GROUP BY c.region
ORDER BY count(c.id) DESC;