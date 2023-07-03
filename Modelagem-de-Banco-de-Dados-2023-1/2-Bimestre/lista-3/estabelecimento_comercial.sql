DROP DATABASE IF EXISTS estabelecimento_comercial;

CREATE DATABASE estabelecimento_comercial;

\c estabelecimento_comercial;

CREATE TABLE cliente (
    id serial primary key,
    cpf character(11) unique,
    nome character varying(100) not null,
    telefone text
);
INSERT INTO cliente (cpf, nome, telefone) VALUES 
('11111111111', 'AMIGO DO GABRYEL COM Y', '(55) 5535353');

CREATE TABLE pedido (
    id serial primary key,
    data_hora timestamp default current_timestamp,
    cliente_id integer references cliente (id)
);
INSERT INTO pedido (cliente_id) VALUES (1);

CREATE TABLE fornecedor (
    id serial primary key,
    cnpj character(14),
    nome character varying(100) not null,
    telefone text not null
);
INSERT INTO fornecedor (cnpj, nome, telefone) VALUES
('11111111111111', 'FUN KITCHEN COMPANY LTDA', '(35) 3535353535555');

CREATE TABLE produto (
    id serial primary key,
    nome text not null,
    preco money,
    qtde integer,
    fornecedor_id integer references fornecedor (id)
);
INSERT INTO produto (nome, preco, qtde, fornecedor_id) VALUES
('MÁQUINA DE WAFFLE FUN KITCHEN', 100.0, 1000, 1),
('MÁQUINA DE CREPES', 150.0, 2000, 1);


CREATE TABLE item (
    ordem integer,
    produto_id integer references produto (id),
    pedido_id integer references pedido (id),
    qtde integer,
    preco_unitario money,
    primary key (ordem, produto_id, pedido_id)
);

INSERT INTO item (ordem, produto_id, pedido_id, qtde, preco_unitario) VALUES
(1, 1, 1, 10, 100.0),
(2, 2, 1, 20, 150.0);

--estabelecimento_comercial=# SELECT count(*) from item where pedido_id = 1;
-- count 
---
--     2
--(1 row)
--
--estabelecimento_comercial=# SELECT sum(qtde) from item where pedido_id = 1;
-- sum 
---
--  30
--(1 row)

--estabelecimento_comercial=# select sum(qtde*preco_unitario) from item where pedido_id = 1;
--
-- estabelecimento_comercial=# UPDATE item SET qtde = 100 where ordem = 1 and pedido_id = 1;



