# Partitioning (WIP)

## Range Partitioning

```
psql "postgres://postgres:example@localhost/postgres" -f queries/range.sql
```

You should see only `order_2026_02` in the query plan. That's partition pruning in action.

## List Partitioning

```
psql "postgres://postgres:example@localhost/postgres" -f queries/list.sql
```

You should see only `customer_us` and `customer_eu` in the query plan.