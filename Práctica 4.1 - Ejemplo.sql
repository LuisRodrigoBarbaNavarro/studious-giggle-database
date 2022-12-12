/* USAR 'maquina_expendedora' */
USE maquina_expendedora;

/* Verifique el contenido de la tabla y la cantidad de registros: */
SELECT * FROM cliente;
SELECT count(*) FROM cliente;

/* Inicie una transacción (Cada una de las siguientes instrucciones deben ser realizadas de manera consecutiva hasta): */
START TRANSACTION;

/* Realice las siguientes inserciones: */
INSERT INTO `maquina_expendedora`.`cliente` VALUES (2, 1010, 'Johan Antonio', 'Gurrola', 'Bernal');
INSERT INTO `maquina_expendedora`.`cliente` VALUES (3, 1010, 'Alejandro', 'Lira', 'Lopez');

/* Verifique nuevamente la tabla: */
SELECT * FROM cliente;
SELECT count(*) FROM cliente;

/* Realice un commit: */
COMMIT;

/* Verifique nuevamente la tabla: */
SELECT * FROM cliente;
SELECT count(*) FROM cliente;

# # # # # # # # # # # # # # # # # # # # # # # # # # # #

/* Inicie una nueva transacción */
START TRANSACTION;

/* Realice las siguientes inserciones: */
INSERT INTO `maquina_expendedora`.`cliente` VALUES (4, 1010, 'Luis', 'Barba', 'Navarro');
INSERT INTO `maquina_expendedora`.`cliente` VALUES (5, 1010, 'Mario', 'Navarro', 'Ruíz');

/* Verifique nuevamente la tabla: */
SELECT * FROM cliente;
SELECT count(*) FROM cliente;

/* Realice un rollback: */
ROLLBACK;

/* Verifique nuevamente la tabla: */
SELECT * FROM cliente;
SELECT count(*) FROM cliente;

# # # # # # # # # # # # # # # # # # # # # # # # # # # #

/* Inicie una nueva transacción */
START TRANSACTION;

/* Verifique la tabla: */
SELECT * FROM tarjeta;
SELECT count(*) FROM tarjeta;

/* Destruya la tabla: */
DROP TABLE tarjeta;

/* Realice un rollback: */
ROLLBACK;

/* Verifique nuevamente la tabla: */
SELECT * FROM tarjeta;
SELECT count(*) FROM tarjeta;