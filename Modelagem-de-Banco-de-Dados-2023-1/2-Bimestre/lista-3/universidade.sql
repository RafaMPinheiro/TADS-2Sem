DROP DATABASE IF EXISTS universidade;

CREATE DATABASE universidade;

\c universidade;

CREATE TABLE departamento (
    id serial primary key,
    nome character varying(100) not null
);
INSERT INTO departamento (nome) VALUES ('INFORMÁTICA');

CREATE TABLE nivel (
    id serial primary key,
    descricao text not null
);
INSERT INTO nivel (descricao) VALUES
('BACHARELADO'), ('TECNOLÓGICO'), ('LICENCIATURA');

CREATE TABLE turno (
    id serial primary key,
    descricao text not null
);
INSERT INTO turno (descricao) VALUES
('MANHÃ'), ('TARDE'), ('NOITE');

CREATE TABLE curso (
    id serial primary key,
    nivel_id integer references nivel (id),
    turno_id integer references turno (id),
    departamento_id integer references departamento (id),
    nome character varying (100) not null
);
INSERT INTO curso (departamento_id, nome) VALUES
(1, 'TECNOLOGIA EM ANÁLISE E DESENVOLVIMENTO DE SISTEMAS'),
(1, 'TÉCNICO EM INFORMÁTICA PARA INTERNET');

CREATE TABLE disciplina (
    id serial primary key,
    curso_id integer references curso (id),
    nome text not null,
    ementa text,
    creditos integer DEFAULT 2,
    carga_horaria real,
    semestre integer DEFAULT 1
);
INSERT INTO disciplina (curso_id, nome) VALUES
(1, 'LÓGICA DE PROGRAMAÇÃO'),
(1, 'TECNOLOGIA E SOCIEDADE');

INSERT INTO disciplina (curso_id, nome, semestre) VALUES
(1, 'PROJETO E MODELAGEM EM BANCO DE DADOS', 2);

CREATE TABLE pre_requisito (
    disciplina_id integer references disciplina (id),
    prerequisito_id integer references disciplina (id),
    primary key (disciplina_id, prerequisito_id)
);
INSERT INTO pre_requisito (disciplina_id, prerequisito_id) VALUES (3, 1);


-- universidade=# select id, substring(nome from 1 for 10) || '...' as nome, nivel_id, turno_id from curso;
-- universidade=# UPDATE curso SET turno_id = 3, nivel_id = 2 WHERE id = 1;

BEGIN;
INSERT INTO nivel (descricao) VALUES ('TÉCNICO');
UPDATE curso SET turno_id = 1, nivel_id = 4 WHERE id = 2;
COMMIT;



