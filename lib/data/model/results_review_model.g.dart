// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsReviewModel _$ResultsReviewModelFromJson(Map<String, dynamic> json) =>
    ResultsReviewModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => ReviewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsReviewModelToJson(ResultsReviewModel instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
