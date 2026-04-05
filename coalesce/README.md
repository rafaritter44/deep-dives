# Coalesce

## Coalesce function

```
psql "postgres://postgres:example@localhost/postgres" -f queries/coalesce.sql
```

## Coalesce function with alias

When a name is not specified for the coalesce column, Postgres uses "coalesce" as the column name.

To specify a column name, add an alias after the coalesce function.

```
psql "postgres://postgres:example@localhost/postgres" -f queries/alias.sql
```