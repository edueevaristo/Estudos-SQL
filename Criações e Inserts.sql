--Criação do banco
CREATE DATABASE alura;
----------------------------------------------------------
-----------------Criação das tabelas----------------------
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);
----------------Fim da Criação das tabelas----------------
----------------------------------------------------------

---------------Início dos inserts nas tabelas-------------
/*Observação: Adicionando vários registros de uma única
vez, passando entre colchetes e com vírgula.*/
INSERT INTO aluno 
	(primeiro_nome, ultimo_nome, data_nascimento) 
	VALUES
	('Eduardo', 'Silva', '26/10/2000'),
    ('Geovana', 'Brito', '03/01/2002'),
    ('Camila', 'Galceran', '04/06/1995'),
    ('Edson', 'Silva', '20/06/1965');

INSERT INTO categoria
	(nome)
	VALUES
	('Técnico'),
    ('Saúde'),
    ('Educação');

INSERT INTO curso
	(nome, categoria_id)
	VALUES
	('Análise e Desenvolvimento de Sistemas', 1)
    ('Ciência da Computação', 1),
    ('Sistema da Informação', 1),
    ('Medicina', 2),
    ('Psicologia', 2),
    ('Farmácia', 2),
    ('Administração', 3),
    ('Contabilidade', 2),
    ('Pedagogia', 2);

INSERT INTO aluno_curso
	(aluno_id, curso_id)
	VALUES
	(1,1),
    (1,2),
    (2,4),
    (2,1),
    (3,1),
    (3,9),
    (4,7);
----------------Fim dos inserts nas tabelas---------------
----------------------------------------------------------