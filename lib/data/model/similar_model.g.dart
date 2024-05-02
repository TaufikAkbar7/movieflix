// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimilarModel _$SimilarModelFromJson(Map<String, dynamic> json) => SimilarModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      poster_path: json['poster_path'] as String?,
    );

Map<String, dynamic> _$SimilarModelToJson(SimilarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.poster_path,
    };
