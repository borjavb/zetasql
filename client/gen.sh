#!/bin/bash
bazel build zetasql/local_service:local_service_proto  

PATH=PATH:~/go/bin

./bazel-out/host/bin/external/com_google_protobuf/protoc \
    --go_out=plugins=grpc,import_path=zetasql:./client \
    --proto_path=client \
    -Ibazel-bin/external/com_google_protobuf/ \
    client/onepage.proto