USE maquina_expendedora;

SELECT * FROM institucion; #Listo
SELECT * FROM cliente; #Listo
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

/* Ejemplo de funcionamiento */
# Facturas donde se compró Agua Ciel.
SELECT id_maquina, id_factura, detalle.cantidad, precio_unitario, (detalle.cantidad * precio_unitario) AS subtotal
FROM factura
INNER JOIN detalle using (id_factura)
	INNER JOIN inventario_maquina using(id_producto, id_maquina)
WHERE detalle.id_producto = '159002';