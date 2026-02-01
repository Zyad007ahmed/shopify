import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_file_response_model.freezed.dart';
part 'upload_file_response_model.g.dart';

@freezed
abstract class UploadFileResponseModel with _$UploadFileResponseModel {
  const UploadFileResponseModel._();

  const factory UploadFileResponseModel({required String location}) =
      _UploadFileResponseModel;

  factory UploadFileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseModelFromJson(json);
}
