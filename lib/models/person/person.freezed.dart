// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Person _$PersonFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'default':
      return PersonSelect.fromJson(json);
    case 'user':
      return PersonUser.fromJson(json);
    case 'saveLocally':
      return PersonSaveLocally.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Person',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$PersonTearOff {
  const _$PersonTearOff();

  PersonSelect call(
      {String? id,
      String? name,
      String? email,
      String? phoneNo,
      String? imageUrl,
      bool isSelected = false,
      String? selectedUserId = null}) {
    return PersonSelect(
      id: id,
      name: name,
      email: email,
      phoneNo: phoneNo,
      imageUrl: imageUrl,
      isSelected: isSelected,
      selectedUserId: selectedUserId,
    );
  }

  PersonUser user(
      {String? name,
      String? email,
      String? phoneNo,
      String? imageUrl,
      List<dynamic>? groups,
      DateTime? createdAt}) {
    return PersonUser(
      name: name,
      email: email,
      phoneNo: phoneNo,
      imageUrl: imageUrl,
      groups: groups,
      createdAt: createdAt,
    );
  }

  PersonSaveLocally saveLocally(
      {String? id,
      String? name,
      String? email,
      String? phoneNo,
      String? imageUrl}) {
    return PersonSaveLocally(
      id: id,
      name: name,
      email: email,
      phoneNo: phoneNo,
      imageUrl: imageUrl,
    );
  }

  Person fromJson(Map<String, Object> json) {
    return Person.fromJson(json);
  }
}

/// @nodoc
const $Person = _$PersonTearOff();

/// @nodoc
mixin _$Person {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNo => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)
        $default, {
    required TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)
        user,
    required TResult Function(String? id, String? name, String? email,
            String? phoneNo, String? imageUrl)
        saveLocally,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)?
        $default, {
    TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)?
        user,
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl)?
        saveLocally,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)?
        $default, {
    TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)?
        user,
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl)?
        saveLocally,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PersonSelect value) $default, {
    required TResult Function(PersonUser value) user,
    required TResult Function(PersonSaveLocally value) saveLocally,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(PersonSelect value)? $default, {
    TResult Function(PersonUser value)? user,
    TResult Function(PersonSaveLocally value)? saveLocally,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PersonSelect value)? $default, {
    TResult Function(PersonUser value)? user,
    TResult Function(PersonSaveLocally value)? saveLocally,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res>;
  $Res call({String? name, String? email, String? phoneNo, String? imageUrl});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res> implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  final Person _value;
  // ignore: unused_field
  final $Res Function(Person) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phoneNo = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNo: phoneNo == freezed
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class $PersonSelectCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory $PersonSelectCopyWith(
          PersonSelect value, $Res Function(PersonSelect) then) =
      _$PersonSelectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      String? email,
      String? phoneNo,
      String? imageUrl,
      bool isSelected,
      String? selectedUserId});
}

