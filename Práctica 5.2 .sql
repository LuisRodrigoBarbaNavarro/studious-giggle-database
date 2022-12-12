USE mydb;

DROP PROCEDURE IF EXISTS Invertir_Nombrecliente;  
DELIMITER //
CREATE PROCEDURE Invertir_Nombrecliente (IN cliente int)
BEGIN  
  DECLARE nombre_cliente varchar(20);  
  SELECT nombre INTO nombre_cliente from clientes WHERE noCliente=cliente;  
  CALL ReverseProcedure(nombre_cliente, @Reversed, @Length);  
  UPDATE clientes SET nombre=@Reversed WHERE nocliente=cliente;  
END//
DELIMITER ;

call Invertir_Nombrecliente (10024);
SELECT nombre from clientes WHERE noCliente=10024;  /*10024 es el valor que fue enviado al SP */

DROP PROCEDURE IF EXISTS Invertir_Nombrecliente2;  
DELIMITER //
CREATE PROCEDURE Invertir_Nombrecliente2 ( IN cliente int)
BEGIN  
  DECLARE nombre_cliente varchar(20);  
  DECLARE inverso varchar(20);
  SELECT nombre INTO nombre_cliente from clientes WHERE noCliente=cliente;  
  CALL ReverseProcedure(nombre_cliente, inverso, @Length);  
  UPDATE clientes SET nombre= inverso WHERE nocliente=cliente;  
END//
DELIMITER ;

select * from clientes where nocliente=10024;
Call Invertir_Nombrecliente2('10024');
select @Reversed;
select inverso;

Call Invertir_Nombrecliente('10024');
select @Reversed;
select inverso;