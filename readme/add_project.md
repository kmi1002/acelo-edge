# 프로젝트 추가하기
* **api, admin, web은 기본 설정이다.**
* 추가 프로젝트 설정시 [docker 추가하기](add_docker.md), [docker-compose 추가하기](add_docker-compose.md), [shell 추가하기](add_shell.md) **반드시 읽기**
* {GITHUB_ID}, {project} 수정하기

## API 프로젝트 생성
```
$> git clone https://github.com/kmi1002/nestjs-boilerplate.git acelo-edge-api
```

## Admin 프로젝트 생성
```p
$> git clone https://github.com/kmi1002/nextjs-boilerplate.git acelo-edge-admin
```

## Web 프로젝트 생성
```
$> git clone https://github.com/kmi1002/nextjs-boilerplate.git acelo-edge-web
```

## 서브 모듈 추가
```
$> ./git-module.sh master https://github.com/kmi1002/acelo-edge-api.git project/api
$> ./git-module.sh master https://github.com/kmi1002/acelo-edge-admin.git project/admin
$> ./git-module.sh master https://github.com/kmi1002/acelo-edge-web.git project/web
```

## .gitmodules 파일
```
[submodule "project/api"]
	path = project/api
	url = https://github.com/kmi1002/acelo-edge-api.git
	branch = master
[submodule "project/admin"]
	path = project/admin
	url = https://github.com/kmi1002/acelo-edge-admin.git
	branch = master
[submodule "project/web"]
	path = project/web
	url = https://github.com/kmi1002/acelo-edge-web.git
	branch = master
```