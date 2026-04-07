# Aggregate Functions

## COUNT

```
psql "postgres://postgres:example@localhost/postgres" -f queries/count.sql
```

With GROUP BY:

```
psql "postgres://postgres:example@localhost/postgres" -f queries/count-group-by.sql
```

## MAX

```
psql "postgres://postgres:example@localhost/postgres" -f queries/max.sql
```

With GROUP BY:

```
psql "postgres://postgres:example@localhost/postgres" -f queries/max-group-by.sql
```

## MIN

```
psql "postgres://postgres:example@localhost/postgres" -f queries/min.sql
```

With GROUP BY:

```
psql "postgres://postgres:example@localhost/postgres" -f queries/min-group-by.sql
```

## SUM

```
psql "postgres://postgres:example@localhost/postgres" -f queries/sum.sql
```

With GROUP BY:

```
psql "postgres://postgres:example@localhost/postgres" -f queries/sum-group-by.sql
```

## AVG

```
psql "postgres://postgres:example@localhost/postgres" -f queries/avg.sql
```

With GROUP BY:

```
psql "postgres://postgres:example@localhost/postgres" -f queries/avg-group-by.sql
```

## STRING_AGG

```
psql "postgres://postgres:example@localhost/postgres" -f queries/string-agg.sql
```

With GROUP BY:

```
psql "postgres://postgres:example@localhost/postgres" -f queries/string-agg-group-by.sql
```

## HAVING on aggregated column

```
psql "postgres://postgres:example@localhost/postgres" -f queries/having-aggregated.sql
```

With GROUP BY:

```
psql "postgres://postgres:example@localhost/postgres" -f queries/having-aggregated-group-by.sql
```

## HAVING on grouped column

```
psql "postgres://postgres:example@localhost/postgres" -f queries/having-grouped.sql
```

With GROUP BY:

```
psql "postgres://postgres:example@localhost/postgres" -f queries/having-grouped-group-by.sql
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