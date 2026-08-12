# Partitioning

## Range Partitioning

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/range.sql
```

You should see only `order_2026_02` in the query plan. That's partition pruning in action.

## List Partitioning

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/list.sql
```

You should see only `customer_us` and `customer_eu` in the query plan.

## Hash Partitioning

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/hash.sql
```

You should see only a single partition in the query plan.