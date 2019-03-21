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

INSERT INTO matricula (id_alu,id_curso) VALUES (1,10);
INSERT INTO matricula (id_alu,id_curso) VALUES (2,10);
INSERT INTO matricula (id_alu,id_curso) VALUES (3,11);
INSERT INTO matricula (id_alu,id_curso) VALUES (3,10);

-- CONSULTAR ALUMNOS MATRICULADOS EN LOS CURSOS
SELECT alumnos.nombre,p1.nombre from alumnos LEFT JOIN (SELECT * FROM matricula LEFT JOIN curso ON curso.id = matricula.id_curso ) AS p1  ON alumnos.id=p1.id_alu;

SELECT * FROM alumnos CROSS JOIN curso;

SELECT alumnos.nombre,COALESCE(p1.nombre, 'Nada') from alumnos LEFT JOIN (SELECT * FROM matricula CROSS JOIN curso ON curso.id = matricula.id_curso ) AS p1  ON alumnos.id=p1.id_alu;


-- CONSULTA DE VARIOS Y MARCAR YES O NO SI ESTA EN EL CURSO

SELECT alumnos.nombre,p1.nombre from alumnos CROSS JOIN (SELECT * FROM matricula LEFT JOIN curso ON curso.id = matricula.id_curso ) AS p1 ORDER BY (alumnos.nombre);
