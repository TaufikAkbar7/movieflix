// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_trailer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsTrailerModel _$ResultsTrailerModelFromJson(Map<String, dynamic> json) =>
    ResultsTrailerModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => TrailerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsTrailerModelToJson(
        ResultsTrailerModel instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
