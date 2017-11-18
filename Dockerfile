FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y git curl wget unzip

# Instal Go
RUN wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
RUN tar -C /usr/local -xvzf go1.9.2.linux-amd64.tar.gz
RUN mkdir -p /go/{bin,pkg,src}
ENV GOROOT=/usr/local/go
ENV GOPATH=/go
ENV PATH="${PATH}:$GOROOT/bin:$GOPATH/bin"

# Install Go libs
RUN go get -u github.com/golang/dep/cmd/dep
RUN go get -u github.com/golang/protobuf/proto
RUN go get -u github.com/golang/protobuf/protoc-gen-go

# Install Proto Buf
RUN cd /
RUN curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip
RUN rm -rf protoc3
RUN unzip protoc-3.2.0-linux-x86_64.zip -d protoc3
RUN rm -f protoc-3.2.0-linux-x86_64.zip
RUN mv protoc3/bin/* /usr/local/bin/
RUN mv protoc3/include/* /usr/local/include/
RUN ln -s ~/protoc3/bin/protoc /usr/bin/protoc

# Install ffmpeg
RUN apt-get install -y libav-tools
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:mc3man/trusty-media -y
RUN apt-get update
RUN apt-get install -y ffmpeg x264

WORKDIR /code

ADD ./ /code
CMD /usr/local/go/bin/go build -o /usr/local/bin/transcoder /code/cmd/transcoder/main.go
#CMD /usr/local/bin/transcoder &> /dev/null &

EXPOSE 8080
ENTRYPOINT /bin/bash