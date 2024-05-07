import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/model/similar_model.dart';

part 'results_similar_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResultsSimilarModel {
  final int page;
  final List<SimilarModel> results;

  ResultsSimilarModel({required this.results, required this.page});

  factory ResultsSimilarModel.fromJson(Map<String, dynamic> json) =>
      _$ResultsSimilarModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsSimilarModelToJson(this);
}
