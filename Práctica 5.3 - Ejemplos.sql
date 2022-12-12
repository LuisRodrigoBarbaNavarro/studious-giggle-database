/* USE maquina_expendedora */
USE maquina_expendedora;

-- Parámetros de entrada
DROP PROCEDURE IF EXISTS obtener_clientes_por_institucion;
DELIMITER $$
CREATE PROCEDURE obtener_clientes_por_institucion
(
IN id_institucion INT
)
BEGIN	
	SELECT *
    FROM cliente
    WHERE cliente.id_institucion = id_institucion;
END $$ DELIMITER ;

CALL obtener_clientes_por_institucion(1010);

-- Parámetros de salida
DROP PROCEDURE IF EXISTS contar_clientes_por_institucion;
DELIMITER $$
CREATE PROCEDURE contar_clientes_por_institucion
(
IN id_institucion INT,
OUT numero INT
)
BEGIN
	SELECT count(id_cliente) INTO numero
	FROM cliente
	 WHERE cliente.id_institucion = id_institucion;
END $$ DELIMITER ;

CALL contar_clientes_por_institucion(1010, @numero);
SELECT "1010", @numero;

-- Parámetro de entrada y salida
DROP PROCEDURE IF EXISTS acumulado_venta_producto;
DELIMITER $$
CREATE PROCEDURE acumulado_venta_producto
(
INOUT subtotal DOUBLE,
IN id_maquina INT,
IN id_producto INT,
IN cantidad INT
)
BEGIN 
	SELECT precio_unitario INTO @precio
	FROM inventario_maquina
	WHERE inventario_maquina.id_producto = id_producto AND inventario_maquina.id_maquina = id_maquina;
	SET subtotal = subtotal + cantidad * @precio;
END $$ DELIMITER ;


-- Demostración

SELECT * FROM inventario_maquina;

SET @total = 0;
CALL acumulado_venta_producto(@total, 4010, 159001, 2);
CALL acumulado_venta_producto(@total, 4010, 159002, 6);
CALL acumulado_venta_producto(@total, 4010, 159003, 1);
CALL acumulado_venta_producto(@total, 4010, 159003, 1);

SELECT "Puntos:", @total;