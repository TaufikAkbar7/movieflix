part of 'similar_bloc.dart';

abstract class SimilarState extends Equatable {
  final bool hasReachedMax;
  final List<SimilarModel> similarMovie;
  final Status status;
  final String errorMessage;

  const SimilarState(
      {this.hasReachedMax = false,
      this.similarMovie = const [],
      this.status = Status.loading,
      this.errorMessage = ''});

  @override
  List<Object> get props => [];
}

class SimilarInitial extends SimilarState {}

class SimilarError extends SimilarState {
  final String e;
  const SimilarError(this.e) : super(status: Status.error, errorMessage: e);

  @override
  List<Object> get props => [e];
}

class SimilarSuccess extends SimilarState {
  final List<SimilarModel> similar;
  const SimilarSuccess({required this.similar})
      : super(similarMovie: similar, status: Status.success);

  @override
  List<Object> get props => [similar];
}

class SimilarHasReachMax extends SimilarState {
  final bool isReachMax;
  const SimilarHasReachMax({required this.isReachMax})
      : super(hasReachedMax: isReachMax, status: Status.success);

  @override
  List<Object> get props => [isReachMax];
}
