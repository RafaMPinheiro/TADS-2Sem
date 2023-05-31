DROP DATABASE IF EXISTS administradora;

CREATE DATABASE administradora;

\c administradora;

CREATE TABLE administradora (
    id serial primary key,
    cnpj character(14) unique,
    razao_social character varying(100) not null,
    nome_fantasia character varying(100) not null
);
INSERT INTO administradora (cnpj, razao_social, nome_fantasia) VALUES
('11111111111111','Nicolle Admin. Corp. Ltda imoveis', 'nkay');

CREATE TABLE email (
    id serial primary key,
    email character varying(60) unique,
    administradora_id integer references administradora (id)
);
INSERT INTO email (email, administradora_id) VALUES
('nkay@nkay.com', 1);

CREATE TABLE condominio (
    id serial primary key,
    nome text not null,
    complemento text,
    cep character(8),
    bairro text,
    rua text,
    numero text,
    administradora_id integer references administradora (id)
);
INSERT INTO condominio (nome, complemento, cep, bairro, rua, numero, administradora_id) VALUES
('leão do parque hotel empreendimentos', 'perto do aldo dapuzzo', '96202100', 'parque', 'av. presidente vargas', 's/n', 1),
('jockey club', 'perto de onde eu não sei', '96202111', 'vila braz', 'pedro de sá freitas', 's/n', 1);


CREATE TABLE dono (
    id serial primary key,
    cpf character(11) unique,
    nome character varying(60) not null   
);
INSERT INTO dono (cpf, nome) VALUES
('11111111111', 'Diogo Huch'),
('22222222222', 'Nicole Bahls Huch'),
('44444444444', 'Joselino Dutra');

CREATE TABLE unidade (
    id serial primary key,
--    andar character(3),
    numero character(3),
    bloco character(2),
    condominio_id integer references condominio (id) 
);

INSERT INTO unidade (numero, bloco, condominio_id) VALUES
('101', 'A', 1),
('102', 'A', 1),
('101', 'A', 2);

CREATE TABLE dono_unidade (
    dono_id integer references dono (id),
    unidade_id integer references unidade (id),
    primary key (dono_id, unidade_id)
);

INSERT INTO dono_unidade (dono_id, unidade_id) VALUES
(1,1),
(2,1),
(2,2),
(3,3);
-- se eu quiser remover "donice" da nicole no apt que tem compartilhado com o "diogao"
--administradora=# delete from dono_unidade where dono_id = 2 and unidade_id = 1;


CREATE TABLE inquilino (
    id serial primary key,
    cpf character(11) unique,
    nome character varying(60) not null
    -- telefone
    -- administradora=# ALTER TABLE inquilino ADD COLUMN telefone text;
);

INSERT INTO inquilino (cpf, nome) VALUES
('33333333333', 'Teodoro Henrique');

CREATE TABLE unidade_inquilino (
    inquilino_id integer references inquilino (id),
    unidade_id integer references 
 unidade (id),
    data_inicio date default current_date,
    data_fim date not null,
--  valor aluguel
-- ALTER TABLE unidade_inquilino ADD COLUMN valor numeric(8,2) DEFAULT 500.00;
--  dia_vencimento integer default 10
--administradora=# ALTER TABLE unidade_inquilino ADD COLUMN dia_vencimento integer default 10;
    primary key (inquilino_id, unidade_id, data_inicio)
);
INSERT INTO unidade_inquilino (inquilino_id, unidade_id, data_inicio, data_fim) VALUES
(1, 1, CURRENT_DATE, CURRENT_DATE + INTERVAL '1 year');

-- administradora=# select * from condominio where bairro != 'centro';

-- administradora=# select condominio.nome, count(*) from condominio inner join unidade on (condominio.id = unidade.condominio_id) group by condominio.nome having count(*) = (select count(*) from condominio inner join unidade on (condominio.id = unidade.condominio_id) group by condominio.nome order by count(*) desc limit 1);





