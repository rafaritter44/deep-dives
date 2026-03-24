# View

## Query table v1

```
psql "postgres://postgres:example@localhost/postgres" -f queries/query-table-v1.sql
```

## Query view v1

```
psql "postgres://postgres:example@localhost/postgres" -f queries/query-view-v1.sql
```

## Rename column

```
psql "postgres://postgres:example@localhost/postgres" -f ddl-scripts/rename-column.sql
```

Renaming a column from the base table won't affect the view. You can try querying the view again and you'll notice that it still works. The underlying query was automatically updated along with the base table.

Also notice that even though the column name in the base table has changed, the column name in the view has not changed.

## Rename table

```
psql "postgres://postgres:example@localhost/postgres" -f ddl-scripts/rename-table.sql
```

The same applies to renaming the base table. Queries to the view are not affected.

## Query table v2

Queries to the base table, however, are affected, of course.

```
psql "postgres://postgres:example@localhost/postgres" -f queries/query-table-v2.sql
```

## Rename view

```
psql "postgres://postgres:example@localhost/postgres" -f ddl-scripts/rename-view.sql
```

And renaming a view will only affect queries to the view; not to the base table, of course.

## Query view v2

```
psql "postgres://postgres:example@localhost/postgres" -f queries/query-view-v2.sql
```

## Drop column

The following DDL script will fail because it tries to drop a column that is used by the view.

```
psql "postgres://postgres:example@localhost/postgres" -f ddl-scripts/drop-column.sql
```

## Drop column cascade

You would have to force it by using cascade, thus dropping the view as a result.

```
psql "postgres://postgres:example@localhost/postgres" -f ddl-scripts/drop-column-cascade.sql
```