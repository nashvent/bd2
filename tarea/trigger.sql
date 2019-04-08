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



CREATE TABLE auditoria (
     id INT NOT NULL AUTO_INCREMENT,
     tabla CHAR(30),
     columna CHAR(30),
     val_ant CHAR(30),
     val_nuevo CHAR(30),
     tstamp TIMESTAMP,
     PRIMARY KEY (id)
);

DROP TRIGGER antes_ins_alumnos;
SHOW triggers;

/******* TRIGGER ********/
DELIMITER //
Create Trigger ins_alumnos BEFORE INSERT ON alumnos FOR EACH ROW
BEGIN
INSERT INTO auditoria (tabla,columna,val_nuevo) VALUES ('alumnos','nombre',NEW.nombre);
END //

DELIMITER //
Create Trigger upd_alumnos BEFORE UPDATE ON alumnos FOR EACH ROW
BEGIN
INSERT INTO auditoria (tabla,columna,val_ant,val_nuevo) VALUES ('alumnos','nombre',NEW.nombre);
END //


INSERT INTO alumnos (nombre) VALUES ('nash');

/*
DELIMITER //
Create Trigger antes_ins_alumnos BEFORE INSERT ON alumnos FOR EACH ROW
BEGIN
IF NEW.age < 0 THEN SET NEW.age = 0;
END IF;
END //
*/