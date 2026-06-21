# Aggregate Functions

## COUNT

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/count.sql
```

With GROUP BY:

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/count-group-by.sql
```

## MAX

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/max.sql
```

With GROUP BY:

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/max-group-by.sql
```

## MIN

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/min.sql
```

With GROUP BY:

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/min-group-by.sql
```

## SUM

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/sum.sql
```

With GROUP BY:

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/sum-group-by.sql
```

## AVG

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/avg.sql
```

With GROUP BY:

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/avg-group-by.sql
```

## STRING_AGG

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/string-agg.sql
```

With GROUP BY:

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/string-agg-group-by.sql
```

## ARRAY_AGG

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/array-agg.sql
```

With GROUP BY:

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/array-agg-group-by.sql
```

## HAVING on aggregated column

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/having-aggregated.sql
```

With GROUP BY:

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/having-aggregated-group-by.sql
```

## HAVING on grouped column

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/having-grouped.sql
```

## FILTER

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/filter.sql
```

With GROUP BY:

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/filter-group-by.sql
```

## GROUPING SETS

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/grouping-sets.sql
```

## ROLLUP

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/rollup.sql
```

## CUBE

```shell
psql "postgres://postgres:example@localhost/postgres" -f queries/cube.sql
```