// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_tv_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsTvSeriesModel _$ResultsTvSeriesModelFromJson(
        Map<String, dynamic> json) =>
    ResultsTvSeriesModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => TvSeriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
    );

Map<String, dynamic> _$ResultsTvSeriesModelToJson(
        ResultsTvSeriesModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
