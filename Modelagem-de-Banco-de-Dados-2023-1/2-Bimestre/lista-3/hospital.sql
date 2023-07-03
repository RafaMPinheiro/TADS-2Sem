DROP DATABASE IF EXISTS hospital;

CREATE DATABASE hospital;

\c hospital;

CREATE TABLE paciente (
    id serial primary key,
    cpf character(11) unique,
    rg character(10),
    nome character varying(60) not null,
    rua text,
    bairro text,
    numero text,
    complemento text
);
INSERT INTO paciente (cpf, nome) VALUES
('11111111111', 'SEU JORGE');

CREATE TABLE telefone (
    id serial primary key,
    numero character(11),
    paciente_id integer references paciente (id)
);
INSERT INTO telefone (numero, paciente_id) VALUES
('53999999999', 1);

CREATE TABLE medico (
    id serial primary key,
    crm character(13) unique,
    nome character varying(60) not null
);
INSERT INTO medico (crm, nome) VALUES
('1111111111111', 'GOOD DOCTOR');

CREATE TABLE consulta (
    id serial primary key,
    paciente_id integer references paciente (id),
    medico_id integer references medico (id),
    data date default current_date,
    hora time default current_time,
--  extra
    valor money default 0
);
INSERT INTO consulta (paciente_id, medico_id) VALUES
(1,1);

-- EXTRA
CREATE TABLE exame (
    id serial primary key,
    descricao text not null
);
INSERT INTO exame (descricao) VALUES
('FEZES'),
('URINA'),
('TURBECULOSE'),
('RESSONÂNCIA MAGNÉTICA');

CREATE TABLE exame_consulta (
    id serial primary key,
    data_hora_realizacao timestamp default current_timestamp,
    valor money default 0,
    exame_id integer references exame (id),
    consulta_id integer references consulta (id)
);
INSERT INTO exame_consulta (consulta_id, exame_id, valor) VALUES
(1, 1, 100.0);

CREATE TABLE especialidade (
    id serial primary key,
    nome text not null
);

INSERT INTO especialidade (nome) VALUES
('CARDIOLOGISTA'), ('DERMATOLOGISTA'), ('PROCTOLOGISTA');

CREATE TABLE medico_especialidade (
    medico_id integer references medico (id),
    especialidade_id integer references especialidade (id),
    primary key (medico_id, especialidade_id)
);

INSERT INTO medico_especialidade (medico_id, especialidade_id) VALUES
(1, 1),
(1, 3);

-- hospital=# Alter TABLE consulta ADD COLUMN observacao TEXT;

