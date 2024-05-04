import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/reviews/reviews_bloc.dart';
import 'package:movie_app/presentation/widgets/app_review_widget.dart';

@RoutePage()
class ReviewScreen extends StatefulWidget {
  final int movieId;
  const ReviewScreen({super.key, required this.movieId});

  @override
  State<ReviewScreen> createState() => _ReviewScreen();
}

class _ReviewScreen extends State<ReviewScreen> {
  final ReviewsBloc _reviewsBloc = ReviewsBloc();

  @override
  void initState() {
    _reviewsBloc.add(GetDetailMovieReviews(movieId: widget.movieId));
    super.initState();
  }

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
          child: RefreshIndicator(
              onRefresh: () async => _reviewsBloc
                  .add(GetDetailMovieReviews(movieId: widget.movieId)),
              child: BlocBuilder<ReviewsBloc, ReviewsState>(
                  builder: (context, state) {
                if (state is ReviewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.blueGrey,
                    ),
                  );
                } else if (state is ReviewsSuccess) {
                  final data = state.reviews;

                  return SizedBox(
                      height: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: AppReviewWidget(reviews: data),
                      ));
                } else if (state is ReviewsError) {
                  return Text(state.e,
                      style: const TextStyle(color: Colors.white));
                } else {
                  return Container();
                }
              })),
        ));
  }
}
