-- 1. Criando o banco de dados
CREATE DATABASE Biblioteca;
GO

-- 2. Indicando que usaremos este banco
USE Biblioteca;
GO

-- 3. Criando as tabelas 

-- Tabela Autor 
CREATE TABLE Autor(
    IDAutor SMALLINT PRIMARY KEY IDENTITY(1,1),
    NomeAutor VARCHAR(50) NOT NULL,
    SobrenomeAutor VARCHAR(60) NOT NULL
);
GO

-- Tabela Editora
CREATE TABLE Editora(
    IDEditora SMALLINT PRIMARY KEY IDENTITY(1,1),
    NomeEditora VARCHAR(50) NOT NULL
);
GO

-- Tabela Assunto
CREATE TABLE Assunto(
    IDAssunto TINYINT PRIMARY KEY IDENTITY(1,1),
    NomeAssunto VARCHAR(25) NOT NULL
);
GO

-- Tabela Livro
CREATE TABLE Livro (
    IDLivro SMALLINT PRIMARY KEY IDENTITY(100,1), 
    NomeLivro VARCHAR(70) NOT NULL,
    ISBN13 CHAR(13) UNIQUE NOT NULL,
    DATAPUB DATE,
    PreçoLivro MONEY NOT NULL,
    NumeroPaginas SMALLINT NOT NULL,
    IDEditora SMALLINT NOT NULL,
    IDAssunto TINYINT NOT NULL,
    CONSTRAINT fk_id_editora FOREIGN KEY(IDEditora) REFERENCES Editora(IDEditora) ON DELETE CASCADE,
    CONSTRAINT fk_id_assunto FOREIGN KEY(IDAssunto) REFERENCES Assunto(IDAssunto) ON DELETE CASCADE,
    CONSTRAINT verificar_preco CHECK(PreçoLivro >= 0) 
);
GO

-- Tabela LivroAutor (Associação)
CREATE TABLE LivroAutor(
    IDLivro SMALLINT NOT NULL,
    IDAutor SMALLINT NOT NULL,
    CONSTRAINT fk_id_livro FOREIGN KEY(IDLivro) REFERENCES Livro(IDLivro),
    CONSTRAINT fk_id_autor FOREIGN KEY(IDAutor) REFERENCES Autor(IDAutor),
    CONSTRAINT pk_id_livro_autor PRIMARY KEY(IDLivro, IDAutor)
);
GO

-- 4. Inserindo Dados

-- Inserindo Assuntos
INSERT INTO Assunto (NomeAssunto)
VALUES 
('Ficção Científica'), ('Botânica'), ('Eletrônica'), ('Matemática'),
('Aventura'), ('Romance'), ('Finanças'), ('Gastronomia'),
('Terror'), ('Administração'), ('Informática'), ('Suspense');
GO

-- Inserindo Editoras
INSERT INTO Editora (NomeEditora)
VALUES 
('Prentice Hall'), ('O Reilly'), ('Aleph'), ('Microsoft Press'),
('Wiley'), ('HarperCollins'), ('Erica'), ('Novatec'),
('McGraw-Hill'), ('Apress'), ('Francisco Alves'), ('Sybex'),
('Globo'), ('Companhia de Letras'), ('Morro Branco'), ('Penguin Books'),
('Martins Claret'), ('Record'), ('Springers'), ('Melhoramentos'),
('Oxford'), ('Taschen'), ('Ediouro'), ('Bookman');
GO

-- Inserindo Autores
INSERT INTO Autor (NomeAutor, SobrenomeAutor)
VALUES ('Umberto', 'Eco');
GO

