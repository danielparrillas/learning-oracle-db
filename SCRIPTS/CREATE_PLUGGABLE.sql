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
