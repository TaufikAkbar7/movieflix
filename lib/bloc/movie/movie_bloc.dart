import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/data/model/results_movie_model.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';

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
    on<GetPopularMoviesPagination>((event, emit) async {
      final getCurrentPopularMovieState = state.movieList;
      int currentPage = state.currentPage;

      try {
        final getData = await movieService.getPopularMovies(page: currentPage);
        Map<String, dynamic> data = getData;
        ResultsMovieModel results = ResultsMovieModel.fromJson(data);

        if (results.results.isNotEmpty) {
          List<MovieModel> combineResult = [];
          combineResult.addAll(getCurrentPopularMovieState);
          combineResult.addAll(results.results);

          emit(PopularMoviesListState(
              movieListNew: combineResult, page: results.page + 1));
        } else {
          emit(const MovieHasReachMax(isReachMax: true));
        }
      } catch (e) {
        emit(MovieError(e.toString()));
        rethrow;
      }
    }, transformer: droppable());
    on<GetUpcomingMovies>(
      (event, emit) async {
        try {
          final getData = await movieService.getUpcomingMovies();
          final getDataResult = getData['results'] as List<dynamic>;
          List<MovieModel> results =
              getDataResult.map((value) => MovieModel.fromJson(value)).toList();

          emit(HomeUpcomingMoviesListState(upcomingMovieListNew: results));
        } catch (e) {
          rethrow;
        }
      },
    );
  }
}
