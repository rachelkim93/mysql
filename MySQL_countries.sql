SELECT countries.name, languages.language, languages.percentage FROM countries LEFT JOIN languages ON countries.id = languages.country_id WHERE language = "slovene";

SELECT countries.name, count(cities.name) FROM cities LEFT JOIN countries ON countries.id = cities.country_id GROUP BY cities ORDER BY countries DESC;

SELECT cities.name, cities.population FROM cities LEFT JOIN countries ON cities.country_code = countries.id WHERE cities.population > 500000;

SELECT countries.name, languages.language, languages.percentage FROM countries LEFT JOIN languages ON countries.id = languages.country_id WHERE languages.percentage > 89;

SELECT name, surface_area, population FROM countries WHERE surface_area < 501 AND population > 100000;

SELECT name, government_form, capital, life_expectancy FROM countries WHERE government_form = "Constitutional Monarchy";

SELECT countries.name, cities.name, cities.district, cities.population FROM countries LEFT JOIN cities ON countries.id = cities.country_id WHERE cities.population > 500000 AND cities.district = "Buenos Aires";

SELECT region, count(*) AS countries FROM countries GROUP BY region ORDER BY countries DESC;