DROP DATABASE IF EXISTS liga_basquete;

CREATE DATABASE liga_basquete;

\c liga_basquete;

CREATE TABLE equipe (
    id serial primary key,
    nome character varying(100) NOT NULL,
    cidade text NOT NULL
);

INSERT INTO equipe (nome, cidade) VALUES
('NORTENSE BASQUETE CLUBE', 'SÃO JOSÉ DO NORTE - RS'),
('PAPAREIA BASQUETE CLUBE', 'RIO GRANDE - RS');


CREATE TABLE tecnico (
    id serial primary key,
    nome character varying(60) not null,
    funcao text not null,
    equipe_id integer references equipe (id)
);

INSERT INTO tecnico (nome, funcao, equipe_id) VALUES
('SEU MADRUGA', 'DEFESA', 1),
('KIKO', 'ATAQUE', 2);

CREATE TABLE jogador (
    id serial primary key,
    nome text not null,
    posicao text not null,
    equipe_id integer references equipe (id)
);


CREATE TABLE jogo (
    equipe_casa_id integer references equipe (id),
    equipe_visitante_id integer references equipe (id),
    pontos_casa integer DEFAULT 0,
    pontos_visitante integer DEFAULT 0,
    data_hora timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (equipe_casa_id, equipe_visitante_id, data_hora)
);
INSERT INTO jogo (equipe_casa_id, equipe_visitante_id) VALUES 
(1, 2),
(2, 1);
