// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String,
      ambition: json['ambition'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ambition': instance.ambition,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
    };
