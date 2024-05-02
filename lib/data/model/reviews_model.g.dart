// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsModel _$ReviewsModelFromJson(Map<String, dynamic> json) => ReviewsModel(
      id: (json['id'] as num).toInt(),
      author: json['author'] as String,
      updated_at: json['updated_at'] as String,
      content: json['content'] as String,
      author_details: AuthorDetailModel.fromJson(
          json['author_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewsModelToJson(ReviewsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'updated_at': instance.updated_at,
      'content': instance.content,
      'author_details': instance.author_details.toJson(),
    };
