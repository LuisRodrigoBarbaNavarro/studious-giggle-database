USE mydb;

-- Procedimiento almacenado que invierte cadena.
DROP PROCEDURE IF EXISTS ReverseProcedure; 
DELIMITER //
CREATE PROCEDURE ReverseProcedure
(
	IN String VARCHAR(80),
	OUT Reversed VARCHAR(80),
	OUT Length INTEGER
)
BEGIN
  SET Reversed = REVERSE(String);
  SET Length = LENGTH(String);
  SELECT String, Reversed, Length;
END //
DELIMITER ;

CALL ReverseProcedure('Herong', @Reversed, @Length);

CALL ReverseProcedure((select nombre from clientes where noCliente=10015), @Reversed, @Length);
SELECT @n:=nombre from clientes where noCliente=10015;
CALL ReverseProcedure(@n, @Reversed, @Length);