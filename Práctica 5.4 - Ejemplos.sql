/* USE maquina_expendedora */
USE maquina_expendedora;

-- Estructura IF.
/*
Procedimiento almacenado que se encarga de verificar si un cliente en específico tiene
tarjetas inhabilitadas, si es así, te menciona cuántas tarjetas inhabilitadas tiene.
*/
DROP PROCEDURE IF EXISTS verificar_tarjetas_inhabilitadas;
DELIMITER //
CREATE PROCEDURE verificar_tarjetas_inhabilitadas (IN id_cliente INT)    
BEGIN
	DECLARE tarjetas_inhabilitadas INT;
	IF ((SELECT estatus FROM tarjeta WHERE tarjeta.id_cliente = id_cliente AND estatus = 'Deshabilitada' LIMIT 1) = 'Deshabilitada')
		THEN
			BEGIN
				SELECT count(*) INTO tarjetas_inhabilitadas
				FROM tarjeta 
				WHERE tarjeta.id_cliente = id_cliente AND estatus = 'Deshabilitada';
                SELECT "Hay tarjetas inhabilitadas: " AS "", tarjetas_inhabilitadas AS "Cantidad";
            END;
		ELSE SELECT "No hay tarjetas inhabilitadas.";
	END IF;
END; //
DELIMITER ;

-- Demostración - Estructura IF.
SELECT * FROM tarjeta;
CALL verificar_tarjetas_inhabilitadas(20490688);

-- Estructura CASE.
/*
Procedimiento almacenado que se encarga de actualizar el precio unitario en caso de que sea mayor a 35, 
si es así, se aumentará el precio 16% según el impuesto aplicado. Se pedirá como parámetro de entrada
el identificador del artículo.
*/
DROP PROCEDURE IF EXISTS agregar_impuesto_producto;
DELIMITER $$
CREATE PROCEDURE agregar_impuesto_producto (IN id_producto VARCHAR(8))
BEGIN
	SELECT id_maquina, id_producto, precio_unitario, 
    CASE
		WHEN precio_unitario > 35
			THEN precio_unitario * 1.16
			ELSE "N/A"
	END AS "precio_actualizado"
	FROM inventario_maquina
    WHERE inventario_maquina.id_producto = id_producto ;
END; $$
DELIMITER ;

-- Demostración
SELECT * FROM inventario_maquina;
CALL agregar_impuesto_producto(159001);

-- Estructura WHILE
/*
Procedimiento almacenado que se encarga de obtener el costo total a partir de la sumatoria 
del costo del producto multiplicada por su respectiva cantidad en una máquina en específico
dada por el usuario.
*/
DROP PROCEDURE IF EXISTS costo_total_maquina;
DELIMITER //
CREATE PROCEDURE costo_total_maquina
(
IN id_maquina VARCHAR(4)
)
BEGIN
	DECLARE precio_total INT;
	DECLARE precio_obtenido INT;
    DECLARE cantidad_total INT;
	DECLARE i INT;
	
    SET i = (SELECT id_producto FROM inventario_maquina WHERE inventario_maquina.id_maquina = id_maquina ORDER BY id_producto LIMIT 1);
    SET precio_total = 0;
    SET precio_obtenido = 0;
    SET cantidad_total = 0;
	
    WHILE i <= (SELECT id_producto FROM inventario_maquina WHERE inventario_maquina.id_maquina = id_maquina ORDER BY id_producto DESC LIMIT 1) DO
        SELECT precio_unitario, cantidad INTO precio_obtenido, cantidad_total
        FROM inventario_maquina
        WHERE id_producto = i AND inventario_maquina.id_maquina = id_maquina;
		
        SET precio_total = precio_total + precio_obtenido * cantidad_total;
		
        SET i = i + 1;
	END WHILE;
    
    SELECT id_maquina AS "Máquina", precio_total AS "Costo Total en Puntos";
END; //
DELIMITER ;

-- Demostración
SELECT * FROM inventario_maquina;
CALL costo_total_maquina('4010');

-- Estructura REPEAT
/*
Procedimiento almacenado que nos permite obtener el total facturado, 
mediante la sumatoria del costo total de todas las facturas que se 
han generado.
*/
DROP PROCEDURE IF EXISTS total_facturado;
DELIMITER //
CREATE PROCEDURE total_facturado()
BEGIN
	DECLARE total_facturado INT;
    DECLARE total_facturado_cliente INT;
	DECLARE i INT;
	
    SET i = (SELECT id_cliente FROM cliente ORDER BY id_cliente LIMIT 1);
    SET total_facturado = 0;

	REPEAT
		SET total_facturado_cliente = 0;
		
        SELECT sum(precio_unitario * detalle.cantidad) INTO total_facturado_cliente
		FROM factura
		INNER JOIN detalle using(id_factura)
			INNER JOIN inventario_maquina using(id_maquina, id_producto)
		WHERE id_cliente = i
		GROUP BY id_cliente;
			
		SET total_facturado = total_facturado + total_facturado_cliente;
			
		SET i = i + 1;
	UNTIL i >= (SELECT id_cliente FROM cliente ORDER BY id_cliente DESC LIMIT 1) 
	END REPEAT;
    
    SELECT total_facturado AS 'Total Facturado';
END; //
DELIMITER ;

-- Demostración
SELECT *
FROM factura
	INNER JOIN detalle using(id_factura)
		INNER JOIN inventario_maquina using(id_maquina, id_producto);
CALL total_facturado();

SELECT * FROM cliente;

-- Estructura ITERATE
/*
Procedimiento almacenado que nos permite obtener saldo total
de las tarjetas inhabilitadas.
*/
DROP PROCEDURE IF EXISTS saldo_total_tarjetas_inhabilitadas;
DELIMITER $$
CREATE PROCEDURE saldo_total_tarjetas_inhabilitadas ()
BEGIN
	DECLARE total INT;
	DECLARE i INT;
    
    SET total = 0;
    SET i = (SELECT DISTINCT id_cliente FROM tarjeta WHERE estatus = "Deshabilitada" LIMIT 1);
	
	label_1: LOOP
	
    SET total = total + 
    (
		SELECT sum(puntos)
		FROM tarjeta
		WHERE estatus = "Deshabilitada"
		AND id_cliente = i
    );
    
    SET i = i + 1;
    
    IF i <= (SELECT DISTINCT id_cliente FROM tarjeta WHERE estatus = "Deshabilitada" ORDER BY id_cliente DESC LIMIT 1) THEN
		ITERATE label_1;
	END IF;
   
	LEAVE label_1;
    END LOOP label_1;
    
    SELECT total AS "Saldo total en tarjetas deshabilitadas";
END $$
DELIMITER ;

-- Demostración
SELECT id_cliente, sum(puntos)
FROM tarjeta
WHERE estatus = "Deshabilitada"
GROUP BY id_cliente;

CALL saldo_total_tarjetas_inhabilitadas();