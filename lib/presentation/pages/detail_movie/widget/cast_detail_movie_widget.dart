import 'package:flutter/material.dart';
import 'package:movie_app/data/model/language_model.dart';

class CastDetailMovieWidget extends StatelessWidget {
  final List<Map<String, String>> casts;
  final List<LanguageModel> language;
  const CastDetailMovieWidget(
      {super.key, required this.casts, required this.language});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Cast & Crew',
                  style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  onPressed: () => {})
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 170,
            child: ListView.separated(
              itemCount: casts.length > 10 ? 10 : casts.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(casts[index]['image'] != ''
                          ? "https://image.tmdb.org/t/p/w154/${casts[index]['image']}"
                          : "https://www.gravatar.com/avatar/3b3be63a4c2a439b013787725dfce802?d=identicon"),
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(height: 2.0),
                    Text(casts[index]['job'] ?? '-',
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 12.0)),
                    const SizedBox(height: 2.0),
                    Text(casts[index]['name'] ?? '-',
                        style: const TextStyle(color: Colors.white))
                  ],
                );
              },
            ),
          ),
          RichText(
              text: TextSpan(
                  text: 'Audio Track: ',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                  children: language.map((lang) {
                    return TextSpan(
                        text: lang.name,
                        style: const TextStyle(color: Color(0xff9ba0a6)));
                  }).toList())),
        ],
      ),
    );
  }
}
