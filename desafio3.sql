SELECT 
	u.`name` AS 'usuario',
    COUNT(h.song_id) AS 'qtde_musicas_ouvidas',
    ROUND(SUM(s.duration) / 60, 2) AS 'total_minutos'
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.song AS s
INNER JOIN SpotifyClone.history AS h
ON s.id = h.song_id AND h.user_id = u.id
GROUP BY u.id
ORDER BY u.`name`;