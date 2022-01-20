import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'person.freezed.dart';

part 'person.g.dart';

@freezed
class Person with _$Person {
  const Person._();

  factory Person({
    @required String? id,
    @required String? name,
    @required String? email,
    @required String? phoneNo,
    @required String? imageUrl,
    @Default(false) bool isSelected,
    @Default(null) String? selectedUserId,
  }) = PersonSelect;

  factory Person.user({
    @required String? name,
    @required String? email,
    @required String? phoneNo,
    @required String? imageUrl,
    @required List<dynamic>? groups,
    DateTime? createdAt,
  }) = PersonUser;

  factory Person.saveLocally({
    @required String? id,
    @required String? name,
    @required String? email,
    @required String? phoneNo,
    @required String? imageUrl,
  }) = PersonSaveLocally;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
