import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/widget.dart';

class AppGridViewWidget<T> extends StatelessWidget {
  final ScrollController scrollController;
  final List<T> data;
  final bool isTvSeries;
  const AppGridViewWidget(
      {super.key,
      required this.scrollController,
      required this.data,
      required this.isTvSeries});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 24.0, // spacing between rows
              crossAxisSpacing: 14.0,
              mainAxisExtent: 250.0 // spacing between columns
              ),
          delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  AppCardMovieWidget(data: data[index], isTvSeries: isTvSeries),
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
    );
  }
}
