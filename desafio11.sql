CREATE VIEW cancoes_premium AS
    SELECT 
        c.titulo_cancao AS 'nome',
        COUNT(hr.usuario_id) 'reproducoes'
    FROM
        SpotifyClone.cancoes AS c
            INNER JOIN
        SpotifyClone.historico_reproducao AS hr ON c.cancao_id = hr.cancao_id
            INNER JOIN
        SpotifyClone.usuarios AS u ON u.usuario_id = hr.usuario_id
            INNER JOIN
        SpotifyClone.planos AS p ON p.plano_id = u.plano_id
    WHERE
        p.nome_plano = 'familiar'
            OR p.nome_plano = 'universitário'
    GROUP BY c.titulo_cancao
    ORDER BY nome ASC;