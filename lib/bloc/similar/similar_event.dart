part of 'similar_bloc.dart';

sealed class SimilarEvent extends Equatable {
  const SimilarEvent();

  @override
  List<Object> get props => [];
}

class GetDetailMovieSimilar extends SimilarEvent {
  final int movieId;
  const GetDetailMovieSimilar({required this.movieId});
}
