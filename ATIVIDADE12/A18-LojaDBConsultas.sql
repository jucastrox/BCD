-- criando banco de dados
CREATE DATABASE IF NOT EXISTS db_LojaDB;

USE  db_LojaDB;

CREATE TABLE IF NOT EXISTS tb_vendas(
id_nf int,
id_item int,
cod_prod int,
valor_unit decimal (4,2), 
quantidade int,
desconto int
);

INSERT INTO tb_vendas (id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) 
VALUES
(1, 1, 1, 25.00, 10, 5),
(1, 2, 2, 13.50, 3, null),
(1, 3, 3, 15.00, 2, null),
(1, 4, 4, 10.00, 1, null),
(1, 5, 5, 30.00, 1, null),
(2, 1, 3, 15.00, 4, null),
(2, 2, 4, 10.00, 5, null),
(2, 3, 5, 30.00, 7, null),
(3, 1, 1, 25.00, 5, null),
(3, 2, 4, 10.00, 4, null),
(3, 3, 5, 30.00, 5, null),
(3, 4, 2, 13.50, 7, null),
(4, 1, 5, 30.00, 10, 15),
(4, 2, 4, 10.00, 12, 5),
(4, 3, 1, 25.00, 13, 5),
(4, 4, 2, 13.50, 15, 5),
(5, 1, 3, 15.00, 3, null),
(5, 2, 5, 30.00, 6, null),
(6, 1, 1, 25.00, 22, 15),
(6, 2, 3, 15.00, 25, 20),
(7, 1, 1, 25.00, 10, 3),
(7, 2, 2, 13.50, 10, 4),
(7, 3, 3, 15.00, 10, 4),
(7, 4, 5, 30.00, 10, 1);

-- 1
SELECT id_nf, id_item, cod_prod, valor_unit
FROM tb_vendas
WHERE desconto IS NULL;

-- 2
select id_nf, id_item, cod_prod, valor_unit, valor_unit - (valor_unit*(DESCONTO/100)) AS valor_vendido
FROM tb_vendas
WHERE desconto IS NOT NULL;

-- 3
UPDATE tb_vendas
set desconto = 0
WHERE desconto = null;

-- 4 
select id_nf, id_item, cod_prod, desconto, valor_unit, (valor_unit*(desconto/100)) AS valor_vendido,
valor_unit, quantidade * valor_unit AS valor_total
FROM tb_vendas;

-- 5
SELECT id_nf, SUM(quantidade * valor_unit) AS valor_total
FROM tb_vendas
GROUP BY id_nf
ORDER BY id_nf DESC;

-- 6
SELECT id_nf, SUM(valor_unit*(desconto/100)) AS valor_vendido, SUM(quantidade * valor_unit) AS valor_total
FROM tb_vendas
GROUP BY id_nf
ORDER BY id_nf DESC;

-- 7
SELECT cod_prod, MAX(quantidade)
FROM tb_vendas
GROUP BY cod_prod;

-- 8
SELECT id_nf, cod_prod, count(quantidade)
FROM tb_vendas
WHERE quantidade > 10
GROUP BY id_nf, cod_prod;

-- 9
SELECT id_nf 
AS valor_total 
FROM tb_vendas
WHERE id_nf < 500
GROUP BY id_nf, valor_total
ORDER BY id_nf DESC;

-- 10
SELECT AVG(desconto) AS media
FROM tb_vendas
GROUP BY cod_prod;

-- 11
SELECT cod_prod, AVG(valor_unit *(desconto/100)) AS valor_medio
FROM tb_vendas
GROUP BY cod_prod;

-- 12
SELECT id_nf, SUM(quantidade) AS quantidade_itens
FROM tb_vendas
GROUP BY id_nf;