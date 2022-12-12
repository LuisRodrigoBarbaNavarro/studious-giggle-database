/* USE 'mydb' */
USE mydb;

# # # # # # # # # # # # # # # # # # # # # # # # # # # #
-- Problema A
# # # # # # # # # # # # # # # # # # # # # # # # # # # #

-- Iniciar sesión con user_1_4.2 --

/* Inicie una transacción: */
START TRANSACTION;

/* Realice las siguientes insersiones: */
INSERT INTO `mydb`.`empleado` (`IdEmpleado`, `nombre`, `salario`) VALUES ('100', 'CARLOS LOPEZ', '1000');
INSERT INTO `mydb`.`empleado` (`IdEmpleado`, `nombre`, `salario`) VALUES ('200', 'JUAN PEREZ', '1000');

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

-- Iniciar sesión con user_2_4.2 --

/* Inicie una nueva transacción: */
START TRANSACTION;

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

/* Realice las siguientes insersiones: */
INSERT INTO `mydb`.`empleado` (`IdEmpleado`, `nombre`, `salario`) VALUES ('300', 'MARIA GOMEZ', '1000');
INSERT INTO `mydb`.`empleado` (`IdEmpleado`, `nombre`, `salario`) VALUES ('400', 'GABRIELA ARENAS', '1000');

-- Regresar a user_1_4.2

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

/* Compremete los datos con comando COMMIT */
COMMIT;

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

-- Regresar a user_2_4.2

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

/* Compremete los datos con comando COMMIT */
COMMIT;

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

-- Regresar a user_1_4.2

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

# # # # # # # # # # # # # # # # # # # # # # # # # # # #
-- Problema B
# # # # # # # # # # # # # # # # # # # # # # # # # # # #

-- Iniciar sesión con user_1_4.2 --

/* Inicie una transacción: */
START TRANSACTION;

/* Realiza la siguiente actualización de los datos: */
UPDATE empleado SET salario=6000 WHERE IdEmpleado=400;

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

-- Iniciar sesión con user_2_4.2 --

/* Inicie una nueva transacción: */
START TRANSACTION;

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;

/* Realiza la siguiente actualización de los datos: */
UPDATE empleado SET salario=4500 WHERE IdEmpleado=400;

-- ¿Qué está ocurriendo?

-- Regresar con user_1_4.2 --

/* Compremete los datos con comando COMMIT */
COMMIT;

-- Regresar con user_2_4.2 --

-- ¿Qué sucedió con la actualización?

/* Compremete los datos con comando COMMIT */
COMMIT;

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM empleado;
SELECT count(*) FROM empleado;