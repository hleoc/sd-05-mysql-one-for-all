CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        c.titulo_cancao AS 'cancao', COUNT(1) AS 'reproducoes'
    FROM
        SpotifyClone.cancoes AS c
            INNER JOIN
        SpotifyClone.historico_reproducao AS hr ON c.cancao_id = hr.cancao_id
            INNER JOIN
        SpotifyClone.usuarios AS u ON u.usuario_id = hr.usuario_id
    GROUP BY c.cancao_id
    ORDER BY reproducoes DESC , cancao ASC
    LIMIT 2;