USE mydb;

-- Estructura IF.
delimiter //
CREATE procedure miProc(IN p1 int)    
begin
declare miVar int;        /* se declara variable local */
SET miVar = p1 +1 ;        /* se establece la variable */
IF miVar = 12
  then SELECT 55555;
  else SELECT 76655;
end IF;
end; //
delimiter ;

CALL miProc(12);

-- Estructura CASE.

delimiter //
CREATE procedure miProc2 (IN p1 int)
begin
declare var int ;
set var = p1 +2 ;
case var
when 2 then SELECT (66666);
when 3 then SELECT (4545665);
else SELECT (77777777);
end case;
end; //
delimiter ;
CALL miProc2(12);

-- Estructura WHILE

delimiter //
CREATE procedure p14()
begin
declare v int;
set v = 0;
while v < 5 do
SET v = v + 1 ;
end while;
SELECT v;
end; //
delimiter ;

CALL p14();

-- Estructura REPEAT

delimiter //
CREATE procedure p15()
begin
declare v int;
set v = 20;
repeat
  SET v = v - 1;
until v <= 1
end repeat;
SELECT v;
end; //
delimiter ;

CALL p15();

-- Estructura ITERATE

delimiter $
CREATE PROCEDURE doiterate(p1 INT)
BEGIN
   label1: LOOP
   SET p1 = p1 + 1;
   IF p1 < 10 THEN
      ITERATE label1;
   END IF;
   LEAVE label1;
   END LOOP label1;
   SET @x = p1;
   END$
delimiter ;

CALL doiterate(5);
SELECT @x