import 'package:json_annotation/json_annotation.dart';

part 'tvseries_model.g.dart';

@JsonSerializable()
class TvSeriesModel {
  final int id;
  final String name;
  final String poster_path;

  TvSeriesModel(
      {required this.id, required this.name, required this.poster_path});

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeriesModelToJson(this);
}
