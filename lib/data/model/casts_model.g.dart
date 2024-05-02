// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastsModel _$CastsModelFromJson(Map<String, dynamic> json) => CastsModel(
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => CrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastsModelToJson(CastsModel instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
    };
