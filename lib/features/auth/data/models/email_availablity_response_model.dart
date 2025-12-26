import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_availablity_response_model.freezed.dart';
part 'email_availablity_response_model.g.dart';

@freezed
abstract class EmailAvailablityResponseModel
    with _$EmailAvailablityResponseModel {
  const EmailAvailablityResponseModel._();

  const factory EmailAvailablityResponseModel({required bool isAvailable}) =
      _EmailAvailablityResponseModel;

  factory EmailAvailablityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EmailAvailablityResponseModelFromJson(json);
}
