SELECT
	art.name AS 'artista',
    a.name AS 'album'
FROM SpotifyClone.album AS a
LEFT JOIN SpotifyClone.artist AS art
ON a.artist_id = art.id
WHERE art.name = 'Walter Phoenix';