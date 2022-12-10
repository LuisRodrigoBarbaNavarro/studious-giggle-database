/* USAR maquina_expendedora */
use maquina_expendedora;

/*
Escriba un store procedure que reciba como parámetro un id de tarjeta, un id de producto y una cantidad, y que:
actualice el inventario de productos de la máquina el saldo de la tarjeta valide que la tarjeta tenga el saldo 
suficiente para la venta, en caso de no tenerlo debe lanzar un error, utilice transacciones.
*/

drop procedure if exists buy_product;
delimiter //
create procedure buy_product 
-- Parámetros
(
    in id_maquina_V int,
    in id_tarjeta_V int,
    in id_producto_V int,
    in buying int
)
-- Inicio del procedimiento
begin
    declare points_to_pay, M_Verify, T_Verify, P_Verify int;
    declare exit handler for sqlstate '45000' rollback;
	
    set M_Verify = 0;
    set T_Verify = 0;
    set P_Verify = 0;
    
    start transaction;
	
    select count(*) into M_Verify from inventario_maquina where id_maquina = id_maquina_V;
	select count(*) into P_Verify from inventario_maquina where id_maquina = id_maquina_V and id_producto = id_producto_V;
    select count(*) into T_Verify from tarjeta where id_tarjeta = id_tarjeta_V;
    
    if M_Verify > 0 and P_Verify > 0 and T_Verify > 0 then
    
	select (buying * precio_unitario) into points_to_pay 
    from inventario_maquina 
    where id_maquina = id_maquina_V
    and id_producto = id_producto_V;
    
    set @message = 'ERROR: Insuficient product.';
    update inventario_maquina 
    set cantidad = cantidad - buying
    where id_maquina = id_maquina_V 
    and id_producto = id_producto_V;


	set @message = 'ERROR: Insuficient funds.';
    update tarjeta 
    set puntos = puntos - points_to_pay
    where id_tarjeta = id_tarjeta_V;
    
    end if;
    
    set @message = 'Transaction complete, enjoy your product!'; 

    commit;
end //
delimiter ;


-- Testing
select * 
from inventario_maquina
where id_maquina = 4010;

select * 
from inventario_maquina
where id_maquina = 4010
and id_producto = 159001;

select * 
from tarjeta 
where id_tarjeta = 10020512;

update inventario_maquina
set cantidad = 6
where id_maquina = 4010 
and id_producto = 159001;

update tarjeta 
set puntos = 170
where id_tarjeta = 10020512;

set @message = '';
call buy_product(4010, 10020512, 159001, 9);
select @message;

update tarjeta set puntos = 1000 where id_tarjeta = 10020512;
select @message;

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

-- Trigger for the card.
drop trigger no_points_below_zero_BU;
delimiter //
create trigger no_points_below_zero_BU before update on tarjeta
for each row
begin
    if new.puntos < 0 then
		signal sqlstate '45000'
        set message_text = 'ERROR: Insuficient funds.';
    end if;
end //
delimiter ;

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

-- Trigger for the products in the machine.
drop trigger no_product_below_zero_BU;
delimiter //
create trigger no_product_below_zero_BU before update on inventario_maquina
for each row
begin
    if new.cantidad < 0 then
        signal sqlstate '45000'
        set message_text = 'ERROR: Insuficient product.';
    end if;
end //
delimiter ;