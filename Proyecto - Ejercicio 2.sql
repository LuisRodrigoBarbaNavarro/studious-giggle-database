-- Usar maquina_expendedora
USE maquina_expendedora;

/*
TO-DO:
Escriba un trigger que al solicitar un alta de un producto en un determinado slot de una maquina valide que no se sobrepase de 
la capacidad, que ese slot exista y que sea el mismo producto, en caso de ocurrir lance un error. Considere que la capacidad de 
los slots es de 30 productos y que son 80 slots por máquina.
*/

-- Procedimiento almacenado para mostrar inventario de una máquina expendedora en específico;
DROP PROCEDURE IF EXISTS show_inventory_vending
DELIMITER //
CREATE PROCEDURE show_inventory_vending
(
	IN id_maquina VARCHAR(4)
)
BEGIN
	SELECT * 
	FROM inventario_maquina
		INNER JOIN producto using (id_producto)
			INNER JOIN categoria using (id_categoria)
	WHERE inventario_maquina.id_maquina = id_maquina;
END //
DELIMITER ;

-- Procedimiento almacenado para dar alta de un producto en un slot de máquina expendedora;
DROP PROCEDURE IF EXISTS add_product;
DELIMITER //
CREATE PROCEDURE add_product
(
	IN id_maquina VARCHAR(4),
	IN id_producto INT,
	IN numero_slot VARCHAR(3),
	IN cantidad INT
)
BEGIN
	IF 
    (
		SELECT count(*)
        FROM inventario_maquina
        WHERE inventario_maquina.numero_slot = numero_slot
        AND inventario_maquina.id_maquina = id_maquina
    ) > 0 
    THEN
		IF 
		(
			SELECT count(*)
			FROM inventario_maquina
			WHERE inventario_maquina.numero_slot = numero_slot
			AND inventario_maquina.id_producto = id_producto
			AND inventario_maquina.id_maquina = id_maquina
		) > 0
		THEN
			UPDATE inventario_maquina
			SET inventario_maquina.cantidad = inventario_maquina.cantidad + cantidad
			WHERE inventario_maquina.id_maquina = id_maquina
			AND inventario_maquina.id_producto = id_producto
			AND inventario_maquina.numero_slot = numero_slot;
		ELSE
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error. Producto agregado no coincide con el producto que se encontraba anteriormente.';
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Error. Número de slot no existe';
	END IF;
END //
DELIMITER  ;

-- Disparador que valida que no se sobrepase de la capacidad, que el slot exista y que sea el mismo producto;
DROP TRIGGER IF EXISTS verify_capability_BU;
DELIMITER //
CREATE TRIGGER verify_capability_BU BEFORE UPDATE on inventario_maquina
FOR EACH ROW
BEGIN
	IF new.cantidad > 30 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Error. Se excedió la capacidad del slot en la máquina expendedora.';
	END IF;
END //
DELIMITER ;

-- Demostración
CALL show_inventory_vending('4010');
CALL add_product('4010', 159001, 'A02', 8);
