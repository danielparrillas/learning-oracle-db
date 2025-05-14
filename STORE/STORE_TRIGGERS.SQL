-- Duplicar tabla para el ejemplo

CREATE TABLE PRODUCTS_COPY AS
SELECT * FROM PRODUCTS;


-- Restaurar el campo SALARY de la tabla employees al estado anterior
MERGE INTO EMPLOYEES E
USING EMPLOYEES_COPY EC
ON (E.EMPLOYEE_ID = EC.EMPLOYEE_ID)
WHEN MATCHED THEN
	UPDATE SET E.SALARY = EC.SALARY;
COMMIT;

-- Agregar campo timestamps

ALTER TABLE PRODUCTS
ADD CREATED_DATETIME TIMESTAMP;

-- Crear trigger de timestamps
