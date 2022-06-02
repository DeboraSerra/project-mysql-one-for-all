SELECT 
	s.`name` AS 'cancao',
    COUNT(h.last_heard) AS 'reproducoes'
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.history AS h
ON h.song_id = s.id
GROUP BY s.`name`
ORDER BY COUNT(h.last_heard) DESC,
	s.`name`
LIMIT 2;