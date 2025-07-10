CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.nome_usuario AS 'usuario', c.titulo_cancao AS 'nome'
    FROM
        SpotifyClone.usuarios AS u
            INNER JOIN
        SpotifyClone.historico_reproducao AS hr ON u.usuario_id = hr.usuario_id
            INNER JOIN
        SpotifyClone.cancoes AS c ON hr.cancao_id = c.cancao_id
    ORDER BY u.nome_usuario ASC , c.titulo_cancao ASC;