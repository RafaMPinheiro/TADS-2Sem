DROP DATABASE IF EXISTS cinema;

CREATE DATABASE cinema;

\c cinema;

CREATE TABLE salas (
    numero integer primary key,
    descricao text NOT NULL,
    capacidade integer NOT NULL
);

INSERT INTO salas (numero, descricao, capacidade) VALUES 
(101, 'Sala 3D 1', 100),
(102, 'Sala 3D 2', 100),
(103, 'Sala Convencional 1', 150), 
(201, 'Sala Convencional 2', 100),
(202, 'Sala 3D 3', 80 );

CREATE TABLE diretores (
    id serial primary key,
    nome character varying(100) NOT NULL
);

INSERT INTO diretores (nome) VALUES
('Fulano de Tal da Silva'),
('Ciclana das Neves'),
('Josicreidson Seilayevsk');

CREATE TABLE filmes (
    id serial primary key,
    nome character varying(100) NOT NULL,
    ano_lancamento character(4) NOT NULL,
    categoria character varying(40) NOT NULL,
    cod_diretor integer references diretores (id)
);

INSERT INTO filmes (nome, ano_lancamento, categoria, cod_diretor) VALUES
('Titanic', '1997', 'Drama', 1),
('Matrix', '2001', 'Ficção', 1),
('À Prova de Fogo', '2009', 'Romance', 2 ),
('Toy Story', '1998', 'Animação', 3),
('Shrek', '2000', 'Animação', 2);

CREATE TABLE salas_filmes (
    numero_sala integer references salas (numero),
    cod_filme integer references filmes (id),
    data_filme date NOT NULL,
    horario time NOT NULL,
    primary key (numero_sala, cod_filme, data_filme)
);

INSERT INTO salas_filmes (numero_sala, cod_filme, data_filme, horario) VALUES
(101, 1, '14-04-2014', '20:00'),
(101, 2, '15-04-2014', '22:00'),
(102, 1, '10-04-2014', '19:00'),
(103, 3, '22-04-2014', '16:00'),
(201, 4, '14-04-2014', '22:00'),
(201, 5, '15-04-2014', '20:00'),
(202, 3, '21-04-2014', '20:00');

CREATE TABLE premios (
    id serial primary key,
    nome character varying(100) NOT NULL,
    ano_premiacao character(4) NOT NULL,
    cod_filme integer references filmes (id)
);

INSERT INTO premios (nome, ano_premiacao, cod_filme) VALUES
('Oscar – Melhor Filme', '1997', 1),
('Oscar – Melhor Diretor', '1997', 1),
('Globo de Ouro – Melhor Filme', '1997', 1),
('Oscar – Efeitos Especiais', '2002', 2),
('Globo de Ouro – Melhor Animação', '1999', 4),
('Globo de Ouro – Melhor Animação', '2001', 5),
('Oscar – Melhor Atriz Coadjuvante', '1997', 1);

--2)
SELECT * FROM diretores;

--3)
SELECT nome FROM filmes WHERE categoria = 'Animação'; --Anima├º├úo

--4)
UPDATE salas SET capacidade = 200 WHERE numero = 202;

--5)
UPDATE salas_filmes SET numero_sala = 202 WHERE data_filme = '14-04-2014';

--6)
SELECT id FROM diretores WHERE nome = 'Fulano de Tal da Silva'; -- 1
SELECT id FROM filmes WHERE cod_diretor = 1; -- Fez o filme 1 e o 2
DELETE FROM salas_filmes WHERE cod_filme = 1;-- Deletar as salas q iam ter os filmes
DELETE FROM salas_filmes WHERE cod_filme = 2;
DELETE FROM premios WHERE cod_filme = 1;-- Deletar os premios dos filmes
DELETE FROM premios WHERE cod_filme = 2;
DELETE FROM filmes WHERE cod_diretor = 1;-- Deletar os filmes
DELETE FROM diretores WHERE nome = 'Fulano de Tal da Silva';

--7)
--SELECT id FROM diretores WHERE nome = 'Ciclana das Neves'; -- 2
--SELECT nome, categoria FROM filmes WHERE cod_diretor = 2;

SELECT filmes.nome, filmes.categoria FROM filmes INNER JOIN diretores on filmes.cod_diretor = diretores.id WHERE diretores.nome = 'Ciclana das Neves';-- Junta as tabelas e filtar pela coluna nome da segunda tabela

--8)
-- SELECT * FROM salas_filmes WHERE data_filme = '15/04/2014';
SELECT horario FROM salas_filmes WHERE data_filme = '15/04/2014';

--9)
SELECT premios.nome, premios.ano_premiacao FROM premios INNER JOIN filmes on premios.cod_filme = filmes.id WHERE filmes.nome = 'Shrek';

--10)
SELECT id, nome, categoria FROM filmes WHERE ano_lancamento > '2000'; -- Matrix saiu pra deletar o diretor com id=1