import 'package:json_annotation/json_annotation.dart';

part 'crew_model.g.dart';

@JsonSerializable()
class CrewModel {
  final int id;
  final String name;
  final String? profile_path;
  final String job;

  CrewModel(
      {required this.id,
      required this.name,
      required this.profile_path,
      required this.job});

  factory CrewModel.fromJson(Map<String, dynamic> json) =>
      _$CrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewModelToJson(this);
}
