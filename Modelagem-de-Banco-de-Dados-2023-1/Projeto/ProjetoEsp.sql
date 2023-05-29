DROP DATABASE IF EXISTS projeto_esp;

CREATE DATABASE projeto_esp;

\c projeto_esp;

CREATE TABLE esp (
    id serial primary key,
    descricao character varying(60),
);

CREATE TABLE temperaturas (
    temperatura real NOT NULL,
    data date default current_date,
    hora time default current_time,
    esp_id integer references esp (id)
    primary key (temperatura, data, hora)
);