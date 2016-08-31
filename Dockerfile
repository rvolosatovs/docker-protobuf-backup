FROM alpine:3.4
MAINTAINER Steeve Morin <steeve@zen.ly>

ENV GRPC_VERSION 1.0.0
ENV PROTOBUF_VERSION 3.0.0
ENV GOPATH /go

RUN apk add --no-cache build-base curl automake autoconf libtool git go zlib-dev && \
    curl -L https://github.com/google/protobuf/archive/v${PROTOBUF_VERSION}.tar.gz | tar xvz && \
    cd /protobuf-${PROTOBUF_VERSION} && \
        ./autogen.sh && \
        ./configure --prefix=/usr && \
        make && make install && \
        rm -rf `pwd` && cd / && \
    git clone --recursive -b v${GRPC_VERSION} https://github.com/grpc/grpc.git && \
    cd /grpc/third_party/protobuf && git checkout v${PROTOBUF_VERSION} && \
    cd /grpc && \
        make plugins && make install-plugins prefix=/usr && \
        rm -rf `pwd` && cd / && \
    curl -L https://github.com/grpc/grpc-java/archive/v${GRPC_VERSION}.tar.gz | tar xvz && \
    cd /grpc-java-${GRPC_VERSION}/compiler/src/java_plugin/cpp && \
        g++ -I. -lprotoc -lprotobuf -lpthread --std=c++0x -s -o protoc-gen-grpc-java *.cpp && \
        install -c protoc-gen-grpc-java /usr/bin/ && \
        rm -rf /grpc-java-${GRPC_VERSION} && cd / && \
    go get \
        github.com/golang/protobuf/protoc-gen-go \
        github.com/gogo/protobuf/protoc-gen-gofast \
        github.com/gogo/protobuf/protoc-gen-gogo \
        github.com/gogo/protobuf/protoc-gen-gogofast \
        github.com/gogo/protobuf/protoc-gen-gogofaster \
        github.com/gogo/protobuf/protoc-gen-gogoslick && \
    install -c /go/bin/* /usr/bin/ && \
    rm -rf /go/* && \
    mkdir -p /protobuf/google/protobuf && \
        for f in any duration empty struct timestamp wrappers; do \
            curl -L -o /protobuf/google/protobuf/${f}.proto https://raw.githubusercontent.com/google/protobuf/master/src/google/protobuf/${f}.proto; \
        done && \
    mkdir -p /protobuf/gogoproto && \
        curl -L -o /protobuf/gogoproto/gogo.proto https://raw.githubusercontent.com/gogo/protobuf/master/gogoproto/gogo.proto && \
    apk del build-base curl automake autoconf libtool git go zlib-dev && \
    find /usr/lib -name "*.a" -or -name "*.la" -delete && \
    apk add --no-cache libstdc++

ENTRYPOINT ["/usr/bin/protoc", "-I/protobuf"]
