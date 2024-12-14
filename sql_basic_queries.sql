SELECT * FROM 116_world_mining_companies_clean;

-- Change name into Table 1
ALTER TABLE 116_world_mining_companies_clean RENAME TO table_1;

SELECT * FROM world_mining_commodities_clean;

-- Chaning name into Table 2 
ALTER TABLE world_mining_commodities_clean RENAME TO table_2;

-- Rename columns for years (2018, 2019, 2020, 2021, 2022) in table_2
-- Rename columns for years (2018, 2019, 2020, 2021, 2022) in table_2
ALTER TABLE table_2
RENAME COLUMN `2018` TO `year_2018`;

ALTER TABLE table_2
RENAME COLUMN `2019` TO `year_2019`;

ALTER TABLE table_2
RENAME COLUMN `2020` TO `year_2020`;

ALTER TABLE table_2
RENAME COLUMN `2021` TO `year_2021`;

ALTER TABLE table_2
RENAME COLUMN `2022` TO `year_2022`;



-- BASIC QUESTION
-- 1. List all unique commodities mined by companies in Table 1.
SELECT DISTINCT Commodity
FROM table_1;

-- 2. Retrieve the names and websites of all companies operating in Canada.
SELECT Name, Website
FROM table_1
WHERE Location LIKE '%Canada%';

-- 3. List the countries from Table 2 where 'Gold' was mined in 2022.
SELECT country
FROM table_2
WHERE mined_raw_mat = 'Gold' AND year_2022 > 0;

-- 4. Find the total production of 'Copper' for the year 2020 across all countries
SELECT SUM(year_2020) AS total_copper_production_2020
FROM table_2
WHERE mined_raw_mat = 'Copper';

-- 5. Display the name and project stage of companies involved in Diamond mining.
SELECT name, `Project Stage`
FROM table_1
WHERE Commodity LIKE '%Diamond%';

-- 6. Identify the unit of measurement used for 'Nickel' in Table 2.
SELECT DISTINCT unit
FROM table_2
WHERE mined_raw_mat = 'Nickel';

-- 7. List all companies in Table 1 that are in the 'Production' stage.
SELECT name
FROM table_1
WHERE `Project Stage` LIKE '%Production%';

-- 8. Find the top 3 commodities mined in Zimbabwe based on total production in 2021.
SELECT mined_raw_mat, SUM(year_2021) AS total_production_2021
FROM table_2
WHERE country = 'Zimbabwe'
GROUP BY mined_raw_mat
ORDER BY total_production_2021 DESC
LIMIT 3;

-- 9. Retrieve records where the production of any commodity exceeded 1 million tons in 2022.
SELECT country, mined_raw_mat, year_2022
FROM table_2
WHERE year_2022 > 1000000;

-- 10. List the countries where 'Talc' production decreased between 2018 and 2022.
SELECT country
FROM table_2
WHERE mined_raw_mat = 'Talc' 
AND year_2022 < year_2018;
