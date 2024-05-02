import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/model/detail_movie_model.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/data/services/movie_service.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieService movieService = MovieService();

  MovieBloc() : super(MovieInitial()) {
    on<GetPopularMovies>((event, emit) async {
      try {
        final getData = await movieService.getPopularMovies();
        final getDataResult = getData['results'] as List<dynamic>;
        List<MovieModel> results =
            getDataResult.map((value) => MovieModel.fromJson(value)).toList();

        emit(HomePopularMoviesListState(movieListNew: results));
      } catch (e) {
        rethrow;
      }
    });
    on<GetUpcomingMovies>((event, emit) async {
      try {
        final getData = await movieService.getUpcomingMovies();
        final getDataResult = getData['results'] as List<dynamic>;
        List<MovieModel> results =
            getDataResult.map((value) => MovieModel.fromJson(value)).toList();

        emit(HomeUpcomingMoviesListState(upcomingMovieListNew: results));
      } catch (e) {
        rethrow;
      }
    });
  }
}
