SELECT DISTINCT t.industry AS industry_with_decrease
FROM t_monika_plewova_project_SQL_primary_final t
JOIN t_monika_plewova_project_SQL_primary_final t2
	ON t.industry = t2.industry
	AND t._year = t2._year +1 
WHERE (t.payroll_avg - t2.payroll_avg ) < 0
GROUP BY t.industry, t._year 
ORDER BY t.industry
;