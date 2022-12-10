-- Usar maquina_expendedora
USE maquina_expendedora;

/*
TO-DO:
Escriba un procedimiento que realice un inventario de productos de todas las maquinas de una institución en particular, 
debe regresar el total en dinero de todos los productos, la cantidad de productos diferentes que se venden y la cantidad 
de categorías diferentes que se venden.
*/

-- Procedimiento almacenado que recibe un identificador de una institución, y muestra el total de dinero en cuestión de
-- productos, cantidad de productos diferentes que se venden y la cantidad de categorías diferentis que se venden.
drop procedure if exists inventario;
delimiter //
create procedure inventario
(
	in id_inst int, 
	out Total_Dinero int, 
	out Productos_Diferentes int, 
	out Categorias_Diferentes int
)
begin
	if (select count(*) from institucion where id_institucion = id_inst) = 0 then
		begin
			signal sqlstate '45000'
			set message_text = 'Error. Institución no encontrada';
		end;
	else
		/*Dinero total*/
		select sum(precio_unitario * cantidad) into Total_Dinero
		from inventario_maquina
		inner join maquina using (id_maquina)
		where id_institucion=id_inst;
    
		/*Cantidad diferente de productos*/
		select count(distinct producto.id_producto) into Productos_Diferentes
		from producto
		inner join inventario_maquina using (id_producto)
			inner join maquina using (id_maquina)
		where id_institucion=id_inst;
    
		/*Cantidad de categorías*/
		select count(distinct id_categoria) into Categorias_Diferentes
		from producto
		inner join inventario_maquina using (id_producto)
			inner join maquina using (id_maquina)
		where id_institucion=id_inst;
    
    end if;
end // 
delimiter ;

-- Demostración
call inventario(100, @Total_Dinero, @Productos_Diferentes, @Categorias_Diferentes);
select @Total_Dinero, @Productos_Diferentes, @Categorias_Diferentes;