// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
class _$GroupTearOff {
  const _$GroupTearOff();

  _Group call(
      {String? id,
      String? title,
      String? purpose,
      String? creatorId,
      String? creatorName,
      DateTime? createdAt,
      bool startSelection = false}) {
    return _Group(
      id: id,
      title: title,
      purpose: purpose,
      creatorId: creatorId,
      creatorName: creatorName,
      createdAt: createdAt,
      startSelection: startSelection,
    );
  }

  Group fromJson(Map<String, Object> json) {
    return Group.fromJson(json);
  }
}

/// @nodoc
const $Group = _$GroupTearOff();

/// @nodoc
mixin _$Group {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get purpose => throw _privateConstructorUsedError;
  String? get creatorId => throw _privateConstructorUsedError;
  String? get creatorName => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool get startSelection => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? title,
      String? purpose,
      String? creatorId,
      String? creatorName,
      DateTime? createdAt,
      bool startSelection});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res> implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  final Group _value;
  // ignore: unused_field
  final $Res Function(Group) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? purpose = freezed,
    Object? creatorId = freezed,
    Object? creatorName = freezed,
    Object? createdAt = freezed,
    Object? startSelection = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: purpose == freezed
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorName: creatorName == freezed
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startSelection: startSelection == freezed
          ? _value.startSelection
          : startSelection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$GroupCopyWith(_Group value, $Res Function(_Group) then) =
      __$GroupCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? title,
      String? purpose,
      String? creatorId,
      String? creatorName,
      DateTime? createdAt,
      bool startSelection});
}

/// @nodoc
class __$GroupCopyWithImpl<$Res> extends _$GroupCopyWithImpl<$Res>
    implements _$GroupCopyWith<$Res> {
  __$GroupCopyWithImpl(_Group _value, $Res Function(_Group) _then)
      : super(_value, (v) => _then(v as _Group));

  @override
  _Group get _value => super._value as _Group;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? purpose = freezed,
    Object? creatorId = freezed,
    Object? creatorName = freezed,
    Object? createdAt = freezed,
    Object? startSelection = freezed,
  }) {
    return _then(_Group(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: purpose == freezed
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorName: creatorName == freezed
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startSelection: startSelection == freezed
          ? _value.startSelection
          : startSelection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Group extends _Group with DiagnosticableTreeMixin {
  _$_Group(
      {this.id,
      this.title,
      this.purpose,
      this.creatorId,
      this.creatorName,
      this.createdAt,
      this.startSelection = false})
      : super._();

  factory _$_Group.fromJson(Map<String, dynamic> json) =>
      _$$_GroupFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? purpose;
  @override
  final String? creatorId;
  @override
  final String? creatorName;
  @override
  final DateTime? createdAt;
  @JsonKey(defaultValue: false)
  @override
  final bool startSelection;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Group(id: $id, title: $title, purpose: $purpose, creatorId: $creatorId, creatorName: $creatorName, createdAt: $createdAt, startSelection: $startSelection)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Group'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('purpose', purpose))
      ..add(DiagnosticsProperty('creatorId', creatorId))
      ..add(DiagnosticsProperty('creatorName', creatorName))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('startSelection', startSelection));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Group &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.purpose, purpose) ||
                const DeepCollectionEquality()
                    .equals(other.purpose, purpose)) &&
            (identical(other.creatorId, creatorId) ||
                const DeepCollectionEquality()
                    .equals(other.creatorId, creatorId)) &&
            (identical(other.creatorName, creatorName) ||
                const DeepCollectionEquality()
                    .equals(other.creatorName, creatorName)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.startSelection, startSelection) ||
                const DeepCollectionEquality()
                    .equals(other.startSelection, startSelection)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(purpose) ^
      const DeepCollectionEquality().hash(creatorId) ^
      const DeepCollectionEquality().hash(creatorName) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(startSelection);

  @JsonKey(ignore: true)
  @override
  _$GroupCopyWith<_Group> get copyWith =>
      __$GroupCopyWithImpl<_Group>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupToJson(this);
  }
}

abstract class _Group extends Group {
  factory _Group(
      {String? id,
      String? title,
      String? purpose,
      String? creatorId,
      String? creatorName,
      DateTime? createdAt,
      bool startSelection}) = _$_Group;
  _Group._() : super._();

  factory _Group.fromJson(Map<String, dynamic> json) = _$_Group.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get purpose => throw _privateConstructorUsedError;
  @override
  String? get creatorId => throw _privateConstructorUsedError;
  @override
  String? get creatorName => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  bool get startSelection => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GroupCopyWith<_Group> get copyWith => throw _privateConstructorUsedError;
}
