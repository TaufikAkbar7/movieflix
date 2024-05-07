import 'package:flutter/material.dart';
import 'package:movie_app/data/model/genre_model.dart';

class ContentDetailMovieWidget extends StatelessWidget {
  final List<GenreModel> genres;
  final String title;
  final String overview;

  const ContentDetailMovieWidget(
      {super.key,
      required this.genres,
      required this.title,
      required this.overview});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          children: genres.map((item) {
                    if (genres.length > 1) {
                      return TextSpan(
                          text: ' ${item.name} ',
                          children: genres.indexOf(item) != genres.length - 1
                              ? [
                                  const TextSpan(
                                      text: '\u2022',
                                      style: TextStyle(color: Colors.white))
                                ]
                              : [],
                          style: const TextStyle(color: Color(0xff9ba0a6)));
                    } else {
                      return TextSpan(
                          text: item.name,
                          style: const TextStyle(color: Color(0xff9ba0a6)));
                    }
                  }).toList())),
                  const Text('3h 12m',
                      style: TextStyle(color: Color(0xff9ba0a6)))
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0)),
          Text(overview, style: const TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
