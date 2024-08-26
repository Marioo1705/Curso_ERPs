CREATE OR REPLACE PROCEDURE calculadora(
    IN num1 INTEGER, -- No haría falta poner IN, ya lo tomaría así
    IN num2 INTEGER,
    OUT suma INTEGER,
    OUT resta INTEGER,
    OUT multiplicacion INTEGER,
    OUT division FLOAT
)
AS $$
BEGIN
    suma := num1 + num2;  
    resta := num1 - num2;
    multiplicacion := num1 * num2;
    IF num2 = 0 THEN
        division := NULL; -- Evita la división por cero, que no existe
    ELSE
        division := num1::FLOAT / num2; -- Cambia num1 de INTEGER a FLOAT
    END IF;
END;
$$ LANGUAGE plpgsql;


DO $$
DECLARE
	suma INTEGER;
	resta INTEGER;
	multiplicacion INTEGER;
	division FLOAT;
	n1 INTEGER DEFAULT 1300;
	n2 INTEGER DEFAULT 10;

BEGIN
	CALL calculadora(n1,n2,suma, resta, multiplicacion, division);
	RAISE NOTICE 'Suma: %', suma;
    RAISE NOTICE 'Resta: %', resta;
    RAISE NOTICE 'Multiplicación: %', multiplicacion;
    RAISE NOTICE 'División: %', division;
	CALL calculadora(3,7,suma, resta, multiplicacion, division);
    RAISE NOTICE 'Suma: %', suma;
    RAISE NOTICE 'Resta: %', resta;
    RAISE NOTICE 'Multiplicación: %', multiplicacion;
    RAISE NOTICE 'División: %', division;
END $$;