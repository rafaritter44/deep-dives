# Joins

## Cross join

`FROM T1 CROSS JOIN T2` is equivalent to `FROM T1 INNER JOIN T2 ON TRUE`. It is also equivalent to `FROM T1, T2`.

### Implicit

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/cross-implicit.sql
```

### Explicit

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/cross-explicit.sql
```

## Join condition

### ON

A restriction placed in the `ON` clause is processed _before_ the join, while a restriction placed in the `WHERE` clause is processed _after_ the join. That does not matter with inner joins, but it matters a lot with outer joins.

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/on.sql
```

### USING

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/using.sql
```

### NATURAL

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/natural.sql
```

## Qualified joins

The words `INNER` and `OUTER` are optional in all forms. `INNER` is the default; `LEFT`, `RIGHT`, and `FULL` imply an outer join.

### Inner join

#### Implicit

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/inner-implicit.sql
```

#### Explicit

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/inner-explicit.sql
```

### Outer join

#### Left join

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/outer-left.sql
```

#### Right join

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/outer-right.sql
```

#### Full join

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/outer-full.sql
```

## Self-join

### Hierarchical

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/self-hierarchical.sql
```

### Peer comparison

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/self-peer-comparison.sql
```

## Anti-join

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/anti.sql
```