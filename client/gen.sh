#!/bin/bash
# TODO convert this to genrule
# Find all protos using:
#    bazel aquery 'mnemonic(GenProtoDescriptorSet, deps(zetasql/local_service:local_service_proto))'
bazel build zetasql/local_service:local_service_proto  

PATH=PATH:~/go/bin

./bazel-out/host/bin/external/com_google_protobuf/protoc \
    --go_out=plugins=grpc,import_path=github.com/georgewfraser/calvinist/zetasql:./client \
    -I. \
    -Ibazel-bin \
    -Ibazel-bin/external/com_google_protobuf/ \
    zetasql/resolved_ast/resolved_ast.proto \
    zetasql/resolved_ast/resolved_node_kind.proto \
    zetasql/local_service/*.proto \
    zetasql/proto/*.proto \
    zetasql/public/*.proto \
    zetasql/public/proto/*.proto \
    zetasql/resolved_ast/*.proto 

mv client/zetasql/proto/function.pb.go client/zetasql/proto/function2.pb.go 
mv client/zetasql/proto/options.pb.go client/zetasql/proto/options2.pb.go
mv client/zetasql/public/proto/type_annotation.pb.go client/zetasql/public/proto/type_annotation2.pb.go
mv $(find client/zetasql -name '*.pb.go') client/zetasql