/* USE maquina_expendedora */
USE maquina_expendedora;

DROP PROCEDURE IF EXISTS reverse_procedure;
DELIMITER //
CREATE PROCEDURE reverse_procedure
(
IN cadena VARCHAR(80),
OUT reversed VARCHAR(80),
OUT length INTEGER
)
BEGIN 
	SET reversed = reverse(cadena);
    SET length = length(cadena);
    SELECT cadena, reversed, length;
END // 
DELIMITER ;

-- Demostración
-- Otras formas de enviar información.

CALL reverse_procedure((SELECT nombre FROM cliente WHERE id_cliente = 20490687), @Reversed, @Length);

CALL reverse_procedure((SELECT nombre_cliente FROM cliente WHERE id_cliente = 20490688), @Reversed, @Length);

SELECT @n:=nombre_cliente from cliente where id_cliente = 20490689;
CALL ReverseProcedure(@n, @Reversed, @Length);
