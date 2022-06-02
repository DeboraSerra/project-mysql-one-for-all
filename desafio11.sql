SELECT
	s.name AS 'nome_musica',
    (CASE
		WHEN name LIKE '%Streets' THEN REPLACE(name, 'Streets', 'Code Review')
		WHEN name LIKE '%Her Own' THEN REPLACE(name, 'Her Own', 'Trybe')
		WHEN name LIKE '%Inner Fire' THEN REPLACE(name, 'Inner Fire', 'Project')
		WHEN name LIKE '%Silly' THEN REPLACE(name, 'Silly', 'Nice')
		WHEN name LIKE '%Circus' THEN REPLACE(name, 'Circus', 'Pull Request')
		ELSE name
	END) AS 'novo_nome'
    FROM SpotifyClone.song AS s
    WHERE s.name <> (CASE
		WHEN name LIKE '%Streets' THEN REPLACE(name, 'Streets', 'Code Review')
		WHEN name LIKE '%Her Own' THEN REPLACE(name, 'Her Own', 'Trybe')
		WHEN name LIKE '%Inner Fire' THEN REPLACE(name, 'Inner Fire', 'Project')
		WHEN name LIKE '%Silly' THEN REPLACE(name, 'Silly', 'Nice')
		WHEN name LIKE '%Circus' THEN REPLACE(name, 'Circus', 'Pull Request')
		ELSE name
	END)
    ORDER BY s.name;

