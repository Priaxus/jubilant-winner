# 10LE - Postgres Architechture & Roles

## Roles and Priviliges
All connections (sessions) are associated with a PostgreSQL role.

The `postgres` role is the default role for standard installations. This 
role has superuser privileges

Roles can be assigned the following attributes:
- `CREATEDB`: can create databases 
- `CREATEROLE`: can create roles
- `LOGIN`: ability to initiate a connection to the database
- `PASSWORD`: defines the password for the role
- `BYPASSRLS`: bypass row level security checks
- `SUPERUSER`: bypass security checks

Roles are also associated with a set of privileges that apply at 
different layers:
- Database: a single PostgreSQL instance (aka "cluster") can support many databases
- Tablespaces: where the data is stored on disk
- Schema: containers for tables and other objects
- Tables: containers for the data
- Functions/Procedures: predefined code
- Column level security: restricts roles to specific columns in a table 
- Row level security: restricts roles to specific roles in a table

![](https://i.imgur.com/11WHic0.png)

To grant or revoke priveliges the format is generally

```sql
GRANT ... TO ...
REVOKE ... FROM ...
```

Some examples:

DATABASE-LEVEL PRIVILEGES
```sql
grant connect on my_db to user1;
```

SCHEMA-LEVEL PRIVILEGES
```sql
grant usage on my_schema to user1;
```

TABLE-LEVEL PRIVILEGES
```sql
grant all privileges on my_table to user1;
grant select on all tables in schema myschema to user2;
```

Default privileges means 
- All privileges for the owner
- Some privileges for PUBLIC

### Role inheritance

Not all roles are used for establishing connections to the database
- Some roles may be setup to declare a set of access privileges on database objects which can then be "inherited" by other roles 
- Instead of declaring complex access privileges for each and every role, create one set of privileges to a role and grant privileges for that role to each user
- NOTE: role attributes cannot be inherited in this way.

### Example
![](https://i.imgur.com/rnUmKt8.png)


![](https://i.imgur.com/LX0ot70.png)

### PUBLIC Role and PUBLIC Schema

- PostgreSQL supports the concept of a PUBLIC role and a PUBLIC schema
    - The PUBLIC role is associated with any new role that is created
    - It is unlike other roles that can be created or dropped
    - Any privilege associated with the PUBLIC role is available to other roles.
    - By default, new objects are placed in the PUBLIC schema
- The built-in PUBLIC role is associated with a set of privileges
    - CONNECT | TEMP permissions on databases
    - CREATE (table) permission on the PUBLIC schema (anyone can create tables!!!)
    - USAGE permission on the PUBLIC schema (“lookup” objects in the schema –prerequisite for all table operations)
    - PUBLIC role does not grant access to tables created by others

### Dealing with PUBLIC priviliges
- Revoking privileges from the PUBLIC role is best practice. There are several ways to do this:
    - ensuring any connect privileges for the PUBLIC role are revoked for the database
    - revoking USAGE privileges on the PUBLIC schema
    - ensuring any other privileges on tables, views, functions and procedures are revoked
- Unexpected consequences may arise from failing to deal properly with these privileges

```sql
REVOKE ALL ON schema public FROM public;
GRANT usage ON schema public TO user1;
```

![](https://i.imgur.com/Xoly2iK.png)

| Privilege                              |  Abbreviation   | Applicable Object Types                                                                 |
| -------------------------------------- |:---------------:| --------------------------------------------------------------------------------------- |
| CREATE                                 |        C        | DATABASE, SCHEMA, TABLESPACE                                                            |
| CONNECT                                |        c        | DATABASE                                                                                |
| TEMPORARY T DATABASE                   |        T        | DATABASE                                                                                |
| USAGE                                  |        U        | SCHEMA (others: DOMAIN, FOREIGN DATA WRAPPER, FOREIGN SERVER, LANGUAGE, SEQUENCE, TYPE) |
| SELECT                                 |  r<br>(“read”)  | TABLE (and table-like objects), table column                                            |
| INSERT a (“append”)                    | a<br>("append") | TABLE, table column                                                                     |
| UPDATE w (“write”) TABLE, table column | w<br>("write")  | TABLE, table column (others: LARGE OBJECT, SEQUENCE)                                    |
| DELETE d TABLE                         |        d        | TABLE                                                                                   |
| TRUNCATE D TABLE                       |        D        | TABLE                                                                                   |
| REFERENCES x TABLE, table column       |        x        | TABLE, table column                                                                     |
| TRIGGER t TABLE                        |        t        | TABLE                                                                                   |
| EXECUTE X FUNCTION, PROCEDURE          |        X        | FUNCTION, PROCEDURE                                                                     |

### PG Table-Level Security

Database owners can `CREATE`/`DROP`/`ALTER` ANY table.

Non-database owners can `CREATE TABLES` via default PUBLIC role and 
then perform `SELECT`, `INSERT`, `DELETE`, `UPDATE` operations.

Non-database owners can `ALTER` / `DROP` tables that they own.

Non-database owners can `GRANT` or `REVOKE` privileges only for tables 
they own.

Non-database owners cannot access tables owned by other users 
unless access has been specifically granted.

### PG Column-Level Security

A characteristic of relational databases is that data from one table 
relates to data stored in another. 

It does not always follow that a user with access to a table should be 
able to access all fields in the database (e.g. personal information, 
credit card details)

#### Usage example
```sql
REVOKE SELECT FROM TABLE myschema.table FROM user;
GRANT SELECT (id, name) FROM TABLE myschema.table TO user;
```

### PG Row-Level Security

Row level security can be activated on a table. 

The following example restricts operations on rows identified by the logged in user:

```sql
CREATE TABLE manufacturing_data (
    partNum text,
    checkDate timestamp,
    operator text
) ENABLE ROW LEVEL SECURITY;
    
CREATE POLICY quality_team ON manufacturing_data USING (operator = current_user);
```