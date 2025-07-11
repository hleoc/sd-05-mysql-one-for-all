CREATE VIEW perfil_artistas AS
    SELECT 
        ar.nome_artista AS 'artista',
        al.titulo_album AS 'album',
        COUNT(s.usuario_id) AS 'seguidores'
    FROM
        SpotifyClone.artistas AS ar
            INNER JOIN
        SpotifyClone.albuns AS al ON ar.artista_id = al.artista_id
            INNER JOIN
        SpotifyClone.seguidores AS s ON s.artista_id = ar.artista_id
    GROUP BY ar.nome_artista , al.titulo_album
    ORDER BY seguidores DESC , artista ASC , album ASC;