/// @nodoc
class _$PersonSelectCopyWithImpl<$Res> extends _$PersonCopyWithImpl<$Res>
    implements $PersonSelectCopyWith<$Res> {
  _$PersonSelectCopyWithImpl(
      PersonSelect _value, $Res Function(PersonSelect) _then)
      : super(_value, (v) => _then(v as PersonSelect));

  @override
  PersonSelect get _value => super._value as PersonSelect;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phoneNo = freezed,
    Object? imageUrl = freezed,
    Object? isSelected = freezed,
    Object? selectedUserId = freezed,
  }) {
    return _then(PersonSelect(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNo: phoneNo == freezed
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedUserId: selectedUserId == freezed
          ? _value.selectedUserId
          : selectedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonSelect extends PersonSelect with DiagnosticableTreeMixin {
  _$PersonSelect(
      {this.id,
      this.name,
      this.email,
      this.phoneNo,
      this.imageUrl,
      this.isSelected = false,
      this.selectedUserId = null})
      : super._();

  factory _$PersonSelect.fromJson(Map<String, dynamic> json) =>
      _$$PersonSelectFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phoneNo;
  @override
  final String? imageUrl;
  @JsonKey(defaultValue: false)
  @override
  final bool isSelected;
  @JsonKey(defaultValue: null)
  @override
  final String? selectedUserId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Person(id: $id, name: $name, email: $email, phoneNo: $phoneNo, imageUrl: $imageUrl, isSelected: $isSelected, selectedUserId: $selectedUserId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Person'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phoneNo', phoneNo))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('isSelected', isSelected))
      ..add(DiagnosticsProperty('selectedUserId', selectedUserId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PersonSelect &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNo, phoneNo) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNo, phoneNo)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.isSelected, isSelected) ||
                const DeepCollectionEquality()
                    .equals(other.isSelected, isSelected)) &&
            (identical(other.selectedUserId, selectedUserId) ||
                const DeepCollectionEquality()
                    .equals(other.selectedUserId, selectedUserId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNo) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(isSelected) ^
      const DeepCollectionEquality().hash(selectedUserId);

  @JsonKey(ignore: true)
  @override
  $PersonSelectCopyWith<PersonSelect> get copyWith =>
      _$PersonSelectCopyWithImpl<PersonSelect>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)
        $default, {
    required TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)
        user,
    required TResult Function(String? id, String? name, String? email,
            String? phoneNo, String? imageUrl)
        saveLocally,
  }) {
    return $default(
        id, name, email, phoneNo, imageUrl, isSelected, selectedUserId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)?
        $default, {
    TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)?
        user,
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl)?
        saveLocally,
  }) {
    return $default?.call(
        id, name, email, phoneNo, imageUrl, isSelected, selectedUserId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)?
        $default, {
    TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)?
        user,
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl)?
        saveLocally,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          id, name, email, phoneNo, imageUrl, isSelected, selectedUserId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PersonSelect value) $default, {
    required TResult Function(PersonUser value) user,
    required TResult Function(PersonSaveLocally value) saveLocally,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(PersonSelect value)? $default, {
    TResult Function(PersonUser value)? user,
    TResult Function(PersonSaveLocally value)? saveLocally,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PersonSelect value)? $default, {
    TResult Function(PersonUser value)? user,
    TResult Function(PersonSaveLocally value)? saveLocally,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonSelectToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class PersonSelect extends Person {
  factory PersonSelect(
      {String? id,
      String? name,
      String? email,
      String? phoneNo,
      String? imageUrl,
      bool isSelected,
      String? selectedUserId}) = _$PersonSelect;
  PersonSelect._() : super._();

  factory PersonSelect.fromJson(Map<String, dynamic> json) =
      _$PersonSelect.fromJson;

  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get phoneNo => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  String? get selectedUserId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $PersonSelectCopyWith<PersonSelect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonUserCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory $PersonUserCopyWith(
          PersonUser value, $Res Function(PersonUser) then) =
      _$PersonUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      String? email,
      String? phoneNo,
      String? imageUrl,
      List<dynamic>? groups,
      DateTime? createdAt});
}

/// @nodoc
class _$PersonUserCopyWithImpl<$Res> extends _$PersonCopyWithImpl<$Res>
    implements $PersonUserCopyWith<$Res> {
  _$PersonUserCopyWithImpl(PersonUser _value, $Res Function(PersonUser) _then)
      : super(_value, (v) => _then(v as PersonUser));

  @override
  PersonUser get _value => super._value as PersonUser;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phoneNo = freezed,
    Object? imageUrl = freezed,
    Object? groups = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(PersonUser(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNo: phoneNo == freezed
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonUser extends PersonUser with DiagnosticableTreeMixin {
  _$PersonUser(
      {this.name,
      this.email,
      this.phoneNo,
      this.imageUrl,
      this.groups,
      this.createdAt})
      : super._();

  factory _$PersonUser.fromJson(Map<String, dynamic> json) =>
      _$$PersonUserFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phoneNo;
  @override
  final String? imageUrl;
  @override
  final List<dynamic>? groups;
  @override
  final DateTime? createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Person.user(name: $name, email: $email, phoneNo: $phoneNo, imageUrl: $imageUrl, groups: $groups, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Person.user'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phoneNo', phoneNo))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('groups', groups))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PersonUser &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNo, phoneNo) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNo, phoneNo)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.groups, groups) ||
                const DeepCollectionEquality().equals(other.groups, groups)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNo) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(groups) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  $PersonUserCopyWith<PersonUser> get copyWith =>
      _$PersonUserCopyWithImpl<PersonUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)
        $default, {
    required TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)
        user,
    required TResult Function(String? id, String? name, String? email,
            String? phoneNo, String? imageUrl)
        saveLocally,
  }) {
    return user(name, email, phoneNo, imageUrl, groups, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)?
        $default, {
    TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)?
        user,
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl)?
        saveLocally,
  }) {
    return user?.call(name, email, phoneNo, imageUrl, groups, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)?
        $default, {
    TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)?
        user,
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl)?
        saveLocally,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(name, email, phoneNo, imageUrl, groups, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PersonSelect value) $default, {
    required TResult Function(PersonUser value) user,
    required TResult Function(PersonSaveLocally value) saveLocally,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(PersonSelect value)? $default, {
    TResult Function(PersonUser value)? user,
    TResult Function(PersonSaveLocally value)? saveLocally,
  }) {
    return user?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PersonSelect value)? $default, {
    TResult Function(PersonUser value)? user,
    TResult Function(PersonSaveLocally value)? saveLocally,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonUserToJson(this)..['runtimeType'] = 'user';
  }
}

