USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user_id INT)
RETURNS INT READS SQL DATA
BEGIN
	DECLARE music_total INT;
	SELECT COUNT(*)
	FROM SpotifyClone.historico_reproducao
	WHERE SpotifyClone.historico_reproducao.usuario_id = user_id INTO music_total;
    RETURN music_total;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(3);