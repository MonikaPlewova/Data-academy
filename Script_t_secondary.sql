CREATE TABLE IS NOT EXISTS t_monika_plewova_project_SQL_secondary_final AS
SELECT 
	country,
	`year` ,
	population ,
	ROUND( GDP , 0) AS GDP,
	gini 
FROM economies e 
WHERE `year` BETWEEN 2000 AND 2020
	AND country IN (
	SELECT country 
	FROM countries c 
	WHERE continent IN ('Europe'))
ORDER BY country , `year` 
;