# TimescaleDB (WIP)

## Load schema

```shell
psql "postgres://postgres:password@localhost/postgres" -f sql/schema.sql
```

## Load data

```shell
psql "postgres://postgres:password@localhost/postgres" -f sql/data.sql
```