import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/routes/router.dart';

class ListMovieWidget<T> extends StatelessWidget {
  final List<dynamic> data;
  final String title;
  final bool isTvSeries;
  final PageRouteInfo<dynamic> destinationRoute;

  const ListMovieWidget(
      {super.key,
      required this.data,
      required this.title,
      this.isTvSeries = false,
      required this.destinationRoute});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                  size: 36.0,
                ),
                onPressed: () => context.router.push(destinationRoute))
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (data.isNotEmpty) {
                return GestureDetector(
                    onTap: () {
                      context.router.push(DetailMovieRoute(
                          movieId: data[index].id, isTvSeries: isTvSeries));
                    },
                    child: Container(
                      width: 154.0,
                      height: 154.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w154${data[index].poster_path}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
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
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: SizedBox(
                                    height: 42.0,
                                    child: IconButton(
                                      icon: const Icon(Icons.bookmark_add,
                                          size: 26.0, color: Colors.white),
                                      onPressed: () => {},
                                    ),
                                  ),
                                )),
                            Text(
                              isTvSeries ? data[index].name : data[index].title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ));
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
