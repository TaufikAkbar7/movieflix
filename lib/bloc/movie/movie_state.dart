part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  final List<MovieModel> movieList;
  final List<MovieModel> upcomingMovieList;

  const MovieState(
      {this.movieList = const [], this.upcomingMovieList = const []});

  @override
  List<Object> get props => [movieList, upcomingMovieList];
}

class MovieInitial extends MovieState {}

class HomePopularMoviesListState extends MovieState {
  final List<MovieModel> movieListNew;

  const HomePopularMoviesListState({required this.movieListNew})
      : super(movieList: movieListNew);

  List<MovieModel> get getPopularMovieListState => movieListNew;

  @override
  List<Object> get props => [getPopularMovieListState];
}

class HomeUpcomingMoviesListState extends MovieState {
  final List<MovieModel> upcomingMovieListNew;

  const HomeUpcomingMoviesListState({required this.upcomingMovieListNew})
      : super(upcomingMovieList: upcomingMovieListNew);

  List<MovieModel> get getUpcomingMovieList => upcomingMovieListNew;

  @override
  List<Object> get props => [getUpcomingMovieList];
}
