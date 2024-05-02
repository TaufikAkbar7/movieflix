part of 'tv_series_bloc.dart';

sealed class TvSeriesState extends Equatable {
  final List<TvSeriesModel> tvSeriesList;
  final List<TvSeriesModel> upcomingTvSeriesList;
  const TvSeriesState(
      {this.tvSeriesList = const [], this.upcomingTvSeriesList = const []});

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
