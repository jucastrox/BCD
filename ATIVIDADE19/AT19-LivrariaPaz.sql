CREATE DATABASE db_LivrariaPaz;

use db_LivrariaPaz;

CREATE TABLE livro(
id_livro INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(30),
genero VARCHAR(20),
isbn INT
);

CREATE TABLE editora(
id_editora INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45),
cnpj INT,
LIVRO_id_livro int,
FOREIGN KEY (LIVRO_id_livro) REFERENCES livro(id_livro)
);

