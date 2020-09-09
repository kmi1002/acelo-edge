
# docker-compose 추가하기
* 추가 프로젝트 설정시 [docker 추가하기](add_docker.md), [shell 추가하기](add_shell.md) **반드시 읽기**
* docker-compose.base.yml에서 container_name 수정하기

## docker-compose 구조
```
+ docker-compose
+   admin
+   api
+   web
```

`api`폴더를 복제하고 폴더명을 `redis`으로 수정한다.
```
+ docker-compose
+   admin
+   api
+   redis
-     docker-compose.base.yml
-     docker-compose.dev.yml
-     docker-compose.local.yml
-     docker-compose.prod.yml
+   web
```

## docker-compose.base.yml 수정
```
version: '3'

services:
  redis:                                 // redis으로 변경
    build:
      context: ../project/redis          // redis으로 변경
    environment:
      ...
      REDIS_HOST: ${REDIS_HOST}          // redis host 추가
      REDIS_PORT: ${REDIS_PORT}          // redis port 추가
      ...
    ports:
      - "${REDIS_PORT}:6379"             // redis port 수정
    ...
```

## docker-compose.local.yml 수정
```
version: '3'

services:
  redis:                                 // redis으로 변경
    build:
      dockerfile: Dockerfile.local
    environment:
      APP_ENV: local
    volumes:
      - ../project/redis:/usr/src/app    // redis으로 변경
    depends_on:
      ...
      - example                          // 상황에 맞게 추가
```

## docker-compose.dev.yml 수정
```
version: '3'

services:
  redis:                                 // redis으로 변경
    build:
      dockerfile: Dockerfile.dev
    environment:
      APP_ENV: development
    volumes:
      - ../project/redis:/usr/src/app    // redis으로 변경
      ...
      - example                          // 상황에 맞게 추가
```

## docker-compose.prod.yml 수정
```
version: '3'

services:
  redis:                                 // redis으로 변경
    build:
      dockerfile: Dockerfile
    environment:
      APP_ENV: production
    volumes:
      - ../project/redis:/usr/src/app    // redis으로 변경
      ...
      - example                          // 상황에 맞게 추가
```