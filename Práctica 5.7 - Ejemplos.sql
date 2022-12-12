/* USE maquina_expendedora*/
USE maquina_expendedora;

drop procedure if exists actualizar_saldo;
DELIMITER //
CREATE PROCEDURE actualizar_saldo (in id_cliente int, in nuevos_puntos int, out error varchar(30))
BEGIN
DECLARE CONTINUE HANDLER FOR 1644 SET error = 'Error: Sueldo menor al limite'; 
select count(*) into @x from tarjeta where tarjeta.id_cliente = id_cliente and estatus = "Habilitada";
if @x=1 then
  set error = 'Actualizacion Exitosa';
  update tarjeta set puntos=nuevos_puntos where tarjeta.id_cliente = id_cliente and estatus = "Habilitada" ;
else
   set error = 'Error: Cliente no existe';   
end if;
END //
DELIMITER ;

set @error='';
call actualizar_saldo  (2, 132, @error) ;
select  @error;

SELECT * FROM tarjeta;

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

drop procedure if exists actualizarSaldoyNombre;
delimiter //
CREATE PROCEDURE actualizarSaldoyNombre 
(in id_cliente int, in nuevos_puntos int, in nombreCompleto varchar(64),out error varchar(30))
BEGIN
 DECLARE CONTINUE HANDLER FOR SQLSTATE '45000'
  begin    
 set error = 'Error: Sueldo menor al limite';      
 Rollback;
  end;
	select count(*) into @x from tarjeta where tarjeta.id_cliente = id_cliente and estatus = "Habilitada";
  if @x=1 then 
  start Transaction;
  set error = 'Actualizacion Exitosa';    
  update tarjeta set puntos=nuevos_puntos where tarjeta.id_cliente = id_cliente and estatus = "Habilitada" ;
  update cliente set nombre_cliente = nombreCompleto where cliente.id_cliente = id_cliente;
  commit;
  else   
  set error = 'Error: Empleado no existe';   
  end if;
END //
delimiter ;

set @error='';
call actualizarSaldoyNombre (12, 1, "Gustavo", @error) ;
select  @error;

SELECT * FROM cliente;
SELECT * FROM tarjeta;

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
DROP FUNCTION IF EXISTS f_actualizar_saldo;
DELIMITER //
CREATE function  f_actualizar_saldo (id_cliente int, nuevos_puntos int) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
 DECLARE MENSAJE varchar(100);
 DECLARE CANT INT;
 DECLARE CONTINUE HANDLER FOR 1644 SET MENSAJE = 'Error: Sueldo mayor al limite';
 select count(*) into CANT from tarjeta where tarjeta.id_cliente = id_cliente and estatus = "Habilitada";
 if CANT=1 then
	set MENSAJE = 'Actualizacion Exitosa';
	update tarjeta set puntos=nuevos_puntos where tarjeta.id_cliente = id_cliente and estatus = "Habilitada" ;
 else
 set MENSAJE = 'Error: Empleado no existe';   
 end if;
 RETURN MENSAJE;
END //
DELIMITER ;

SET @error = "";
SET @error = (f_actualizar_saldo(2, 10000));
select @error;

SELECT * FROM tarjeta;

UPDATE tarjeta
SET puntos = puntos + (99999)
WHERE id_cliente = 2 AND estatus = "Habilitada";

SHOW TRIGGERS;