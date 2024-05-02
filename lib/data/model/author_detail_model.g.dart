// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorDetailModel _$AuthorDetailModelFromJson(Map<String, dynamic> json) =>
    AuthorDetailModel(
      name: json['name'] as String,
      username: json['username'] as String,
      rating: (json['rating'] as num).toInt(),
    );

Map<String, dynamic> _$AuthorDetailModelToJson(AuthorDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'rating': instance.rating,
    };
