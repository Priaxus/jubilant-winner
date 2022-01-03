# Overview
*In this exercise, you will examine the default security settings associated with databases, schemas, tables, columns and rows in PostgreSQL. Refer to previous course material on setting up and configuring PostgreSQL as well as running simple commands to select, insert, update and delete data.*

# Procedure

*For this exercise, you will connect to PostgreSQL using a privileged account to create a single database `d1`*

*Create three roles `u1`, `u2` and `u3` with login privilege*

*Create 3 schema in the database named `s1`, `s2` and `s3`. Assign the ownership of schema `s1` to role `u1` (`s2` to `u2` and `s3` to `u3`)*

*Create a table `t1` in each of the three schema you created. The tables are created in each of the schema using the following:*

```sql
CREATE TABLE t1 (name text, secretstr text);
```

*The table in each schema is then populated with three rows*

```
'u1', '<some secret string1>' 
'u2', '<some other secret string>' 
'u3', '<yet another secret string3>'
```

## Security policies to apply

1. *Each role has full privileges on the table in its own schema*
2. *Role `u1` can view only data in the name column in the table in `s3`. The secret string is not accessible*
3. *Role `u2` can select only the row associated with `u2` in the table in `s3`*
4. *Role `u2` can update the secret string in the table in `s1`*
5. *Role `u3` can only view the data in `s2` via a function call that you will need to create. Direct access to the table in `s2` is not permitted. Role `u3` cannot access `s1`*
6. *Unless explicitly stated (or otherwise implied) access is denied*

# My solution

1. Switch to `postgres` user:
```bash
sudo su - postgres
```

2. Create `d1` database
```bash
psql
```
```sql
CREATE DATABASE d1;
```

3. Connect to `d1`
```bash
\c d1
```

4. Create roles with login priviliges
```sql
CREATE ROLE u1 LOGIN;
CREATE ROLE u2 LOGIN;
CREATE ROLE u3 LOGIN;
```

5. Create schemas assigned to respective users
```sql
CREATE SCHEMA IF NOT EXISTS s1 AUTHORIZATION u1;
CREATE SCHEMA IF NOT EXISTS s2 AUTHORIZATION u2;
CREATE SCHEMA IF NOT EXISTS s3 AUTHORIZATION u3;
```

Can use `\dn` to list all schemas

6. Create tables on schemas
```sql
CREATE TABLE IF NOT EXISTS s1.t1 (
    name text,
    secretstr text
);

CREATE TABLE IF NOT EXISTS s2.t1 (
    name text,
    secretstr text
);

CREATE TABLE IF NOT EXISTS s3.t1 (
    name text,
    secretstr text
);
```

7. Populate tables with data
```sql
INSERT INTO s1.t1 VALUES ('u1','aaaa'),('u2','bbbb'),('u3','cccc');
INSERT INTO s2.t1 VALUES ('u1','aaaa'),('u2','bbbb'),('u3','cccc');
INSERT INTO s3.t1 VALUES ('u1','aaaa'),('u2','bbbb'),('u3','cccc');
```

8. Give full priviliges to each role on its own schema
```sql
GRANT USAGE ON SCHEMA s1 TO u1;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA s1 TO u1;
GRANT USAGE ON SCHEMA s2 TO u2;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA s2 TO u2;
GRANT USAGE ON SCHEMA s3 TO u3;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA s3 TO u3;
```

9. Role `u1` can view only data in the name column in the table in `s3`. The secret string is not accessible.
```sql
GRANT USAGE ON SCHEMA s3 TO u1;
GRANT SELECT(name) ON s3.t1 TO u1;
```

10. Role `u2` can select only the row associated with `u2` in the table in `s3`
```sql
GRANT USAGE ON SCHEMA s3 TO u2;
ALTER TABLE s3.t1 ENABLE ROW LEVEL SECURITY;
CREATE POLICY restrict_u2 ON s3.t1 FOR SELECT TO u2 USING (name = CURRENT_USER);
GRANT SELECT ON s3.t1 TO u2;

CREATE POLICY enable_u1 ON s3.t1 FOR ALL TO u1 USING (TRUE); ---Allows for u1 to access name column despite RLS
```

11. Role `u2` can update the secret string in the table in `s1`
```sql
GRANT USAGE ON SCHEMA s1 TO u2;
GRANT SELECT, UPDATE(secretstr) ON s1.t1 TO u2;
```

13. Role `u3` can only view the data in `s2` via a function call that you will need to create. Direct access to the table in `s2` is not permitted. Role `u3` cannot access `s1`
```sql
CREATE OR REPLACE FUNCTION u3Access() 
    
    RETURNS TABLE (
        name text,
        secstring text
    )
    LANGUAGE plpgsql

    AS $$
    
    BEGIN
        RETURN QUERY
            SELECT 
                'name',
                secretstr
            FROM
                s2.t1;
    END; $$;
```
Use the `SET SEARCH_PATH=s2` command and `SHOW SEARCH_PATH`

