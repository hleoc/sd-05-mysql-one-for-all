DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos (
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(50) NOT NULL UNIQUE,
    valor DECIMAL(5,2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE artistas (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(100) NOT NULL UNIQUE
) ENGINE = InnoDB;

CREATE TABLE albuns (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo_album VARCHAR(255) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) ENGINE = InnoDB;

CREATE TABLE cancoes (
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo_cancao VARCHAR(255) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) ENGINE = InnoDB;

CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(100) NOT NULL UNIQUE,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) ENGINE = InnoDB;

CREATE TABLE historico_reproducao (
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    PRIMARY KEY (usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
) ENGINE = InnoDB;

CREATE TABLE seguidores (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) ENGINE = InnoDB;

INSERT INTO planos (nome_plano, valor) VALUES
('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO artistas (nome_artista) VALUES
('Walter Phoenix'),
('Freddie Shannon'),
('Lance Day'),
('Peter Strong');

INSERT INTO albuns (titulo_album, artista_id) VALUES
('Envious', (SELECT artista_id FROM artistas WHERE nome_artista = 'Walter Phoenix')),
('Exuberant', (SELECT artista_id FROM artistas WHERE nome_artista = 'Walter Phoenix')),
('Hallowed Steam', (SELECT artista_id FROM artistas WHERE nome_artista = 'Peter Strong')),
('Incandescent', (SELECT artista_id FROM artistas WHERE nome_artista = 'Lance Day')),
('Temporary Culture', (SELECT artista_id FROM artistas WHERE nome_artista = 'Freddie Shannon'));

INSERT INTO cancoes (titulo_cancao, album_id) VALUES
('Soul For Us', (SELECT album_id FROM albuns WHERE titulo_album = 'Envious')),
('Reflections Of Magic', (SELECT album_id FROM albuns WHERE titulo_album = 'Envious')),
('Dance With Her Own', (SELECT album_id FROM albuns WHERE titulo_album = 'Envious')),
('Troubles Of My Inner Fire', (SELECT album_id FROM albuns WHERE titulo_album = 'Exuberant')),
('TimeFireworks', (SELECT album_id FROM albuns WHERE titulo_album = 'Exuberant')),
('Magic Circus', (SELECT album_id FROM albuns WHERE titulo_album = 'Hallowed Steam')),
('Honey, So Do I', (SELECT album_id FROM albuns WHERE titulo_album = 'Hallowed Steam')),
('Sweetie, Lets Go Wild', (SELECT album_id FROM albuns WHERE titulo_album = 'Hallowed Steam')),
('She Knows', (SELECT album_id FROM albuns WHERE titulo_album = 'Hallowed Steam')),
('Fantasy For Me', (SELECT album_id FROM albuns WHERE titulo_album = 'Incandescent')),
('Celebration Of More', (SELECT album_id FROM albuns WHERE titulo_album = 'Incandescent')),
('Rock His Everything', (SELECT album_id FROM albuns WHERE titulo_album = 'Incandescent')),
('Home Forever', (SELECT album_id FROM albuns WHERE titulo_album = 'Incandescent')),
('Diamond Power', (SELECT album_id FROM albuns WHERE titulo_album = 'Incandescent')),
('Honey, Lets Be Silly', (SELECT album_id FROM albuns WHERE titulo_album = 'Incandescent')),
('Thang Of Thunder', (SELECT album_id FROM albuns WHERE titulo_album = 'Temporary Culture')),
('Words Of Her Life', (SELECT album_id FROM albuns WHERE titulo_album = 'Temporary Culture')),
('Without My Streets', (SELECT album_id FROM albuns WHERE titulo_album = 'Temporary Culture'));

INSERT INTO usuarios (nome_usuario, idade, plano_id) VALUES
('Thati', 23, (SELECT plano_id FROM planos WHERE nome_plano = 'gratuito')),
('Cintia', 35, (SELECT plano_id FROM planos WHERE nome_plano = 'familiar')),
('Bill', 20, (SELECT plano_id FROM planos WHERE nome_plano = 'universitário')),
('Roger', 45, (SELECT plano_id FROM planos WHERE nome_plano = 'gratuito'));

INSERT INTO historico_reproducao (usuario_id, cancao_id) VALUES
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Thati'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Soul For Us')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Thati'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Magic Circus')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Thati'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Diamond Power')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Thati'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Thang Of Thunder')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Cintia'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Home Forever')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Cintia'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Words Of Her Life')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Cintia'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Reflections Of Magic')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Cintia'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Honey, Lets Be Silly')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Bill'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Troubles Of My Inner Fire')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Bill'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Thang Of Thunder')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Bill'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Magic Circus')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Roger'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Dance With Her Own')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Roger'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Without My Streets')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Roger'), (SELECT cancao_id FROM cancoes WHERE titulo_cancao = 'Celebration Of More'));

INSERT INTO seguidores (usuario_id, artista_id) VALUES
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Thati'), (SELECT artista_id FROM artistas WHERE nome_artista = 'Walter Phoenix')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Thati'), (SELECT artista_id FROM artistas WHERE nome_artista = 'Freddie Shannon')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Thati'), (SELECT artista_id FROM artistas WHERE nome_artista = 'Lance Day')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Cintia'), (SELECT artista_id FROM artistas WHERE nome_artista = 'Walter Phoenix')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Cintia'), (SELECT artista_id FROM artistas WHERE nome_artista = 'Lance Day')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Bill'), (SELECT artista_id FROM artistas WHERE nome_artista = 'Peter Strong')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Bill'), (SELECT artista_id FROM artistas WHERE nome_artista = 'Walter Phoenix')),
((SELECT usuario_id FROM usuarios WHERE nome_usuario = 'Roger'), (SELECT artista_id FROM artistas WHERE nome_artista = 'Freddie Shannon'));
