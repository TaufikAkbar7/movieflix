part of 'tv_series_bloc.dart';

sealed class TvSeriesState extends Equatable {
  final List<TvSeriesModel> tvSeriesList;
  final List<TvSeriesModel> upcomingTvSeriesList;
  final Status status;
  final String errorMessage;
  final int currentPage;
  final bool hasReachedMax;

  const TvSeriesState(
      {this.tvSeriesList = const [],
      this.upcomingTvSeriesList = const [],
      this.hasReachedMax = false,
      this.status = Status.loading,
      this.errorMessage = '',
      this.currentPage = 1});

  @override
  List<Object> get props => [];
}

final class TvSeriesInitial extends TvSeriesState {}

class HomePopularTvSeriesListState extends TvSeriesState {
  final List<TvSeriesModel> tvSeriesListNew;

  const HomePopularTvSeriesListState({required this.tvSeriesListNew})
      : super(tvSeriesList: tvSeriesListNew);

  List<TvSeriesModel> get getPopularTvSeriesListState => tvSeriesListNew;

  @override
  List<Object> get props => [tvSeriesList];
}

class HomeUpcomingTvSeriesListState extends TvSeriesState {
  final List<TvSeriesModel> upcomingTvSeriesListNew;

  const HomeUpcomingTvSeriesListState({required this.upcomingTvSeriesListNew})
      : super(upcomingTvSeriesList: upcomingTvSeriesListNew);

  List<TvSeriesModel> get getUpcomingTvSeriesListState =>
      upcomingTvSeriesListNew;

  @override
  List<Object> get props => [getUpcomingTvSeriesListState];
}

class PopularTvSeriesListState extends TvSeriesState {
  final int page;
  final List<TvSeriesModel> tvSeriesNew;

  const PopularTvSeriesListState(
      {required this.tvSeriesNew, required this.page})
      : super(
            tvSeriesList: tvSeriesNew,
            status: Status.success,
            currentPage: page);

  List<TvSeriesModel> get getPopularMovieListState => tvSeriesNew;

  @override
  List<Object> get props => [getPopularMovieListState];
}

class TvSeriesError extends TvSeriesState {
  final String e;
  const TvSeriesError(this.e) : super(errorMessage: e, status: Status.error);

  @override
  List<Object> get props => [e];
}

class TvSeriesHasReachMax extends TvSeriesState {
  final bool isReachMax;
  const TvSeriesHasReachMax({required this.isReachMax})
      : super(hasReachedMax: isReachMax, status: Status.success);

  @override
  List<Object> get props => [isReachMax];
}
