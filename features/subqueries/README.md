# Subqueries

## In the WHERE clause

```
psql "postgres://postgres:example@localhost/postgres" -f queries/where.sql
```

## In the SELECT clause

```
psql "postgres://postgres:example@localhost/postgres" -f queries/select.sql
```

## In the FROM clause

```
psql "postgres://postgres:example@localhost/postgres" -f queries/from.sql
```

## Correlated subqueries

### In the WHERE clause

```
psql "postgres://postgres:example@localhost/postgres" -f queries/correlated-where.sql
```

### In the SELECT clause

```
psql "postgres://postgres:example@localhost/postgres" -f queries/correlated-select.sql
```

### In the FROM clause (LATERAL)

```
psql "postgres://postgres:example@localhost/postgres" -f queries/correlated-from.sql
```

### EXISTS (semi-join)

```
psql "postgres://postgres:example@localhost/postgres" -f queries/exists.sql
```

### NOT EXISTS (anti-join)

```
psql "postgres://postgres:example@localhost/postgres" -f queries/not-exists.sql
```

## IN (semi-join)

```
psql "postgres://postgres:example@localhost/postgres" -f queries/in.sql
```

## NOT IN (anti-join)

```
psql "postgres://postgres:example@localhost/postgres" -f queries/not-in.sql
```

Note that if the left-hand expression yields null, or if there are no equal right-hand values and at least one right-hand row yields null, the result of the `NOT IN` construct will be null, not true. This is in accordance with SQL's normal rules for Boolean combinations of null values.

## ANY/SOME

```
psql "postgres://postgres:example@localhost/postgres" -f queries/any.sql
```

```
psql "postgres://postgres:example@localhost/postgres" -f queries/some.sql
```

`SOME` is a synonym for `ANY`. `IN` is equivalent to `= ANY`.

## ALL

```
psql "postgres://postgres:example@localhost/postgres" -f queries/all.sql
```

`NOT IN` is equivalent to `<> ALL`.