# shell 추가하기
* 추가 프로젝트 설정시 [docker 추가하기](add_docker.md), [docker-compose 추가하기](add_docker-compose.md) **반드시 읽기**
* -p project 수정하기

## shell 구조
```
+ shell
...
-   docker-start-dev.sh
-   docker-start-local.sh
-   docker-start-prod.sh
...
```

## docker-start-local..sh 수정
* `docker-start-dev.sh`, `docker-start-prod.sh`도 상황에 맞게 추가한다.
```
function local()
{
  echo
  PS3="Please select which option > "
  options=("All" "Api" "Api + Admin" "Api + Web" "Redis" "Quit")   // redis 추가
  select yn in "${options[@]}"; do
      case $yn in
          "All" )         local_all; break;;
          "Api" )         local_api; break;;
          "Api + Admin" ) local_admin; break;;
          "Api + Web" )   local_web; break;;
          "Redis" )       local_redis; break;;                     // redis 추가
          "Quit" )        exit;;
      esac
  done
}
```

```
function local_redis()                                             // redis 추가
{
  cp .env.local .env
  docker-compose \
    -f ./docker-compose/redis/docker-compose.base.yml \
    -f ./docker-compose/redis/docker-compose.local.yml \
    up $build --remove-orphans
}
```

```
function local_all()
{
  cp .env.local .env
  docker-compose \
    ...
    -f ./docker-compose/redis/docker-compose.base.yml \             // redis 추가
    -f ./docker-compose/redis/docker-compose.local.yml \            // redis 추가
    ...
}
```