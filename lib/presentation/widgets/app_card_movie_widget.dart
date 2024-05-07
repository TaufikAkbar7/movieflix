import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';
import 'package:movie_app/routes/router.dart';

class AppCardMovieWidget extends StatelessWidget {
  final dynamic data;
  final bool isTvSeries;

  const AppCardMovieWidget(
      {super.key, required this.data, required this.isTvSeries});

  @override
  Widget build(context) {
    return GestureDetector(
        onTap: () {
          AutoRouter.of(context)
              .push(DetailMovieRoute(movieId: data.id, isTvSeries: isTvSeries));
        },
        child: Container(
          width: 154.0,
          height: 154.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: NetworkImage(data.poster_path != null
                  ? "${ImageConstant.tmbdImageCard}/${data.poster_path}"
                  : ImageConstant.defaultImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
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
                Text(
                  isTvSeries ? data.name : data.title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ));
  }
}
