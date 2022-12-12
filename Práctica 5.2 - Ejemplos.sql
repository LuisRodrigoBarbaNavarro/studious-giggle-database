/* USE maquina_expendedora */
USE maquina_expendedora;

DROP PROCEDURE IF EXISTS invertir_nombre_cliente;
DROP PROCEDURE IF EXISTS invertir_nombre_cliente_2;

DELIMITER //
CREATE PROCEDURE invertir_nombre_cliente
(
IN cliente INTEGER
)
BEGIN
	DECLARE nombre_cliente VARCHAR(20);
    SELECT cliente.nombre_cliente INTO nombre_cliente
    FROM cliente 
    WHERE id_cliente = cliente;
    CALL reverse_procedure(nombre_cliente, @reversed, @length);
    UPDATE cliente SET cliente.nombre_cliente = @reversed
    WHERE id_cliente = cliente;
END // DELIMITER ;

DELIMITER $$

CREATE PROCEDURE invertir_nombre_cliente_2
(
IN cliente INTEGER
)
BEGIN
	DECLARE nombre_cliente VARCHAR(20);
    DECLARE inverso VARCHAR(20);
	SELECT cliente.nombre_cliente INTO nombre_cliente
    FROM cliente 
    WHERE id_cliente = cliente;
    CALL reverse_procedure(nombre_cliente, inverso, @length);
    UPDATE cliente SET cliente.nombre_cliente = inverso
    WHERE id_cliente = cliente;
END $$ DELIMITER ;

-- Demostración
SELECT * FROM cliente;
CALL invertir_nombre_cliente(20490687);
CALL invertir_nombre_cliente_2(20490689);