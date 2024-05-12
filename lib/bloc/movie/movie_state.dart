part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  final bool hasReachedMax;
  final List<MovieModel> movieList;
  final List<MovieModel> upcomingMovieList;
  final Status status;
  final String errorMessage;
  final int currentPage;

  const MovieState(
      {this.movieList = const [],
      this.upcomingMovieList = const [],
      this.hasReachedMax = false,
      this.status = Status.loading,
      this.errorMessage = '',
      this.currentPage = 1});

  @override
  List<Object> get props => [movieList, upcomingMovieList];
}

class MovieInitial extends MovieState {}

class HomePopularMoviesListState extends MovieState {
  final List<MovieModel> movieListNew;

  const HomePopularMoviesListState({required this.movieListNew})
      : super(movieList: movieListNew, status: Status.success);

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

class MovieError extends MovieState {
  final String e;
  const MovieError(this.e) : super(errorMessage: e, status: Status.error);

  @override
  List<Object> get props => [e];
}

class MovieHasReachMax extends MovieState {
  final bool isReachMax;
  const MovieHasReachMax({required this.isReachMax})
      : super(hasReachedMax: isReachMax, status: Status.success);

  @override
  List<Object> get props => [isReachMax];
}

class PopularMoviesListState extends MovieState {
  final int page;
  final List<MovieModel> movieListNew;

  const PopularMoviesListState({required this.movieListNew, required this.page})
      : super(
            movieList: movieListNew, status: Status.success, currentPage: page);

  List<MovieModel> get getPopularMovieListState => movieListNew;

  @override
  List<Object> get props => [getPopularMovieListState];
}
