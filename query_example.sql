USE maquina_expendedora;

SELECT * FROM cliente; #Listo
SELECT * FROM institucion; #Listo
SELECT * FROM categoria; #Listo
SELECT * FROM promocion; #Listo
SELECT * FROM maquina; #Listo
SELECT * FROM tarjeta; #Listo
SELECT * FROM promocion_categoria; #Listo
SELECT * FROM promocion_maquina; #Listo
SELECT * FROM producto; #Listo
SELECT * FROM inventario_maquina; #Listo
SELECT * FROM factura; #Listo
SELECT * FROM detalle; #Listo

/* Ejemplo */
SELECT *
FROM factura
INNER JOIN detalle using(id_factura)
	INNER JOIN producto using(id_producto)