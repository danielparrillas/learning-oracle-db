PS C:\Users\Danie\OneDrive\Documentos\UES\BAD\Repaso Lab3> sqlplus / as sysdba

SQL*Plus: Release 21.0.0.0.0 - Production on Mar Abr 29 19:12:45 2025
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.



Conectado a:



Conectado a:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> ALTER SESSION SET CONTAINER = CDB$ROOT;



Conectado a:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> ALTER SESSION SET CONTAINER = CDB$ROOT;


Conectado a:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0



Conectado a:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0


Conectado a:





Conectado a:





Conectado a:








Conectado a:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> ALTER SESSION SET CONTAINER = CDB$ROOT;

Sesi¾n modificada.

SQL> SELECT name, open_mode FROM v$pdbs;

NAME
--------------------------------------------------------------------------------
OPEN_MODE
----------
PDB$SEED
READ ONLY

XEPDB1
READ WRITE


SQL> SELECT name, open_mode FROM v$database;

NAME      OPEN_MODE
--------- --------------------
XE        READ WRITE

SQL> CREATE PLUGGABLE DATABASE BADPS19005
  2  ADMIN USER PS19005 IDENTIFIED BY PS19005
  3  FILE_NAME_CONVERT = ('C:\app\Danie\product\21c\oradata\XE\pdbseed', 'C:\app\Danie\product\21c\oradata\XE\ps19005');

Base de datos de conexi¾n creada.

SQL> ALTER PLUGGABLE DATABASE BADPS19005 OPEN;

Base de datos de conexi¾n modificada.

SQL> SELECT name, open_mode FROM v$pdbs;

NAME
--------------------------------------------------------------------------------
OPEN_MODE
----------
PDB$SEED
READ ONLY

XEPDB1
READ WRITE

BADPS19005
READ WRITE


SQL> 


