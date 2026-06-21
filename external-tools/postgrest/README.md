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