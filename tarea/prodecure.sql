/*DROP PROCEDURE IF EXISTS factorial;
DELIMITER //

CREATE PROCEDURE factorial
(IN con INT)
BEGIN
 DECLARE x  INT;
 DECLARE factorial  INT;
 DECLARE tot INT;
 
 DECLARE str  VARCHAR(255);

 SET x = 1;
 SET str =  '';
 set factorial = 1;
 WHILE x  <= con DO
	SET factorial = factorial * x;
	SET  x = x + 1; 
 END WHILE;
 
 SELECT factorial;



END //
DELIMITER ;
*/

/*SET  str = CONCAT(str,factorial,',');*/

DELIMITER //
SET @@SESSION.max_sp_recursion_depth=255; //
create procedure factorial2(in entrada int,out salida int)
BEGIN	
	if entrada=1 then
		select entrada into salida;
	else
		call factorial2(entrada - 1, @RET);
		select entrada *@RET into salida;
	end if;
END //
DELIMITER ;

CALL factorial(4);
CALL factorial2(4,@total);
SELECT @total;