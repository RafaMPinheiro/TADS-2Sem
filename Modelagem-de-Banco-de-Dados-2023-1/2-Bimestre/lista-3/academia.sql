DROP DATABASE IF EXISTS academia;

CREATE DATABASE academia;

\c academia;

CREATE TABLE cliente (
    id serial primary key,
    telefone character varying(50),
    cpf character(11) unique,
    data_nascimento date,
    nome character varying(60) not null,
    email text
);

INSERT INTO cliente (cpf, nome, data_nascimento, telefone, email) VALUES
('11111111111', 'IGOR PEREIRA', '1987-01-20', '355535', 'igor.pereira@riogrande.ifrs.edu.br'),
('22222222222', 'MÁRCIO TORRES', '1900-01-01', '(53)4555545','marcio.torres@riogrande.ifrs.edu.br'),
('33333333333', 'digigibooo', '1900-01-01', '355535', 'igor.pereira@sdfsdfsd');


CREATE TABLE plano (
    id serial primary key,
    valor money,
    duracao integer,
    nome text
); 
INSERT INTO plano (nome, duracao, valor) VALUES
('LUXO', 120, 1000.0),
('POBRE', 1, 1.99);

CREATE TABLE assinatura (
    plano_id integer references plano (id),
    cliente_id integer references cliente (id),
    primary key (plano_id, cliente_id)
);

INSERT INTO assinatura (plano_id, cliente_id) VALUES
(1, 1),
(2, 2);

CREATE TABLE atividade (
    id serial primary key,
    descricao text not null
);

INSERT INTO atividade (descricao) VALUES
('Judô para idosos'),
('hidro para idosos muito idosos');

CREATE TABLE plano_atividade (
    plano_id integer references plano (id),
    atividade_id integer references atividade (id),
    primary key (plano_id, atividade_id)
);
INSERT INTO plano_atividade (plano_id, atividade_id) VALUES
(1, 1),
(1, 2),
(2, 1);

CREATE TABLE professor (
    id serial primary key,
    nome character varying(60) not null
);
INSERT INTO professor (nome) VALUES
('CIBELE'),
('TELECKEN'),
('BETITO');

CREATE TABLE horario (
    id serial primary key,
    hora_inicio time,
    dia_semana character varying (10) check (dia_semana = 'domingo' or dia_semana = 'segunda' or dia_semana = 'terça' or dia_semana = 'quarta' or dia_semana = 'quinta' or dia_semana = 'sexta' or dia_semana = 'sábado')
);
INSERT INTO horario (hora_inicio, dia_semana) VALUES
('08:00', 'segunda'),
('08:00', 'terça'),
('08:00', 'quarta'),
('08:00', 'quinta'),
('08:00', 'sexta'),
('08:00', 'sábado'),
('08:00', 'domingo'),
('08:45', 'segunda'),
('08:45', 'terça');

CREATE TABLE turma (
    id serial primary key,
    professor_id integer references professor (id),
    atividade_id integer references atividade (id),
    horario_id integer references horario (id),
    unique(professor_id, atividade_id, horario_id)
);
INSERT INTO turma (professor_id, atividade_id, horario_id) VALUES
(1,1,1),
(2,1,2),
(2,2,3);

-- 1)
-- sem subselect
-- academia=# SELECT nome,extract(year from age(data_nascimento)) as idade FROM cliente ORDER BY data_nascimento asc limit 1;
-- com subselect
-- academia=# SELECT * FROM cliente where extract(year from age(data_nascimento)) = (select extract(year from age(data_nascimento)) from cliente order by data_nascimento asc limit 1);

-- 2)
-- academia=# select * from plano order by valor asc limit 1;

-- 3)
-- academia=# select professor_id, count(*) from turma group by professor_id order by count(*) desc limit 1;


-- 4) academia=# SELECT id FROM professor EXCEPT SELECT professor_id FROM turma;


-- 5) academia=# SELECT * from horario;

-- academia=# SELECT hora_inicio, hora_inicio + INTERVAL '45 minutes' as hora_fim from horario;








