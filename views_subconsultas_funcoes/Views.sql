--Nomeando consultas com a view. Ter maior legibilidade no acesso a relatórios.
--Observação: Através da view você não insere ou atualiza os dados, somente é possível a visualização.
--Observação: Em views, eu consigo realizar todos os filtros que eu utilizo em uma tabela normal, sendo cláusula WHERE, IN e até mesmo o JOIN.

CREATE VIEW vw_cursos_por_categoria AS SELECT categoria.nome AS categoria,
		COUNT(curso.id) AS numero_cursos
	FROM categoria
	JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria;

--Pesquisando pela view
SELECT * FROM vw_cursos_por_categoria

--Utilizando a view no local da sub-query
SELECT categoria
	FROM vw_cursos_por_categoria AS categoria_cursos
	WHERE numero_cursos >= 3;
	
--Criando outra view, desta vez, trazendo somente os cursos de programação.
CREATE VIEW vw_cursos_programacao AS SELECT nome FROM curso WHERE categoria_id = 1;
SELECT * FROM vw_cursos_programacao;


--Realizando relatório com JOIN entre a view e uma tabela comum
SELECT categoria.id AS categoria_id, vw_cursos_por_categoria.*
	FROM vw_cursos_por_categoria
	JOIN categoria ON categoria.nome = vw_cursos_por_categoria.categoria;
