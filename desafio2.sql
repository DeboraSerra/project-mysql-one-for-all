SELECT
	COUNT(s.`name`) AS 'cancoes',
    COUNT(DISTINCT art.`name`) AS 'artistas',
    COUNT(DISTINCT a.`name`) AS 'albuns'
FROM SpotifyClone.song AS s
RIGHT JOIN SpotifyClone.album AS a
ON a.id = s.album_id
RIGHT JOIN SpotifyClone.artist AS art
ON a.artist_id = art.id;