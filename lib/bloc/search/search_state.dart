part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  final bool hasReachedMax;
  final List<MovieModel> searchMovie;
  final Status status;
  final String errorMessage;

  const SearchState(
      {this.hasReachedMax = false,
      this.searchMovie = const [],
      this.status = Status.loading,
      this.errorMessage = ''});

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchError extends SearchState {
  final String e;
  const SearchError(this.e) : super(status: Status.error, errorMessage: e);

  @override
  List<Object> get props => [e];
}

class SearchSuccess extends SearchState {
  final List<MovieModel> search;
  const SearchSuccess({required this.search})
      : super(searchMovie: search, status: Status.success);

  @override
  List<Object> get props => [search];
}

class SearchHasReachMax extends SearchState {
  final bool isReachMax;
  const SearchHasReachMax({required this.isReachMax})
      : super(hasReachedMax: isReachMax, status: Status.success);

  @override
  List<Object> get props => [isReachMax];
}
