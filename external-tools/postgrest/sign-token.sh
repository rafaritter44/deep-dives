#!/bin/bash
set -e

JWT_SECRET='reallyreallyreallyreallyverysafe'

exp=$(( $(date +%s) + 5*60 )) # five minutes

_base64 () { openssl base64 -e -A | tr '+/' '-_' | tr -d '='; }

header=$(echo -n '{"alg":"HS256","typ":"JWT"}' | _base64)
payload=$(echo -n "{\"role\":\"todo_user\",\"exp\":$exp}" | _base64)
signature=$(echo -n "$header.$payload" | openssl dgst -sha256 -hmac "$JWT_SECRET" -binary | _base64)

echo -n "$header.$payload.$signature"