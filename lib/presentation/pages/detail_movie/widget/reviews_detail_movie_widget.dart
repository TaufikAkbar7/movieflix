import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/data/model/reviews_model.dart';
import 'package:movie_app/helper/functions.dart';

class ReviewsDetailMovieWidget extends StatefulWidget {
  final List<ReviewsModel> reviews;
  const ReviewsDetailMovieWidget({super.key, required this.reviews});

  @override
  State<ReviewsDetailMovieWidget> createState() => _ReviewsDetailMovieWidget();
}

class _ReviewsDetailMovieWidget extends State<ReviewsDetailMovieWidget> {
  bool isExpand = false;
  String expandId = '0';

  @override
  void initState() {
    super.initState();
  }

  List<dynamic> get getReviews => widget.reviews;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
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
                  onPressed: () {},
                  child: const Text('All reviews',
                      style: TextStyle(color: Colors.white)))
            ],
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
              itemCount: getReviews.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                if (getReviews.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: getReviews[index].author,
                            style: const TextStyle(color: Color(0xff9ba0a6))),
                        const WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: SizedBox(width: 4)),
                        const TextSpan(
                            text: '\u2022',
                            style: TextStyle(color: Colors.white)),
                        const WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: SizedBox(width: 4)),
                        TextSpan(
                            text: formatDate(getReviews[index].updated_at),
                            style: const TextStyle(color: Color(0xff9ba0a6))),
                      ])),
                      const SizedBox(height: 5),
                      Column(
                        children: [
                          Text(
                              isExpand && expandId == getReviews[index].id
                                  ? getReviews[index].content
                                  : getReviews[index].content.length > 180
                                      ? '${getReviews[index].content.substring(0, 180)}...'
                                      : getReviews[index].content,
                              style: const TextStyle(color: Colors.white)),
                          InkWell(
                            onTap: () => setState(() {
                              isExpand = !isExpand;
                              expandId = getReviews[index].id;
                            }),
                            child: Row(
                              children: [
                                Text(
                                  isExpand && expandId == getReviews[index].id
                                      ? 'show less'
                                      : 'show more',
                                  style: const TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.yellow, size: 21.0),
                          const SizedBox(width: 5),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text:
                                    '${getReviews[index].author_details.rating ?? '-'}/',
                                style: const TextStyle(color: Colors.white)),
                            const TextSpan(
                                text: '10',
                                style: TextStyle(
                                    color: Color(0xff9ba0a6), fontSize: 12.0)),
                          ])),
                        ],
                      )
                    ],
                  );
                } else {
                  return const Text(
                    'No Review',
                    style: TextStyle(color: Colors.white),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
