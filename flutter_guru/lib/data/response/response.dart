import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Response<T> {
  String status;
  String message;
  T data;

  Response({this.status, this.message, this.data});

  factory Response.fromJson(
          Map<String, dynamic> json, T Function(Object json) fromJsonT) =>
      _$ResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ResponseToJson(this, toJsonT);
}
