USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nomeDoArtista VARCHAR(200))
BEGIN
	SELECT ar.nome_artista AS 'artista', al.titulo_album AS 'album'
    FROM SpotifyClone.artistas AS ar
    INNER JOIN SpotifyClone.albuns AS al
    ON ar.artista_id = al.artista_id
    WHERE ar.nome_artista = nomeDoArtista
    ORDER BY al.titulo_album ASC;
END $$

DELIMITER ;