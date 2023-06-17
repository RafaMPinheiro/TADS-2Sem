DROP DATABASE IF EXISTS garagem_coletiva;

CREATE DATABASE garagem_coletiva;

\c garagem_coletiva;

CREATE TABLE cliente (
    id serial primary key,
    cpf character(11) unique not null,
    nome character varying(100),
    data_nascimento date,
    rua character varying(100),
    bairro character varying(50),
    complemento character varying(30),
    numero_casa character varying(8)
);

INSERT INTO cliente (cpf, nome, data_nascimento, rua, bairro, complemento, numero_casa) VALUES 
('12345678901', 'João Silva', '1990-01-01', 'Rua A', 'Bairro X', 'Complemento 1', '123'),
('98765432109', 'Maria Santos', '1985-05-10', 'Rua B', 'Bairro Y', 'Complemento 2', '456'),
('55555555555', 'Pedro Oliveira', '1995-12-20', 'Rua C', 'Bairro Z', 'Complemento 3', '789');

CREATE TABLE modelo (
    id serial primary key,
    descricao text,
    ano_lancamento date not null
);

INSERT INTO modelo (descricao, ano_lancamento) VALUES 
('Sedan', '2020-01-01'),
('Hatchback', '2019-01-01'),
('SUV', '2021-01-01');

CREATE TABLE veiculo (
    id serial primary key,
    chassi character(17) unique,
    placa character(7) unique,
    cor character varying(15) not null,
    ano date not null,
    id_cliente integer REFERENCES cliente(id),
    id_modelo integer REFERENCES modelo(id)
);

INSERT INTO veiculo (chassi, placa, cor, ano, id_cliente, id_modelo) VALUES 
('ABC123DEF456GHI78', 'ABC1234', 'Preto', '2001-01-01', 1, 1),
('XYZ987WVU654TSR32', 'XYZ9876', 'Prata', '1997-01-01', 2, 2),
('PQR456MNO321LKJ54', 'PQR4567', 'Azul', '2012-01-01', 3, 2);

CREATE TABLE vaga (
    id serial primary key,
    vaga character(9) not null
);

INSERT INTO vaga (vaga) VALUES 
('A1'), ('A2'), ('A3'), ('A4'), ('A5'),
('B1'), ('B2'), ('B3'), ('B4'), ('B5'),
('C1'), ('C2'), ('C3'), ('C4'), ('C5');

CREATE TABLE vaga_veiculo (
    id_vaga_veiculo serial primary key,
    entrada timestamp DEFAULT current_timestamp,
    saida timestamp DEFAULT current_timestamp + INTERVAL '2 hours',
    id_veiculo integer REFERENCES veiculo(id),
    id_vaga integer REFERENCES vaga(id)
);

INSERT INTO vaga_veiculo (id_veiculo, id_vaga) VALUES 
(1, 1),
(3, 3);

INSERT INTO vaga_veiculo (entrada, saida, id_veiculo, id_vaga) VALUES 
('2023-05-20 12:00:00', '2023-05-21 01:37:00', 1, 2);

-- 2)
SELECT placa, ano as ano_de_lancamento FROM veiculo WHERE id = 1;

-- 3)
SELECT placa, ano as ano_de_lancamento FROM veiculo WHERE EXTRACT(YEAR FROM ano) >= 2000;

-- 4)
SELECT * FROM veiculo WHERE id_modelo = 1;

-- 5)
SELECT * FROM vaga_veiculo WHERE id_veiculo = 1;

-- 6)
SELECT id_veiculo AS veiculo, id_vaga AS vaga, saida - entrada AS "Tempo na vaga" FROM vaga_veiculo WHERE id_veiculo = 1 and id_vaga = 2;

-- 7)
SELECT COUNT(*) AS "Quantidade de veículos do modelo 2" FROM veiculo WHERE id_modelo = 2;

-- 8)
SELECT CAST(AVG(EXTRACT(YEAR FROM age(data_nascimento))) AS INT) AS "Média de idade dos clientes" FROM cliente;

-- 9)
-- EXTRACT(EPOCH FROM saida - entrada) => saida - entrada em segundos 
-- / 3600 => para converter para horas 
-- CEIL => para arredondar para cima
SELECT id_veiculo AS veiculo, id_vaga AS vaga,  CEIL(EXTRACT(EPOCH FROM saida - entrada) / 3600) * 2 AS "Veiculo 1 na vaga 1 pagou" FROM vaga_veiculo;