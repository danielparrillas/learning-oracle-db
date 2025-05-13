-- sqlplus sys/daniel@XE as sysdba

CREATE PLUGGABLE DATABASE ps19005
  ADMIN USER ps19005 IDENTIFIED BY ps19005
  FILE_NAME_CONVERT = ('/opt/oracle/oradata/XE/pdbseed/', '/opt/oracle/oradata/XE/ps19005/');

	-- Abrir la base de datos pluggable recién creada
	ALTER PLUGGABLE DATABASE ps19005 OPEN;

	-- Mostrar las bases de datos pluggable existentes
	SHOW PDBS;

	-- Grant privileges to user ps19005

	-- Grant privileges to create objects
	-- Conéctate como SYSDBA al contenedor XE: sqlplus sys/daniel@ps19005 as sysdba
	GRANT CONNECT, RESOURCE TO ps19005;

	-- Grant privilege to create users and other objects
	GRANT DBA TO ps19005;

-- 🎯 CONNECT le permite iniciar sesión.
-- 🛠️ RESOURCE permite crear tablas, índices, vistas, etc.
-- 🔓 DBA otorga acceso total dentro de esa PDB (si es solo para desarrollo o pruebas, está bien).















-- SOLO SI NO FUNCIONA

-- Permisos básicos
GRANT CONNECT, RESOURCE TO ps19005;

-- Permisos para programación PL/SQL
GRANT CREATE TRIGGER TO ps19005;
GRANT CREATE PROCEDURE TO ps19005;
GRANT CREATE FUNCTION TO ps19005;
GRANT CREATE PACKAGE TO ps19005;
GRANT CREATE PACKAGE BODY TO ps19005;

-- Permisos para otros objetos útiles
GRANT CREATE VIEW TO ps19005;
GRANT CREATE SEQUENCE TO ps19005;
GRANT CREATE SYNONYM TO ps19005;

-- (Opcional) Permiso completo dentro de la PDB
-- Solo si es un entorno de desarrollo
GRANT DBA TO ps19005;