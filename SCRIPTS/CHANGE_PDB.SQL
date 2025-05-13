-- Conéctate como SYSDBA al contenedor XE:
-- En terminal bash, ejecuta:
-- sqlplus sys/daniel@XE as sysdba

-- Cambia a la PDB:
ALTER SESSION SET CONTAINER = ps19005;

-- Verifica el contenedor actual:
SHOW CON_NAME;

-- Debería mostrar:
-- CON_NAME
-- ------------------------------
-- PS19005