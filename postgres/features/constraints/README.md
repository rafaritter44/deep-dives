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

## Exclusion Constraints (WIP)

### References

https://www.postgresql.org/docs/current/ddl-constraints.html#DDL-CONSTRAINTS-EXCLUSION
https://www.postgresql.org/docs/current/sql-createtable.html#SQL-CREATETABLE-EXCLUDE