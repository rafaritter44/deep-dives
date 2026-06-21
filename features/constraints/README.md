# Constraints

## Check Constraints

### Unnamed Constraints

#### Column Constraint

```shell
psql "postgres://postgres:example@localhost/postgres" -f dml-scripts/check-column.sql
```

#### Table Constraint

```shell
psql "postgres://postgres:example@localhost/postgres" -f dml-scripts/check-table.sql
```

### Named Constraints

#### Column Constraint

```shell
psql "postgres://postgres:example@localhost/postgres" -f dml-scripts/check-column-named.sql
```

#### Table Constraint

```shell
psql "postgres://postgres:example@localhost/postgres" -f dml-scripts/check-table-named.sql
```