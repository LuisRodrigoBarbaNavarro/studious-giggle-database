/* USE mydb*/
USE mydb;

drop procedure if exists actualizarSueldo;
DELIMITER //
CREATE PROCEDURE actualizarSueldo (in idEmp int, in sueldo double, out error varchar(30))
BEGIN
DECLARE CONTINUE HANDLER FOR 1644 SET error = 'Error: Sueldo menor al limite'; 
select count(*) into @x from empleado where idEmpleado = idEmp;
if @x=1 then
  set error = 'Actualizacion Exitosa';
  update empleado set salario=sueldo where idEmpleado=idEmp;
else
   set error = 'Error: Empleado no existe';   
end if;
END //
DELIMITER ;

set @error='';
call actualizarSueldo (200, -1, @error) ;
select  @error;

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

drop procedure if exists actualizarSueldoyNombre;
delimiter //
CREATE PROCEDURE actualizarSueldoyNombre  
(in idEmp int, in sueldo double, in nombreCompleto varchar(15),out error varchar(30))
BEGIN
 DECLARE CONTINUE HANDLER FOR SQLSTATE '45000'
  begin    
 set error = 'Error: Sueldo menor al limite';      
 Rollback;
  end;
  select count(*) into @x from empleado where idEmpleado = idEmp;
  if @x=1 then 
  start Transaction;
  set error = 'Actualizacion Exitosa';    
  update empleado set nombre=nombreCompleto  where idEmpleado=idEmp;   
  update empleado set salario=sueldo where idEmpleado=idEmp;   
  commit;
  else   
  set error = 'Error: Empleado no existe';   
  end if;
END //
delimiter ;

set @error='';
call actualizarSueldoyNombre(700, 0, "Juan Perez", @error) ;
select  @error;

DELIMITER //
CREATE function  f_actualizarSueldo (idEmp int, sueldo double) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
 DECLARE MENSAJE varchar(100);
 DECLARE CANT INT;
 DECLARE CONTINUE HANDLER FOR 1644 SET MENSAJE = 'Error: Sueldo menor al limite';
 select count(*) INTO CANT from empleado where idEmpleado = idEmp LIMIT 1;
 if CANT=1 then
 set MENSAJE = 'Actualizacion Exitosa';
 Update empleado set salario=sueldo where idEmpleado=idEmp;
 else
 set MENSAJE = 'Error: Empleado no existe';   
 end if;
 RETURN MENSAJE;
END //
DELIMITER ;

SET @error = 0;
SET @error = (f_actualizarSueldo(1, 9999));
select  @error;

select * from empleado;