part of 'tv_series_bloc.dart';

sealed class TvSeriesEvent extends Equatable {
  const TvSeriesEvent();

  @override
  List<Object> get props => [];
}

class GetPopularTvSeries extends TvSeriesEvent {}

class GetUpcomingTvSeries extends TvSeriesEvent {}
