SELECT
	u.`name` AS 'usuario',
    (CASE
		WHEN u.id = active.user_id THEN 'Usuário ativo'
        ELSE 'Usuário inativo'
    END) AS 'condicao_usuario'
FROM SpotifyClone.`user` AS u
LEFT JOIN (SELECT 
		DISTINCT h.user_id
	FROM SpotifyClone.history AS h
	WHERE YEAR(h.last_heard) >= 2021) AS active
ON u.id = active.user_id
ORDER BY u.`name`;

