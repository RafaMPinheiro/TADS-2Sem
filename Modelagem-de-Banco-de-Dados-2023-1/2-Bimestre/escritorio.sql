DROP DATABASE IF EXISTS escritorio;

CREATE DATABASE escritorio;

\c escritorio;

CREATE TABLE cliente (
    id serial primary key,
    cpf character(11) unique,
    nome text not null,
    telefone text,
    endereco text not null
);

CREATE TABLE processo (
    id serial primary key,
    descricao text,
    data_abertura date default current_date,
    cliente_id integer references cliente (id)
);

CREATE TABLE advogado (
    id serial primary key,
    nome text not null,
    oab character(10) unique,
    telefone text not null,
    data_admissao date default current_date
);


CREATE TABLE processo_advogado (
    processo_id integer references processo (id),
    advogado_id integer references advogado (id),
    primary key (processo_id, advogado_id)
);

CREATE TABLE audiencia (
    id serial primary key,
    data_hora timestamp default current_timestamp,
    local text not null,
    processo_id integer references processo (id)
);
