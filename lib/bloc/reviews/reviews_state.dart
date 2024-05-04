part of 'reviews_bloc.dart';

abstract class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsError extends ReviewsState {
  final String e;
  const ReviewsError(this.e);

  @override
  List<Object> get props => [e];
}

class ReviewsSuccess extends ReviewsState {
  final List<ReviewsModel> reviews;
  const ReviewsSuccess({required this.reviews});

  @override
  List<Object> get props => [reviews];
}
