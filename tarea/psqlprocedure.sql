/*
DROP TABLE IF EXISTS alumnos;
DROP TABLE IF EXISTS curso;
DROP TABLE IF EXISTS matricula;
CREATE TABLE alumnos (
     id serial PRIMARY KEY,
     nombre CHAR(30) NOT NULL
);

CREATE TABLE curso (
     id serial PRIMARY KEY,
     nombre CHAR(30) NOT NULL
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
*/

select * from matricula;
select * from alumnos;


CREATE PROCEDURE insert_data(a integer, b integer)
LANGUAGE SQL
AS $$

$$;

/*CALL insert_data(1, 2);*/


/*CALL insert_data(1);*/
