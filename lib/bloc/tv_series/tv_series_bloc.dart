import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/model/results_tv_series_model.dart';
import 'package:movie_app/data/model/tvseries_model.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';

part 'tv_series_event.dart';
part 'tv_series_state.dart';

class TvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final MovieService movieService = MovieService();

  TvSeriesBloc() : super(TvSeriesInitial()) {
    on<GetPopularTvSeries>((event, emit) async {
      try {
        final getData = await movieService.getPopularTvSeries();
        final getDataResult = getData['results'] as List<dynamic>;
        List<TvSeriesModel> results = getDataResult
            .map((value) => TvSeriesModel.fromJson(value))
            .toList();

        emit(HomePopularTvSeriesListState(tvSeriesListNew: results));
      } catch (e) {
        rethrow;
      }
    });
    on<GetUpcomingTvSeries>((event, emit) async {
      try {
        final getData = await movieService.getUpcomingTvSeries();
        final getDataResult = getData['results'] as List<dynamic>;
        List<TvSeriesModel> results = getDataResult
            .map((value) => TvSeriesModel.fromJson(value))
            .toList();

        emit(HomeUpcomingTvSeriesListState(upcomingTvSeriesListNew: results));
      } catch (e) {
        rethrow;
      }
    });
    on<GetPopularTvSeriesPagination>((event, emit) async {
      final getCurrentPopularMovieState = state.tvSeriesList;
      int currentPage = state.currentPage;

      try {
        final getData =
            await movieService.getPopularTvSeries(page: currentPage);
        Map<String, dynamic> data = getData;
        ResultsTvSeriesModel results = ResultsTvSeriesModel.fromJson(data);
        print(results.results[0].name);
        if (results.results.isNotEmpty) {
          List<TvSeriesModel> combineResult = [];
          combineResult.addAll(getCurrentPopularMovieState);
          combineResult.addAll(results.results);

          emit(PopularTvSeriesListState(
              tvSeriesNew: combineResult, page: results.page + 1));
        } else {
          emit(const TvSeriesHasReachMax(isReachMax: true));
        }
      } catch (e) {
        emit(TvSeriesError(e.toString()));
        rethrow;
      }
    }, transformer: droppable());
  }
}
