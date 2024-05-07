import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/model/similar_model.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';

part 'similar_event.dart';
part 'similar_state.dart';

class SimilarBloc extends Bloc<SimilarEvent, SimilarState> {
  final MovieService movieService = MovieService();

  SimilarBloc() : super(SimilarInitial()) {
    on<GetDetailMovieSimilar>((event, emit) async {
      if (state.hasReachedMax) return;
      final getCurrentSimilarState = state.similarMovie;
      final path = event.isTvSeries ? 'tv' : 'movie';

      try {
        final getData = await movieService.getDetailMovieSimilar(
            id: event.movieId, page: event.currentPage, prefix: path);
        final data = getData['results'] as List<dynamic>;

        if (data.isNotEmpty) {
          List<SimilarModel> results =
              data.map((value) => SimilarModel.fromJson(value)).toList();
          List<SimilarModel> combineResult = [];
          combineResult.addAll(getCurrentSimilarState);
          combineResult.addAll(results);

          emit(SimilarSuccess(similar: combineResult));
        } else {
          emit(const SimilarHasReachMax(isReachMax: true));
        }
      } catch (e) {
        emit(SimilarError(e.toString()));
        rethrow;
      }
    }, transformer: droppable());
  }
}
