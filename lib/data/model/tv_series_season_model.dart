import 'package:json_annotation/json_annotation.dart';

part 'tv_series_season_model.g.dart';

@JsonSerializable()
class TvSeriesSeasonModel {
  final int id;
  final String? air_date;
  final String name;
  final String? poster_path;
  final int episode_count;

  TvSeriesSeasonModel(
      {required this.id,
      required this.air_date,
      required this.name,
      required this.poster_path,
      required this.episode_count});

  factory TvSeriesSeasonModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesSeasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeriesSeasonModelToJson(this);
}
