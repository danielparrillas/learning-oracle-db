/* 1. Implementar un bloque anonimo que imprima en pantalla la cantidad de ordenes para una tienda
y un año especificado */

-- Primero hacemos la consulta
SELECT
    S.STORE_NAME,
    EXTRACT(YEAR FROM O.ORDER_DATETIME),
    COUNT(*)
FROM ORDERS O
INNER JOIN STORES S
    ON O.STORE_ID = S.STORE_ID
GROUP BY
    S.STORE_NAME,
    EXTRACT(YEAR FROM O.ORDER_DATETIME);

-- Luego hacer el bloque
DECLARE
    v_store_name STORES.STORE_NAME%TYPE:='Book Haven';
    n_year INT:=2025;
    n_order_count INT;
BEGIN
    SELECT COUNT(*)
    INTO n_order_count
    FROM ORDERS O
    INNER JOIN STORES S
        ON O.STORE_ID = S.STORE_ID
    WHERE 
        EXTRACT(YEAR FROM O.ORDER_DATETIME) = n_year AND
        S.STORE_NAME = v_store_name;

    DBMS_OUTPUT.PUT_LINE('Total de ordenes para ' || v_store_name || ' en ' || n_year || ': ' || n_order_count);
END;