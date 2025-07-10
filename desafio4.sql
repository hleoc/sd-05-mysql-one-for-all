CREATE VIEW top_3_artistas AS
    SELECT 
        a.nome_artista AS 'artista', COUNT(1) AS 'seguidores'
    FROM
        SpotifyClone.artistas AS a
            INNER JOIN
        SpotifyClone.seguidores AS s ON a.artista_id = s.artista_id
            INNER JOIN
        SpotifyClone.usuarios AS u ON u.usuario_id = s.usuario_id
    GROUP BY a.artista_id
    ORDER BY 'artista' DESC , 'seguidores' ASC
    LIMIT 3;