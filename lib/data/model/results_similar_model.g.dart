// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_similar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsSimilarModel _$ResultsSimilarModelFromJson(Map<String, dynamic> json) =>
    ResultsSimilarModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => SimilarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
    );

Map<String, dynamic> _$ResultsSimilarModelToJson(
        ResultsSimilarModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
