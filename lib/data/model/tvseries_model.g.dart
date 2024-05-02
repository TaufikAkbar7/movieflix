// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvseries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvSeriesModel _$TvSeriesModelFromJson(Map<String, dynamic> json) =>
    TvSeriesModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      poster_path: json['poster_path'] as String,
    );

Map<String, dynamic> _$TvSeriesModelToJson(TvSeriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.poster_path,
    };
