import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher {
  String nip;

  @JsonKey(name: 'nama')
  String name;

  String email;

  Teacher({this.nip, this.name, this.email});

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}
