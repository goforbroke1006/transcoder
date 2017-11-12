FROM debian:jessie
#FROM golang
#FROM jrottenberg/ffmpeg

COPY ./.docker/bin /bin
RUN chmod +x /bin/*.sh
RUN /bin/install-ffmpeg.sh
RUN /bin/install-go-1.9.2.sh

RUN go get -u github.com/golang/dep/cmd/dep

WORKDIR /code

EXPOSE 8080
ENTRYPOINT /usr/bin/bash

ADD ./ /code
CMD /usr/local/go/bin/go build -o /usr/local/bin/transcoder /code/cmd/transcoder/main.go
CMD /usr/local/bin/transcoder &> /dev/null &