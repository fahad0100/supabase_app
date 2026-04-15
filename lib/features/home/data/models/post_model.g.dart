// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostModel _$PostModelFromJson(Map<String, dynamic> json) => _PostModel(
  id: (json['id'] as num).toInt(),
  content: json['content'] as String,
  userId: json['user_id'] as String,
  isDeleted: json['is_deleted'] as bool,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$PostModelToJson(_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'user_id': instance.userId,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
    };
