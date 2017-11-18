PROJECT=transcoder
DOCKER_ID_USER=goforbroke1006

app_build:
	go build -o /code/build/${PROJECT} /code/cmd/${PROJECT}/main.go

image:
	docker build -t ${DOCKER_ID_USER}/${PROJECT} .
	docker push ${DOCKER_ID_USER}/${PROJECT}:latest

container:
	docker-compose stop || true
#	docker rm -f $(docker-compose ps -q) || true
	docker-compose build
	docker-compose up -d