part of 'detail_movie_bloc.dart';

abstract class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

class DetailMovieInitial extends DetailMovieState {}

class DetailMovieLoading extends DetailMovieState {}

class DetailMovieError extends DetailMovieState {
  final String e;
  const DetailMovieError(this.e);

  @override
  List<Object> get props => [e];
}

class DetailMovieDataState extends DetailMovieState {
  final DetailMovieModel detailMovie;

  const DetailMovieDataState({required this.detailMovie});

  List<Map<String, String>> get castsMovie {
    final cast = detailMovie.casts.cast.map((e) => {
          'name': e.name,
          'job': e.known_for_department,
          'image': e.profile_path ?? ''
        });
    final crew = detailMovie.casts.crew.map(
        (e) => {'name': e.name, 'job': e.job, 'image': e.profile_path ?? ''});

    return {...cast, ...crew}.toList();
  }

  @override
  List<Object> get props => [detailMovie, castsMovie];
}
