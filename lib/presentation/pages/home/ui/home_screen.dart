import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_bloc.dart';
import 'package:movie_app/bloc/tv_series/tv_series_bloc.dart';
import 'package:movie_app/presentation/pages/home/widget/carousel_widget.dart';
import 'package:movie_app/presentation/pages/home/widget/list_movie_widget.dart';
import 'package:movie_app/routes/router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieBloc _movieBloc = MovieBloc();
  final TvSeriesBloc _tvSeriesBloc = TvSeriesBloc();

  @override
  void initState() {
    _movieBloc.add(GetPopularMovies());
    _tvSeriesBloc.add(GetPopularTvSeries());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           _movieBloc.add(GetPopularMovies());
      //           _tvSeriesBloc.add(GetPopularTvSeries());
      //         },
      //         icon: const Icon(Icons.refresh))
      //   ],
      // ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<MovieBloc>(
            create: (context) => _movieBloc,
          ),
          BlocProvider<TvSeriesBloc>(
            create: (context) => _tvSeriesBloc,
          ),
        ],
        child: Scaffold(
            backgroundColor: const Color(0xFF141A26),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const CarouselWidget(),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                    child: Column(
                      children: [
                        BlocBuilder<MovieBloc, MovieState>(
                          builder: (context, state) {
                            return ListMovieWidget(
                              destinationRoute: const HomeRoute(),
                              data: state.movieList,
                              title: 'Popular Movies',
                            );
                          },
                        ),
                        BlocBuilder<TvSeriesBloc, TvSeriesState>(
                          builder: (context, state) {
                            return ListMovieWidget(
                              destinationRoute: const HomeRoute(),
                              data: state.tvSeriesList,
                              title: 'Popular Tv Series',
                              isTvSeries: true,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('wkwkw'),
    //   ),
    //   body: Container(
    //     child: OutlinedButton(
    //       child: Text('Click'),
    //       onPressed: () =>
    //           HomeBloc(homeRepos: HomeRepository())..add(GetPopularTvSeries()),
    //     ),
    //   ),
    // );
  }
}
