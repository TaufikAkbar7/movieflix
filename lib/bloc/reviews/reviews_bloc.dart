import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/model/reviews_model.dart';
import 'package:movie_app/data/services/movie_service.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final MovieService movieService = MovieService();

  ReviewsBloc() : super(ReviewsInitial()) {
    on<GetDetailMovieReviews>((event, emit) async {
      try {
        emit(ReviewsLoading());
        final getData = await movieService.getDetailMovieReviews(event.movieId);
        final data = getData['results'] as List<dynamic>;

        List<ReviewsModel> results =
            data.map((value) => ReviewsModel.fromJson(value)).toList();

        emit(ReviewsSuccess(reviews: results));
      } catch (e) {
        emit(ReviewsError(e.toString()));
        rethrow;
      }
    });
  }
}
