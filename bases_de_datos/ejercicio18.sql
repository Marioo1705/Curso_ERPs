-- Crea un procedimiento que permita recibir un número, sumarle 100 y devolverlo modificado

CREATE OR REPLACE PROCEDURE suma_100(INOUT resultado INTEGER)
AS $$
BEGIN
    resultado := resultado + 100;
END;
$$ LANGUAGE plpgsql;

DO $$
DECLARE
	n INTEGER DEFAULT 100;
BEGIN
	CALL suma_100(n);
	RAISE NOTICE 'Numero: %', n;
	CALL suma_100(n);
	RAISE NOTICE 'Numero: %', n;
	CALL suma_100(n);
	RAISE NOTICE 'Numero: %', n;
END $$;