-- sqlplus sys/daniel@XE as sysdba

CREATE PLUGGABLE DATABASE STOREDB
  ADMIN USER store_user IDENTIFIED BY store_user
  FILE_NAME_CONVERT = ('/opt/oracle/oradata/XE/pdbseed/', '/opt/oracle/oradata/XE/STOREDB/');

-- Abrir la base de datos pluggable recién creada
ALTER PLUGGABLE DATABASE STOREDB OPEN;

-- Mostrar las bases de datos pluggable existentes
SHOW PDBS;

-- Grant privileges to user STOREDB

-- Grant privileges to create objects
-- Conéctate como SYSDBA al contenedor XE: sqlplus sys/daniel@STOREDB as sysdba
ALTER SESSION SET CONTAINER = STOREDB;

GRANT CONNECT, RESOURCE TO store_user;

-- Grant privilege to create users and other objects
GRANT DBA TO store_user;

-- 🎯 CONNECT le permite iniciar sesión.
-- 🛠️ RESOURCE permite crear tablas, índices, vistas, etc.
-- 🔓 DBA otorga acceso total dentro de esa PDB (si es solo para desarrollo o pruebas, está bien).
