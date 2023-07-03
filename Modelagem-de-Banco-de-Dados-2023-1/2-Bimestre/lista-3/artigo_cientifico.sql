DROP DATABASE IF EXISTS artigo_cientifico;
CREATE DATABASE artigo_cientifico;

\c artigo_cientifico;


CREATE TABLE instituicao (
    id serial primary key,
    nome text not null,
    email text unique
);

CREATE TABLE autor (
    id serial primary key,
    nome text not null,
    email character varying(60) unique,
    instituicao_id integer references instituicao (id)
);


CREATE TABLE periodico (
    id serial primary key,
    nome character varying (100) not null
);

CREATE TABLE artigo (
    id serial primary key,
    titulo text not null,
    nr_paginas integer check (nr_paginas > 0),
    arquivo text,
    resumo text,
    periodico_id integer references periodico (id)
);

CREATE TABLE palavra (
    id serial primary key,
    palavra_chave text not null,
    artigo_id integer references artigo (id)
);

CREATE TABLE artigo_autor (
    artigo_id integer references artigo (id),
    autor_id integer references autor (id),
    primary key (artigo_id, autor_id)
);
