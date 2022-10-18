USE maquina_expendedora;
SHOW TABLES;

DESCRIBE cliente;
INSERT INTO cliente VALUES
(
20490687,
"LUIS RODRIGO",
"BARBA",
"NAVARRO"
);

SELECT * FROM cliente;

DESCRIBE institucion;
INSERT INTO institucion VALUES
(
128,
"TECNOLÓGICO NACIONAL DE MÉXICO CAMPUS MEXICALI",
"AV. INSTITUTO TECNOLÓGICO",
"PLUTARCO ELÍAS CALLES",
21376
);

SELECT * FROM institucion;

DESCRIBE categoria;
INSERT INTO categoria VALUES
(
1,
"BEBIDA",
"PRODUCTO LÍQUIDO CONSUMIBLE"
);

SELECT * FROM categoria;

DESCRIBE promocion;
INSERT INTO promocion VALUES
(
1,
"2022-10-21 12:00:00",
150
);

SELECT * FROM promocion;

DESCRIBE maquina;
INSERT INTO maquina VALUES
(
1,
128,
"EDIFICIO G",
"ACEPTABLE",
64
);

SELECT * FROM maquina;

DESCRIBE tarjeta;
INSERT INTO tarjeta VALUES
(
1,
20490687,
"2022-10-31",
2500,
"ACTIVA"
);

SELECT * FROM tarjeta;

DESCRIBE producto;
INSERT INTO producto VALUES
(
1,
1,
"COCA-COLA LIGHT",
upper("bebida azucarada gaseosa vendida a nivel mundial en tiendas")
);

SELECT * FROM producto;

DESCRIBE factura;
INSERT INTO factura VALUES
(
1,
20490687,
1,
"2022-10-31",
"12:50:00"
);

SELECT * FROM factura;

DESCRIBE detalle;
INSERT INTO detalle VALUES
(
1,
1,
4,
"A3"
);

SELECT * FROM detalle;

DESCRIBE inventario_maquina;
INSERT INTO inventario_maquina VALUES
(
1,
1,
"A3",
12,
20
);

SELECT * FROM inventario_maquina;

DESCRIBE promocion_maquina;
INSERT INTO promocion_maquina VALUES
(
1,
1
);

SELECT * FROM promocion_maquina;

DESCRIBE promocion_categoria;
INSERT INTO promocion_categoria VALUES
(
1,
1
);

SELECT * FROM promocion_categoria;


/*Example:*/
SELECT id_maquina AS Maquina, nombre_producto, cantidad, precio_unitario
FROM maquina
INNER JOIN inventario_maquina using(id_maquina)
	INNER JOIN producto using(id_producto);