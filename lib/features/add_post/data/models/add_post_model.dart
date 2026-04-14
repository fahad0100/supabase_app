import 'package:supabase_app/features/add_post/domain/entities/add_post_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_post_model.freezed.dart';
part 'add_post_model.g.dart';

@freezed
abstract class AddPostModel with _$AddPostModel {
  const factory AddPostModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _AddPostModel;

  factory AddPostModel.fromJson(Map<String, Object?> json) => _$AddPostModelFromJson(json);
}



extension AddPostModelMapper on AddPostModel {
  AddPostEntity toEntity() {
    return AddPostEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
