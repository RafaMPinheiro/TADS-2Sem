DROP DATABASE IF EXISTS cinema;

CREATE DATABASE cinema;

\c cinema;

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
    nome text NOT NULL,
    ano_lancamento integer NOT NULL,
    categoria text NOT NULL,
    cod_diretor integer references diretores (id) ON DELETE CASCADE
);

INSERT INTO filmes (nome, ano_lancamento, categoria, cod_diretor) VALUES
('Titanic', 1997, 'Drama', 1),
('Matrix', 2001, 'Ficção', 1),
('À Prova de Fogo', 2009, 'Romance', 2 ),
('Toy Story', 1998, 'Animação', 3),
('Shrek', 2000, 'Animação', 2);

CREATE TABLE salas_filmes (
    numero_sala integer references salas (numero),
    cod_filme integer references filmes (id) ON DELETE CASCADE,
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
    cod_filme integer references filmes (id) ON DELETE CASCADE
);

INSERT INTO premios (nome, ano_premiacao, cod_filme) VALUES
('Oscar – Melhor Filme', '1997', 1),
('Oscar – Melhor Diretor', '1997', 1),
('Globo de Ouro – Melhor Filme', '1997', 1),
('Oscar – Efeitos Especiais', '2002', 2),
('Globo de Ouro – Melhor Animação', '1999', 4),
('Globo de Ouro – Melhor Animação', '2001', 5),
('Oscar – Melhor Atriz Coadjuvante', '1997', 1);