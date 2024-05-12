part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMovies extends MovieEvent {}

class GetUpcomingMovies extends MovieEvent {}

class GetPopularMoviesPagination extends MovieEvent {
  int page;
  GetPopularMoviesPagination({this.page = 1});
}
