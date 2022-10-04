/*
Creación de Base de Datos 
con Codificación UTF8
*/
CREATE SCHEMA IF NOT EXISTS maquina_expendedora
DEFAULT CHARACTER SET utf8;

/*
Manejo de Base de Datos
*/
USE maquina_expendedora;

/*
--- Consultar las restricciones generales
SELECT *
FROM information_schema.table_constraints
WHERE constraint_schema = 'maquina_expendedora'
*/

/*Tabla: Institución*/
DROP TABLE IF EXISTS maquina_expendedora.institucion;
CREATE TABLE IF NOT EXISTS maquina_expendedora.institucion (
id_institucion INT NOT NULL,
nombre_inst VARCHAR(64) NOT NULL,
calle_inst VARCHAR(64) NOT NULL,
colonia_inst VARCHAR(64) NOT NULL,
numero_inst INT NOT NULL,
PRIMARY KEY (id_institucion))
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Institución*/
DESCRIBE institucion;

/*Tabla: Cliente*/
DROP TABLE IF EXISTS maquina_expendedora.cliente;
CREATE TABLE IF NOT EXISTS maquina_expendedora.cliente (
id_cliente INT NOT NULL,
nombre_cliente VARCHAR(64) NOT NULL,
apellido_paterno VARCHAR(64) NOT NULL,
apellido_materno VARCHAR(64) NOT NULL,
PRIMARY KEY (id_cliente))
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Cliente*/
DESCRIBE cliente;