-- Inserindo Autores
INSERT INTO Autor (NomeAutor, SobrenomeAutor)
VALUES 
('Daniel', 'Barret'),('Gerald', 'Carter'),('Mark', 'Sobell'),
('William', 'Stanek'),('Christine', 'Bresnahan'),('William', 'Gibson'),
('James', 'Joyce'),('John', 'Emsley'),('Jose', 'Saramago'),
('Richard', 'Silverman'),('Robert', 'Byrnes'),('Jay', 'Ts'),
('Isaac', 'Asimov'),('Arthur', 'Clarke'),('George', 'Orwell'),
('Aldous', 'Huxley'),('Stephen', 'King'),('J.R.R.', 'Tolkien'),
('H.P.', 'Lovecraft'),('Agatha', 'Christie'),('Neil', 'Gaiman'),
('Terry', 'Pratchett'),('Douglas', 'Adams'),('Frank', 'Herbert'),
('Philip', 'Dick'),('Ursula', 'Le Guin'),('Ray', 'Bradbury'),
('Paul', 'Deitel'),('Robert', 'Martin'),('Martin', 'Fowler'),
('Erich', 'Gamma'),('Richard', 'Helm'),('Ralph', 'Johnson'),
('John', 'Vlissides'),('Linus', 'Torvalds'),('Ken', 'Thompson'),
('Dennis', 'Ritchie'),('Bjarne', 'Stroustrup'),('Donald', 'Knuth');
GO

--Tabela de Livros
INSERT INTO Livro (NomeLivro, ISBN13, DATAPUB, PreçoLivro,
NumeroPaginas, IDAssunto, IDEditora)
VALUES ('A Arte da Eletrônica', '9788582604342',
'20170308', 300.74, 1160, 3, 24);
GO

--Tabela de Livros

INSERT INTO Livro (NomeLivro, ISBN13, DATAPUB, PreçoLivro, NumeroPaginas, IDAssunto, IDEditora)
VALUES 
('Código Limpo', '9788576057039', '20090908', 85.50, 425, 11, 1),
('Aprendendo Linux', '9788575225444', '20170515', 74.00, 336, 11, 8),
('Redes de Computadores', '9788521634706', '20181122', 189.00, 704, 11, 9),
('Java: Como Programar', '9788575226939', '20190311', 150.00, 900, 11, 1),
('Sistemas Operacionais Modernos', '9788550804668', '20190215', 120.00, 600, 11, 1),
('O Algoritmo de Mestre', '9788575224355', '20170515', 74.00, 336, 11, 8),
('Neuromancer', '9788576573005', '20160210', 45.00, 320, 1, 3),
('Fundação', '9788576574545', '20190820', 52.00, 240, 1, 3),
('Duna', '9788576573135', '20170425', 72.00, 680, 1, 3),
('O Hobbit', '9788595084742', '20190715', 49.90, 336, 5, 6),
('1984', '9788535914849', '20090815', 42.00, 416, 1, 14),
('Fahrenheit 451', '9788525052247', '20120510', 37.00, 216, 1, 13),
('O Iluminado', '9788560280424', '20170101', 58.00, 480, 9, 18),
('Admirável Mundo Novo', '9788525056009', '20140220', 39.90, 312, 1, 13),
('Eu, Robô', '9788576573006', '20141021', 40.00, 320, 1, 3),
('2001: Uma Odisséia no Espaço', '9788576571551', '20131015', 55.00, 336, 1, 3),
('Ensaio Sobre a Cegueira', '9788535900712', '19950815', 48.00, 312, 6, 14),
('O Nome da Rosa', '9788501012076', '19800101', 65.00, 500, 12, 18),
('Moby Dick', '9788572327429', '20080612', 45.00, 600, 5, 17),
('Ulysses', '9788525056001', '20120301', 80.00, 900, 6, 16),
('Crime e Castigo', '9788572327430', '20090510', 35.00, 560, 6, 17),
('O Retrato de Dorian Gray', '9788572327431', '20101010', 25.00, 240, 6, 17),
('Drácula', '9788572327432', '20111111', 30.00, 400, 9, 17),
('O Chamado de Cthulhu', '9788572327433', '20121212', 20.00, 120, 9, 17),
('Sherlock Holmes: Estudo em Vermelho', '9788572327434', '20130101', 22.00, 180, 12, 6),
('O Guia do Mochileiro das Galáxias', '9788576573007', '20100504', 35.00, 208, 1, 18),
('O Silmarillion', '9788595084743', '20190315', 59.90, 400, 5, 6),
('Sandman: Prelúdio', '9788580575461', '20150315', 90.00, 220, 1, 14),
('Mitologia Nórdica', '9788580575462', '20170101', 45.00, 304, 5, 18);
GO

--Visualizando o cadastro.

