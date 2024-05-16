import "dart:async";
import "dart:collection";

import "package:analyzer/dart/element/element.dart";
import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:glob/glob.dart";

import "package:gql_code_builder/serializer.dart";
import "package:path/path.dart" as p;

import "./allocators/pick_allocator.dart";
import "./config.dart";

/// Aggregates all `built_value` `Serializers` generated by any of the gql builders.
class SerializerBuilder implements Builder {
  final AssetId schemaId;
  final Set<Reference> customSerializers;
  final Map<String, Reference> typeOverrides;

  SerializerBuilder(
    this.schemaId,
    this.customSerializers,
    this.typeOverrides,
  );

  static final _formatter = DartFormatter();
  static final _generatedFiles = Glob("lib/**.gql.dart");

  // create a path for the serializers output in same directory as schema
  List<String> get pathSegments =>
      outputAssetId(schemaId, serializerExtension).pathSegments
        ..removeLast()
        ..add("serializers.gql.dart");

  @override
  Map<String, List<String>> get buildExtensions => {
        // buildExtensions already include the 'lib' path segment, so we must remove it here
        r"$lib$": [p.joinAll(pathSegments.skip(1))],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final allocator = PickAllocator(
      doNotPick: ["package:built_value/serializer.dart"],
      include: [
        "package:built_collection/built_collection.dart",
        ...typeOverrides.values.map((ref) => ref.url).whereType<String>()
      ],
    );

    /// BuiltValue classes with serializers. These will be added automatically
    /// using `@SerializersFor`.
    final builtClasses =
        SplayTreeSet<ClassElement>((a, b) => a.name.compareTo(b.name));

    /// Non BuiltValue classes with serializers (i.e. inline fragment classes).
    /// These need to be added manually since `@SerializersFor` only recognizes
    /// BuiltValue classes.
    final nonBuiltClasses =
        SplayTreeSet<ClassElement>((a, b) => a.name.compareTo(b.name));

    final hasSerializer = (ClassElement c) => c.fields.any((field) =>
        field.isStatic &&
        field.name == "serializer" &&
        field.type.element?.name == "Serializer" &&
        field.type.element?.source?.uri.toString() ==
            "package:built_value/serializer.dart");

    final isBuiltValue = (ClassElement c) => c.allSupertypes.any((interface) =>
        (interface.element.name == "Built" ||
            interface.element.name == "EnumClass") &&
        interface.element.source.uri.toString() ==
            "package:built_value/built_value.dart");

    await for (final input in buildStep.findAssets(_generatedFiles)) {
      final lib = await buildStep.resolver.libraryFor(input);
      lib.units
          .expand((cu) => cu.classes)
          .where((c) => hasSerializer(c) && isBuiltValue(c))
          .forEach(builtClasses.add);

      lib.units
          .expand((cu) => cu.classes)
          .where(
            (c) => hasSerializer(c) && !isBuiltValue(c),
          )
          .forEach(nonBuiltClasses.add);
    }

    final Set<Expression> additionalSerializers = {
      // GraphQL Operation serializer
      refer(
        "OperationSerializer",
        "package:gql_code_builder_serializers/gql_code_builder_serializers.dart",
      ).call([]),
      // User-defined custom serializers
      ...customSerializers.map((ref) => ref.call([])),
      // Serializers from data classes that aren't caught by `@SerializersFor`
      ...nonBuiltClasses.map<Expression>(
        (c) => refer(c.name, c.source.uri.toString()).property("serializer"),
      ),
    };

    final library = buildSerializerLibrary(
      builtClasses,
      "serializers.gql.g.dart",
      additionalSerializers,
    );

    final _emitter = DartEmitter(
      allocator: allocator,
      orderDirectives: true,
      useNullSafetySyntax: true,
    );

    final output = AssetId(
      buildStep.inputId.package,
      p.joinAll(pathSegments),
    );

    return buildStep.writeAsString(
      output,
      _formatter.format("${library.accept(_emitter)}"),
    );
  }
}
