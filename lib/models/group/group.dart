import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'group.freezed.dart';

part 'group.g.dart';

@freezed
class Group with _$Group {
  const Group._();

  factory Group({
    @required String? id,
    @required String? title,
    @required String? purpose,
    @required String? creatorId,
    @required String? creatorName,
    @required DateTime? createdAt,
    @Default(false) bool startSelection,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
