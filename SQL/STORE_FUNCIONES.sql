CREATE OR REPLACE FUNCTION OBTENER_COUNTEO_ORDENES_POR_TIENDA_Y_ANIO(
    i_store_name IN STORES.STORE_NAME%TYPE,
    i_year IN INT
    )
RETURN int IS
    n_order_count INT;
BEGIN
    SELECT COUNT(*)
    INTO n_order_count
    FROM ORDERS O
    INNER JOIN STORES S
        ON O.STORE_ID = S.STORE_ID
    WHERE 
        EXTRACT(YEAR FROM O.ORDER_DATETIME) = i_year AND
        S.STORE_NAME = i_store_name;
    
    RETURN(n_order_count);
END;


-- PROBAR LA FUNCIÓN

SELECT OBTENER_COUNTEO_ORDENES_POR_TIENDA_Y_ANIO('Book Haven', 2025) FROM DUAL;

-- CON BLOQUE ANÓNIMO

DECLARE
    result NUMBER;
    I_STORE_NAME VARCHAR2(4000) := 'Book Haven';
    I_YEAR NUMBER := 2025;
BEGIN
    result := OBTENER_COUNTEO_ORDENES_POR_TIENDA_Y_ANIO(
        I_STORE_NAME => I_STORE_NAME,
        I_YEAR => I_YEAR
    );

    DBMS_OUTPUT.PUT_LINE('Resultado: ' || result);
END;
