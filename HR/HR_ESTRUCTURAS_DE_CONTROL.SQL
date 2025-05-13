/*
	Implementar un procedimiento que utilize eI procedimiento AJUSTE SALARIAL en base a los siguientes rangos:
		Salarios menores a $6000, un aumento del 10%
		Salarios entre $6,000 y $8,000 un aumento del
		Salarios de mas de $8,000 un aumento del 3%
*/

CREATE PROCEDURE EJECUTAR_AUMENTO_IF(
	I_EMPLOYEE_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE
) IS
	N_SALARIO EMPLOYEES.SALARY%TYPE;
	N_AUMENTO_1 CONSTANT FLOAT := 0.1;
	N_AUMENTO_2 CONSTANT FLOAT := 0.05;
	N_AUMENTO_3 CONSTANT FLOAT := 0.03;
BEGIN
	-- Obtener el salario actual del empleado
	SELECT SALARY INTO N_SALARIO
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID = I_EMPLOYEE_ID;

	-- Imprimir el salario anterior
	DBMS_OUTPUT.PUT_LINE('Salario anterior: ' || N_SALARIO);

	-- Aplicar el aumento según el rango del salario utilizando el procedimiento AJUSTE_SALARIAL
	IF N_SALARIO < 6000 THEN
		DBMS_OUTPUT.PUT_LINE('Salario menor a $6000');
		HR_PROCEDURES.AJUSTE_SALARIAL(I_ID => I_EMPLOYEE_ID, I_PORCENTAJE => N_AUMENTO_1);

	ELSIF N_SALARIO BETWEEN 6000 AND 8000 THEN
		DBMS_OUTPUT.PUT_LINE('Salario entre $6000 y $8000');
		HR_PROCEDURES.AJUSTE_SALARIAL(I_ID => I_EMPLOYEE_ID, I_PORCENTAJE => N_AUMENTO_2);

	ELSE
		DBMS_OUTPUT.PUT_LINE('Salario mayor a $8000');
		HR_PROCEDURES.AJUSTE_SALARIAL(I_ID => I_EMPLOYEE_ID, I_PORCENTAJE => N_AUMENTO_3);

	END IF;
	
	COMMIT;
END EJECUTAR_AUMENTO_IF;

/*
	Esta función/procedimiento realiza una operación específica en la base de datos.
	Parámetros:
		- [Describa aquí los parámetros de entrada y salida, si los hay]
	Retorna:
		- [Describa el valor de retorno, si aplica]
	Detalles:
		- [Explique brevemente la lógica o propósito principal]
	Notas:
		- [Incluya cualquier consideración especial, restricciones o advertencias]
*/

CREATE PROCEDURE EJECUTAR_AUMENTO_CASE(
	I_EMPLOYEE_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE
) IS
	N_SALARIO EMPLOYEES.SALARY%TYPE;
	N_AUMENTO_1 CONSTANT FLOAT := 0.1;
	N_AUMENTO_2 CONSTANT FLOAT := 0.05;
	N_AUMENTO_3 CONSTANT FLOAT := 0.03;
	N_PORCENTAJE FLOAT;
BEGIN
	-- Obtener el salario actual del empleado
	SELECT SALARY INTO N_SALARIO
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID = I_EMPLOYEE_ID;

	-- Imprimir el salario anterior
	DBMS_OUTPUT.PUT_LINE('Salario anterior: ' || N_SALARIO);

	-- Determinar el porcentaje de aumento usando CASE
	N_PORCENTAJE := CASE
		WHEN N_SALARIO < 6000 THEN N_AUMENTO_1
		WHEN N_SALARIO BETWEEN 6000 AND 8000 THEN N_AUMENTO_2
		ELSE N_AUMENTO_3
	END;

	-- Mensaje según el rango
	CASE
		WHEN N_SALARIO < 6000 THEN
			DBMS_OUTPUT.PUT_LINE('Salario menor a $6000');
		WHEN N_SALARIO BETWEEN 6000 AND 8000 THEN
			DBMS_OUTPUT.PUT_LINE('Salario entre $6000 y $8000');
		ELSE
			DBMS_OUTPUT.PUT_LINE('Salario mayor a $8000');
	END CASE;

	-- Aplicar el aumento utilizando el procedimiento AJUSTE_SALARIAL
	HR_PROCEDURES.AJUSTE_SALARIAL(I_ID => I_EMPLOYEE_ID, I_PORCENTAJE => N_PORCENTAJE);

	COMMIT;
END EJECUTAR_AUMENTO_CASE;