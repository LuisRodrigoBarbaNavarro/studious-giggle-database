USE mydb;

DELIMITER //
CREATE PROCEDURE acumuladoVentaArticulo(INOUT subtotal double,  IN id_producto INT,  IN cantidad INT)
BEGIN
    SELECT PrecioEuros into @incremento_precio
    FROM Articulos
    WHERE NoArticulo = id_producto;
    SET subtotal =subtotal + cantidad * @incremento_precio;
END //
DELIMITER ;

SET @sTotal = 0;
Call acumuladoVentaArticulo(@sTotal,5,3);
Call acumuladoVentaArticulo(@sTotal,12,4);
Call acumuladoVentaArticulo(@sTotal,25,7);
Call acumuladoVentaArticulo(@sTotal,76,1);
Select @sTotal;