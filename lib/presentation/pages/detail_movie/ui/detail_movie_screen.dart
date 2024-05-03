import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/detail_movie/bloc/detail_movie_bloc.dart';
import 'package:movie_app/presentation/pages/detail_movie/widget/button_detail_movie_widget.dart';
import 'package:movie_app/presentation/pages/detail_movie/widget/carousel_detail_movie_widget.dart';
import 'package:movie_app/presentation/pages/detail_movie/widget/cast_detail_movie_widget.dart';
import 'package:movie_app/presentation/pages/detail_movie/widget/content_detail_movie_widget.dart';
import 'package:movie_app/presentation/pages/detail_movie/widget/reviews_detail_movie_widget.dart';
import 'package:movie_app/presentation/pages/home/widget/list_movie_widget.dart';

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
  // final TvSeriesBloc _tvSeriesBloc = TvSeriesBloc(homeRepos: DetailRepository());

  @override
  void initState() {
    _movieBloc.add(GetDetailMovie(movieId: getMovieId));
    // _tvSeriesBloc.add(GetPopularTvSeries());
    super.initState();
  }

  int get getMovieId => widget.movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF141A26),
        body: BlocProvider(
          create: (context) => _movieBloc,
          child: RefreshIndicator(
            onRefresh: () async =>
                _movieBloc.add(GetDetailMovie(movieId: getMovieId)),
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
                              const ButtonDetailMovieWidget(),
                              ContentDetailMovieWidget(
                                  genres: data.genres,
                                  overview: data.overview,
                                  title: data.title),
                              CastDetailMovieWidget(
                                  movieId: getMovieId,
                                  casts: state.castsMovie,
                                  language: data.spoken_languages),
                              ReviewsDetailMovieWidget(
                                  reviews: data.reviews.results),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: ListMovieWidget(
                                    data: data.similar.results as List<dynamic>,
                                    title: 'More like this'),
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
