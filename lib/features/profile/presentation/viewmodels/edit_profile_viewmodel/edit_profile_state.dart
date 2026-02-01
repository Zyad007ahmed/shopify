import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;
  const factory EditProfileState.loading() = EditProfileLoading;
  const factory EditProfileState.uploadingImage() = EditProfileUploadingImage;
  const factory EditProfileState.success(String message) = _Success;
  const factory EditProfileState.error(String message) = EditProfileError;
}
