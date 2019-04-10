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



/******* TRIGGER ALUMNOS ********/
DELIMITER //
Create Trigger ins_alumnos BEFORE INSERT ON alumnos FOR EACH ROW
BEGIN
INSERT INTO auditoria (tabla,columna,val_nuevo) VALUES ('alumnos','nombre',NEW.nombre);
END //

DELIMITER //
Create Trigger upd_alumnos BEFORE UPDATE ON alumnos FOR EACH ROW
BEGIN
INSERT INTO auditoria (tabla,columna,val_ant,val_nuevo) VALUES ('alumnos','nombre',OLD.nombre,NEW.nombre);
END //

DELIMITER //
Create Trigger del_alumnos BEFORE DELETE ON alumnos FOR EACH ROW
BEGIN
INSERT INTO auditoria (tabla,columna,val_ant) VALUES ('alumnos','nombre',OLD.nombre);
END //


/******* TRIGGER CURSOS ********/
DELIMITER //
Create Trigger ins_curso BEFORE INSERT ON curso FOR EACH ROW
BEGIN
INSERT INTO auditoria (tabla,columna,val_nuevo) VALUES ('curso','nombre',NEW.nombre);
END //

DELIMITER //
Create Trigger upd_curso BEFORE UPDATE ON curso FOR EACH ROW
BEGIN
INSERT INTO auditoria (tabla,columna,val_ant,val_nuevo) VALUES ('curso','nombre',OLD.nombre,NEW.nombre);
END //

DELIMITER //
Create Trigger del_curso BEFORE DELETE ON curso FOR EACH ROW
BEGIN
INSERT INTO auditoria (tabla,columna,val_ant) VALUES ('curso','nombre',OLD.nombre);
END //


/******* TRIGGER MATRICULLA ********/
DELIMITER //
Create Trigger ins_matricula BEFORE INSERT ON matricula FOR EACH ROW
BEGIN
INSERT INTO auditoria (tabla,columna,val_nuevo) VALUES ('matricula','id_alu',NEW.id_alu);
INSERT INTO auditoria (tabla,columna,val_nuevo) VALUES ('matricula','id_curso',NEW.id_curso);
END //


DELIMITER //
Create Trigger upd_matricula BEFORE UPDATE ON matricula FOR EACH ROW
BEGIN
INSERT INTO auditoria (tabla,columna,val_ant,val_nuevo) VALUES ('matricula','id_alu',OLD.id_alu,NEW.id_alu);
INSERT INTO auditoria (tabla,columna,val_ant,val_nuevo) VALUES ('matricula','id_curso',OLD.id_curso,NEW.id_curso);
END //

DELIMITER //
Create Trigger del_matricula BEFORE DELETE ON matricula FOR EACH ROW
BEGIN
INSERT INTO auditoria (tabla,columna,val_ant) VALUES ('matricula','id_alu',OLD.id_alu);
INSERT INTO auditoria (tabla,columna,val_ant) VALUES ('matricula','id_curso',OLD.id_curso);
END //


INSERT INTO alumnos (nombre) VALUES ('nacho');
INSERT INTO matricula (id_alu,id_curso) VALUES (3,10);

/*
DELIMITER //
Create Trigger antes_ins_alumnos BEFORE INSERT ON alumnos FOR EACH ROW
BEGIN
IF NEW.age < 0 THEN SET NEW.age = 0;
END IF;
END //
*/