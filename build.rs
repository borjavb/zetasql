fn main() -> Result<(), Box<dyn std::error::Error>> {
    // To find all proto locations:
    //   bazel aquery 'mnemonic(GenProtoDescriptorSet, deps(zetasql/local_service:local_service_proto))'
    // To build proto templates:
    //   bazel build zetasql/local_service:local_service_proto
    // To list all protos rust needs:
    //   ls \
    //     zetasql/local_service/*.proto \
    //     zetasql/proto/*.proto \
    //     zetasql/public/*.proto \
    //     zetasql/public/proto/*.proto \
    //     zetasql/resolved_ast/*.proto
    // Make out dir and run build:
    //   mkdir out
    //   cargo build
    tonic_build::configure().out_dir("out").compile(
        &[
            "zetasql/resolved_ast/resolved_ast.proto",
            "zetasql/resolved_ast/resolved_node_kind.proto",
            "zetasql/local_service/local_service.proto",
            "zetasql/proto/function.proto",
            "zetasql/proto/internal_error_location.proto",
            "zetasql/proto/options.proto",
            "zetasql/proto/simple_catalog.proto",
            "zetasql/public/builtin_function.proto",
            "zetasql/public/deprecation_warning.proto",
            "zetasql/public/error_location.proto",
            "zetasql/public/function.proto",
            "zetasql/public/options.proto",
            "zetasql/public/parse_location_range.proto",
            "zetasql/public/parse_resume_location.proto",
            "zetasql/public/proto/type_annotation.proto",
            "zetasql/public/proto/wire_format_annotation.proto",
            "zetasql/public/simple_constant.proto",
            "zetasql/public/simple_table.proto",
            "zetasql/public/type.proto",
            "zetasql/public/type_annotation.proto",
            "zetasql/public/value.proto",
            "zetasql/resolved_ast/resolved_ast_enums.proto",
            "zetasql/resolved_ast/serialization.proto",
        ],
        &[".", "bazel-bin", "bazel-bin/external/com_google_protobuf/"],
    )?;
    Ok(())
}
