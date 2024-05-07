import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/detail_movie/detail_movie_bloc.dart';
import 'package:movie_app/helper/functions.dart';
import 'package:movie_app/presentation/pages/detail_movie/widget/button_detail_movie_widget.dart';
import 'package:movie_app/presentation/pages/detail_movie/widget/carousel_detail_movie_widget.dart';
import 'package:movie_app/presentation/pages/detail_movie/widget/cast_detail_movie_widget.dart';
import 'package:movie_app/presentation/pages/detail_movie/widget/content_detail_movie_widget.dart';
import 'package:movie_app/presentation/pages/detail_movie/widget/reviews_detail_movie_widget.dart';
import 'package:movie_app/presentation/pages/detail_movie/widget/season_detail_movie_widget.dart';
import 'package:movie_app/presentation/pages/home/widget/list_movie_widget.dart';
import 'package:movie_app/routes/router.dart';

@RoutePage()
class DetailMovieScreen extends StatefulWidget {
  final int movieId;
  final bool isTvSeries;

  const DetailMovieScreen(
      {super.key, required this.movieId, this.isTvSeries = false});

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreen();
}

class _DetailMovieScreen extends State<DetailMovieScreen> {
  final DetailMovieBloc _movieBloc = DetailMovieBloc();

  @override
  void initState() {
    _movieBloc
        .add(GetDetailMovie(movieId: getMovieId, isTvSeries: getIsTvSeries));
    super.initState();
  }

  int get getMovieId => widget.movieId;
  bool get getIsTvSeries => widget.isTvSeries;

  String formatYear(String date1, String date2) {
    var resultDate1 = date1.split('-')[0];
    var resultDate2 = date2.split('-')[0];
    return '$resultDate1 - $resultDate2';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF141A26),
        body: BlocProvider(
          create: (context) => _movieBloc,
          child: RefreshIndicator(
            onRefresh: () async => _movieBloc.add(
                GetDetailMovie(movieId: getMovieId, isTvSeries: getIsTvSeries)),
            child: BlocBuilder<DetailMovieBloc, DetailMovieState>(
              builder: (context, state) {
                if (state is DetailMovieLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.blueGrey,
                    ),
                  );
                } else if (state is DetailMovieDataState) {
                  final data = state.detailMovie;

                  return SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              CarouselDetailMovieWidget(poster_images: [
                                data.backdrop_path,
                                data.poster_path
                              ], rating: data.vote_average),
                              const SizedBox(height: 10),
                              ButtonDetailMovieWidget(
                                  trailers: data.videos.results),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 12.0),
                                    ContentDetailMovieWidget(
                                        genres: data.genres,
                                        overview: data.overview,
                                        title: data.title),
                                    CastDetailMovieWidget(
                                        movieId: getMovieId,
                                        casts: state.castsMovie,
                                        language: data.spoken_languages,
                                        isTvSeries: getIsTvSeries),
                                    const SizedBox(height: 10.0),
                                    ReviewsDetailMovieWidget(
                                        movieId: getMovieId,
                                        reviews: data.reviews.results,
                                        isTvSeries: getIsTvSeries),
                                    ListMovieWidget(
                                        destinationRoute: SimilarRoute(
                                            movieId: getMovieId,
                                            isTvSeries: getIsTvSeries),
                                        data: data.similar.results
                                            as List<dynamic>,
                                        title: 'More like this')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ));
                } else if (state is DetailTvSeriesSuccess) {
                  final data = state.detailTvSeries;

                  return SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              CarouselDetailMovieWidget(
                                  poster_images: [
                                    data.backdrop_path,
                                    data.poster_path
                                  ],
                                  rating: data.vote_average,
                                  year: formatYear(
                                      data.first_air_date, data.last_air_date),
                                  totalEpisodes: data.number_of_episodes),
                              const SizedBox(height: 10),
                              ButtonDetailMovieWidget(
                                  trailers: data.videos.results),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 12.0),
                                    ContentDetailMovieWidget(
                                        genres: data.genres,
                                        overview: data.overview,
                                        title: data.name),
                                    CastDetailMovieWidget(
                                        movieId: getMovieId,
                                        casts: state.castsTvSeries,
                                        language: data.spoken_languages,
                                        isTvSeries: getIsTvSeries),
                                    const SizedBox(height: 10.0),
                                    ReviewsDetailMovieWidget(
                                        movieId: getMovieId,
                                        reviews: data.reviews.results,
                                        isTvSeries: getIsTvSeries),
                                    const SizedBox(height: 14.0),
                                    SeasonDetailMovieWidget(
                                        seasons: data.seasons),
                                    ListMovieWidget(
                                        destinationRoute: SimilarRoute(
                                            movieId: getMovieId,
                                            isTvSeries: getIsTvSeries),
                                        data: data.similar.results
                                            as List<dynamic>,
                                        isTvSeries: getIsTvSeries,
                                        title: 'More like this')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ));
                } else if (state is DetailMovieError) {
                  return Text(state.e,
                      style: const TextStyle(color: Colors.white));
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }
}
