import 'package:json_annotation/json_annotation.dart';

part 'author_detail_model.g.dart';

@JsonSerializable()
class AuthorDetailModel {
  final String name;
  final String username;
  final int rating;

  AuthorDetailModel(
      {required this.name, required this.username, required this.rating});

  factory AuthorDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailModelToJson(this);
}
