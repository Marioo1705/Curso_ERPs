-- Crea un procedimiento y una función que indiquen si un número pasado por parámetros es par o impar

-- Función
CREATE OR REPLACE FUNCTION par_impar_2(numero INTEGER)
RETURNS BOOLEAN AS $$
BEGIN
	RETURN numero % 2 = 0;
END;
$$ LANGUAGE plpgsql;

DO $$

BEGIN
	IF par_impar_2(324) THEN
    	RAISE NOTICE 'El numero es par';
	ELSE 
    	RAISE NOTICE 'El numero es impar';
	END IF;
	IF par_impar_2(15) THEN
    	RAISE NOTICE 'El numero es par';
	ELSE 
    	RAISE NOTICE 'El numero es impar';
	END IF;

END $$;

-- Procedimiento
CREATE OR REPLACE PROCEDURE par_impar(numero INTEGER)
AS $$
BEGIN
	IF numero % 2 = 0 THEN
    	RAISE NOTICE 'El numero es par';
	ELSE 
    	RAISE NOTICE 'El numero es impar';
	END IF;
END;
$$ LANGUAGE plpgsql;

CALL par_impar(1400);
CALL par_impar(1401);

