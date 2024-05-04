part of 'similar_bloc.dart';

abstract class SimilarState extends Equatable {
  const SimilarState();

  @override
  List<Object> get props => [];
}

class SimilarInitial extends SimilarState {}

class SimilarLoading extends SimilarState {}

class SimilarError extends SimilarState {
  final String e;
  const SimilarError(this.e);

  @override
  List<Object> get props => [e];
}

class SimilarSuccess extends SimilarState {
  final List<SimilarModel> similar;
  const SimilarSuccess({required this.similar});

  @override
  List<Object> get props => [similar];
}
