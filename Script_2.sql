SELECT MIN(t._year), MAX(t._year) 
FROM t_monika_plewova_project_SQL_primary_final t
WHERE t.food_category IS NOT NULL 
;

SELECT 
	IF (t.`_year`= 2006, 'první srovnatelné období', 'poslední srovnatelné období') AS label, 
		t.`_year` AS min_max_year ,
		t.food_category,
		ROUND(AVG(t.payroll_avg) / t.price_avg) AS buying_amount,
		t.food_unit
FROM t_monika_plewova_project_SQL_primary_final t
WHERE 	t._year IN  (2006, 2018) AND 
		t.food_code IN  (111301, 114201)
GROUP BY t.`_year`, t.food_category
ORDER BY t.`_year`
;