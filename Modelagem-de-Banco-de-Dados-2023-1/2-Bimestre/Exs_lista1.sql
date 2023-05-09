--2)
    SELECT nome FROM diretores;

--3)
    SELECT nome FROM filmes WHERE categoria = 'Animação'; --Anima├º├úo
    SELECT nome FROM filmes WHERE UPPER(categoria) = 'ANIMAÇÃO';
    SELECT nome FROM filmes WHERE LOWER(categoria) = 'animação';

--4)
    UPDATE salas SET capacidade = 200 WHERE numero = 202;

--5)
    UPDATE salas_filmes SET numero_sala = 202 WHERE data_filme = '14-04-2014';

--6)
    SELECT id FROM diretores WHERE nome = 'Fulano de Tal da Silva'; -- Acha o id do diretor 1
    SELECT id FROM filmes WHERE cod_diretor = 1; -- Fez o filme 1 e o 2
    DELETE FROM salas_filmes WHERE cod_filme = 1;-- Deletar as salas q iam ter os filmes
    DELETE FROM salas_filmes WHERE cod_filme = 2;
    DELETE FROM premios WHERE cod_filme = 1;-- Deletar os premios dos filmes
    DELETE FROM premios WHERE cod_filme = 2;
    DELETE FROM filmes WHERE cod_diretor = 1;-- Deletar os filmes
    DELETE FROM diretores WHERE nome = 'Fulano de Tal da Silva';

-- ON DELETE CASCADE 
    DELETE FROM diretores WHERE nome = 'Fulano de Tal da Silva';

-- OU
    UPDATE filmes SET cod_diretor = 0 WHERE cod_diretor = 1;
    DELETE FROM diretores WHERE nome = 'Fulano de Tal da Silva';

--7)
    --SELECT id FROM diretores WHERE nome = 'Ciclana das Neves'; -- 2
    --SELECT nome, categoria FROM filmes WHERE cod_diretor = 2;

    SELECT filmes.nome, filmes.categoria FROM filmes INNER JOIN diretores on filmes.cod_diretor = diretores.id WHERE diretores.nome = 'Ciclana das Neves';-- Junta as tabelas e filtar pela coluna nome da segunda tabela

--8)
    -- SELECT * FROM salas_filmes WHERE data_filme = '15-04-2014';
    SELECT horario FROM salas_filmes WHERE data_filme = '15-04-2014';

--9)
    SELECT premios.nome, premios.ano_premiacao FROM premios INNER JOIN filmes on premios.cod_filme = filmes.id WHERE filmes.nome = 'Shrek';

--10)
    SELECT id, nome, categoria FROM filmes WHERE ano_lancamento > '2000'; -- Matrix saiu pra deletar o diretor com id=1
