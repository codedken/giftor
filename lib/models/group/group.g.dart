// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Group _$$_GroupFromJson(Map<String, dynamic> json) => _$_Group(
      title: json['title'] as String?,
      purpose: json['purpose'] as String?,
      creatorId: json['creatorId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_GroupToJson(_$_Group instance) => <String, dynamic>{
      'title': instance.title,
      'purpose': instance.purpose,
      'creatorId': instance.creatorId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
