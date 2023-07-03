DROP DATABASE IF EXISTS gravadora;

CREATE DATABASE gravadora;

\c gravadora;

CREATE TABLE autor (
    id serial primary key,
    nome text not null
);

CREATE TABLE musica (
    id serial primary key,
    duracao time, -- 00:09:00
    titulo text
);

CREATE TABLE autor_musica (
    autor_id integer references autor (id),
    musica_id integer references musica (id)
);

CREATE TABLE gravadora (
    id serial primary key,
    nome text not null,
    contato text,
    site text,
    endereco text
);


CREATE TABLE cd (
    id serial primary key,
    preco money,
    titulo text,
    cd_id integer references cd (id)
);

CREATE TABLE musica_cd (
    nr_faixa integer default 1 check (nr_faixa > 0),
    musica_id integer references musica (id),
    cd_id integer references cd (id),
    primary key (musica_id, cd_id),
    unique (nr_faixa, cd_id)
);






