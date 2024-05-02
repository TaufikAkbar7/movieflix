import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/model/cast_model.dart';
import 'package:movie_app/data/model/crew_model.dart';

part 'casts_model.g.dart';

@JsonSerializable()
class CastsModel {
  final List<CastModel> cast;
  final List<CrewModel> crew;

  CastsModel({required this.cast, required this.crew});

  factory CastsModel.fromJson(Map<String, dynamic> json) =>
      _$CastsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastsModelToJson(this);
}
