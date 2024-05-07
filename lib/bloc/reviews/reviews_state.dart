part of 'reviews_bloc.dart';

abstract class ReviewsState extends Equatable {
  final bool hasReachedMax;
  final List<ReviewsModel> reviews;
  final Status status;
  final String errorMessage;

  const ReviewsState(
      {this.status = Status.loading,
      this.reviews = const [],
      this.errorMessage = '',
      this.hasReachedMax = false});

  @override
  List<Object> get props => [];
}

class ReviewsInitial extends ReviewsState {}

class ReviewsError extends ReviewsState {
  final String e;
  const ReviewsError(this.e) : super(status: Status.error, errorMessage: e);

  @override
  List<Object> get props => [e];
}

class ReviewsSuccess extends ReviewsState {
  final List<ReviewsModel> reviewsState;
  const ReviewsSuccess({required this.reviewsState})
      : super(reviews: reviewsState, status: Status.success);

  @override
  List<Object> get props => [reviews];
}

class SimilarHasReachMax extends ReviewsState {
  final bool isReachMax;
  const SimilarHasReachMax({required this.isReachMax})
      : super(hasReachedMax: isReachMax, status: Status.success);

  @override
  List<Object> get props => [isReachMax];
}
