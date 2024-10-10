-- Criando um banco de dados
CREATE DATABASE db_livraria;

-- Usando um Banco de Dados
USE db_livraria;

-- Criando uma Tabela
CREATE TABLE IF NOT EXISTS cliente (
id_cliente int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome varchar (45),
cpf varchar(11),
rg varchar(11),
email varchar(45)
);

CREATE TABLE IF NOT EXISTS telefone_cliente(
id_telefone int PRIMARY KEY NOT NULL AUTO_INCREMENT,
telefone varchar(15),
CLIENTE_id_cliente int,
foreign key (CLIENTE_id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS endereco_cliente(
id_endereco int PRIMARY KEY NOT NULL AUTO_INCREMENT,
rua varchar(45),
numero int,
cidade varchar (45),
estado varchar (45),
CLIENTE_id_cliente int,
foreign key (CLIENTE_id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS editora(
id_editora int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_editora varchar(45),
nome_contato varchar(45),
email varchar(45),
contato varchar(45)
);

CREATE TABLE IF NOT EXISTS livro(
id_livro int PRIMARY KEY NOT NULL AUTO_INCREMENT,
titulo varchar(45),
categoria varchar(45),
isbn varchar (13),
ano date,
valor decimal (10,2),
autor varchar(45),
EDITORA_id_editora int,
foreign key (EDITORA_id_editora) REFERENCES editora(id_editora)
);

CREATE TABLE IF NOT EXISTS estoque(
id_estoque int PRIMARY KEY NOT NULL AUTO_INCREMENT,
quantidade int,
LIVRO_id_livro int,
foreign key (LIVRO_id_livro) REFERENCES livro(id_livro)
);

CREATE TABLE IF NOT EXISTS pedido(
id_pedido int PRIMARY KEY NOT NULL AUTO_INCREMENT,
valor decimal(10,2),
dia_hora date,
CLIENTE_id_cliente int,
foreign key (CLIENTE_id_livro) REFERENCES ciente(id_cliente)
);

CREATE TABLE IF NOT EXISTS item_pedido(
id_item_pedido int PRIMARY KEY NOT NULL AUTO_INCREMENT,
quantidade int,
valor decimal(10,2),
PEDIDO_id_pedido int,
LIVRO_id_livro int,
foreign key (PEDIDO_id_pedido) REFERENCES pedido(id_pedido),
foreign key (LIVRO_id_livro) REFERENCES livro(id_livro)
);

SHOW TABLES;

SHOW DATABASES;