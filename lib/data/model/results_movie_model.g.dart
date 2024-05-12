// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsMovieModel _$ResultsMovieModelFromJson(Map<String, dynamic> json) =>
    ResultsMovieModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
    );

Map<String, dynamic> _$ResultsMovieModelToJson(ResultsMovieModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
