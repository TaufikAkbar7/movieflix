import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/model/tvseries_model.dart';

part 'results_tv_series_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResultsTvSeriesModel {
  final int page;
  final List<TvSeriesModel> results;

  ResultsTvSeriesModel({required this.results, required this.page});

  factory ResultsTvSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$ResultsTvSeriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsTvSeriesModelToJson(this);
}