/*Tabla: Tarjeta*/
DROP TABLE IF EXISTS maquina_expendedora.tarjeta;
CREATE TABLE IF NOT EXISTS maquina_expendedora.tarjeta (
id_tarjeta INT NOT NULL,
id_cliente INT NOT NULL,
fecha_expedicion DATE NOT NULL,
puntos INT NOT NULL,
estatus VARCHAR(32) NOT NULL,
PRIMARY KEY (id_tarjeta),

INDEX cliente_idx (id_cliente ASC) VISIBLE,
CONSTRAINT cliente_tarjeta
FOREIGN KEY (id_cliente)
REFERENCES maquina_expendedora.cliente (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Tarjeta*/
DESCRIBE tarjeta;

/*Tabla: Maquina*/
DROP TABLE IF EXISTS maquina_expendedora.maquina;
CREATE TABLE IF NOT EXISTS maquina_expendedora.maquina (
id_maquina VARCHAR(8) NOT NULL,
id_institucion INT NOT NULL,
ubicacion VARCHAR(64) NOT NULL,
estatus VARCHAR(32) NOT NULL,
capacidad INT NOT NULL,
PRIMARY KEY (id_maquina),

INDEX institucion_idx (id_institucion ASC) VISIBLE,
CONSTRAINT institucion_maquina
FOREIGN KEY (id_institucion)
REFERENCES maquina_expendedora.institucion (id_institucion)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Maquina*/
DESCRIBE maquina;

/*Tabla: Factura*/
DROP TABLE IF EXISTS maquina_expendedora.factura;
CREATE TABLE IF NOT EXISTS maquina_expendedora.factura (
id_factura VARCHAR(8) NOT NULL,
id_cliente INT NOT NULL,
id_maquina VARCHAR(8) NOT NULL,
fecha_expedicion DATE NOT NULL,
hora_expedicion TIME NOT NULL,
PRIMARY KEY (id_factura),

INDEX cliente_idx (id_cliente ASC) VISIBLE,
INDEX maquina_idx (id_maquina ASC) VISIBLE,
CONSTRAINT cliente_factura
FOREIGN KEY (id_cliente)
REFERENCES maquina_expendedora.cliente (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION,

CONSTRAINT maquina_factura
FOREIGN KEY (id_maquina)
REFERENCES maquina_expendedora.maquina (id_maquina)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Factura*/
DESCRIBE factura;

/*Tabla: Categoría*/
DROP TABLE IF EXISTS maquina_expendedora.categoria;
CREATE TABLE IF NOT EXISTS maquina_expendedora.categoria (
id_categoria INT NOT NULL,
nombre_categoria VARCHAR(32) NOT NULL,
descripcion_categoria VARCHAR(64) NOT NULL,
PRIMARY KEY (id_categoria))
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Categoría*/
DESCRIBE categoria;

/*Tabla: Producto*/
DROP TABLE IF EXISTS maquina_expendedora.producto;
CREATE TABLE IF NOT EXISTS maquina_expendedora.producto (
id_producto INT NOT NULL,
id_categoria INT NOT NULL,
nombre_producto VARCHAR(32) NOT NULL,
descripcion_producto VARCHAR(64) NOT NULL,
PRIMARY KEY (id_producto),

INDEX categoria_idx (id_categoria ASC) VISIBLE,
CONSTRAINT categoria_producto
FOREIGN KEY (id_categoria)
REFERENCES maquina_expendedora.categoria (id_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Producto*/
DESCRIBE producto;

/*Tabla: Promoción*/
DROP TABLE IF EXISTS maquina_expendedora.promocion;
CREATE TABLE IF NOT EXISTS maquina_expendedora.promocion (
id_promocion INT NOT NULL,
vigencia_promocion DATETIME NOT NULL,
precio_promocion INT NOT NULL,
PRIMARY KEY (id_promocion))
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Promoción*/
DESCRIBE promocion;

/*Tabla de Unión: Promoción-Maquina*/
DROP TABLE IF EXISTS maquina_expendedora.promocion_maquina;
CREATE TABLE IF NOT EXISTS maquina_expendedora.promocion_maquina (
id_promocion INT NOT NULL,
id_maquina VARCHAR(8) NOT NULL,
PRIMARY KEY (id_promocion, id_maquina),

INDEX promocion_idx (id_promocion ASC) VISIBLE,
INDEX maquina_idx (id_maquina ASC) VISIBLE,
CONSTRAINT promocion_pm
FOREIGN KEY (id_promocion)
REFERENCES maquina_expendedora.promocion (id_promocion)
ON DELETE NO ACTION
ON UPDATE NO ACTION,

CONSTRAINT maquina_pm
FOREIGN KEY (id_maquina)
REFERENCES maquina_expendedora.maquina (id_maquina)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Promoción-Maquina*/
DESCRIBE promocion_maquina;

/*Tabla de Unión: Promoción-Categoría*/
DROP TABLE IF EXISTS maquina_expendedora.promocion_categoria;
CREATE TABLE IF NOT EXISTS maquina_expendedora.promocion_categoria (
id_promocion INT NOT NULL,
id_categoria INT NOT NULL,
PRIMARY KEY (id_promocion, id_categoria),

INDEX promocion_idx (id_promocion ASC) VISIBLE,
INDEX categoria_idx (id_categoria ASC) VISIBLE,
CONSTRAINT promocion_pc
FOREIGN KEY (id_promocion)
REFERENCES maquina_expendedora.promocion (id_promocion)
ON DELETE NO ACTION
ON UPDATE NO ACTION,

CONSTRAINT categoria_pc
FOREIGN KEY (id_categoria)
REFERENCES maquina_expendedora.categoria (id_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Promoción-Categoría*/
DESCRIBE promocion_categoria;

/*Tabla: Inventario*/
DROP TABLE IF EXISTS maquina_expendedora.inventario_maquina;
CREATE TABLE IF NOT EXISTS maquina_expendedora.inventario_maquina (
id_maquina VARCHAR(8) NOT NULL,
id_producto INT NOT NULL,
numero_slot VARCHAR(3) NOT NULL,
cantidad INT NOT NULL,
precio_unitario INT NOT NULL,
PRIMARY KEY (id_maquina, id_producto, numero_slot),

INDEX maquina_idx (id_maquina ASC) VISIBLE,
INDEX producto_idx (id_producto ASC) VISIBLE,
CONSTRAINT maquina_inventario
FOREIGN KEY (id_maquina)
REFERENCES maquina_expendedora.maquina (id_maquina)
ON DELETE NO ACTION
ON UPDATE NO ACTION,

CONSTRAINT producto_inventario
FOREIGN KEY (id_producto)
REFERENCES maquina_expendedora.producto (id_producto)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Inventario*/
DESCRIBE inventario_maquina;

/*Tabla: Detalle*/
DROP TABLE IF EXISTS maquina_expendedora.detalle;
CREATE TABLE IF NOT EXISTS maquina_expendedora.detalle (
id_factura VARCHAR(8) NOT NULL,
id_producto INT NOT NULL,
cantidad INT NOT NULL,
posicion VARCHAR(3) NOT NULL,
PRIMARY KEY (id_factura, id_producto),

INDEX factura_idx (id_factura ASC) VISIBLE,
INDEX producto_idx (id_producto ASC) VISIBLE,
CONSTRAINT factura_detalle
FOREIGN KEY (id_factura)
REFERENCES maquina_expendedora.factura (id_factura)
ON DELETE NO ACTION
ON UPDATE NO ACTION,

CONSTRAINT producto_detalle
FOREIGN KEY (id_producto)
REFERENCES maquina_expendedora.producto (id_producto)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
/*Mostrar estructura de la tabla: Detalle*/
DESCRIBE detalle;