import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/search/search_bloc.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';
import 'package:movie_app/presentation/widgets/widget.dart';

@RoutePage()
class GenreScreen extends StatefulWidget {
  final int genreId;
  final String genreName;
  const GenreScreen(
      {super.key, required this.genreId, required this.genreName});

  @override
  State<GenreScreen> createState() => _GenreScreen();
}

class _GenreScreen extends State<GenreScreen> {
  final _scrollController = ScrollController();
  final SearchBloc _searchBloc = SearchBloc();
  int _currentPage = 1;

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

  void _fetchData({int page = 1}) {
    _searchBloc.add(
        GetMovieByGenre(currentPage: _currentPage, genreId: widget.genreId));
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= (maxScroll * 0.9)) {
      _currentPage++;
      _fetchData(page: _currentPage);
    }
  }

  @override
  Widget build(context) {
    return AppScaffoldWidget(
      isUsingAppBar: true,
      appBarTitle: widget.genreName,
      body: BlocProvider(
        create: (context) => _searchBloc,
        child: AppContainerWidget(
          onRefresh: () async => _fetchData(),
          child:
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            switch (state.status) {
              case Status.loading:
                return const AppLoadingWidget();
              case Status.success:
                final data = state.searchMovie;
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: AppGridViewWidget(
                        data: data,
                        scrollController: _scrollController,
                        isTvSeries: false));
              case Status.error:
                return AppErrorMessageWidget(errorMessage: state.errorMessage);
              default:
                return Container();
            }
          }),
        ),
      ),
    );
  }
}
