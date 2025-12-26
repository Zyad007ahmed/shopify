import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  final String? message;
  final String? error;
  @JsonKey(name: 'statusCode')
  final int? code;

  ErrorModel({this.message, this.error, this.code});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}
