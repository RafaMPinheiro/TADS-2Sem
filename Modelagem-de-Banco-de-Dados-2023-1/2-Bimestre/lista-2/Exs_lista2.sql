--2)
    SELECT novelas.nome, capitulos.data_exibicao, capitulos.nome as nome_cap FROM capitulos INNER JOIN novelas on capitulos.cod_novela = novelas.cod WHERE novelas.nome = 'Mistérios de uma Vida';

--3)
    SELECT * FROM novelas WHERE horario_exibicao is null;