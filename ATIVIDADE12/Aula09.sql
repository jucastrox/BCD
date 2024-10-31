DROP DATABASE db_senai;

CREATE DATABASE IF NOT EXISTS db_senai;

USE db_senai;

CREATE TABLE IF NOT EXISTS tb_curso (
id_curso INT PRIMARY KEY AUTO_INCREMENT,
nome_curso VARCHAR(30) NOT NULL UNIQUE,
carga_horaria INT UNSIGNED,
ano YEAR
);

INSERT INTO tb_curso (nome_curso, carga_horaria, ano) VALUES
('Engenharia de software' , 360, 2022),
('Administração', 400, 2021),
('Medicina', 360, NULL),
('Direito', NULL, NULL),
('Arquitetura', 429, 2023),
('Psicologia', 480, 2023),
('Biomedicina', NULL, 2021),
('Educação Física', 360, 2022),
('Ciência da computação', 480, 2020),
('Engenharia Civil', 400, 2018),
('Farmácia', 400, 2022),
('Veterinária', 500, NULL),
('Desing Gráfico', 369, 2023),
('Contabilidade', 400, 2019),
('Gestão de Recursos Humanos', 360, 2021),
('Sistemas de Informação', 480, 2022),
('Engenharia Elétrica', 400, 2020),
('Marketing', 360, 2021),
('Turismo', 320, 2023),
('Ciências Biológicas', 420, 2019);

SELECT * FROM tb_curso
ORDER BY nome_curso ASC;

SELECT nome_curso, ano FROM tb_curso
ORDER BY ano DESC;

SELECT nome_curso, ano FROM tb_curso
WHERE ano = 2020 
ORDER BY nome_curso;

SELECT nome_curso, ano FROM tb_curso
WHERE ano <= 2020
ORDER BY nome_curso;

SELECT nome_curso, ano FROM tb_curso
WHERE ano != 2020
ORDER BY nome_curso;

SELECT nome_curso, ano FROM tb_curso
WHERE carga_horaria > 360 AND carga_horaria < 500
ORDER BY ano;

SELECT nome_curso, ano FROM tb_curso
WHERE ano IS NULL;

SELECT nome_curso, ano FROM tb_curso
WHERE ano IS NOT NULL;

SELECT nome_curso, carga_horaria, ano FROM tb_curso
WHERE carga_horaria BETWEEN 400 AND 480
ORDER BY ano ASC, nome_curso DESC; 

SELECT nome_curso, ano FROM tb_curso
WHERE ano IN (2018, 2020, 2023);

SELECT * FROM tb_curso
WHERE nome_curso LIKE '%A';

SELECT * FROM tb_curso
WHERE nome_curso LIKE '%A%';

SELECT * FROM tb_curso
WHERE nome_curso NOT LIKE '%A%';

SELECT * FROM tb_curso
WHERE nome_curso LIKE 'Adm%o';

SELECT * FROM tb_curso
WHERE nome_curso LIKE 'Eng%a%';

SELECT * FROM tb_curso 
WHERE nome_curso LIKE 'Eng%a__';

SELECT * FROM tb_curso
WHERE nome_curso LIKE 'Dir__to';

SELECT COUNT(*) FROM tb_curso;
SELECT carga_horaria > 400;

SELECT MAX(carga_horaria) FROM tb_curso;

SELECT MAX(carga_horaria) FROM tb_curso
WHERE ano = 2018;

SELECT MIN(carga_horaria) FROM tb_curso
WHERE ano = 2020;

SELECT SUM(carga_horaria) FROM tb_curso
WHERE ano = 2021;

SELECT AVG (carga_horaria) AS Media FROM tb_curso
WHERE ano = 2023;

SELECT carga_horaria AS Carga, COUNT(*) AS Contagem FROM tb_curso
GROUP BY carga_horaria
ORDER BY carga_horaria;

SELECT carga_horaria AS Carga, Count(*) AS Contagem FROM tb_curso
WHERE ANO > 2019
GROUP BY carga_horaria
HAVING carga_horaria > (SELECT AVG (carga_horaria) FROM tb_curso)
ORDER BY carga_horaria;