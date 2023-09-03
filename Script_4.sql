SELECT  t._year, 
	ROUND(( AVG (t.price_avg)  - AVG(t2.price_avg))  / AVG (t2.price_avg) * 100 , 2) 		AS price_growth,
	ROUND(( AVG (t.payroll_avg)  - AVG(t2.payroll_avg))  / AVG (t2.payroll_avg) * 100 , 2) 	AS pay_growth,
	ROUND(( AVG (t.price_avg)  - AVG(t2.price_avg))  / AVG (t2.price_avg) * 100 , 2)
	- ROUND(( AVG (t.payroll_avg)  - AVG(t2.payroll_avg))  / AVG (t2.payroll_avg) * 100 , 2) AS diff_growth
FROM t_monika_plewova_project_SQL_primary_final t
JOIN t_monika_plewova_project_SQL_primary_final t2
	ON  t.food_category = t2.food_category
	AND t.industry  = t2.industry
	AND t._year = t2._year +1 
GROUP BY t._year
ORDER BY t._year
;