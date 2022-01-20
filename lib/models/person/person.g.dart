// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonSelect _$$PersonSelectFromJson(Map<String, dynamic> json) =>
    _$PersonSelect(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phoneNo'] as String?,
      imageUrl: json['imageUrl'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
      selectedUserId: json['selectedUserId'] as String? ?? null,
    );

Map<String, dynamic> _$$PersonSelectToJson(_$PersonSelect instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'imageUrl': instance.imageUrl,
      'isSelected': instance.isSelected,
      'selectedUserId': instance.selectedUserId,
    };

_$PersonUser _$$PersonUserFromJson(Map<String, dynamic> json) => _$PersonUser(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phoneNo'] as String?,
      imageUrl: json['imageUrl'] as String?,
      groups: json['groups'] as List<dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PersonUserToJson(_$PersonUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'imageUrl': instance.imageUrl,
      'groups': instance.groups,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$PersonSaveLocally _$$PersonSaveLocallyFromJson(Map<String, dynamic> json) =>
    _$PersonSaveLocally(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phoneNo'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$PersonSaveLocallyToJson(_$PersonSaveLocally instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'imageUrl': instance.imageUrl,
    };
