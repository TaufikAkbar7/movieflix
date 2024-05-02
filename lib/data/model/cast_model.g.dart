// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastModel _$CastModelFromJson(Map<String, dynamic> json) => CastModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      profile_path: json['profile_path'] as String?,
      character: json['character'] as String,
      known_for_department: json['known_for_department'] as String,
    );

Map<String, dynamic> _$CastModelToJson(CastModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profile_path,
      'character': instance.character,
      'known_for_department': instance.known_for_department,
    };
