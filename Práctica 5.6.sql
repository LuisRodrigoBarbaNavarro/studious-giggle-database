USE mydb;

DROP TABLE IF EXISTS departamentos;
CREATE TABLE departamentos (
  IdDepto int NOT NULL,
  nombre varchar(25) NOT NULL,
  total_salario double NOT NULL,
  PRIMARY KEY (IdDepto)
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

DROP TABLE IF EXISTS empleado;
CREATE TABLE empleado (
  IdEmpleado int NOT NULL,
  nombre varchar(15) NOT NULL,
  superId int DEFAULT NULL,
  salario double NOT NULL,
  IdDepto int DEFAULT NULL,
  PRIMARY KEY (IdEmpleado),
  KEY deptosIdx (IdDepto),
  CONSTRAINT deptosIdx FOREIGN KEY (IdDepto) REFERENCES departamentos (IdDepto)
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

INSERT INTO departamentos (IdDepto, nombre, total_salario) VALUES (1, 'produccion', '0');
INSERT INTO departamentos (IdDepto, nombre, total_salario) VALUES (2, 'ventas', '0');
INSERT INTO departamentos (IdDepto, nombre, total_salario) VALUES (3, 'almacen', '0');
INSERT INTO departamentos (IdDepto, nombre, total_salario) VALUES (4, 'administrativo', '0');

SELECT * FROM departamentos;

DROP TRIGGER IF EXISTS actualiza_salario_deptoAI;
delimiter //
CREATE TRIGGER actualiza_salario_deptoAI AFTER INSERT on empleado
       FOR EACH ROW
       BEGIN
           IF new.idDepto is not null  THEN
             update departamentos set total_salario=total_salario+new.salario
               where departamentos.IdDepto=new.IdDepto; 
           END IF;
       END;//
delimiter ;

INSERT INTO empleado (IdEmpleado, nombre, salario, IdDepto) VALUES ('100', 'CARLOS LOPEZ', '1900', '1');
INSERT INTO empleado (IdEmpleado, nombre, salario, IdDepto) VALUES ('200', 'JUAN PEREZ', '1800', '2');
INSERT INTO empleado (IdEmpleado, nombre, salario, IdDepto) VALUES ('300', 'MARIA GOMEZ', '2000', '3');
INSERT INTO empleado (IdEmpleado, nombre, salario, IdDepto) VALUES ('400', 'GABRIELA ARENAS', '1300', '4');

select * from departamentos;

DROP TRIGGER IF EXISTS actualiza_salario_deptoAU;
delimiter //
CREATE TRIGGER actualiza_salario_deptoAU AFTER UPDATE on empleado
       FOR EACH ROW
       BEGIN
           IF old.idDepto is not null  THEN
             update departamentos set total_salario=total_salario-old.salario
               where departamentos.IdDepto=old.IdDepto; 
           END IF;
          IF new.idDepto is not null  THEN
             update departamentos set total_salario=total_salario+new.salario
                where departamentos.IdDepto=new.IdDepto; 
           END IF;
       END;//
delimiter ;

UPDATE empleado SET salario = '2000' WHERE (IdEmpleado = '100');
UPDATE empleado SET IdDepto = '3' WHERE (IdEmpleado = '400');

select * from departamentos;

DROP TRIGGER IF EXISTS actualiza_salario_deptoAD;
delimiter //
CREATE TRIGGER actualiza_salario_deptoAD AFTER  DELETE on empleado
FOR EACH ROW
BEGIN
IF old.idDepto is not null  THEN
update departamentos set total_salario=total_salario-old.salario
where departamentos.IdDepto=old.IdDepto; 
END IF;
END;//
delimiter ;

delete from empleado where (IdEmpleado = '100');

select * from departamentos;

drop TRIGGER if exists valida_sueldo_BU;
delimiter //
CREATE TRIGGER valida_sueldo_BU BEFORE update on empleado
FOR EACH ROW
BEGIN   
IF new.salario<=0  THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Error en sueldo';
END IF;
END;//
delimiter ;

UPDATE empleado SET salario = -10 WHERE (IdEmpleado = '200');

select * from empleado;
select * from departamentos;