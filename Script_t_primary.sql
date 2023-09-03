CREATE TABLE IF NOT EXISTS tpay AS
SELECT
	cpib.name 					AS industry,
    ROUND(AVG(cpay.value)) 		AS payroll_avg,
    cpay.payroll_year 			AS _year,
    e.GDP 						AS GDP_CZ
FROM czechia_payroll 			AS cpay     
JOIN czechia_payroll_industry_branch cpib
  	ON cpay.industry_branch_code = cpib.code
JOIN economies e 
	ON cpay.payroll_year = e.`year` AND 
	e.country IN ('Czech Republic')
WHERE cpay.value_type_code = 5958
GROUP BY cpay.payroll_year, cpib.name, e.GDP
ORDER BY cpay.payroll_year
;



CREATE TABLE IF NOT EXISTS tpri AS
SELECT
    cpc.name 					AS food_category, 
    cp.category_code			AS food_code,
    cpc.price_unit 				AS food_unit,
    ROUND(AVG(cp.value)) 		AS price_avg,
    YEAR(cp.date_from) 			AS pri_year   
FROM czechia_price cp
JOIN czechia_price_category cpc
    ON cp.category_code = cpc.code
GROUP BY YEAR(cp.date_from), cpc.name
ORDER BY cpc.name, YEAR(cp.date_from) 
;




CREATE TABLE IF NOT EXISTS t_monika_plewova_project_SQL_primary_final AS
SELECT
	 tpay.industry,
	 tpay.payroll_avg,
	 tpay._year,
	 tpri.food_category,
	 tpri.food_unit,
	 tpri.food_code,
	 tpri.price_avg,
	 tpay.GDP_CZ
FROM tpay
 LEFT JOIN tpri
	 ON tpay._year = tpri.pri_year
GROUP BY tpay._year, tpay.industry, tpay.payroll_avg, tpri.food_category, tpri.food_code, tpri.food_unit, tpay.GDP_CZ
ORDER BY tpay._year
;

DROP TABLE tpay
;

DROP TABLE tpri
;