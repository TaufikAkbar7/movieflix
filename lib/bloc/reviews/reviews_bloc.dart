import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/model/reviews_model.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final MovieService movieService = MovieService();

  ReviewsBloc() : super(ReviewsInitial()) {
    on<GetDetailMovieReviews>((event, emit) async {
      if (state.hasReachedMax) return;
      final getCurrentReviewsState = state.reviews;
      final path = event.isTvSeries ? 'tv' : 'movie';

      try {
        final getData = await movieService.getDetailMovieReviews(
            id: event.movieId, prefix: path);
        final data = getData['results'] as List<dynamic>;
        List<ReviewsModel> results =
            data.map((value) => ReviewsModel.fromJson(value)).toList();
        List<ReviewsModel> combineResult = [];
        combineResult.addAll(getCurrentReviewsState);
        combineResult.addAll(results);

        emit(ReviewsSuccess(reviewsState: combineResult));
      } catch (e) {
        emit(ReviewsError(e.toString()));
        rethrow;
      }
    });
  }
}
