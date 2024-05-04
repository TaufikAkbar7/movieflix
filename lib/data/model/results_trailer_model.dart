import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/model/trailer_model.dart';

part 'results_trailer_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResultsTrailerModel {
  final List<TrailerModel> results;

  ResultsTrailerModel({required this.results});

  factory ResultsTrailerModel.fromJson(Map<String, dynamic> json) =>
      _$ResultsTrailerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsTrailerModelToJson(this);
}
