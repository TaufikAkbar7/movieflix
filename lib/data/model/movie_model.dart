import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final int id;
  final String title;
  final String? poster_path;
  final String release_date;
  final double vote_average;

  MovieModel(
      {required this.id,
      required this.title,
      required this.poster_path,
      required this.release_date,
      required this.vote_average});

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
