part of 'casts_bloc.dart';

sealed class CastsEvent extends Equatable {
  const CastsEvent();

  @override
  List<Object> get props => [];
}

class GetDetailMovieCasts extends CastsEvent {
  final int movieId;
  const GetDetailMovieCasts({required this.movieId});
}
