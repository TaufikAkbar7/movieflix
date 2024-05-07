import 'package:flutter/material.dart';
import 'package:movie_app/data/model/tv_series_season_model.dart';

class SeasonDetailMovieWidget extends StatelessWidget {
  final List<TvSeriesSeasonModel> seasons;
  const SeasonDetailMovieWidget({super.key, required this.seasons});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Seasons',
                style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.separated(
            itemCount: seasons.length,
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (seasons.isNotEmpty) {
                return Container(
                  width: 154.0,
                  height: 154.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w154${seasons[index].poster_path}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.2),
                      ]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 40,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.black.withOpacity(0.5),
                                      ]),
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: SizedBox(
                                height: 42.0,
                                child: IconButton(
                                  icon: const Icon(Icons.bookmark_add,
                                      size: 26.0, color: Colors.white),
                                  onPressed: () => {},
                                ),
                              ),
                            )),
                        Column(
                          children: [
                            Text(
                              seasons[index].name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${seasons[index].episode_count} eps',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const Text(
                  'no data',
                  style: TextStyle(color: Colors.white),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
