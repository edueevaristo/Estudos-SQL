--Unir o primeiro nome com o segundo nome, para formar o nome completo.
--O operador pipe vai unir ambos os parâmetros informados.
SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_aluno FROM aluno;


--Se eu quiser unir os parâmetros e também um dado que retornará NULL, 
--neste caso, eu teria que utilizar o operador CONCAT.
SELECT CONCAT('Eduardo', ' ', NULL);


--Realizar a concanetação mas também deixar todas as demais letras da query em maíusuculo.
SELECT UPPER(CONCAT('Eduardo', ' ', 'Evaristo'));

--Realizar a concanetação mas também deixar todas as demais letras da query em maíusuculo. 
--E remover qualquer espaço da frente ou do final da string.

--Olhar depois a documentação relacionado a manipulação de string.
SELECT TRIM(UPPER(CONCAT('Eduardo', ' ', 'Evaristo')));


--Calcular a idade de cada pessoa através da data atual.
--Utilizando a função NOW() para trazer a data atual e utilizando o ::DATE para formatar e trazer somente a data.
--Dividindo por 365 dias, retornará a idade
SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo, 
		(NOW()::DATE - data_nascimento) / 365 
FROM aluno;

--Realizando de uma forma mais simples, trazendo a idade do aluno com a função AGE()
SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo, 
		AGE(data_nascimento) as idade
FROM aluno;

--Realizando de uma forma mais simples, trazendo a idade do aluno com a função AGE()
--Extraindo agora somente a data de aniversário com a função EXTRACT(YEAR FROM)
SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo, 
		EXTRACT( YEAR FROM AGE(data_nascimento)) as idade
FROM aluno;


--Utilizando conversões de tipo e formatação com a função TO_CHAR
SELECT TO_CHAR(NOW(), 'DD-MM-YYYY');