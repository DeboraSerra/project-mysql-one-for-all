SELECT
	s.name AS 'nome',
    COUNT(h.song_id) AS 'reproducoes'
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.history AS h
ON s.id = h.song_id
INNER JOIN SpotifyClone.user AS u
ON h.user_id = u.id
WHERE hire_plan_id IN (1, 4)
GROUP BY s.name
ORDER BY s.name;