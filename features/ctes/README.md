# Common Table Expressions (CTEs)

## `SELECT` in `WITH`

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/select-in-with.sql
```

## Recursive queries

### Simple example

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/recursive-simple.sql
```

### Useful example

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/recursive-useful.sql
```

### DFS

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/dfs.sql
```

### BFS

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/bfs.sql
```