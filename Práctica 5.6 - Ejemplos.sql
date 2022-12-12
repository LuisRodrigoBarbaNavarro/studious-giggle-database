/* USE maquina_expendedora */
USE maquina_expendedora;

DROP TRIGGER IF EXISTS asignar_tarjeta_AI;
/*
Disparador que se activa cuando creamos un cliente nuevo, nos permite
crear y asignar una tarjeta al nuevo cliente con quince puntos de regalo.
*/
DELIMITER //
CREATE TRIGGER asignar_tarjeta_AI AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
	DECLARE final_id_tarjeta INT;
    SET final_id_tarjeta = (SELECT id_tarjeta FROM tarjeta ORDER BY id_tarjeta DESC LIMIT 1);
    
	IF NEW.id_cliente IS NOT NULL THEN
		INSERT INTO tarjeta VALUES 
        (
			(final_id_tarjeta) + 1,
            NEW.id_cliente,
            CURRENT_DATE(),
            15,
            "Habilitada"
        );
	END IF;
END //
DELIMITER ;   

-- Demostración
SELECT * FROM cliente;
SELECT * FROM tarjeta;
DELETE FROM cliente WHERE id_cliente = 1;

INSERT INTO cliente (id_cliente, nombre_cliente, apellido_paterno, apellido_materno) VALUES (3, "Rodrigo", "Barba", "Navarro");

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

DROP TRIGGER IF EXISTS validar_saldo_tarjeta_AD;
/*
Disparador que valida el saldo de la tarjeta para que no sea menor o igual a 0
o en su defecto, que sobrepase 9999 por desbordamiento, esto se realizará antes
de hacer una actualización sobre la tabla 'tarjeta'.
*/
DELIMITER //
CREATE TRIGGER validar_saldo_tarjeta_AD BEFORE UPDATE ON tarjeta
FOR EACH ROW
BEGIN   
	IF NEW.puntos <= 0 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Error. Saldo ingresado no es válido.';
	END IF;
    
    IF NEW.puntos >= 9999 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Error. Saldo ingresado supera el límite de lo establecido.';
	END IF;
END //
DELIMITER ;

-- Demostración
SELECT * FROM tarjeta;

UPDATE tarjeta
SET puntos = puntos + (9999)
WHERE id_cliente = 20490687 AND estatus = "Habilitada";

UPDATE tarjeta
SET puntos = -1
WHERE id_cliente = 20490687 AND estatus = "Habilitada";