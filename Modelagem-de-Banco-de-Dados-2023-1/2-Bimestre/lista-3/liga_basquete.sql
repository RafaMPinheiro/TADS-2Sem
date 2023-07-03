DROP DATABASE IF EXISTS liga_basquete;

CREATE DATABASE liga_basquete;


\c liga_basquete;

CREATE TABLE estado (
    sigla character(2) primary key,
    nome text not null
);

INSERT INTO estado (sigla, nome) VALUES ('RS', 'RIO GRANDE DO SUL');

-- cuidado: pode cair!!
CREATE TABLE cidade (
    id serial primary key,
    nome text not null,
    estado_sigla character(2) references estado (sigla)
);
INSERT INTO cidade (nome, estado_sigla) VALUES 
('PORTO ALEGRE', 'RS'), ('RIO GRANDE', 'RS');

-- vai cair muito!!! n pode esquecer...
CREATE TABLE equipe (
    id serial primary key,
    nome character varying(100) not null,
    cidade_id integer references cidade (id)
);
INSERT INTO equipe (nome, cidade_id) VALUES
('GRÊMIO', 1), ('INTERNACIONAL', 1), ('SÃO PAULO', 2);

CREATE TABLE posicao (
    id serial primary key,
    descricao text not null
);
INSERT INTO posicao (descricao) VALUES ('DEFENSOR'), ('ATACANTE');

CREATE TABLE jogador (
    id serial primary key,
    nome text not null,
    posicao_id integer references posicao (id),
    equipe_id integer references equipe (id),
    camisa integer DEFAULT 1 CHECK(camisa > 0),
    unique(equipe_id, camisa)
    
);
INSERT INTO jogador (nome, posicao_id, equipe_id, camisa) VALUES
('LUISITO SOARES', 2, 1, 9),
('KANEMAN', 1, 1, 5),
('MILHÃO', 2, 3, 9);


-- atencao!!
CREATE TABLE tecnico (
    id serial primary key,
    nome character varying(60) not null,
    funcao text,
    equipe_id integer references equipe (id)    
);
INSERT INTO tecnico (nome, equipe_id) VALUES
('RENATO GAÚCHO', 1),
('MANO MENEZES', 2),
('LEONETE', 3);


CREATE TABLE campeonato (
    id serial primary key,
    nome text not null,
    ano integer default extract(year from current_date)
);
INSERT INTO campeonato (nome) VALUES ('CAMPEONATO GAÚCHO');

CREATE TABLE jogo (
    equipe_casa_id integer references equipe (id),
    equipe_visitante_id integer references equipe (id),
    pontos_equipe_casa integer DEFAULT 0,
    pontos_equipe_visitante integer DEFAULT 0,
    data_hora timestamp default current_timestamp,
    campeonato_id integer references campeonato (id),
    primary key (equipe_casa_id, equipe_visitante_id, data_hora)
);
INSERT INTO jogo (equipe_casa_id, equipe_visitante_id, pontos_equipe_casa, pontos_equipe_visitante, campeonato_id) VALUES
(1,2, 5, 0, 1);





