SELECT
	art.name AS 'artista',
    a.name AS 'album',
    COUNT(f.user_id) AS 'seguidores'
FROM SpotifyClone.album AS a
LEFT JOIN SpotifyClone.artist AS art
ON a.artist_id = art.id
LEFT JOIN SpotifyClone.following_artists AS f
ON f.artist_id = art.id
GROUP BY a.name, art.name
ORDER BY COUNT(f.user_id) DESC, art.name, a.name;