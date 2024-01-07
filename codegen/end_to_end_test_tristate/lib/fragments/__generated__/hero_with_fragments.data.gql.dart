// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_with_fragments.data.gql.g.dart';

abstract class GHeroWithFragmentsData
    implements Built<GHeroWithFragmentsData, GHeroWithFragmentsDataBuilder> {
  GHeroWithFragmentsData._();

  factory GHeroWithFragmentsData(
          [void Function(GHeroWithFragmentsDataBuilder b) updates]) =
      _$GHeroWithFragmentsData;

  static void _initializeBuilder(GHeroWithFragmentsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GcomparisonFieldsData? get hero;
  static Serializer<GHeroWithFragmentsData> get serializer =>
      _$gHeroWithFragmentsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithFragmentsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithFragmentsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithFragmentsData.serializer,
        json,
      );
}

abstract class GheroData {
  String get G__typename;
  String get name;
  Map<String, dynamic> toJson();
}

abstract class GheroDataData
    implements Built<GheroDataData, GheroDataDataBuilder>, GheroData {
  GheroDataData._();

  factory GheroDataData([void Function(GheroDataDataBuilder b) updates]) =
      _$GheroDataData;

  static void _initializeBuilder(GheroDataDataBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get name;
  static Serializer<GheroDataData> get serializer => _$gheroDataDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroDataData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroDataData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroDataData.serializer,
        json,
      );
}

abstract class GcomparisonFields implements GheroData {
  @override
  String get G__typename;
  String get id;
  @override
  String get name;
  GcomparisonFields_friendsConnection get friendsConnection;
  @override
  Map<String, dynamic> toJson();
}

abstract class GcomparisonFields_friendsConnection {
  String get G__typename;
  int? get totalCount;
  BuiltList<GcomparisonFields_friendsConnection_edges?>? get edges;
  Map<String, dynamic> toJson();
}

abstract class GcomparisonFields_friendsConnection_edges {
  String get G__typename;
  GheroDataData? get node;
  Map<String, dynamic> toJson();
}

abstract class GcomparisonFieldsData
    implements
        Built<GcomparisonFieldsData, GcomparisonFieldsDataBuilder>,
        GcomparisonFields,
        GheroData {
  GcomparisonFieldsData._();

  factory GcomparisonFieldsData(
          [void Function(GcomparisonFieldsDataBuilder b) updates]) =
      _$GcomparisonFieldsData;

  static void _initializeBuilder(GcomparisonFieldsDataBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  GcomparisonFieldsData_friendsConnection get friendsConnection;
  static Serializer<GcomparisonFieldsData> get serializer =>
      _$gcomparisonFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GcomparisonFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GcomparisonFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GcomparisonFieldsData.serializer,
        json,
      );
}

abstract class GcomparisonFieldsData_friendsConnection
    implements
        Built<GcomparisonFieldsData_friendsConnection,
            GcomparisonFieldsData_friendsConnectionBuilder>,
        GcomparisonFields_friendsConnection {
  GcomparisonFieldsData_friendsConnection._();

  factory GcomparisonFieldsData_friendsConnection(
      [void Function(GcomparisonFieldsData_friendsConnectionBuilder b)
          updates]) = _$GcomparisonFieldsData_friendsConnection;

  static void _initializeBuilder(
          GcomparisonFieldsData_friendsConnectionBuilder b) =>
      b..G__typename = 'FriendsConnection';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int? get totalCount;
  @override
  BuiltList<GcomparisonFieldsData_friendsConnection_edges?>? get edges;
  static Serializer<GcomparisonFieldsData_friendsConnection> get serializer =>
      _$gcomparisonFieldsDataFriendsConnectionSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GcomparisonFieldsData_friendsConnection.serializer,
        this,
      ) as Map<String, dynamic>);

  static GcomparisonFieldsData_friendsConnection? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GcomparisonFieldsData_friendsConnection.serializer,
        json,
      );
}

abstract class GcomparisonFieldsData_friendsConnection_edges
    implements
        Built<GcomparisonFieldsData_friendsConnection_edges,
            GcomparisonFieldsData_friendsConnection_edgesBuilder>,
        GcomparisonFields_friendsConnection_edges {
  GcomparisonFieldsData_friendsConnection_edges._();

  factory GcomparisonFieldsData_friendsConnection_edges(
      [void Function(GcomparisonFieldsData_friendsConnection_edgesBuilder b)
          updates]) = _$GcomparisonFieldsData_friendsConnection_edges;

  static void _initializeBuilder(
          GcomparisonFieldsData_friendsConnection_edgesBuilder b) =>
      b..G__typename = 'FriendsEdge';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GheroDataData? get node;
  static Serializer<GcomparisonFieldsData_friendsConnection_edges>
      get serializer => _$gcomparisonFieldsDataFriendsConnectionEdgesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GcomparisonFieldsData_friendsConnection_edges.serializer,
        this,
      ) as Map<String, dynamic>);

  static GcomparisonFieldsData_friendsConnection_edges? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GcomparisonFieldsData_friendsConnection_edges.serializer,
        json,
      );
}
