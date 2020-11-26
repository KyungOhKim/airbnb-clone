# fullstack-graphql-airbnb-clone

A Fullstack GraphQL Airbnb Clone with React and React Native

## Road map

1. Website register/login
2. Deploy backend and frontend
3. App register/login
4. Website and App forgot password
5. Website and App create listing
6. Website and App view listings
7. Website and App chat
8. Feature requests

## Notes

- Typescript
- Ant Design

# Part 1

packages 디렉토리에서 터미널에 git clone https://github.com/kko0831/airbnb-graphql.git server 입력

server 디렉토리에서 터미널에 rm -rf .git 입력

루트 디렉토리에서 터미널에 git init 입력

루트 디렉토리에서 터미널에 yarn install 입력

server 디렉토리에 있는 .gitignore와 ormconfig.json을 루트 디렉토리로 이동

터미널2에 redis-server를 입력(redis 실행)하고 터미널1에 yarn test 입력

packages 디렉토리에서 터미널에 create-react-app web --template typescript 입력

web 디렉토리에서 터미널에 yarn start 입력

# Part 2

web 디렉토리에서 터미널에 yarn start 입력 후 localhost:3000/register에서 register page가 잘 나오는지 확인

# Part 3

Replace text-decoration-skip: ink to text-decoration-skip-ink: auto라는 compile warning이 뜸
-> airbnb-clone/node_modules/antd/dist/antd.css에서 text-decoration-skip: ink를 text-decoration-skip-ink: auto로 변경

If you cannot provide a valid href, but still need the element to resemble a link, use a button and change it with appropriate styles라는 compile warning이 뜸
-> <a></a> 대신 <Link></Link> 사용

localhost:3000/register에서 email input에 bob, password input에 bob2를 치면 개발자 도구 console에 {email: "bob", password: "bob2"}가 보임

# Part 4

web 디렉토리에서 yarn start 했을 때 Module not found: Can't resolve '@babel/runtime/helpers/builtin/extends' 에러가 뜸
-> web 디렉토리의 yup 버전을 0.26.2로 변경하여 해결

# Part 5

common 디렉토리에서 yarn build 하여 dist 디렉토리 생성됨

web 디렉토리에서 yarn start 했을 때 Module not found: Can't resolve '@babel/runtime/helpers/builtin/extends' 에러가 뜸
-> common 디렉토리의 yup 버전을 0.26.2로 변경하여 해결

# Part 6

web 디렉토리에서 yarn start 했을 때 Type 'StatelessComponent<FieldProps<any> & { prefix: ReactNode; }>' is not assignable to type 'string | ComponentClass<FieldProps<any>, any> | FunctionComponent<FieldProps<any>> | ComponentCla...'. 에러가 뜸
-> component={InputField}를 component={InputField as any}로 변경

# Part 7

controller 디렉토리에서 yarn build 하여 dist 디렉토리 생성됨

# Part 8

루트 디렉토리에서 redis-server 실행

server 디렉토리에서 .env 파일 생성

SPARKPOST_API_KEY=sparkpost에서 sign up하고 만든 api key
FRONTEND_HOST=yarn start하여 React를 실행하는 url

server 디렉토리에서 yarn start 했을 때 error: "password" 열에는 null 값 자료가 있습니다
-> DB에 password가 null인 user 데이터 삭제 후 yarn start하여 해결

yarn start 후 localhost:4000에서

mutation {
register(
email: "10minutemail.net/?lang=ko에서 생성된 메일 주소",
password: "임의의 password"
) {
path
message
}
}

response가 아래처럼 나오면서 user 생성됨
{
"data": {
"register": null
}
}

packages/controller/src/modules/RegisterController/index.tsx 수정 후 controller 디렉토리 terminal에서 yarn build 입력

web 디렉토리에서 yarn start하여 localhost:3000/register로 이동 -> https://10minutemail.net/?lang=ko 에 나오는 임의의 email과 password 입력하고 Register 버튼 누르면 response로 data 객체 리턴됨(user가 생성됨) -> https://10minutemail.net/?lang=ko 로 메일이 오는 것을 확인하고 confirm email을 클릭하면 페이지 이동 후 ok가 보임

# Part 9

루트 디렉토리에서 redis-server를 실행하고 server 디렉토리에서 yarn start한 후 controller 디렉토리에서 terminal에 yarn global add apollo-codegen@0.19.1 입력

yarn add apollo-codegen@0.19.1 --dev하고 controller 디렉토리에서 terminal에 apollo-codegen introspect-schema http://localhost:4000 --output schema.json을 입력하면 schema.json 파일 생성됨

