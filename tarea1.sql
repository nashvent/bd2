CREATE TABLE alumnos (
     id INT NOT NULL AUTO_INCREMENT,
     nombre CHAR(30) NOT NULL,
     PRIMARY KEY (id)
);

CREATE TABLE gustar (
     id1 INT NOT NULL,
     id2 INT NOT NULL
);

INSERT INTO alumnos (nombre) VALUES ('javier');
INSERT INTO alumnos (nombre) VALUES ('renzo');
INSERT INTO alumnos (nombre) VALUES ('ana');
INSERT INTO alumnos (nombre) VALUES ('maria');
INSERT INTO alumnos (nombre) VALUES ('omar');

INSERT INTO gustar (id1,id2) VALUES (1,3);
INSERT INTO gustar (id1,id2) VALUES (3,1);
INSERT INTO gustar (id1,id2) VALUES (2,4);
INSERT INTO gustar (id1,id2) VALUES (5,4);
INSERT INTO gustar (id1,id2) VALUES (4,5);
INSERT INTO gustar (id1,id2) VALUES (2,3);
INSERT INTO gustar (id1,id2) VALUES (1,4);


select nombre from alumnos where id not in(select id2 from gustar);
    
SELECT c1.nombre1, c1.nombre2 FROM( SELECT g.id1,g.id2,p1.nombre AS 'nombre1', p2.nombre AS 'nombre2' FROM alumnos AS p1, alumnos AS p2, gustar AS g WHERE p1.id=g.id1 AND p2.id = g.id2) AS c1 INNER JOIN gustar AS b ON c1.id2=b.id1 AND c1.id1=b.id2;