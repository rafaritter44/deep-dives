# PostgREST

## GET

```shell
curl http://localhost:3000/todo
```

## Unauthorized POST

```shell
curl http://localhost:3000/todo -X POST \
     -H "Content-Type: application/json" \
     -d '{"task": "do bad thing"}'
```

The response should be 401.

## Sign token

```shell
TOKEN=$(./sign-token.sh)
```

## POST

```shell
curl http://localhost:3000/todo -X POST \
     -H "Authorization: Bearer $TOKEN"   \
     -H "Content-Type: application/json" \
     -d '{"task": "learn how to auth"}'
```

## PATCH

```shell
curl http://localhost:3000/todo -X PATCH \
     -H "Authorization: Bearer $TOKEN"    \
     -H "Content-Type: application/json"  \
     -d '{"done": true}'
```

## Sign attacker token

```shell
ATTACKER_TOKEN=$(./sign-attacker-token.sh)
```

## Forbidden PATCH

```shell
curl http://localhost:3000/todo -X PATCH      \
     -H "Authorization: Bearer $ATTACKER_TOKEN" \
     -H "Content-Type: application/json"       \
     -d '{"task": "AAAHHHH!", "done": false}'
```