// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailMovieModel _$DetailMovieModelFromJson(Map<String, dynamic> json) =>
    DetailMovieModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      backdrop_path: json['backdrop_path'] as String,
      poster_path: json['poster_path'] as String,
      vote_average: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String,
      casts: CastsModel.fromJson(json['casts'] as Map<String, dynamic>),
      reviews:
          ResultsReviewModel.fromJson(json['reviews'] as Map<String, dynamic>),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      spoken_languages: (json['spoken_languages'] as List<dynamic>)
          .map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      similar:
          ResultsSimilarModel.fromJson(json['similar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailMovieModelToJson(DetailMovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.backdrop_path,
      'poster_path': instance.poster_path,
      'vote_average': instance.vote_average,
      'overview': instance.overview,
      'casts': instance.casts.toJson(),
      'reviews': instance.reviews.toJson(),
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'spoken_languages':
          instance.spoken_languages.map((e) => e.toJson()).toList(),
      'similar': instance.similar.toJson(),
    };
