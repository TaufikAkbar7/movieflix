part of 'similar_bloc.dart';

sealed class SimilarEvent extends Equatable {
  const SimilarEvent();

  @override
  List<Object> get props => [];
}

class GetDetailMovieSimilar extends SimilarEvent {
  final int movieId;
  final int currentPage;
  final bool isTvSeries;

  const GetDetailMovieSimilar(
      {required this.movieId,
      required this.currentPage,
      required this.isTvSeries});
}
