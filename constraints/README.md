# Constraints

## Check Constraints

### Unnamed Constraints

#### Column Constraint

```
psql "postgres://postgres:example@localhost/postgres" -f dml-scripts/check-column.sql
```

#### Table Constraint

```
psql "postgres://postgres:example@localhost/postgres" -f dml-scripts/check-table.sql
```

### Named Constraints

#### Column Constraint

```
psql "postgres://postgres:example@localhost/postgres" -f dml-scripts/check-column-named.sql
```

#### Table Constraint

```
psql "postgres://postgres:example@localhost/postgres" -f dml-scripts/check-table-named.sql
```