-- Crea un procedimiento y una función que calculen el área de un círculo

-- Procedimiento Método 1
CREATE OR REPLACE PROCEDURE area_circulo (radio DECIMAL(6,2))
AS $$
DECLARE
	area DECIMAL(6,2);
BEGIN
	area := pi() * power(radio,2);
	RAISE NOTICE 'El área de un círculo de radio % es %', radio, area;
END;
$$ LANGUAGE plpgsql;

CALL area_circulo (3.25);

-- Procedimiento Método 2
CREATE OR REPLACE PROCEDURE area_circulo(radio DECIMAL(6,2))
AS $$
DECLARE
  area DECIMAL(6,2);
  pi CONSTANT NUMERIC := 3.14159265358979323846; -- Crea una constante cuyo valor no se puede variar
BEGIN
	area := pi * radio ^ 2; 
  	RAISE NOTICE 'El área de un círculo de radio % es %', radio, area;
END;
$$ LANGUAGE plpgsql;

CALL area_circulo(3.25);

-- Procedimiento Método 3
CREATE OR REPLACE PROCEDURE area_circulo_2 (radio DECIMAL(6,2), OUT area2 DECIMAL(6,2))
AS $$
BEGIN
  area2 := pi() * power(radio,2);
END;
$$ LANGUAGE plpgsql;

DO $$
DECLARE
   area2 DECIMAL(6,2);
BEGIN
CALL area_circulo_2 (3.25, area2);
RAISE NOTICE 'Área del círculo: %', area2;
END $$;

--- Función
DROP FUNCTION area_circulo_3 (r DECIMAL(10,4));
CREATE OR REPLACE FUNCTION area_circulo_3 (radio DECIMAL(6,2))
RETURNS DECIMAL(6,2) AS $$
BEGIN
    RETURN pi() * power(radio,2);
END;
$$ LANGUAGE plpgsql;

SELECT area_circulo_3(3.25);