DROP DATABASE IF EXISTS portal;

CREATE DATABASE portal;

\c portal;

-- 1)

CREATE TABLE jornalista (
    id serial primary key,
    nome character varying(60) not null,
    senha text not null,
    email text not null,
    cpf character(11) unique,
    data_nascimento date
);

INSERT INTO jornalista (nome, senha, email, cpf, data_nascimento) VALUES
('Igor Pereira', '123', 'igor.pereira@riogrande.ifrs.edu.br', '11111111111', '1987-01-20'),
('Marcio Torres', '321', 'marcio.torres@riogrande.ifrs.edu.br', '22222222222', '1920-03-03');

CREATE TABLE categoria (
    id serial primary key,
    descricao text not null
    -- qtde_cliques integer default 0
);

INSERT INTO categoria (descricao) VALUES
('ESPORTE'),
('ECONOMIA'),
('POLITICA'),
('EDUCAÇÃO');

CREATE TABLE noticia (
    id serial primary key,
    titulo text,
    texto text,
    data_hora timestamp default CURRENT_TIMESTAMP,
    jornalista_id integer references jornalista (id),
    categoria_id integer references categoria (id)
);
INSERT INTO noticia (titulo, texto, jornalista_id, categoria_id) VALUES
('Lançamento do novo site do tads', 'Um incrível site com excelente experiência UX foi lançado para o curso', 1, 4),
('Grêmio já sabe o time que enfrentará na copa do brasil', 'Renato gaúcho faz mistério sobre a escalação do time contra o Cruzeiro', 2, 1);

CREATE TABLE foto (
    id serial primary key,
    nome text not null,
    legenda text,
    noticia_id integer references noticia (id)
);
INSERT INTO foto (nome, legenda, noticia_id) VALUES
('gremio.png', 'brasão do grêmio',2);


-- 2)
CREATE TABLE assinante (
    id serial primary key,
    nome character varying(60) not null,
    email text not null,
    cpf character(11) unique,
    data_nascimento date
);

CREATE TABLE tipo (
    id serial primary key,
    nome text not null,
    descricao text,
    valor money 
);


CREATE TABLE modalidade (
    id serial primary key,
    nome text not null
);

CREATE TABLE assinatura (
    id serial primary key,
    data_hora_inicio timestamp default current_timestamp,
    data_hora_fim timestamp,
    assinante_id integer references assinante (id),
    modalidade_id integer references modalidade (id),
    tipo_id integer references tipo (id)
);

CREATE TABLE pagamento (
    id serial primary key,
    data_hora timestamp default current_timestamp,
    valor money check(cast(valor as numeric(8,2)) >= 0),
    assinatura_id integer references assinatura (id)
);

-- portal=# SELECT * FROM jornalista;
-- portal=# SELECT nome FROM jornalista;
-- portal=# SELECT nome, data_nascimento FROM jornalista;
-- portal=# SELECT nome, age(data_nascimento) FROM jornalista;
-- portal=# SELECT nome, extract(year from age(data_nascimento)) FROM jornalista;
-- portal=# SELECT nome, extract(year from age(data_nascimento)) as idade FROM jornalista;
-- portal=# SELECT * FROM jornalista WHERE EXTRACT(YEAR FROM AGE(data_nascimento)) > 100;
-- portal=# UPDATE jornalista SET nome = 'Márcio Josué Ramos Torres' WHERE id = 2;
-- portal=# SELECT * FROM jornalista ORDER BY nome;
-- portal=# SELECT * FROM jornalista ORDER BY nome DESC;

-- portal=# ALTER TABLE categoria ADD COLUMN qtde_cliques integer default 0;






