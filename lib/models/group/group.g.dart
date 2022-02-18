// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Group _$$_GroupFromJson(Map<String, dynamic> json) => _$_Group(
      id: json['id'] as String?,
      title: json['title'] as String?,
      purpose: json['purpose'] as String?,
      creatorId: json['creatorId'] as String?,
      creatorName: json['creatorName'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      startSelection: json['startSelection'] as bool? ?? false,
    );

Map<String, dynamic> _$$_GroupToJson(_$_Group instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'purpose': instance.purpose,
      'creatorId': instance.creatorId,
      'creatorName': instance.creatorName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'startSelection': instance.startSelection,
    };
