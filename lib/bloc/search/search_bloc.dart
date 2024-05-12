import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieService movieService = MovieService();

  SearchBloc() : super(SearchInitial()) {
    on<GetMovieBySearch>((event, emit) async {
      if (state.hasReachedMax) return;
      final getCurrentMovieState = state.searchMovie;

      try {
        final getData = await movieService.getMovieBySearch(
            query: event.query, page: event.currentPage);
        final data = getData['results'] as List<dynamic>;

        if (data.isNotEmpty) {
          List<MovieModel> results =
              data.map((value) => MovieModel.fromJson(value)).toList();
          List<MovieModel> combineResult = [];
          combineResult.addAll(getCurrentMovieState);
          combineResult.addAll(results);

          emit(SearchSuccess(search: combineResult));
        } else {
          emit(const SearchHasReachMax(isReachMax: true));
        }
      } catch (e) {
        emit(SearchError(e.toString()));
        rethrow;
      }
    }, transformer: droppable());

    on<GetMovieByGenre>((event, emit) async {
      if (state.hasReachedMax) return;
      final getCurrentMovieState = state.searchMovie;

      try {
        final getData = await movieService.getMovieListByGenre(
            genreId: event.genreId, page: event.currentPage);
        final data = getData['results'] as List<dynamic>;

        if (data.isNotEmpty) {
          List<MovieModel> results =
              data.map((value) => MovieModel.fromJson(value)).toList();
          List<MovieModel> combineResult = [];
          combineResult.addAll(getCurrentMovieState);
          combineResult.addAll(results);

          emit(SearchSuccess(search: combineResult));
        } else {
          emit(const SearchHasReachMax(isReachMax: true));
        }
      } catch (e) {
        emit(SearchError(e.toString()));
        rethrow;
      }
    }, transformer: droppable());
  }
}
