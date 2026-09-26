CREATE SCHEMA IF NOT EXISTS livros;

CREATE TABLE livros.autor (
	autor_id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL
);

CREATE TABLE livros.livro (
	livro_id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	data_criacao DATE,
	autor_id INTEGER REFERENCES livros.autor(autor_id) ON DELETE CASCADE
);

INSERT
	INTO
	livros.autor (nome)
VALUES
	('Joao da silva'),
	('Pedro masqir'),
	('Maria algoz');
	
	
INSERT 
	INTO
	livros.livro (nome, data_criacao, autor_id)
VALUES
	('Branca de neve', '1986-03-30', 1),
	('Sapinho', '1986-03-30', 3),
	('Peixinho', '1986-03-30', 2);
	
SELECT 
	a.nome as autor,
	l.nome as livro,
	l.data_criacao as data
FROM livros.autor a
JOIN livros.livro l ON a.autor_id = l.autor_id