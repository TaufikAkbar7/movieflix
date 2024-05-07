import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/reviews/reviews_bloc.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';
import 'package:movie_app/presentation/widgets/widget.dart';

@RoutePage()
class ReviewScreen extends StatefulWidget {
  final int movieId;
  final bool isTvSeries;
  const ReviewScreen(
      {super.key, required this.movieId, required this.isTvSeries});

  @override
  State<ReviewScreen> createState() => _ReviewScreen();
}

class _ReviewScreen extends State<ReviewScreen> {
  final ReviewsBloc _reviewsBloc = ReviewsBloc();

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  void _fetchData() {
    _reviewsBloc.add(GetDetailMovieReviews(
        movieId: widget.movieId, isTvSeries: getIsTvSeries));
  }

  bool get getIsTvSeries => widget.isTvSeries;

  @override
  Widget build(context) {
    return Scaffold(
        backgroundColor: const Color(0xFF141A26),
        appBar: AppBar(
          title: const Text('Reviews',
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
          create: (context) => _reviewsBloc,
          child: AppContainerWidget(
              onRefresh: () async => _fetchData(),
              child: BlocBuilder<ReviewsBloc, ReviewsState>(
                  builder: (context, state) {
                switch (state.status) {
                  case Status.loading:
                    return const AppLoadingWidget();

                  case Status.success:
                    final data = state.reviews;

                    return SizedBox(
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: AppReviewWidget(reviews: data),
                        ));

                  case Status.error:
                    return AppErrorMessageWidget(
                        errorMessage: state.errorMessage);
                  default:
                    return Container();
                }
              })),
        ));
  }
}
