# Aggregate Functions

## COUNT

```
psql "postgres://postgres:example@localhost/postgres" -f queries/count.sql
```

## MAX

```
psql "postgres://postgres:example@localhost/postgres" -f queries/max.sql
```

## MIN

```
psql "postgres://postgres:example@localhost/postgres" -f queries/min.sql
```

## SUM

```
psql "postgres://postgres:example@localhost/postgres" -f queries/sum.sql
```

## AVG

```
psql "postgres://postgres:example@localhost/postgres" -f queries/avg.sql
```

## STRING_AGG

```
psql "postgres://postgres:example@localhost/postgres" -f queries/string-agg.sql
```

## HAVING on aggregated column

```
psql "postgres://postgres:example@localhost/postgres" -f queries/having-aggregated.sql
```

## HAVING on grouped column

```
psql "postgres://postgres:example@localhost/postgres" -f queries/having-grouped.sql
```

## Aggregate function without GROUP BY

```
psql "postgres://postgres:example@localhost/postgres" -f queries/no-group-by.sql
```

## GROUPING SETS

```
psql "postgres://postgres:example@localhost/postgres" -f queries/grouping-sets.sql
```

## ROLLUP

```
psql "postgres://postgres:example@localhost/postgres" -f queries/rollup.sql
```

## CUBE

```
psql "postgres://postgres:example@localhost/postgres" -f queries/cube.sql
```