=======COMPARISON_PAYROLL_AND_GDP=======
SELECT
	ROUND(( AVG (t.payroll_avg)  - AVG(t2.payroll_avg))  / AVG (t2.payroll_avg) * 100 , 2) 	AS payroll_total_growth,
	ROUND(( AVG (t.GDP_CZ ) - AVG (t2.GDP_CZ ))  / AVG (t2.GDP_CZ ) * 100 , 2)				AS GDP_total_growth
FROM t_monika_plewova_project_SQL_primary_final t
LEFT JOIN t_monika_plewova_project_SQL_primary_final t2
	ON  t._year = t2._year +1 
	AND t.industry  = t2.industry
;

SELECT t._year, 
	ROUND(( AVG (t.payroll_avg)  - AVG(t2.payroll_avg))  / AVG (t2.payroll_avg) * 100 , 2) 				AS pay_growth,
	ROUND(( AVG (t.GDP_CZ ) - AVG (t2.GDP_CZ ))  / AVG (t2.GDP_CZ ) * 100 , 2)							AS GDP_growth,
	IF(( AVG (t.payroll_avg)  - AVG(t2.payroll_avg))  / AVG (t2.payroll_avg) * 100 > 3.88 * 1.3, 1, 0) 	AS pay_growth_true,
	IF(( AVG (t.GDP_CZ ) - AVG (t2.GDP_CZ ))  / AVG (t2.GDP_CZ ) * 100 > 2.2 * 1.3, 1, 0)				AS GDP_growth_true
FROM t_monika_plewova_project_SQL_primary_final t
LEFT JOIN t_monika_plewova_project_SQL_primary_final t2
	ON  t._year = t2._year +1 
	AND t.industry  = t2.industry
GROUP BY t._year
ORDER BY t._year
;

=======COMPARISON_PRICE_AND_GDP=======

SELECT
	ROUND(( AVG (t.price_avg)  - AVG(t2.price_avg))  / AVG (t2.price_avg) * 100 , 2) 		AS price_total_growth,
	ROUND(( AVG (t.GDP_CZ ) - AVG (t2.GDP_CZ ))  / AVG (t2.GDP_CZ ) * 100 , 2)				AS GDP_total_growth
FROM t_monika_plewova_project_SQL_primary_final t
LEFT JOIN t_monika_plewova_project_SQL_primary_final t2
	ON  t._year = t2._year +1 
	AND t.food_category = t2.food_category
;

SELECT t._year, 
	ROUND(( AVG (t.price_avg)  - AVG(t2.price_avg))  / AVG (t2.price_avg) * 100 , 2) 				AS price_growth,
	ROUND(( AVG (t.GDP_CZ ) - AVG (t2.GDP_CZ ))  / AVG (t2.GDP_CZ ) * 100 , 2)						AS GDP_growth,
	IF(( AVG (t.price_avg)  - AVG(t2.price_avg))  / AVG (t2.price_avg) * 100 > 2.52 * 1.3, 1, 0) 	AS price_growth_true,
	IF(( AVG (t.GDP_CZ ) - AVG (t2.GDP_CZ ))  / AVG (t2.GDP_CZ ) * 100 > 2.1 * 1.3, 1, 0)			AS GDP_growth_true
FROM t_monika_plewova_project_SQL_primary_final t
LEFT JOIN t_monika_plewova_project_SQL_primary_final t2
	ON  t._year = t2._year +1 
	AND t.food_category = t2.food_category
WHERE  t.food_category IS NOT NULL 
GROUP BY t._year
ORDER BY t._year
;

