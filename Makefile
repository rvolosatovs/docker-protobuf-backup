LLVM_VERSION ?= 5.0.0
SWIFT_VERSION ?= 4.0
GLIDE_VERSION ?= 0.12.3
PROTOBUF_C_VERSION ?= 1.3.0
GRPC_VERSION ?= 1.6.2
GRPC_JAVA_VERSION ?= 1.6.1
GRPC_RUST_VERSION ?= 0.2.1
GRPC_SWIFT_VERSION ?= 0.2.3
GRPC_GATEWAY_VERSION ?= 1.2.2
RUST_PROTOBUF_VERSION ?= 1.4.1
PROTOC_GEN_LINT_VERSION ?= 0.1.3
PROTOC_GEN_GOGOTTN_VERSION ?= 3.0.1
PROTOC_GEN_DOC_VERSION ?= 1.0.0-rc

IMAGE_NAME ?= thethingsindustries/protoc
TAG ?= latest

all: build push

build:
	docker build \
	--build-arg LLVM_VERSION=$(LLVM_VERSION) \
	--build-arg SWIFT_VERSION=$(SWIFT_VERSION) \
	--build-arg GLIDE_VERSION=$(GLIDE_VERSION) \
	--build-arg PROTOBUF_C_VERSION=$(PROTOBUF_C_VERSION) \
	--build-arg GRPC_VERSION=$(GRPC_VERSION) \
	--build-arg GRPC_JAVA_VERSION=$(GRPC_JAVA_VERSION) \
	--build-arg GRPC_RUST_VERSION=$(GRPC_RUST_VERSION) \
	--build-arg GRPC_SWIFT_VERSION=$(GRPC_SWIFT_VERSION) \
	--build-arg GRPC_GATEWAY_VERSION=$(GRPC_GATEWAY_VERSION) \
	--build-arg RUST_PROTOBUF_VERSION=$(RUST_PROTOBUF_VERSION) \
	--build-arg PROTOC_GEN_LINT_VERSION=$(PROTOC_GEN_LINT_VERSION) \
	--build-arg PROTOC_GEN_GOGOTTN_VERSION=$(PROTOC_GEN_GOGOTTN_VERSION) \
	--build-arg PROTOC_GEN_DOC_VERSION=$(PROTOC_GEN_DOC_VERSION) \
	-t $(IMAGE_NAME):$(TAG) .

push: build
	docker push $(IMAGE_NAME):$(TAG)

clean:
	rm -rf build

.PHONY: all deps build push clean
