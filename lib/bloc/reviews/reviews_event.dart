part of 'reviews_bloc.dart';

sealed class ReviewsEvent extends Equatable {
  const ReviewsEvent();

  @override
  List<Object> get props => [];
}

class GetDetailMovieReviews extends ReviewsEvent {
  final int movieId;
  const GetDetailMovieReviews({required this.movieId});
}
