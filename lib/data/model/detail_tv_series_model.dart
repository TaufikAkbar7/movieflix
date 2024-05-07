import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/model/casts_model.dart';
import 'package:movie_app/data/model/genre_model.dart';
import 'package:movie_app/data/model/language_model.dart';
import 'package:movie_app/data/model/results_review_model.dart';
import 'package:movie_app/data/model/results_similar_model.dart';
import 'package:movie_app/data/model/results_trailer_model.dart';
import 'package:movie_app/data/model/tv_series_season_model.dart';

part 'detail_tv_series_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailTvSeriesModel {
  final int id;
  final String name;
  final String backdrop_path;
  final String poster_path;
  final double vote_average;
  final String overview;
  final CastsModel credits;
  final ResultsReviewModel reviews;
  final List<GenreModel> genres;
  final List<LanguageModel> spoken_languages;
  final ResultsSimilarModel similar;
  final ResultsTrailerModel videos;
  final String first_air_date;
  final String last_air_date;
  final int number_of_episodes;
  final List<TvSeriesSeasonModel> seasons;

  DetailTvSeriesModel(
      {required this.id,
      required this.name,
      required this.backdrop_path,
      required this.poster_path,
      required this.vote_average,
      required this.overview,
      required this.credits,
      required this.reviews,
      required this.genres,
      required this.spoken_languages,
      required this.similar,
      required this.videos,
      required this.first_air_date,
      required this.last_air_date,
      required this.number_of_episodes,
      required this.seasons});

  factory DetailTvSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$DetailTvSeriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailTvSeriesModelToJson(this);
}
