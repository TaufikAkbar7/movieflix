part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetMovieBySearch extends SearchEvent {
  final String query;
  final int currentPage;
  const GetMovieBySearch({required this.query, required this.currentPage});
}

class GetMovieByGenre extends SearchEvent {
  final int genreId;
  final int currentPage;
  const GetMovieByGenre({required this.genreId, required this.currentPage});
}
