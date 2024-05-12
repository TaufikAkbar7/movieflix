import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/model/movie_model.dart';

part 'results_movie_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResultsMovieModel {
  final int page;
  final List<MovieModel> results;

  ResultsMovieModel({required this.results, required this.page});

  factory ResultsMovieModel.fromJson(Map<String, dynamic> json) =>
      _$ResultsMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsMovieModelToJson(this);
}
