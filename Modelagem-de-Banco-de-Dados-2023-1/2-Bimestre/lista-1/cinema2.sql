DROP DATABASE IF EXISTS cinema2;

CREATE DATABASE cinema2;

\c cinema2;


CREATE TABLE salas (
    numero integer primary key,
    descricao character varying(100) NOT NULL,
    capacidade integer CHECK (capacidade > 0)
);
INSERT INTO salas (numero, descricao, capacidade) VALUES
(101, 'Sala 3D 1', 100),
(102, 'Sala 3D 2', 100),
(103, 'Sala Convencional 1', 150),
(201, 'Sala Convencional 2', 100),
(202, 'Sala 3D 3', 80); 

CREATE TABLE diretores (
    codigo serial primary key,
    nome text not null
);
INSERT INTO diretores (codigo, nome) VALUES 
(1, 'Fulano de Tal da Silva'),
(2, 'Ciclana das Neves'),
(3, 'Josicreidson Seilayevski'); 

CREATE TABLE filmes (
    codigo serial primary key,
    nome text not null,
    ano_lancamento integer,
    categoria text,
    cod_diretor integer references diretores (codigo) ON DELETE CASCADE
);
INSERT INTO filmes (nome, ano_lancamento, categoria, cod_diretor) VALUES
('Titanic', 1997, 'Drama', 1),
('Matrix', 2001 ,'Ficção', 1),
('À Prova de Fogo', 2009, 'Romance', 2 ),
('Toy Story',1998 ,'Animação', 3),
('Shrek', 2000, 'Animação', 2);

CREATE TABLE salas_filmes (
    numero_sala integer references salas (numero),
    cod_filme integer references filmes (codigo) ON DELETE CASCADE,
    data date,
    horario time,
    primary key (numero_sala, cod_filme, data)
);
INSERT INTO salas_filmes(numero_sala, cod_filme, data, horario) VALUES
(101, 1, '2014-04-14', '20:00'),
(101, 2, '2014-04-15', '22:00'),
(102, 1, '2014-04-10', '19:00'),
(103, 3, '2014-04-22', '16:00'),
(201, 4, '2014-04-14', '22:00'),
(201, 5, '2014-04-15', '20:00'),
(202, 3, '2014-04-21', '20:00');

CREATE TABLE premios (
    codigo serial primary key,
    nome text not null,
    ano_premiacao integer check (ano_premiacao > 1900),
    cod_filme integer references filmes (codigo) ON DELETE CASCADE
);
INSERT INTO premios (codigo, nome, ano_premiacao, cod_filme) VALUES
(1, 'Oscar – Melhor Filme' ,1997, 1),
(2, 'Oscar – Melhor Diretor', 1997, 1),
(3, 'Globo de Ouro – Melhor Filme', 1997, 1),
(4, 'Oscar – Efeitos Especiais', 2002 ,2),
(5, 'Globo de Ouro – Melhor Animação', 1999, 4),
(6, 'Globo de Ouro – Melhor Animação', 2001 ,5),
(7, 'Oscar – Melhor Atriz Coadjuvante', 1997, 1 );

-- 2) cinema2=# select nome from diretores;
-- 3) cinema2=# select nome from filmes where UPPER(categoria) = 'ANIMAÇÃO';
-- 4) cinema2=# UPDATE salas SET capacidade = 200 WHERE numero = 202;
-- 5) cinema2=# UPDATE salas_filmes SET numero_sala = 202 WHERE data = '2014-04-14';
-- 6) cinema2=# DELETE FROM diretores where UPPER(nome) = UPPER('Fulano de Tal da Silva');
-- 7) cinema2=# SELECT nome, categoria from filmes where cod_diretor = 2;
-- 8) cinema2=# select horario from salas_filmes where data = '2014-04-15';
-- 9) cinema2=# select nome, ano_premiacao from premios where cod_filme  = 5;
-- 10) cinema2=# select codigo, nome, categoria from filmes where ano_lancamento > 2000;





