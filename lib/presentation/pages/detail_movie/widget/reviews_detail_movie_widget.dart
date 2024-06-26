import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/data/model/reviews_model.dart';
import 'package:movie_app/presentation/widgets/app_review_widget.dart';
import 'package:movie_app/routes/router.dart';

class ReviewsDetailMovieWidget extends StatelessWidget {
  final List<ReviewsModel> reviews;
  final int movieId;
  final bool isTvSeries;

  const ReviewsDetailMovieWidget(
      {super.key,
      required this.reviews,
      required this.movieId,
      required this.isTvSeries});

  @override
  Widget build(BuildContext context) {
    if (reviews.isNotEmpty) {
      return Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Reviews',
                    style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                TextButton(
                    onPressed: () => context.router.push(
                        ReviewRoute(movieId: movieId, isTvSeries: isTvSeries)),
                    child: const Text('All reviews',
                        style: TextStyle(color: Colors.white)))
              ],
            ),
            SizedBox(height: 250, child: AppReviewWidget(reviews: reviews))
          ],
        ),
      );
    }
    return Container();
  }
}
