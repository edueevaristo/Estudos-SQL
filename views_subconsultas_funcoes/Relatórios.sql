-- Relatórios personalizados de acordo com as tabelas já criadas.


--Renomeando campo (Relembrando)
--NUNCA realizar update sem a cláusula WHERE, pois o risco é de atualizar todos os valores sem ser um em específico.
UPDATE categoria SET nome = 'Educação' WHERE id = '3'



------------------------------Criacao de relatório----------------------------------
--Fazendo a função de agregação com o "COUNT" e dando um alias (nome) para o campo.
--Fazendo um JOIN e referenciando a um campo de outra tabela.
--Agrupando com o GROUP BY vai agrupar todos os campos antes da função de agregação.
--ORDER BY ordenar pela coluna informanda. DESC = Decrescente, ASC = Crescente.

SELECT aluno.primeiro_nome, 
	   aluno.ultimo_nome,
		COUNT(aluno_curso.curso_id) as numero_cursos
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
GROUP BY aluno.primeiro_nome, aluno.ultimo_nome
ORDER BY numero_cursos DESC;


------------Criacao de outro relatório / CURSO MAIS REQUISITADO---------------------
----Trazendo o curso mais requisitado, ou seja, o curso que tem mais matrículas.----
SELECT curso.nome,
	COUNT(aluno_curso.aluno_id) as numero_alunos
	FROM curso
	JOIN aluno_curso ON aluno_curso.curso_id = curso.id
GROUP BY 1
ORDER BY numero_alunos DESC;


------------Criacao de outro relatório / CATEGORIA MAIS REQUISITADA-----------------
--Trazendo a categoria mais requisitada, ou seja, o categoria que possui mais cursos.

SELECT categoria.nome,
	COUNT(curso.categoria_id) as numero_cursos
	FROM categoria
	JOIN curso ON curso.categoria_id = categoria.id
GROUP BY 1
ORDER BY numero_cursos DESC;
