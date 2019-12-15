#!/bin/bash
# TODO convert this to genrule
# Find all protos using:
#    bazel aquery 'mnemonic(GenProtoDescriptorSet, deps(zetasql/local_service:local_service_proto))'
bazel build zetasql/local_service:local_service_proto  

cat \
    bazel-bin/zetasql/resolved_ast/*.proto \
    zetasql/local_service/*.proto \
    zetasql/proto/*.proto \
    zetasql/public/*.proto \
    zetasql/public/proto/*.proto \
    zetasql/resolved_ast/*.proto \
    > client/onepage.proto