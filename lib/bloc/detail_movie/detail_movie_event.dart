part of 'detail_movie_bloc.dart';

sealed class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object> get props => [];
}

class GetDetailMovie extends DetailMovieEvent {
  final int movieId;
  final bool isTvSeries;
  const GetDetailMovie({required this.movieId, required this.isTvSeries});
}
