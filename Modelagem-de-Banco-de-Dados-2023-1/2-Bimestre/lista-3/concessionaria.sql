DROP DATABASE IF EXISTS concessionaria;

CREATE DATABASE concessionaria;

\c concessionaria;

CREATE TABLE conjuge (
    id serial primary key,
    cpf character(11) UNIQUE,
    nome text NOT NULL
);

CREATE TABLE cliente (
    id serial primary key,
    cpf character(11) UNIQUE,
    nome text NOT NULL,
    estado_civil text DEFAULT 'Solteiro',
    conjuge_id integer references conjuge (id)
);

CREATE TABLE marca (
    id serial primary key,
    nome text NOT NULL
);

CREATE TABLE modelo (
    id serial primary key,
    nome text NOT NULL,
    ano_lancamento date NOT NULL,
    marca_id integer references marca (id) NOT NULL
);

CREATE TABLE veiculo (
    nrm_chassi character(17) primary key,
    placa text NOT NULL,
    ano_fabricacao date NOT NULL,
    cor text NOT NULL,
    quilometragem real NOT NULL,
    modelo_id integer references modelo (id) NOT NULL
);

CREATE TABLE compra (
    id serial primary key,
    valor money NOT NULL,
    data_hora timestamp DEFAULT CURRENT_TIMESTAMP,
    veiculo_id integer references veiculo (id) NOT NULL
    cliente_id integer references cliente (id) NOT NULL
);