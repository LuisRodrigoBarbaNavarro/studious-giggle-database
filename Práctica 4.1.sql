/* USAR 'mydb' */
USE mydb;

/* Crear las tablas departamentos y empleado: */
DROP TABLE IF EXISTS departamentos;
CREATE TABLE departamentos
(
	IdDepto int NOT NULL,
	nombreDepartamento  varchar(15) NOT NULL,
	PRIMARY KEY (IdDepto)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS empleado;
CREATE TABLE empleado
(
	IdEmpleado int NOT NULL,
	nombre varchar(15) NOT NULL,
	superId int DEFAULT NULL,
	salario double NOT NULL,
	IdDepto int DEFAULT NULL,
	PRIMARY KEY (IdEmpleado),

	KEY deptosIdx (IdDepto),
	CONSTRAINT deptosIdx 
    FOREIGN KEY (IdDepto) 
		REFERENCES departamentos (IdDepto)
) ENGINE = InnoDB;

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

/* Inicie una transacción (Cada una de las siguientes instrucciones deben ser realizadas de manera consecutiva hasta): */
START TRANSACTION;

/* Realice las siguientes inserciones: */
INSERT INTO `mydb`.`empleado` (`IdEmpleado`, `nombre`, `salario`) VALUES ('100', 'CARLOS LOPEZ', '1000');
INSERT INTO `mydb`.`empleado` (`IdEmpleado`, `nombre`, `salario`) VALUES ('200', 'JUAN PEREZ', '1000');

/* Verifique nuevamente la tabla: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

/* Realice un commit: */
COMMIT;

/* Verifique nuevamente la tabla: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

# # # # # # # # # # # # # # # # # # # # # # # # # # # #

/* Inicie una nueva transacción */
START TRANSACTION;

/* Realice las siguientes inserciones: */
INSERT INTO `mydb`.`empleado` (`IdEmpleado`, `nombre`, `salario`) VALUES ('300', 'MARIA GOMEZ', '1000');
INSERT INTO `mydb`.`empleado` (`IdEmpleado`, `nombre`, `salario`) VALUES ('400', 'GABRIELA ARENAS', '1000');

/* Verifique nuevamente la tabla: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

/* Realice un rollback: */
ROLLBACK;

/* Verifique nuevamente la tabla: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

# # # # # # # # # # # # # # # # # # # # # # # # # # # #

/* Inicie una nueva transacción */
START TRANSACTION;

/* Destruya la tabla: */
DROP TABLE empleado;

/* Realice un rollback: */
ROLLBACK;

/* Verifique nuevamente la tabla: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;