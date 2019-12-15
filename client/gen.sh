#!/bin/bash
protoc \
    --go_out=plugins=grpc,import_path=zetasql:./client \
    --proto_path=client \
    -Ibazel-out/darwin-fastbuild/bin/external/com_google_protobuf \
    client/onepage.proto