SELECT 
    L.NomeLivro, 
    L.ISBN13, 
    L.PreçoLivro, 
    A.NomeAssunto, 
    E.NomeEditora
FROM Livro L
INNER JOIN Assunto A ON L.IDAssunto = A.IDAssunto
INNER JOIN Editora E ON L.IDEditora = E.IDEditora;

--Tabela de LivroAutor:

INSERT INTO LivroAutor (IDLivro, IDAutor) VALUES 
(112, 30), -- Código Limpo -> Robert Martin
(118, 7),  -- Neuromancer -> William Gibson
(119, 14), -- Fundação -> Isaac Asimov
(120, 25), -- Duna -> Frank Herbert
(121, 19), -- O Hobbit -> J.R.R. Tolkien
(122, 16), -- 1984 -> George Orwell
(123, 28), -- Fahrenheit 451 -> Ray Bradbury
(124, 18), -- O Iluminado -> Stephen King
(125, 17), -- Admirável Mundo Novo -> Aldous Huxley
(126, 14), -- Eu, Robô -> Isaac Asimov
(127, 15), -- 2001: Uma Odisséia no Espaço -> Arthur Clarke
(128, 10), -- Ensaio Sobre a Cegueira -> Jose Saramago
(129, 1),  -- O Nome da Rosa -> Umberto Eco
(131, 8),  -- Ulysses -> James Joyce
(139, 22), -- Sandman: Prelúdio -> Neil Gaiman
(140, 22); -- Mitologia Nórdica -> Neil Gaiman
GO

--Visualizando o cadastro.

SELECT * FROM LivroAutor;

--Visualização com INNER JOIN
SELECT NomeLivro, NomeAutor, SobrenomeAutor
FROM Livro
INNER JOIN LivroAutor
 ON Livro.IDLivro = LivroAutor.IDLivro
INNER JOIN Autor
 ON Autor.IDAutor = LivroAutor.IDAutor
ORDER BY NomeLivro;

/* Clausula ORDER BY
    ORDENA OS RESULTADOS
    */

SELECT *FROM Livro
ORDER BY NomeLivro;

SELECT NomeLivro, IDEditora
FROM Livro
ORDER BY IDEditora;

SELECT NomeLivro, PreçoLivro
FROM Livro
ORDER BY PreçoLivro DESC;

/* Como ordenar
por mais de um coluna
*/

SELECT NomeLivro, PreçoLivro, IDEditora
FROM Livro
ORDER BY IDEditora, PreçoLivro ASC;

--Ordenando com mais de um parametro.

SELECT NomeLivro, PreçoLivro, IDEditora
FROM Livro
ORDER BY IDEditora ASC, PreçoLivro DESC;

-- SELECT TOP

SELECT TOP (2) NomeLivro
FROM Livro
ORDER BY NomeLivro;

-- Ordem Descendente

SELECT TOP (15) NomeLivro
FROM Livro
ORDER BY NomeLivro DESC;

-- Usando o percentual

SELECT TOP (15) PERCENT NomeLivro
FROM Livro
ORDER BY NomeLivro;

SELECT TOP (15) PERCENT NomeLivro
FROM Livro
ORDER BY NomeLivro DESC;

-- WITH TINES

SELECT TOP (3) WITH TIES NomeLivro, IDAssunto
FROM Livro
ORDER BY IDAssunto;

/*   WHERE
Pesquisa com filtro
*/

SELECT NomeLivro, DATAPUB
FROM Livro
WHERE IDEditora = 3;

SELECT IDAutor, NomeAutor
FROM Autor
WHERE SobrenomeAutor = 'Barret';

SELECT NomeLivro, PreçoLivro
FROM Livro
WHERE PreçoLivro > 100.00
ORDER BY PreçoLivro;

-- Concatenando o SELECT com uma SUB CONSULTA.

SELECT NomeLivro, DATAPUB
FROM Livro
WHERE IDEditora IN (
    SELECT IDEditora
    FROM Editora
    WHERE NomeEditora = 'ALEPH'
    );

-- AQUI OUVE UM ERRO COMO A BUSCA ENCONTROU MAIS DE UMA EDITORA PRECISEI SUBSTITUIR "O" = POR "IN'