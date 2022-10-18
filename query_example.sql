USE maquina_expendedora;

SELECT * FROM institucion; #Listo
SELECT * FROM cliente; #Listo
SELECT * FROM categoria; #Listo
SELECT * FROM promocion; #Listo
SELECT * FROM maquina; #Listo
SELECT * FROM tarjeta; #Listo
SELECT * FROM detalle_promocion; #Listo
SELECT * FROM producto; #Listo
SELECT * FROM inventario_maquina; #Listo
SELECT * FROM factura; #Listo
SELECT * FROM detalle; #Listo

/* --- Ejemplo de funcionamiento --- */
SELECT id_maquina, id_factura, id_producto, nombre_producto, detalle.cantidad, precio_unitario, (detalle.cantidad * precio_unitario) AS subtotal
FROM factura
INNER JOIN detalle using (id_factura)
	INNER JOIN inventario_maquina using(id_producto, id_maquina)
		INNER JOIN producto using(id_producto)
WHERE detalle.id_producto = '159002';

/* --- Workspace (Inserción de precio reducido en detalle_precio) --- */
DROP TABLE IF EXISTS maquina_expendedora.temp_table;
CREATE TABLE IF NOT EXISTS maquina_expendedora.detalle_temp_table (
id_promocion INT NOT NULL,
id_maquina VARCHAR(8) NOT NULL,
id_producto INT NOT NULL,
precio_reducido INT NULL
);

-- INSERT INTO maquina_expendedora.detalle_temp_table
SELECT id_promocion, id_maquina, id_producto, (precio_unitario * 0.80) AS precio_reducido
FROM inventario_maquina
INNER JOIN detalle_promocion using(id_maquina, id_producto);

SELECT * FROM detalle_temp_table;

DELETE FROM detalle_promocion;

INSERT INTO maquina_expendedora.detalle_promocion
SELECT * FROM detalle_temp_table;

SELECT * FROM detalle_promocion;

