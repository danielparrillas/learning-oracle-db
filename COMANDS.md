# Oracle Database Commands

- Oracle Database commands are essential for managing and interacting with Oracle databases. Below is a collection of useful commands for various tasks.

```bash
docker ps
docker exec -it <CONTAINER_ID> bash
```

- Interact with the Oracle Database container

```bash
docker exec -it 3d01e7c5b886 bash
```

- Check Oracle Database Status

```bash
lsnrctl status
```

- Connect to Oracle Database using SQL\*Plus

```bash
sqlplus system/daniel@XEPDB1
```

- Connect as SYSDBA using SQL\*Plus as Administrator

```bash
sqlplus sys/daniel@XEPDB1 as sysdba
```

- Connect as SYSDBA to the XE database using SQL\*Plus

```bash
sqlplus sys/daniel@XE as sysdba
```
