DROP DATABASE IF EXISTS noveleiros;
CREATE DATABASE noveleiros;

\c noveleiros;

CREATE TABLE novelas (
    codigo serial primary key,
    nome character varying(100) not null,
    data_primeiro_capitulo date,
    data_ultimo_capitulo date,
    horario_exibicao time
);
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao) VALUES
('REI DO GADO', '1996-06-17', '1997-02-14', '21:00'),
('O CLONE', '2001-10-01', '2002-06-14', '21:00'),
('MISTÉRIO DE UMA VIDA', '2023-01-01', '2023-04-01', '18:00'),
('VIDA DA GENTE', '2021-02-02', '2021-10-21', NULL);

--atores (codigo, nome, data_nascimento, cidade, salario, sexo) 
CREATE TABLE atores (
  codigo serial primary key,
  nome character varying(100),
  data_nascimento date,
  cidade text,
  salario money check(cast(salario as numeric(20,2)) > 0),
  sexo character(1)  
);
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo) VALUES
('ANTÔNIO FAGUNDES', '1949-04-18', 'RIO DE JANEIRO', 10000.00, 'M'),
('MURILO BENÍCIO', '1971-07-13', 'NITERÓI', 20000, 'M'),
('GIOVANNA ANTONELLI', '1976-03-18', 'RIO DE JANEIRO', 500000.00, 'F'),
('IGOR PEREIRA', '1987-01-20', 'MARAU', 20000.00, 'M');

CREATE TABLE personagens (
    codigo serial primary key,
    nome character varying(100) not null,
    data_nascimento date,
    situacao_financeira character(1) check (situacao_financeira = 'A' or situacao_financeira = 'B' or situacao_financeira = 'C'),
    cod_ator integer references atores (codigo)
);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator) VALUES
('BRUNO MENZENGA', '1948-03-04', 'A', 1), 
('LUCAS', '1971-07-13', 'A', 2),
('LÉO', '1991-07-13', 'C', 2),
('JADE', '1980-07-13', 'B', 3);

CREATE TABLE novelas_personagens (
    cod_novela integer references novelas (codigo),
    cod_personagem integer references personagens (codigo),
    primary key (cod_novela, cod_personagem)   
);
INSERT INTO novelas_personagens (cod_novela, cod_personagem) VALUES
(1, 1),
(2, 2),
(2, 3),
(2, 4);

--capítulos (codigo, nome, data_exibicao, cod_novela)
--cod_novela referencia novelas 

CREATE TABLE capitulos (
    codigo serial primary key,
    nome text not null,
    data_exibicao date default current_date,
    cod_novela integer references novelas (codigo)
);
INSERT INTO capitulos (nome, data_exibicao, cod_novela) VALUES
('O AVIÃO DO BRUNO BERDINAZI CAIU', '1996-10-17',  1),
('A JADE DANÇANDO', '2001-11-17',  2);

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







