create-db:
	PGPASSWORD=postgres psql -h localhost -U postgres -c 'CREATE DATABASE go_crud_restful_api;'
	PGPASSWORD=postgres psql -h localhost -U postgres -c 'CREATE DATABASE go_crud_restful_api_test;'

#-------------------------------------#

all-go-test:
	go test -v ./tests/...

#-------------------------------------#

test-home:
	curl --request GET \
  	--url http://localhost:8080/

#-------------------------------------#

test-create-user:
	curl --request POST \
  	--url http://localhost:8080/users \
  	--header 'Content-Type: application/json' \
  	--data '{"nickname": "demo user","email": "demouser@gmail.com","password": "password"}'

test-get-user-1:
	curl --request GET \
  	--url http://localhost:8080/users/1

test-get-users:
	curl --request GET \
  	--url http://localhost:8080/users

test-login-user-1:
	curl --request POST \
  	--url http://localhost:8080/login \
  	--header 'Content-Type: application/json' \
  	--data '{"email": "steven@gmail.com","password": "password"}'

test-login-user-2:
	curl --request POST \
  	--url http://localhost:8080/login \
  	--header 'Content-Type: application/json' \
  	--data '{"email": "luther@gmail.com","password": "password"}'

test-update-user-1:
	curl --request PUT \
  	--url http://localhost:8080/users/1 \
	--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2NTY3OTMwNzMsInVzZXJfaWQiOjF9.Y9X8sFHFA3u40sWvu5oa_lWQlWZTflGkqkfa_6TAICs' \
	--header 'Content-Type: application/json' \
  	--data '{"nickname": "Steven victor updated","email": "steven@gmail.com","password": "password"}'

test-delete-user-2:
	curl --request DELETE \
  	--url http://localhost:8080/users/2 \
	--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2NTY3OTI3MDQsInVzZXJfaWQiOjJ9.GSlEqA5t9bKvrKz27Iid5RMqvIKdA9x8qOOBeZF-JLk'

#-------------------------------------#

test-create-post:
	curl --request POST \
	--url http://localhost:8080/posts \
	--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2NTY3OTM1MzQsInVzZXJfaWQiOjF9.PLbT5R8gc4ziM2LC2xu9C3EZ6DEYQNbUm6AWd6uuvhI' \
	--header 'Content-Type: application/json' \
	--data '{"title": "Created title","author_id": 1,"content": "Created content"}'

test-get-post-1:
	curl --request GET \
  	--url http://localhost:8080/posts/1

test-delete-post:
	curl --request DELETE \
	--url http://localhost:8080/posts/1 \
	--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2NTY3OTM1MzQsInVzZXJfaWQiOjF9.PLbT5R8gc4ziM2LC2xu9C3EZ6DEYQNbUm6AWd6uuvhI'

test-get-posts:
	curl --request GET \
  	--url http://localhost:8080/posts

test-update-post:
	curl --request PUT \
	--url http://localhost:8080/posts/1 \
	--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2NTY3OTIyMDgsInVzZXJfaWQiOjF9.AvcocuMXvv5fE36nVA3gE_tEaks411iS2t1QKw0WuAw' \
	--header 'Content-Type: application/json' \
	--data '{"title": "New title","author_id": 1,"content": "New content"}'