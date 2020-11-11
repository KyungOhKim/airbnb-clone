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

packages 디렉토리에서 터미널에 git clone https://github.com/KyungOhKim/airbnb-graphql.git server 입력

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
