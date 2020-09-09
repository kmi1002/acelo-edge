
# docker 추가하기
* 추가 프로젝트 설정시 [docker-compose 추가하기](add_docker-compose.md), [shell 추가하기](add_shell.md) **반드시 읽기**

## docker 구조
```
+ docker
+   mongodb
+   mysql
+   postgresql
```

`postgresql`폴더를 복제하고 폴더명을 `redis`으로 수정한다.
```
+   mongodb
+   mysql
+   postgresql
+   redis
-     Dockerfile
-     docker-healthcheck
```

## Dockerfile 수정
```
FROM redis:latest                      // redis으로 변경

COPY docker-healthcheck /usr/local/bin/

HEALTHCHECK CMD ["docker-healthcheck"]
```

## docker-healthcheck 수정
https://github.com/docker-library/healthcheck에서 `redis`를 찾아서 덮어쓴다.
```
#!/bin/bash
set -eo pipefail

host="$(hostname -i || echo '127.0.0.1')"

if ping="$(redis-cli -h "$host" ping)" && [ "$ping" = 'PONG' ]; then
	exit 0
fi

exit 1
```