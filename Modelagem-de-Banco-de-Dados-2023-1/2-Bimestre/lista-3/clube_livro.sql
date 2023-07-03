DROP DATABASE IF EXISTS clube;
CREATE DATABASE clube;

\c clube;


CREATE TABLE aluno (
    matricula serial primary key,
    turma text,
    nome character varying(60) not null,
    telefone text,
    email text unique
);
INSERT INTO aluno (turma, nome, telefone, email) VALUES
('TURMA DA FAZENDINHA FELIZ', 'IGOR AVILA PEREIRA', '(53) 99999999', 'igor.pereira@riogrande.ifrs.edu.br'),
('TURMA DA FAZENDINHA FELIZ', 'MÁRCIO JOSUÉ RAMOS TORRES', '(53) 888888', 'marcio.torres@riogrande.ifrs.edu.br');

INSERT INTO aluno (turma, nome, telefone, email) VALUES
('TURMA DA FAZENDINHA FELIZ', 'ISIS VALVERDE', '(53) 7777777', 'isis.valverde@riogrande.ifrs.edu.br');

CREATE TABLE area (
    id serial primary key,
    nome text not null
);
INSERT INTO area (nome) VALUES 
('O QUE FUNDO FUNDO MAR É SÓ DIVERSÃO'),
('CRAZY FROG'),
('BABY SHARK');

CREATE TABLE livro (
    isbn serial primary key,
    ano integer,
    editora text,
    titulo text,
    area_id integer references area (id)
);
INSERT INTO livro (ano, editora, titulo, area_id) VALUES
(2020, 'BOM DIA LTDA', 'AS AVENTURAS DO BITA', 1),
(2023, 'COCORICO LTDA', 'GALINHA PINTADINHA', 3);

CREATE TABLE exemplar (
    id serial primary key,
    numero integer,
    livro_isbn integer references livro (isbn)
);
INSERT INTO exemplar (numero, livro_isbn) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2);

CREATE TABLE emprestimo (
    id serial primary key,
    data_retirada timestamp default current_timestamp,
    data_devolucao timestamp check (data_devolucao > data_retirada),
    aluno_matricula integer references aluno (matricula),
    exemplar_id integer references exemplar (id)
);
INSERT INTO emprestimo (data_retirada, data_devolucao, aluno_matricula, exemplar_id) VALUES
(CURRENT_TIMESTAMP - INTERVAL '1 DAYS', CURRENT_TIMESTAMP, 1, 1);

INSERT INTO emprestimo (data_retirada, aluno_matricula, exemplar_id) VALUES
(CURRENT_TIMESTAMP - INTERVAL '2 DAYS', 2, 4);

-- clube=# SELECT exemplar_id FROM emprestimo WHERE data_devolucao IS NULL;

-- clube=# SELECT * FROM emprestimo WHERE EXTRACT(MONTH FROM data_retirada) = EXTRACT(MONTH FROM CURRENT_TIMESTAMP);

--BONUS TRACK
-- clube=# SELECT aluno_matricula, count(*) FROM emprestimo GROUP BY aluno_matricula ORDER BY count(*) DESC, aluno_matricula ASC;


-- clube=# SELECT matricula FROM aluno
--EXCEPT
--SELECT aluno_matricula FROM emprestimo;
