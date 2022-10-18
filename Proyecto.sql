/*
Usar 'mydb'
*/
USE maquina_expendedora;

/*
1. A partir de un producto, liste todas las máquinas expendedoras que lo venden indicando para cada una,
la ubicación, la cantidad de producto y el precio unitario del mismo.
*/
SELECT id_maquina, id_institucion, nombre_inst, id_producto, nombre_producto, cantidad, precio_unitario
FROM institucion
INNER JOIN maquina using(id_institucion)
	INNER JOIN inventario_maquina using(id_maquina)
		INNER JOIN producto using(id_producto)
WHERE nombre_producto = "Coca-Cola";

/*
2. Liste todas las tarjetas vigentes, indicando el id de la tarjeta, los datos del cliente y el saldo,
la lista debe estar ordenada por universidad y los clientes de forma alfabética.
*/
SELECT id_tarjeta, id_institucion, nombre_inst, id_cliente, concat(nombre_cliente, " ", apellido_paterno, " ", apellido_materno) AS nombre, puntos
FROM cliente
INNER JOIN institucion using(id_institucion)
	INNER JOIN tarjeta using(id_cliente)
WHERE estatus = "Habilitada"
ORDER BY nombre_inst, nombre_cliente;

/*
3. Indique el total de saldo de las tarjetas por universidad.
*/
SELECT id_institucion, nombre_inst, sum(puntos) as total_saldo_institucion
FROM tarjeta
INNER JOIN cliente using(id_cliente)
	INNER JOIN institucion using(id_institucion)
GROUP BY id_institucion;

/*
4. Indique cuál maquina expendedora ha vendido más en un periodo especifico.
*/
SELECT id_institucion, nombre_inst, id_maquina, ubicacion, sum(cantidad) AS total_ventas
FROM factura
INNER JOIN detalle using(id_factura)
	INNER JOIN maquina using(id_maquina)
		INNER JOIN institucion using(id_institucion)
WHERE fecha_expedicion BETWEEN '20210212' AND '20211229'
GROUP BY id_maquina
HAVING total_ventas IN
(
	SELECT max(table_1.total_ventas)
    FROM (
		SELECT sum(cantidad) AS total_ventas
		FROM factura
		INNER JOIN detalle using(id_factura)
        WHERE fecha_expedicion BETWEEN '20210212' AND '20211229'
		GROUP BY id_maquina
    ) AS table_1
);

/* Comprobación */
SELECT *
FROM factura
INNER JOIN detalle using(id_factura)
WHERE id_maquina = 4031 AND fecha_expedicion BETWEEN '20210212' AND '20211229';

SELECT * FROM factura;

/*
5. Indique el total de ventas por categoría de producto de cada máquina expendedora.
*/
SELECT nombre_categoria, id_maquina, sum(cantidad) AS total_ventas_categoria
FROM factura
INNER JOIN detalle using(id_factura)
	INNER JOIN producto using(id_producto)
		INNER JOIN categoria using(id_categoria)
GROUP BY id_categoria, id_maquina
ORDER BY id_categoria, id_maquina;

/* Comprobación */
SELECT *
FROM factura
INNER JOIN detalle using(id_factura)
	INNER JOIN producto using(id_producto)
		INNER JOIN categoria using(id_categoria)
WHERE id_maquina = 4032 AND nombre_categoria = "Botellas de agua";

/*
6. Indique el total de ventas por categoría de producto de cada universidad.
*/
SELECT nombre_categoria, id_institucion, nombre_inst, sum(cantidad) AS total_ventas_universidad
FROM factura
INNER JOIN detalle using(id_factura)
	INNER JOIN producto using(id_producto)
		INNER JOIN categoria using(id_categoria)
			INNER JOIN maquina using(id_maquina)
				INNER JOIN institucion using(id_institucion)
GROUP BY id_categoria, id_institucion
ORDER BY id_categoria, nombre_inst;

