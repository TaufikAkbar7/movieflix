import 'package:json_annotation/json_annotation.dart';

part 'similar_model.g.dart';

@JsonSerializable()
class SimilarModel {
  final int id;
  final String? title;
  final String? name;
  final String? poster_path;

  SimilarModel(
      {required this.id,
      required this.title,
      required this.name,
      required this.poster_path});

  factory SimilarModel.fromJson(Map<String, dynamic> json) =>
      _$SimilarModelFromJson(json);

  Map<String, dynamic> toJson() => _$SimilarModelToJson(this);
}
