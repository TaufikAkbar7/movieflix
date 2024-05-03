import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/model/author_detail_model.dart';

part 'reviews_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReviewsModel {
  final String id;
  final String author;
  final String updated_at;
  final String content;
  final AuthorDetailModel author_details;

  ReviewsModel(
      {required this.id,
      required this.author,
      required this.updated_at,
      required this.content,
      required this.author_details});

  factory ReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsModelToJson(this);
}