controller 디렉토리의 src/modules/RegisterController/index.tsx에서 mutation 이름을 RegisterMutation로 추가한 후 terminal에 apollo-codegen generate src/\*_/_.tsx --schema schema.json --target ts-modern을 입력하면 src/modules/RegisterController/**generated** 디렉토리에 RegisterMutation.ts 파일이 생성됨

controller 디렉토리의 package.json에 scripts를 추가하여 yarn gen-types를 입력했을 때 apollo-codegen이 introspect-schema와 generate를 잘 하는지 확인

# Part 10

server 디렉토리에서 yarn build 실행하여 dist 디렉토리 생성됨

copyfiles src/\*_/_.graphql dist하여 dist/modules 디렉토리에 스키마 파일 복사

docker 설치: https://docs.docker.com/docker-for-windows/install-windows-home/
https://meaownworld.tistory.com/156

루트 디렉토리에 Dockerfile과 .dockerignore 작성 후 docker build -t kko0831/airbnb-clone:1.0.0 . 실행

Remove the existing file and try again, or run npm with --force to overwrite files recklessly 에러 -> Dockerfile의 RUN npm i -g yarn에 --force 추가

루트 디렉토리 터미널에서 docker run -p 3001:4000 --net="host" -d kko0831/airbnb-clone:1.0.0 실행

# Part 11

digitalocean에 sign up함

dokku로 create droplets함

droplet 이름 옆에 있는 ip 주소 복사해서 크롬에서 염

루트 디렉토리 터미널에서 ssh root@droplet 이름 옆에 있는 ip 주소 입력

SSH 키를 설정하는 방법
https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-2

root@airbnb-clone:~#에 dokku apps:create airbnb-clone 입력

root@airbnb-clone:~#에 sudo dokku plugin:install https://github.com/dokku/dokku-postgres.git postgres 입력

root@airbnb-clone:~#에 dokku postgres:create pg 입력

root@airbnb-clone:~#에 dokku postgres:link pg airbnb-clone 입력

root@airbnb-clone:~#에 sudo dokku plugin:install https://github.com/dokku/dokku-redis.git redis 입력

root@airbnb-clone:~#에 dokku redis:create red 입력

root@airbnb-clone:~#에 dokku redis:link red airbnb-clone 입력

root@airbnb-clone:~#에 exit를 입력하여 logout 함

루트 디렉토리에서 docker build -t kko0831/airbnb-clone:1.0.0 . 실행

https://hub.docker.com에서 docker hub 생성하고 터미널에 docker login 입력하여 로그인

루트 디렉토리에서 docker push kko0831/airbnb-clone:1.0.0 입력

루트 디렉토리 터미널에서 ssh root@droplet 이름 옆에 있는 ip 주소 입력

root@airbnb-clone:~#에 docker pull kko0831/airbnb-clone:1.0.0 입력

root@airbnb-clone:~#에 docker tag kko0831/airbnb-clone:1.0.0 dokku/airbnb-clone:latest 입력

root@airbnb-clone:~#에 dokku tags:deploy airbnb-clone latest 입력

server 디렉토리에서 yarn build 하고 루트 디렉토리에서 docker build -t kko0831/airbnb-clone:1.0.0 . 입력

루트 디렉토리에서 docker push kko0831/airbnb-clone:1.0.0 입력

루트 디렉토리 터미널에서 ssh root@droplet 이름 옆에 있는 ip 주소 입력

root@airbnb-clone:~#에 docker tag kko0831/airbnb-clone:1.0.0 dokku/airbnb-clone:latest 입력

root@airbnb-clone:~#에 docker pull kko0831/airbnb-clone:1.0.0 입력

root@airbnb-clone:~#에 docker tag kko0831/airbnb-clone:1.0.0 dokku/airbnb-clone:latest 입력

root@airbnb-clone:~#에 dokku tags:deploy airbnb-clone latest 입력

The following variables were defined in .env.example but are not present in the environment 에러 발생
-> server 디렉토리의 .env와 .env.prod에 FRONTEND_HOST=http://localhost:3000로 수정하여 해결

root@airbnb-clone:~#에 dokku logs airbnb-clone 입력

root@airbnb-clone:~#에 dokku proxy:ports airbnb-clone 입력

root@airbnb-clone:~#에 dokku proxy:ports-add airbnb-clone http:80:4000 입력

root@airbnb-clone:~#에 dokku tags:deploy airbnb-clone latest 입력하여 배포된 url을 크롬 창에 입력

# Part 12

루트 디렉토리 터미널에 yarn global add lerna@2.11.0 입력

루트 디렉토리 터미널에 lerna init 입력

server 디렉토리 터미널에 yarn build 입력

common 디렉토리 터미널에 yarn build 입력

루트 디렉토리 터미널에 yarn build:server 입력

루트 디렉토리 터미널에 chmod +x deploy.sh 입력

루트 디렉토리 터미널에 mv deploy.sh deploy_server_do 입력

루트 디렉토리 터미널에 mv deploy_server_do deploy_server_do.sh 입력

루트 디렉토리 터미널에 ./deploy_server_do.sh 입력

배포된 url을 크롬 창에 입력

# Part 13

루트 디렉토리 터미널에 yarn global add heroku 입력

루트 디렉토리 터미널에 heroku login 입력

루트 디렉토리 터미널에 heroku container:login 입력

루트 디렉토리 터미널에 heroku create 입력

https://elements.heroku.com/addons에서 postgres를 검색하여 heroku postgres를 선택하여 설치

https://elements.heroku.com/addons에서 redis를 검색하여 heroku redis를 선택하여 설치

settings에 가서 app name 확인

루트 디렉토리 터미널에 ./deploy_server_do.sh 입력
