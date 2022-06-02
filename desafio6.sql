SELECT
	UCASE(ROUND(MIN(h.value), 2)) AS 'faturamento_minimo',
    UCASE(ROUND(MAX(h.value), 2)) AS  'faturamento_maximo',
	UCASE(ROUND(AVG(h.value), 2)) AS 'faturamento_medio',
    UCASE(ROUND(SUM(h.value), 2)) AS 'faturamento_total'
FROM SpotifyClone.hire_plan AS h
INNER JOIN SpotifyClone.user AS u
ON u.hire_plan_id = h.id;