# Case

## Case expression

```
psql "postgres://postgres:example@localhost/postgres" -f queries/case.sql
```

## Switch-like case expression

```
psql "postgres://postgres:example@localhost/postgres" -f queries/switch.sql
```

## Case expression with alias

When a name is not specified for the case column, Postgres uses "case" as the column name.

To specify a column name, add an alias after the END keyword.

```
psql "postgres://postgres:example@localhost/postgres" -f queries/alias.sql
```