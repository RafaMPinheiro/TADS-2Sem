DROP DATABASE IF EXISTS garagem_coletiva;

CREATE DATABASE garagem_coletiva;

\c garagem_coletiva;

CREATE TABLE cliente (
    id serial primary key,
    cpf character(11) UNIQUE NOT NULL,
    nome character varying(100) NOT NULL,
    data_nascimento date NOT NULL,
    rua character varying(100) NOT NULL,
    bairro character varying(50) NOT NULL,
    complemento character varying(30) NOT NULL,
    numero_casa character varying(8) NOT NULL
);

INSERT INTO cliente (cpf, nome, data_nascimento, rua, bairro, complemento, numero_casa) VALUES 
('12345678901', 'João Silva', '1990-01-01', 'Rua A', 'Bairro X', 'Complemento 1', '123'),
('98765432109', 'Maria Santos', '1985-05-10', 'Rua B', 'Bairro Y', 'Complemento 2', '456'),
('55555555555', 'Pedro Oliveira', '1995-12-20', 'Rua C', 'Bairro Z', 'Complemento 3', '789');

CREATE TABLE modelo (
    id serial primary key,
    descricao text NOT NULL,
    ano_lancamento date NOT NULL
);

INSERT INTO modelo (descricao, ano_lancamento) VALUES 
('Sedan', '2020-01-01'),
('Hatchback', '2019-01-01'),
('SUV', '2021-01-01');

CREATE TABLE veiculo (
    id serial primary key,
    chassi character(17) UNIQUE NOT NULL,
    placa character(7) UNIQUE NOT NULL,
    cor character varying(15) NOT NULL,
    ano date NOT NULL,
    id_cliente integer references cliente(id),
    id_modelo integer references modelo(id)
);

INSERT INTO veiculo (chassi, placa, cor, ano, id_cliente, id_modelo) VALUES 
('ABC123DEF456GHI78', 'ABC1234', 'Preto', '2001-01-01', 1, 1),
('XYZ987WVU654TSR32', 'XYZ9876', 'Prata', '1997-01-01', 2, 2),
('PQR456MNO321LKJ54', 'PQR4567', 'Azul', '2012-01-01', 3, 2);

CREATE TABLE vaga (
    id serial primary key,
    andar integer NOT NULL
);

INSERT INTO vaga (andar) VALUES 
(1),
(2),
(3);


CREATE TABLE vaga_veiculo (
    id_vaga_veiculo serial primary key,
    entrada timestamp DEFAULT current_timestamp,
    saida timestamp,
    id_veiculo integer references veiculo(id),
    id_vaga integer references vaga(id)
);

INSERT INTO vaga_veiculo (saida, id_veiculo, id_vaga) VALUES 
('2023-05-24 12:00:00', 1, 1),
('2023-05-25 10:15:00', 3, 3);

INSERT INTO vaga_veiculo (entrada, saida, id_veiculo, id_vaga) VALUES 
('2023-05-20 12:00:00', '2023-05-21 10:15:00', 1, 2);

-- 2)
SELECT placa, ano as ano_lancamento FROM veiculo WHERE id = 1;

-- 3)
SELECT placa, ano as ano_lancamento FROM veiculo WHERE EXTRACT(YEAR FROM ano) >= 2000;

-- 4)
SELECT * FROM veiculo WHERE id_modelo = 1;

-- 5)
SELECT * FROM vaga_veiculo WHERE id_veiculo = 1;

-- 6)
SELECT id_veiculo AS veiculo, id_vaga AS vaga, age(saida, entrada) AS "Tempo na vaga" FROM vaga_veiculo WHERE id_veiculo = 1 and id_vaga = 2;

-- 7)
SELECT COUNT(*) AS "Quantidade de veículos do modelo 2" FROM veiculo WHERE id_modelo = 2;

-- 8)
SELECT CAST(AVG(EXTRACT(YEAR FROM age(data_nascimento))) AS INT) AS "Média de idade dos clientes" FROM cliente;

-- 9)
SELECT SUM(CAST(EXTRACT(EPOCH FROM age(saida, entrada) / 3600) AS INT) * 2) AS "Veiculo 1 na vaga 1 pagou" FROM vaga_veiculo WHERE id_veiculo = 1 and id_vaga = 1;
SELECT SUM(CAST(EXTRACT(EPOCH FROM age(saida, entrada) / 3600) AS INT) * 2) AS "Veiculo 1 na vaga 2 pagou" FROM vaga_veiculo WHERE id_veiculo = 1 and id_vaga = 2;
SELECT SUM(CAST(EXTRACT(EPOCH FROM age(saida, entrada) / 3600) AS INT) * 2) AS "Veiculo 3 pagou" FROM vaga_veiculo WHERE id_veiculo = 3;