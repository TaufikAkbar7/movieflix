// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_tv_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailTvSeriesModel _$DetailTvSeriesModelFromJson(Map<String, dynamic> json) =>
    DetailTvSeriesModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      backdrop_path: json['backdrop_path'] as String,
      poster_path: json['poster_path'] as String,
      vote_average: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String,
      credits: CastsModel.fromJson(json['credits'] as Map<String, dynamic>),
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
      videos:
          ResultsTrailerModel.fromJson(json['videos'] as Map<String, dynamic>),
      first_air_date: json['first_air_date'] as String,
      last_air_date: json['last_air_date'] as String,
      number_of_episodes: (json['number_of_episodes'] as num).toInt(),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => TvSeriesSeasonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailTvSeriesModelToJson(
        DetailTvSeriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'backdrop_path': instance.backdrop_path,
      'poster_path': instance.poster_path,
      'vote_average': instance.vote_average,
      'overview': instance.overview,
      'credits': instance.credits.toJson(),
      'reviews': instance.reviews.toJson(),
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'spoken_languages':
          instance.spoken_languages.map((e) => e.toJson()).toList(),
      'similar': instance.similar.toJson(),
      'videos': instance.videos.toJson(),
      'first_air_date': instance.first_air_date,
      'last_air_date': instance.last_air_date,
      'number_of_episodes': instance.number_of_episodes,
      'seasons': instance.seasons.map((e) => e.toJson()).toList(),
    };
