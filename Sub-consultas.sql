--Buscar todos os cursos de categorias que não possuem espaço no nome.
SELECT id FROM categoria WHERE nome NOT LIKE '% %';

--Buscar todos os cursos de categorias que possuem a palavra "de" no nome.
SELECT id FROM categoria WHERE nome LIKE '% de %';

--Filtrar o resultado de uma query para utilizar em outra query. Chamamos de sub-query, sub-pesquisa ou sub-select.
SELECT * FROM curso WHERE categoria_id IN (
	SELECT id FROM categoria WHERE nome NOT LIKE '% %'
);


--Filtro de sub-query para pesquisa dentro do "FROM", passando outro SELECT como tabela e assim, criando uma nova tabela.
SELECT categoria, numero_cursos
	FROM (
			SELECT categoria.nome AS categoria,
					COUNT(curso.id) AS numero_cursos
				FROM categoria
				JOIN curso ON curso.categoria_id = categoria.id
			GROUP BY categoria
		 ) AS categoria_cursos --novo nome da tabela.
WHERE numero_cursos > 3;


--Treinando consulta implementada acima.
SELECT curso, quantidade_alunos
	FROM (
			SELECT curso.nome AS curso,
					COUNT(aluno_curso.curso_id) AS quantidade_alunos
			FROM curso
			JOIN aluno_curso ON aluno_curso.curso_id = curso.id
		GROUP BY curso
	) AS qtde_alunos
WHERE quantidade_alunos IS NOT NULL