/* Comprobación */
SELECT *
FROM factura
INNER JOIN detalle using(id_factura)
	INNER JOIN producto using(id_producto)
		INNER JOIN categoria using(id_categoria)
			INNER JOIN maquina using(id_maquina)
WHERE id_institucion = 1040 AND nombre_categoria = "Bebidas energeticas";

/*
7. Indique cuál cliente es quien más gastado dinero en un periodo determinado.
*/
SELECT id_cliente, concat(nombre_cliente, " ", apellido_paterno, " ", apellido_materno) AS nombre, sum(precio_unitario * detalle.cantidad) AS total_gastado
FROM cliente
INNER JOIN factura using(id_cliente)
	INNER JOIN detalle using(id_factura)
		INNER JOIN inventario_maquina using(id_maquina, id_producto)
WHERE fecha_expedicion BETWEEN '20210212' AND '20211229'
GROUP BY id_cliente
HAVING total_gastado IN
(
	SELECT max(table_1.total_gastado)
    FROM (
		SELECT sum(precio_unitario * detalle.cantidad) AS total_gastado
		FROM cliente
		INNER JOIN factura using(id_cliente)
			INNER JOIN detalle using(id_factura)
				INNER JOIN inventario_maquina using(id_maquina, id_producto)
		WHERE fecha_expedicion BETWEEN '20210212' AND '20211229'
		GROUP BY id_cliente
    ) AS table_1
);

/* Comprobación */
SELECT *
FROM cliente
INNER JOIN factura using(id_cliente)
	INNER JOIN detalle using(id_factura)
		INNER JOIN inventario_maquina using(id_maquina, id_producto)
WHERE fecha_expedicion BETWEEN '20210212' AND '20211229' AND id_cliente = 20490687;

/*
8. Liste a todos los clientes de una universidad en particular, indique los datos completos de cada cliente 
(incluya el total de tarjetas vigentes y no vigentes) y la relación de compras por categoría señalando cuanto a gastado en cada una.
*/
SELECT 
table_1.id_cliente, table_1.id_institucion, table_1.nombre_cliente, table_1.apellido_paterno, table_1.apellido_materno,
count(CASE
	WHEN estatus = 'habilitada' THEN 1
END) AS tarjetas_habilitadas,
count(CASE
	WHEN estatus = 'deshabilitada' THEN 1
END) AS TarjetasDeshabilitadas,
nombre_categoria, puntos_por_categoria
FROM
(
SELECT id_cliente, id_institucion, nombre_cliente, apellido_paterno, apellido_materno, estatus
FROM cliente
INNER JOIN tarjeta using(id_cliente)
WHERE id_institucion = 1030
GROUP BY id_cliente, id_tarjeta) AS table_1
INNER JOIN
(
SELECT id_cliente, id_categoria, nombre_categoria, sum(d.cantidad * precio_unitario) AS puntos_por_categoria
FROM factura
INNER JOIN detalle AS d USING (id_factura)
	INNER JOIN inventario_maquina USING (id_maquina , id_producto)
		INNER JOIN producto USING (id_producto)
			INNER JOIN categoria USING (id_categoria)
GROUP BY id_cliente , id_categoria
ORDER BY id_cliente , id_categoria) AS table_2 USING (id_cliente)

GROUP BY id_categoria, id_cliente;

/*
9 Liste todas las promociones existentes, indicando el precio del paquete, el total de los productos si 
se compraran de forma individual y el porcentaje de ahorro. Ordénela por Universidad y máquina expendedora.
*/
SELECT 
id_promocion, 
id_institucion, 
nombre_inst,
id_maquina,
sum(precio_reducido) AS precio_paquete, 
sum(precio_unitario) AS total_individual,
concat((((sum(precio_unitario) - sum(precio_reducido)) / sum(precio_unitario)) * 100), "%") AS ganancia
FROM inventario_maquina
INNER JOIN detalle_promocion using(id_producto, id_maquina)
	INNER JOIN maquina using(id_maquina)
		INNER JOIN institucion using(id_institucion)
GROUP BY id_promocion, id_maquina
ORDER BY id_institucion, id_maquina;
