CREATE TABLE alumnos (
     id INT NOT NULL AUTO_INCREMENT,
     nombre CHAR(30) NOT NULL,
     PRIMARY KEY (id)
);

CREATE TABLE curso (
     id INT NOT NULL AUTO_INCREMENT,
     nombre CHAR(30) NOT NULL,
     PRIMARY KEY (id)
);

CREATE TABLE matricula (
     id_alu INT NOT NULL,
     id_curso INT NOT NULL
);

INSERT INTO alumnos (nombre) VALUES ('pepe');
INSERT INTO alumnos (nombre) VALUES ('ana');
INSERT INTO alumnos (nombre) VALUES ('amy');
INSERT INTO alumnos (nombre) VALUES ('victor');

INSERT INTO curso (id,nombre) VALUES (10,'mat');
INSERT INTO curso (id,nombre) VALUES (11,'geo');
INSERT INTO curso (id,nombre) VALUES (12,'comp');

INSERT INTO matricula (id_alu,id_curso) VALUES (1,10);
INSERT INTO matricula (id_alu,id_curso) VALUES (2,10);
INSERT INTO matricula (id_alu,id_curso) VALUES (3,11);
INSERT INTO matricula (id_alu,id_curso) VALUES (3,10);

-- CONSULTAR ALUMNOS MATRICULADOS EN LOS CURSOS
SELECT alumnos.nombre,p1.nombre from alumnos LEFT JOIN (SELECT * FROM matricula LEFT JOIN curso ON curso.id = matricula.id_curso ) AS p1  ON alumnos.id=p1.id_alu;

SELECT * FROM alumnos CROSS JOIN curso;

SELECT alumnos.nombre,COALESCE(p1.nombre, 'Nada') from alumnos LEFT JOIN (SELECT * FROM curso LEFT JOIN matricula ON curso.id = matricula.id_curso ) AS p1  ON alumnos.id=p1.id_alu;


-- CONSULTA DE VARIOS Y MARCAR YES O NO SI ESTA EN EL CURSO
-- TAREA PARA PRESENTAR
SELECT c1.anombre,c1.cname,IF(matricula.id_alu IS NULL,'no','yes') from matricula RIGHT JOIN (SELECT alumnos.id as aid,alumnos.nombre as anombre, curso.id as cid, curso.nombre as cname FROM alumnos CROSS JOIN curso) AS c1 ON c1.cid = matricula.id_curso AND c1.aid = matricula.id_alu;




-- CURSO Y CANTIDAD DE MATRICULADOS
SELECT c.nombre, count(*) FROM (SELECT * FROM matricula LEFT JOIN curso ON matricula.id_curso = curso.id ) AS c GROUP BY id_curso;


-- EFICIENCIA 
EXPLAIN SELECT id_curso,count(*) from matricula GROUP by id_curso HAVING id_curso=10;
EXPLAIN SELECT id_curso,count(*) from matricula where id_curso=10 GROUP BY id_curso;

-- EJEMPLO DE VISTA
CREATE VIEW vst_curso AS SELECT id_curso, count(*) FROM matricula GROUP BY id_curso;
SELECT * from vst_curso;


SELECT c1.anombre,c1.cname,IF(matricula.id_alu IS NULL,'no','yes') from matricula  RIGHT JOIN (SELECT alumnos.id as aid,alumnos.nombre as anombre, curso.id as cid, curso.nombre as cname FROM alumnos CROSS JOIN curso) AS c1 ON (c1.cid = matricula.id_curso AND c1.aid = matricula.id_alu) ;




CREATE VIEW c1 AS SELECT alumnos.id as aid,alumnos.nombre as anombre, curso.id as cid, curso.nombre as cname FROM alumnos CROSS JOIN curso
CREATE VIEW c2 AS SELECT c1.anombre,c1.cname,IF(matricula.id_alu IS NULL,'no','yes') from matricula  RIGHT JOIN c1 ON (c1.cid = matricula.id_curso AND c1.aid = matricula.id_alu) ;
SELECT * from c2;
