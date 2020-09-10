# project-boilerplate
* 추가 프로젝트 설정시 [docker 추가하기](add_docker.md), [docker-compose 추가하기](add_docker-compose.md), [shell 추가하기](add_shell.md) **반드시 읽기**

## 프로젝트 생성
```
$> git clone https://github.com/kmi1002/project-boilerplate.git {project}
```

## 구조
```
+ data                    // 도커 데이터
+ docker                  // 도커 설정 폴더
+ docker-compose          // 도커 컴포즈 폴더
+ project                 // 프로젝트 폴더
+   admin                 // 관리자 프로젝트
+   api                   // API 프로제트
+   web                   // 웹 프로제트
+ readme                  // 가이드
+ shell                   // 스크립트 폴더
- .env.example            // 환경 변수
- .gitignore              // git 무시 설정
- .gitmodules             // git submodle 설정
- docker.sh               // 도커 실행 파일
- git.sh                  // git 실행 파일
- git-module.sh           // git submodule 실행 파일
- README.md               // 가이드
```

## Git Submodule 관리
[project 추가하기](readme/add_project.md) **반드시 읽기**

### 서브 모듈 추가
* **api, admin, web은 기본 설정이고 project 상위 폴더를 꼭 지정한다.**
```
$> ./git-module.sh {branch} {git url} project/{name}
```

### 서브 모듈 삭제
```
$> ./git-module.sh project/{name}
```


## Git 관리
* Git Init : git 서브 모듈 초기화
* Git Update : 최신 소스 업데이트

```
$> ./git.sh

1) Git Init
2) Git Update
3) Quit
Please select which option > 
```


## env 설정
* `.env.prod` : 운영 서버 환경 변수
* `.env.dev` : 개발 서버 환경 변수
* `.env.local` : 로컬 서버 환경 변수
* 서비스 시작 시 `.env` 파일로 복사하여 사용


## Docker 관리
### Docker 설정
* 도커 이미지를 재빌드 할 수 있는 `--build` 옵션 값을 지원한다
* 첫 실행시 이미지가 없기 때문에 `--build` 옵션으로 실행한다
```
$> ./docker.sh {--build}

1) Docker Start
2) Docker Stop
3) Quit
Please select which option >
```

### 서버 환경 설정
* Local Server : 로컬 개발 컨테이너에 연결되는 로컬 서버 환경
* Development Server : 개발 인스턴스에 연결되는 개발 서버 환경
* Production Server : 운영 인스턴스에 연결되는 운영 서버 환경

```
Please select which option > 1

1) Local Server	       3) Production Server
2) Development Server  4) Quit
Please select which option >
```

### Docker 시작
* All : Api + Web + Admin 순으로 서버를 실행한다
* Api : Api 서버만 실행한다
* Api + Admin : Api + Admin 순으로 서버를 실행한다
* Api + Web : Api + Web 순으로 서버를 실행한다
```
Please select which option > 1   

1) All
2) Api
3) Api + Admin
4) Api + Web
5) Quit
Please select which option > 
```

### Docker 종료
```
Please select which option > 2
For all Docker containers or images (not just Hyperledger Fabric and Composer)
1 - Kill and remove only the containers
2 - Kill and remove the containers and remove all the downloaded images
3 - Quit and not do anything

1) Kill & Remove
2) Remove Images
3) Quit
Please select which option > 
```


## 추가 설정
* [project 추가하기](readme/add_project.md)
* [docker 추가하기](readme/add_docker.md)
* [docker-compose 추가하기](readme/add_docker-compose.md)
* [shell 추가하기](readme/add_shell.md)
