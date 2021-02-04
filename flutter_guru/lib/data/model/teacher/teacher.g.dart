// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return Teacher(
    nip: json['nip'] as String,
    name: json['nama'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'nip': instance.nip,
      'nama': instance.name,
      'email': instance.email,
    };
