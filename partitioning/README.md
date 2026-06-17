# Partitioning (WIP)

## Range Partitioning

```
psql "postgres://postgres:example@localhost/postgres" -f queries/range.sql
```

You should see only `order_2026_02` in the query plan. That's partition pruning in action.