import 'package:json_annotation/json_annotation.dart';

part 'cast_model.g.dart';

@JsonSerializable()
class CastModel {
  final int id;
  final String name;
  final String? profile_path;
  final String character;
  final String known_for_department;

  CastModel(
      {required this.id,
      required this.name,
      required this.profile_path,
      required this.character,
      required this.known_for_department});

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);
}
