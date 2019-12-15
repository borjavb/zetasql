#!/bin/bash
# TODO convert this to genrule
# Find all protos using:
#    bazel aquery 'mnemonic(GenProtoDescriptorSet, deps(zetasql/local_service:local_service_proto))'
bazel build zetasql/local_service:local_service_proto  

cat \
    bazel-out/darwin-fastbuild/bin/zetasql/resolved_ast/resolved_ast.proto \
    bazel-out/darwin-fastbuild/bin/zetasql/resolved_ast/resolved_node_kind.proto \
    zetasql/local_service/local_service.proto \
    zetasql/proto/function.proto \
    zetasql/proto/options.proto \
    zetasql/proto/simple_catalog.proto \
    zetasql/public/builtin_function.proto \
    zetasql/public/deprecation_warning.proto \
    zetasql/public/error_location.proto \
    zetasql/public/function.proto \
    zetasql/public/options.proto \
    zetasql/public/parse_location_range.proto \
    zetasql/public/parse_resume_location.proto \
    zetasql/public/proto/wire_format_annotation.proto \
    zetasql/public/simple_constant.proto \
    zetasql/public/simple_table.proto \
    zetasql/public/type.proto \
    zetasql/public/value.proto \
    zetasql/resolved_ast/resolved_ast_enums.proto \
    zetasql/resolved_ast/serialization.proto \
    > client/onepage.proto