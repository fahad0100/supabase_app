import 'package:supabase_app/core/common/entity/profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  @JsonSerializable(fieldRename: .snake)
  const factory ProfileModel({
    required String id,
    required String ambition,
    required String fullName,
    required String email,
    required String phone,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> json) =>
      _$ProfileModelFromJson(json);
}

extension ProfileModelMapper on ProfileModel {
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      ambition: ambition,
      fullName: fullName,
      email: email,
      phone: phone,
    );
  }
}
