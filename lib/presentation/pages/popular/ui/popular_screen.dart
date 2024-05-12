import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_bloc.dart';
import 'package:movie_app/bloc/tv_series/tv_series_bloc.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';
import 'package:movie_app/presentation/widgets/widget.dart';

@RoutePage()
class PopularScreen extends StatefulWidget {
  final bool isTvSeries;
  const PopularScreen({super.key, required this.isTvSeries});

  @override
  State<PopularScreen> createState() => _PopularScreen();
}

class _PopularScreen extends State<PopularScreen> {
  final _scrollController = ScrollController();
  final MovieBloc _movieBloc = MovieBloc();
  final TvSeriesBloc _tvSeriesBloc = TvSeriesBloc();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _fetchData();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _fetchData() async {
    if (widget.isTvSeries) {
      _tvSeriesBloc.add(GetPopularTvSeriesPagination());
    } else {
      _movieBloc.add(GetPopularMoviesPagination());
    }
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= (maxScroll * 0.9)) {
      _fetchData();
    }
  }

  Widget Container() {
    if (widget.isTvSeries) {
      return AppContainerWidget(
        onRefresh: () async => _fetchData(),
        child:
            BlocBuilder<TvSeriesBloc, TvSeriesState>(builder: (context, state) {
          switch (state.status) {
            case Status.loading:
              return const AppLoadingWidget();
            case Status.success:
              final data = state.tvSeriesList;
              return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: AppGridViewWidget(
                      data: data,
                      scrollController: _scrollController,
                      isTvSeries: true));
            case Status.error:
              return AppErrorMessageWidget(errorMessage: state.errorMessage);
            default:
              return Container();
          }
        }),
      );
    }
    return AppContainerWidget(
      onRefresh: () async => _fetchData(),
      child: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
        switch (state.status) {
          case Status.loading:
            return const AppLoadingWidget();
          case Status.success:
            final data = state.movieList;
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: AppGridViewWidget(
                  data: data,
                  scrollController: _scrollController,
                  isTvSeries: false,
                ));
          case Status.error:
            return AppErrorMessageWidget(errorMessage: state.errorMessage);
          default:
            return Container();
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      isUsingAppBar: true,
      appBarTitle: widget.isTvSeries ? 'Popular Tv Series' : 'Popular Movie',
      body: MultiBlocProvider(providers: [
        BlocProvider<MovieBloc>(
          create: (context) => _movieBloc,
        ),
        BlocProvider<TvSeriesBloc>(
          create: (context) => _tvSeriesBloc,
        ),
      ], child: Container()),
    );
  }
}
