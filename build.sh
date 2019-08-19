#!/usr/bin/env bash
docker build \
--build-arg ALPINE_VERSION="${ALPINE_VERSION:-"3.11"}" \
--build-arg DART_PROTOBUF_VERSION="${DART_PROTOBUF_VERSION:-"1.0.1"}" \
--build-arg DART_VERSION="${DART_VERSION:-"2.7.2"}" \
--build-arg GO_VERSION="${GO_VERSION:-"1.14.2"}" \
--build-arg GRPC_GATEWAY_VERSION="${GRPC_GATEWAY_VERSION:-"1.14.4"}" \
--build-arg GRPC_VERSION="${GRPC_VERSION:-"1.28.1"}" \
--build-arg PROTOC_GEN_DOC_VERSION="${PROTOC_GEN_DOC_VERSION:-"1.3.2-ttn"}" \
--build-arg PROTOC_GEN_FIELDMASK_VERSION="${PROTOC_GEN_FIELDMASK_VERSION:-"0.4.2"}" \
--build-arg PROTOC_GEN_GO_VERSION="${PROTOC_GEN_GO_VERSION:-"1.4.1"}" \
--build-arg PROTOC_GEN_GOGO_VERSION="${PROTOC_GEN_GOGO_VERSION:-"1.3.1"}" \
--build-arg PROTOC_GEN_GOGOTTN_VERSION="${PROTOC_GEN_GOGOTTN_VERSION:-"3.0.14"}" \
--build-arg PROTOC_GEN_VALIDATE_VERSION="${PROTOC_GEN_VALIDATE_VERSION:-"0.3.0-java"}" \
--build-arg UPX_VERSION="${UPX_VERSION:-"3.96"}" \
${@} .
