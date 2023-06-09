DROP DATABASE IF EXISTS noveleiros;

CREATE DATABASE noveleiros;

\c noveleiros;

CREATE TABLE novelas (
    cod serial primary key,
    nome character varying(60) NOT NULL,
    data_primeiro_capitulo date,
    data_ultimo_capitulo date,
    horario_exibicao time
);

INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES 
('A Força do Querer', '2017-04-03', '2017-10-20', '21:00:00'),
('Avenida Brasil', '2012-03-26', '2012-10-19', '21:30:00'),
('Mistérios de uma Vida', '2014-07-21', '2015-03-13', '21:00:00');

CREATE TABLE atores (
    cod serial primary key,
    nome character varying(60) NOT NULL,
    data_nascimento date,
    cidade character varying(60),
    salario money,
    sexo character(1)
);

INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES 
('John Doe', '1980-05-15', 'Los Angeles', 100000.00, 'M'),
('Jane Doe', '1990-08-20', 'Nova York', 75000.00, 'F'),
('Jack Smith', '1985-02-10', 'Chicago', 90000.00, 'M');

CREATE TABLE personagens (
    cod serial primary key,
    nome character varying(60),
    data_nascimento date,
    situação_financeira character(1) CHECK (situação_financeira = 'A' or situação_financeira = 'B' or situação_financeira = 'C'),
    cod_ator integer references atores (cod) ON DELETE CASCADE
);

INSERT INTO personagens (nome, data_nascimento, situação_financeira, cod_ator)
VALUES 
('Pedro Alves', '1995-07-15', 'C', 3),
('João Silva', '1990-04-25', 'A', 1),
('Maria Santos', '1985-10-10', 'B', 2);

CREATE TABLE novelas_personagens (
    cod_novela integer references novelas (cod) ON DELETE CASCADE,
    cod_personagem integer references personagens (cod) ON DELETE CASCADE,
    primary key (cod_novela, cod_personagem)
);
INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(1, 3);

CREATE TABLE capitulos (
    cod serial primary key,
    nome character varying(60),
    data_exibicao date,
    cod_novela integer references novelas (cod) ON DELETE CASCADE
);

INSERT INTO capitulos (nome, data_exibicao, cod_novela)
VALUES 
('Capítulo 1', '2022-01-10', 1),
('Capítulo 15', '2022-01-11', 3),
('Capítulo 44', '2022-01-11', 2);

-- 2) select data_ultimo_capitulo from novelas where upper(nome) = upper('mistério de uma vida');
-- 3) noveleiros=# select * from novelas where horario_exibicao IS NULL;
-- 4) noveleiros=# SELECT * FROM atores WHERE UPPER(cidade) LIKE 'M%';
-- 4) noveleiros=# SELECT * FROM atores WHERE cidade ILIKE 'M%';
-- 5) noveleiros=# SELECT COUNT(*) as qtde FROM novelas where nome ILIKE 'VIDA%' OR nome ILIKE '%VIDA%' OR nome ILIKE '%VIDA' OR nome ILIKE 'VIDA';
-- 6) noveleiros=# SELECT * FROM personagens ORDER BY nome ASC;
-- 7) noveleiros=# SELECT * FROM personagens order by age(data_nascimento) desc;
-- 8) noveleiros=# select count(*) as qtde_atores from atores;
-- 9) noveleiros=# select count(*) from novelas;
-- 10) noveleiros=# select count(*) from atores where sexo = 'F';
-- 11) noveleiros=# select cast(avg(extract(year from age(data_nascimento))) as numeric(8,2)) as media_idade_personagens from personagens;
-- 12) noveleiros=# SELECT * FROM personagens WHERE extract(year from age(data_nascimento)) < 15;
-- 13) noveleiros=# select max(salario) as maior_salario from atores;
-- 13) com subselect noveleiros=# SELECT nome, salario FROM atores where salario = (select max(salario) as maior_salario from atores);
-- 14) noveleiros=# select min(salario) as menor_salario from atores;
-- 15) noveleiros=# select sum(salario) as soma_salario from atores;