part of 'casts_bloc.dart';

abstract class CastsState extends Equatable {
  const CastsState();

  @override
  List<Object> get props => [];
}

class CastsInitial extends CastsState {}

class CastsLoading extends CastsState {}

class CastsError extends CastsState {
  final String e;
  const CastsError(this.e);

  @override
  List<Object> get props => [e];
}

class CastsSuccess extends CastsState {
  final CastsModel casts;

  const CastsSuccess({required this.casts});

  List<Map<String, String>> get castsMovie {
    final cast = casts.cast.map((e) => {
          'name': e.name,
          'job': e.known_for_department,
          'image': e.profile_path ?? ''
        });
    final crew = casts.crew.map(
        (e) => {'name': e.name, 'job': e.job, 'image': e.profile_path ?? ''});

    return {...cast, ...crew}.toList();
  }

  @override
  List<Object> get props => [castsMovie];
}
