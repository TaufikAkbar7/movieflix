// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewModel _$CrewModelFromJson(Map<String, dynamic> json) => CrewModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      profile_path: json['profile_path'] as String?,
      job: json['job'] as String,
    );

Map<String, dynamic> _$CrewModelToJson(CrewModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profile_path,
      'job': instance.job,
    };
