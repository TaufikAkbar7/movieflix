import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/model/detail_movie_model.dart';
import 'package:movie_app/data/model/detail_tv_series_model.dart';
import 'package:movie_app/data/services/movie_service.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final MovieService movieService = MovieService();

  DetailMovieBloc() : super(DetailMovieInitial()) {
    on<GetDetailMovie>((event, emit) async {
      try {
        emit(DetailMovieLoading());
        if (event.isTvSeries) {
          final getData = await movieService.getDetailTvSeries(event.movieId);
          Map<String, dynamic> data = getData;
          DetailTvSeriesModel results = DetailTvSeriesModel.fromJson(data);

          emit(DetailTvSeriesSuccess(detailTvSeries: results));
        } else {
          final getData = await movieService.getDetailMovie(event.movieId);
          Map<String, dynamic> data = getData;
          DetailMovieModel results = DetailMovieModel.fromJson(data);

          emit(DetailMovieDataState(detailMovie: results));
        }
      } catch (e) {
        emit(DetailMovieError(e.toString()));
        rethrow;
      }
    });
  }
}
