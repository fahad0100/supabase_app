// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddPostModel _$AddPostModelFromJson(Map<String, dynamic> json) =>
    _AddPostModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$AddPostModelToJson(_AddPostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
