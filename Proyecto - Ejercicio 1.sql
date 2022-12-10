-- Usar maquina_expendedora
USE maquina_expendedora;

/*
TO-DO
-- Escriba un trigger que al dar de alta una tarjeta nueva a un cliente, deshabilite todas las tarjetas que tenga y transfiera el saldo a la nueva tarjeta.
1. Asignar una nueva tarjeta al cliente, si tiene otra, el procedimiento debe desactivarla y transferir dinero a nueva tarjeta.
2. Si el identificador de la tarjeta nueva está duplicado, enviar mensaje de error.
3. Si el cliente no existe, enviar mensaje de error.
*/

-- Procedimiento que asigna tarjeta a un cliente.
DROP PROCEDURE IF EXISTS assign_card;
DELIMITER //
CREATE PROCEDURE assign_card
(
	IN id_tarjeta INT,
	IN id_cliente INT
)
BEGIN
	-- Tarjeta duplicada.
    DECLARE EXIT HANDLER
    FOR 1062
    BEGIN
		SELECT 'Identificador de tarjeta duplicado.';
		ROLLBACK;
    END;

    -- Cliente no encontrado.
    DECLARE EXIT HANDLER
    FOR 1452
    BEGIN
		SELECT 'Identificador de cliente no encontrado.';
		ROLLBACK;
    END;
    
    START TRANSACTION;
    SET @puntos = 0;
    SELECT count(*) INTO @conteo FROM tarjeta WHERE tarjeta.id_cliente = id_cliente AND estatus = 'Habilitada';
    IF @conteo > 0
		THEN CALL get_points(id_tarjeta, id_cliente, @puntos);
	END IF;
    INSERT tarjeta VALUES (id_tarjeta, id_cliente, CURRENT_DATE(), @puntos, 'Habilitada');
    SELECT 'Tarjeta agregada satisfactoriamente.';
    COMMIT;
END //
    
DELIMITER ;

-- Procedimiento obtiene los puntos de las tarjetas habilitadas del cliente.
DROP PROCEDURE IF EXISTS get_points;
DELIMITER //
CREATE PROCEDURE get_points
(
IN id_tarjeta INT,
IN id_cliente INT,
OUT puntos INT
)
BEGIN
	SELECT sum(tarjeta.puntos)
    INTO puntos
	FROM tarjeta
    WHERE estatus = 'Habilitada' AND tarjeta.id_cliente = id_cliente;
    
    UPDATE tarjeta
	SET tarjeta.puntos = 0, tarjeta.estatus = 'Deshabilitada'
	WHERE tarjeta.id_cliente = id_cliente AND tarjeta.estatus = "Habilitada";
END //
    
DELIMITER ;

-- Llamado del procedimiento almacenado
SHOW TRIGGERS;
CALL assign_card(17, 20490687);
