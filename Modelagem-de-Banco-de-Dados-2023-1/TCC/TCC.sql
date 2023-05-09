DROP DATABASE IF EXISTS tcc;

CREATE DATABASE tcc;

\c tcc;

CREATE TABLE farmacia (
    id serial primary key,
    bairro text NOT NULL UNIQUE
);

INSERT INTO farmacia(bairro) VALUES
('Cassino'),
('Quinta'),
('Centro');

CREATE TABLE esp (
    id serial primary key,
    farmacia_id integer references farmacia (id)
);

INSERT INTO esp(farmacia_id) VALUES
(2),
(3),
(1);

CREATE TABLE temperaturas (
    id serial primary key,
    temperatura real NOT NULL,
    data date default current_date,
    hora time default current_time,
    esp_id integer references esp (id)
);

INSERT INTO temperaturas(temperatura, esp_id) VALUES
(24.4, 1),
(23.7, 2),
(23.2, 3);