# airbnb-graphql

A GraphQL Server boilerplate made with Typescript, PostgreSQL, and Redis

## Installation

1. Clone project

```
git clone https://github.com/KyungOhKim/airbnb-graphql.git
```

2. cd into folder

```
cd airbnb-graphql
```

3. Download dependencies

```
yarn
```

4. Start PostgreSQL server
5. Create database called `airbnb_graphql`

```
create database airbnb_graphql
```

6. [Add a user](https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e) with the username `postgres` and no password. (You can change what these values are in the [ormconfig.json](https://github.com/KyungOhKim/airbnb-graphql/blob/master/ormconfig.json))

7. Install and start Redis

## Usage

You can start the server with `yarn start` then navigate to `http://localhost:4000` to use GraphQL Playground.

## Features

- Register - Send confirmation email
- Login
- Forgot Password
- Logout
- Cookies
- Authentication middleware
- Rate limiting
- Locking accounts
- Testing (probably Jest)

# Part 0

typeorm 프로젝트 생성
typeorm init --name 프로젝트명 --database postgres

db 생성
psql -U postgres
password 입력 후 create database DB이름;

QueryFailedError: cnst.consrc 칼럼 없음 at new QueryFailedError
-> typeorm 버전을 0.2.21로 올려서 해결

# Part 1

사용자를 만들때마다 자동으로 uuid를 생성

# Part 2

users 테이블에 email, password를 mutation함

# Part 3

yarn test 할 때 securityerror: localstorage is not available for opaque origins at window.get localstorage [as localstorage]
-> jest 버전을 24.9.0로 올려서 해결

# Part 4

NODE_ENV'은(는) 내부 또는 외부 명령, 실행할 수 있는 프로그램, 또는
배치 파일이 아닙니다
-> cross-env package 설치 후 package.json의 scripts에서 "test-server": "cross-env NODE_ENV=test ts-node src/index.ts"로 변경

# Part 5

Consider running Jest with `--detectOpenHandles` to troubleshoot this issue.
-> package.json의 scripts에서 "test": "cross-env NODE_ENV=test jest --detectOpenHandles"로 변경

# Part 6

src/modules/tmp/schema.graphql

type Query {
hello(name: String): String!
}

src/modules/tmp/resolvers.ts

import { ResolverMap } from "../../types/graphql-utils";

export const resolvers: ResolverMap = {
Query: {
hello: (\_, { name }: GQL.IHelloOnQueryArguments) =>
`Bye ${name || "World"}`,
},
};

# Part 9

Returning a Promise from "describe" is not supported. Tests must be defined synchronously.
-> describe("Register user", () => {})로 변경

# Part 11

Warning: no config file specified, using the default config.
-> redis-cli ping -> PONG 반환 후 redis-cli shutdown 실행 -> redis 종료 후 redis-server 실행

# Part 13

.env

SPARKPOST_API_KEY=sparkpost에서 sign up하고 만든 api key

terminal에서 redis-server 실행 후 terminal을 하나 더 열어서 yarn start

https://10minutemail.net/?lang=ko 에 나오는 임의의 email 주소로 playground에서 mutation register하고 메일이 오는 것을 확인 -> confirm email을 클릭하면 페이지 이동 후 ok가 보이고 새로고침 하면 invalid가 보임(pgadmin에서 users 테이블을 보면 confirmed 필드가 false에서 true로 변경됨)

# Part 15

TSError: ⨯ Unable to compile TypeScript
src\startServer.ts (10,33): Argument of type 'typeof session' is not assignable to parameter
of type '(options?: SessionOptions | undefined) => RequestHandler<ParamsDictionary, any, any, Par
sedQs>'.
-> 나중 Part에서 해결 예정

# Part 16

@types/express-session 버전을 1.15.16로 변경하여 Part 15의 TSError를 해결

# Part 30

npx jest --no--cache --detectOpenHandles를 terminal에 입력하여 테스트함

module '"net"' has no exported member 'addressinfo'
-> @types/node 버전을 10.11.0로 변경하여 해결
