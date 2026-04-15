import 'package:supabase_app/features/home/domain/entities/home_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_app/features/home/domain/entities/post_entity.dart';
part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
abstract class PostModel with _$PostModel {
  @JsonSerializable(fieldRename: .snake)
  const factory PostModel({
    required int id,
    required String content,
    required String userId,
    required bool isDeleted,
    required String createdAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, Object?> json) =>
      _$PostModelFromJson(json);
}

extension PostModelMapper on PostModel {
  PostEntity toEntity() {
    return PostEntity(
      id: id,
      content: content,
      userId: userId,
      isDeleted: isDeleted,
      createdAt: createdAt,
    );
  }
}
