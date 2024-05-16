import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/model/casts_model.dart';
import 'package:movie_app/data/model/genre_model.dart';
import 'package:movie_app/data/model/language_model.dart';
import 'package:movie_app/data/model/results_review_model.dart';
import 'package:movie_app/data/model/results_similar_model.dart';
import 'package:movie_app/data/model/results_trailer_model.dart';
import 'package:movie_app/data/model/reviews_model.dart';

part 'detail_movie_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailMovieModel {
  final int id;
  final String title;
  final String? backdrop_path;
  final String poster_path;
  final double vote_average;
  final String overview;
  final CastsModel casts;
  final ResultsReviewModel reviews;
  final List<GenreModel> genres;
  final List<LanguageModel> spoken_languages;
  final ResultsSimilarModel similar;
  final ResultsTrailerModel videos;

  DetailMovieModel(
      {required this.id,
      required this.title,
      required this.backdrop_path,
      required this.poster_path,
      required this.vote_average,
      required this.overview,
      required this.casts,
      required this.reviews,
      required this.genres,
      required this.spoken_languages,
      required this.similar,
      required this.videos});

  factory DetailMovieModel.fromJson(Map<String, dynamic> json) =>
      _$DetailMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailMovieModelToJson(this);
}