abstract class PersonUser extends Person {
  factory PersonUser(
      {String? name,
      String? email,
      String? phoneNo,
      String? imageUrl,
      List<dynamic>? groups,
      DateTime? createdAt}) = _$PersonUser;
  PersonUser._() : super._();

  factory PersonUser.fromJson(Map<String, dynamic> json) =
      _$PersonUser.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get phoneNo => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  List<dynamic>? get groups => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $PersonUserCopyWith<PersonUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonSaveLocallyCopyWith<$Res>
    implements $PersonCopyWith<$Res> {
  factory $PersonSaveLocallyCopyWith(
          PersonSaveLocally value, $Res Function(PersonSaveLocally) then) =
      _$PersonSaveLocallyCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      String? email,
      String? phoneNo,
      String? imageUrl});
}

/// @nodoc
class _$PersonSaveLocallyCopyWithImpl<$Res> extends _$PersonCopyWithImpl<$Res>
    implements $PersonSaveLocallyCopyWith<$Res> {
  _$PersonSaveLocallyCopyWithImpl(
      PersonSaveLocally _value, $Res Function(PersonSaveLocally) _then)
      : super(_value, (v) => _then(v as PersonSaveLocally));

  @override
  PersonSaveLocally get _value => super._value as PersonSaveLocally;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phoneNo = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(PersonSaveLocally(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNo: phoneNo == freezed
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonSaveLocally extends PersonSaveLocally
    with DiagnosticableTreeMixin {
  _$PersonSaveLocally(
      {this.id, this.name, this.email, this.phoneNo, this.imageUrl})
      : super._();

  factory _$PersonSaveLocally.fromJson(Map<String, dynamic> json) =>
      _$$PersonSaveLocallyFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phoneNo;
  @override
  final String? imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Person.saveLocally(id: $id, name: $name, email: $email, phoneNo: $phoneNo, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Person.saveLocally'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phoneNo', phoneNo))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PersonSaveLocally &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNo, phoneNo) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNo, phoneNo)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNo) ^
      const DeepCollectionEquality().hash(imageUrl);

  @JsonKey(ignore: true)
  @override
  $PersonSaveLocallyCopyWith<PersonSaveLocally> get copyWith =>
      _$PersonSaveLocallyCopyWithImpl<PersonSaveLocally>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)
        $default, {
    required TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)
        user,
    required TResult Function(String? id, String? name, String? email,
            String? phoneNo, String? imageUrl)
        saveLocally,
  }) {
    return saveLocally(id, name, email, phoneNo, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)?
        $default, {
    TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)?
        user,
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl)?
        saveLocally,
  }) {
    return saveLocally?.call(id, name, email, phoneNo, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl, bool isSelected, String? selectedUserId)?
        $default, {
    TResult Function(String? name, String? email, String? phoneNo,
            String? imageUrl, List<dynamic>? groups, DateTime? createdAt)?
        user,
    TResult Function(String? id, String? name, String? email, String? phoneNo,
            String? imageUrl)?
        saveLocally,
    required TResult orElse(),
  }) {
    if (saveLocally != null) {
      return saveLocally(id, name, email, phoneNo, imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PersonSelect value) $default, {
    required TResult Function(PersonUser value) user,
    required TResult Function(PersonSaveLocally value) saveLocally,
  }) {
    return saveLocally(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(PersonSelect value)? $default, {
    TResult Function(PersonUser value)? user,
    TResult Function(PersonSaveLocally value)? saveLocally,
  }) {
    return saveLocally?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PersonSelect value)? $default, {
    TResult Function(PersonUser value)? user,
    TResult Function(PersonSaveLocally value)? saveLocally,
    required TResult orElse(),
  }) {
    if (saveLocally != null) {
      return saveLocally(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonSaveLocallyToJson(this)..['runtimeType'] = 'saveLocally';
  }
}

abstract class PersonSaveLocally extends Person {
  factory PersonSaveLocally(
      {String? id,
      String? name,
      String? email,
      String? phoneNo,
      String? imageUrl}) = _$PersonSaveLocally;
  PersonSaveLocally._() : super._();

  factory PersonSaveLocally.fromJson(Map<String, dynamic> json) =
      _$PersonSaveLocally.fromJson;

  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get phoneNo => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $PersonSaveLocallyCopyWith<PersonSaveLocally> get copyWith =>
      throw _privateConstructorUsedError;
}
