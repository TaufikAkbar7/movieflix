import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/model/tvseries_model.dart';
import 'package:movie_app/data/services/movie_service.dart';

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
  }
}
