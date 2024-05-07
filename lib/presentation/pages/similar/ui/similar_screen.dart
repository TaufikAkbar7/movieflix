import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/similar/similar_bloc.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';
import 'package:movie_app/presentation/widgets/widget.dart';

@RoutePage()
class SimilarScreen extends StatefulWidget {
  final int movieId;
  final bool isTvSeries;
  const SimilarScreen(
      {super.key, required this.movieId, required this.isTvSeries});

  @override
  State<SimilarScreen> createState() => _SimilarScreen();
}

class _SimilarScreen extends State<SimilarScreen> {
  final _scrollController = ScrollController();
  final SimilarBloc _similarBloc = SimilarBloc();
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
    _similarBloc.add(GetDetailMovieSimilar(
        movieId: widget.movieId, currentPage: page, isTvSeries: getIsTvSeries));
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= (maxScroll * 0.9)) {
      _currentPage++;
      _fetchData(page: _currentPage);
    }
  }

  bool get getIsTvSeries => widget.isTvSeries;

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141A26),
      appBar: AppBar(
        title: const Text('Similar Movie',
            style: TextStyle(
                color: Colors.white,
                fontSize: 21.0,
                fontWeight: FontWeight.w700)),
        backgroundColor: const Color(0xFF141A26),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: BlocProvider(
        create: (context) => _similarBloc,
        child: AppContainerWidget(
          onRefresh: () async => _fetchData(),
          child:
              BlocBuilder<SimilarBloc, SimilarState>(builder: (context, state) {
            switch (state.status) {
              case Status.loading:
                return const AppLoadingWidget();
              case Status.success:
                final data = state.similarMovie;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    2, // number of items in each row
                                mainAxisSpacing: 24.0, // spacing between rows
                                crossAxisSpacing: 14.0,
                                mainAxisExtent: 250.0 // spacing between columns
                                ),
                        delegate: SliverChildBuilderDelegate(
                            (context, index) => AppCardMovieWidget(
                                data: data[index], isTvSeries: false),
                            childCount: data.length),
                      ),
                      const SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: AppLoadingWidget(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
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
