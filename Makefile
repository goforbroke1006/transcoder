PROJECT=transcoder
DOCKER_ID_USER=goforbroke1006

app_build:
	go build -o /code/build/${PROJECT} /code/cmd/${PROJECT}/main.go

image_build:
	docker build -t ${DOCKER_ID_USER}/${PROJECT} .
	docker push ${DOCKER_ID_USER}/${PROJECT}:latest