/* USE maquina_expendedora */
USE maquina_expendedora;

DROP PROCEDURE IF EXISTS handler_insertar_cliente
/*
Procedimiento almacenado que hace llamar a manejador cuando se ingresa un
identificador de cliente que ya está en la tabla 'cliente' (Duplicado).
*/
DELIMITER //
CREATE PROCEDURE handler_insertar_cliente 
(
	IN id_cliente INT,
	IN id_institucion INT,
	IN nombre_cliente VARCHAR(64),
	IN apellido_paterno VARCHAR(64),
	IN apellido_materno VARCHAR(64)
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLSTATE '23000'
	BEGIN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Error. Identificador de cliente duplicado.';
	END;
	
    INSERT INTO cliente VALUES (id_cliente, id_institucion, nombre_cliente, apellido_paterno, apellido_materno);
    SELECT "Inserción de cliente concluida satisfactoriamente." AS "";
END //
DELIMITER ;

-- Demostración
SELECT * FROM cliente;
CALL handler_insertar_cliente(20490687, 1010, "Luis", "Barba", "Navarro");

DROP PROCEDURE IF EXISTS handler_asignar_tarjeta;
DELIMITER //
CREATE PROCEDURE handler_asignar_tarjeta
(
	IN id_tarjeta INT,
    IN id_cliente INT
)
BEGIN
	-- Tarjeta duplicada.
    DECLARE EXIT HANDLER
    FOR 1062
    SELECT 'Identificador de tarjeta duplicado.' AS "";
    
    -- Cliente no encontrado.
    DECLARE EXIT HANDLER
    FOR 1452
    SELECT 'Identificador de cliente no encontrado.' AS "";
    
    INSERT tarjeta VALUES (id_tarjeta, id_cliente, CURRENT_DATE(), 0, 'Habilitada');
    SELECT 'Tarjeta asignada satisfactoriamente.';
END //
DELIMITER ;

-- Demostración
SELECT * FROM tarjeta;
CALL handler_asignar_tarjeta(10, 20490687);