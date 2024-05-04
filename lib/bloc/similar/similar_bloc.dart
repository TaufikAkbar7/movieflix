import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/model/similar_model.dart';
import 'package:movie_app/data/services/movie_service.dart';

part 'similar_event.dart';
part 'similar_state.dart';

class SimilarBloc extends Bloc<SimilarEvent, SimilarState> {
  final MovieService movieService = MovieService();

  SimilarBloc() : super(SimilarInitial()) {
    on<GetDetailMovieSimilar>((event, emit) async {
      try {
        emit(SimilarLoading());
        final getData = await movieService.getDetailMovieSimilar(event.movieId);
        final data = getData['results'] as List<dynamic>;
        List<SimilarModel> results =
            data.map((value) => SimilarModel.fromJson(value)).toList();

        emit(SimilarSuccess(similar: results));
      } catch (e) {
        emit(SimilarError(e.toString()));
        rethrow;
      }
    });
  }
}
