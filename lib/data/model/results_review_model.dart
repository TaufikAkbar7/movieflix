import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/model/author_detail_model.dart';
import 'package:movie_app/data/model/reviews_model.dart';

part 'results_review_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResultsReviewModel {
  final List<ReviewsModel> results;

  ResultsReviewModel({required this.results});

  factory ResultsReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ResultsReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsReviewModelToJson(this);
}
