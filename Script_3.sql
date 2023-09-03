SELECT DISTINCT t.food_category ,
	ROUND(AVG(( t.price_avg  - t2.price_avg)  / t2.price_avg * 100) OVER (PARTITION BY t.food_category ), 2) AS min_price_growth
FROM t_monika_plewova_project_SQL_primary_final t
JOIN t_monika_plewova_project_SQL_primary_final t2
	ON t.food_category = t2.food_category
	AND t._year = t2._year +1 
WHERE t.food_category IS NOT NULL 
GROUP BY t.food_category, t._year
ORDER BY min_price_growth
LIMIT 1
;