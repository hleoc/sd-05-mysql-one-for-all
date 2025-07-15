USE SpotifyClone;
DELIMITER $$

CREATE TABLE log_usuarios (
		log_id INT AUTO_INCREMENT PRIMARY KEY,
		acao VARCHAR(255) NOT NULL,
		data_acao DATETIME NOT NULL
);

CREATE TRIGGER trigger_usuario_delete
	AFTER DELETE ON usuarios
    FOR EACH ROW
BEGIN
	DELETE FROM historico_reproducao 
WHERE
    usuario_id = OLD.usuario_id;
	DELETE FROM seguidores 
WHERE
    usuario_id = OLD.usuario_id;
	INSERT INTO log_usuarios(acao, data_acao) 
    VALUES ('Exclusão', NOW());
END $$
DELIMITER ;