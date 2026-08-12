# Citus

## Start cluster

```shell
docker compose up --scale worker=3
```

## Load schema

```shell
psql "postgres://postgres:secret@localhost/postgres" -f sql/schema.sql
```

## Load data

```shell
psql "postgres://postgres:secret@localhost/postgres" -f sql/data.sql
```

## Run single-shard query

```shell
psql "postgres://postgres:secret@localhost/postgres" -f sql/queries/single-shard-query.sql
```

## Explain multi-shard query

```shell
psql "postgres://postgres:secret@localhost/postgres" -f sql/queries/explain-multi-shard-query.sql
```

## Shut it down

```shell
docker compose down -v
```