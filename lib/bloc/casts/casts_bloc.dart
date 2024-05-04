import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/model/casts_model.dart';
import 'package:movie_app/data/services/movie_service.dart';

part 'casts_event.dart';
part 'casts_state.dart';

class CastsBloc extends Bloc<CastsEvent, CastsState> {
  final MovieService movieService = MovieService();

  CastsBloc() : super(CastsInitial()) {
    on<GetDetailMovieCasts>((event, emit) async {
      try {
        emit(CastsLoading());
        final getData = await movieService.getDetailMovieCredits(event.movieId);
        Map<String, dynamic> data = getData;
        CastsModel results = CastsModel.fromJson(data);

        emit(CastsSuccess(casts: results));
      } catch (e) {
        emit(CastsError(e.toString()));
        rethrow;
      }
    });
  }
}
