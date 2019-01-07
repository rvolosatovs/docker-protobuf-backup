ALPINE_VERSION ?= 3.8
GO_VERSION = 1.11.4
GRPC_GATEWAY_VERSION ?= 1.6.3
GRPC_JAVA_VERSION ?= 1.17.2
GRPC_RUST_VERSION ?= 0.6.1
GRPC_SWIFT_VERSION ?= 0.7.0
GRPC_VERSION ?= 1.17.2
GRPC_WEB_VERSION ?= 1.0.3
PROTOBUF_C_VERSION ?= 1.3.1
PROTOC_GEN_DOC_VERSION ?= 1.1.0
PROTOC_GEN_FIELDMASK_VERSION ?= 0.0.4
PROTOC_GEN_GO_VERSION ?= 1.2.0
PROTOC_GEN_GOGO_VERSION ?= 1.2.0
PROTOC_GEN_GOGOTTN_VERSION ?= 3.0.11
PROTOC_GEN_GOVALIDATORS_VERSION ?= 0950a79900071e9f3f5979b78078c599376422fd
PROTOC_GEN_LINT_VERSION ?= 0.2.1
RUST_PROTOBUF_VERSION ?= 2.2.2
RUST_VERSION ?= 1.31.1
SWIFT_VERSION ?= 4.2.1
UPX_VERSION ?= 3.95

IMAGE_NAME ?= thethingsindustries/protoc
TAG ?= latest

all: build

build:
	docker build \
	--build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
	--build-arg GO_VERSION=$(GO_VERSION) \
	--build-arg GRPC_GATEWAY_VERSION=$(GRPC_GATEWAY_VERSION) \
	--build-arg GRPC_JAVA_VERSION=$(GRPC_JAVA_VERSION) \
	--build-arg GRPC_RUST_VERSION=$(GRPC_RUST_VERSION) \
	--build-arg GRPC_SWIFT_VERSION=$(GRPC_SWIFT_VERSION) \
	--build-arg GRPC_VERSION=$(GRPC_VERSION) \
	--build-arg GRPC_WEB_VERSION=$(GRPC_WEB_VERSION) \
	--build-arg PROTOBUF_C_VERSION=$(PROTOBUF_C_VERSION) \
	--build-arg PROTOC_GEN_DOC_VERSION=$(PROTOC_GEN_DOC_VERSION) \
	--build-arg PROTOC_GEN_FIELDMASK_VERSION=$(PROTOC_GEN_FIELDMASK_VERSION) \
	--build-arg PROTOC_GEN_GO_VERSION=$(PROTOC_GEN_GO_VERSION) \
	--build-arg PROTOC_GEN_GOGO_VERSION=$(PROTOC_GEN_GOGO_VERSION) \
	--build-arg PROTOC_GEN_GOGOTTN_VERSION=$(PROTOC_GEN_GOGOTTN_VERSION) \
	--build-arg PROTOC_GEN_GOVALIDATORS_VERSION=$(PROTOC_GEN_GOVALIDATORS_VERSION) \
	--build-arg PROTOC_GEN_LINT_VERSION=$(PROTOC_GEN_LINT_VERSION) \
	--build-arg RUST_PROTOBUF_VERSION=$(RUST_PROTOBUF_VERSION) \
	--build-arg RUST_VERSION=$(RUST_VERSION) \
	--build-arg SWIFT_VERSION=$(SWIFT_VERSION) \
	--build-arg UPX_VERSION=$(UPX_VERSION) \
	-t $(IMAGE_NAME):$(TAG) .

push: build
	docker push $(IMAGE_NAME):$(TAG)

clean:
	rm -rf build

.PHONY: all deps build push clean
