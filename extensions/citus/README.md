# Citus

## Start cluster

`docker compose up --scale worker=3`

## Load schema

`psql "postgres://postgres:secret@localhost/postgres" -f sql/schema.sql`

## Load data

`psql "postgres://postgres:secret@localhost/postgres" -f sql/data.sql`

## Run single-shard query

`psql "postgres://postgres:secret@localhost/postgres" -f sql/queries/single-shard-query.sql`

## Explain multi-shard query

`psql "postgres://postgres:secret@localhost/postgres" -f sql/queries/explain-multi-shard-query.sql`

## Shut it down

`docker compose down -v`