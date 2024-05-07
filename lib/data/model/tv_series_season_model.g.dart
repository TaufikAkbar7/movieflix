// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_season_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvSeriesSeasonModel _$TvSeriesSeasonModelFromJson(Map<String, dynamic> json) =>
    TvSeriesSeasonModel(
      id: (json['id'] as num).toInt(),
      air_date: json['air_date'] as String?,
      name: json['name'] as String,
      poster_path: json['poster_path'] as String?,
      episode_count: (json['episode_count'] as num).toInt(),
    );

Map<String, dynamic> _$TvSeriesSeasonModelToJson(
        TvSeriesSeasonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'air_date': instance.air_date,
      'name': instance.name,
      'poster_path': instance.poster_path,
      'episode_count': instance.episode_count,
    };
