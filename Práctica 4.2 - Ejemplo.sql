/* USE 'maquina_expendedora' */
USE maquina_expendedora;

-- Iniciar sesión con user_1_4.2 --

/* Inicie una transacción: */
START TRANSACTION;

/* Realiza la siguiente actualización de los datos: */
UPDATE tarjeta SET puntos=777 WHERE id_cliente=20490687 AND estatus = "Habilitada";

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM tarjeta;
SELECT count(*) FROM tarjeta;

-- Iniciar sesión con user_2_4.2 --

/* Inicie una nueva transacción: */
START TRANSACTION;

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM tarjeta;
SELECT count(*) FROM tarjeta;

/* Realiza la siguiente actualización de los datos: */
UPDATE tarjeta SET puntos=1 WHERE id_cliente=20490687 AND estatus = "Habilitada";

-- ¿Qué está ocurriendo?

-- Regresar con user_1_4.2 --

/* Compremete los datos con comando COMMIT */
COMMIT;

-- Regresar con user_2_4.2 --

-- ¿Qué sucedió con la actualización?

/* Compremete los datos con comando COMMIT */
COMMIT;

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM tarjeta;
SELECT count(*) FROM tarjeta;
