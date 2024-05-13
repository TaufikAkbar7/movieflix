import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';
import 'package:movie_app/presentation/widgets/app_scaffold_widget.dart';
import 'package:movie_app/routes/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreen();
}

class _BookmarkScreen extends State<BookmarkScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<List<dynamic>> _getListBookmarkMovie;

  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences prefs) => {prefs.reload()});
    _getListBookmarkMovie = _prefs.then((SharedPreferences prefs) {
      final getBookmark = prefs.getString('bookmark') ?? '';
      if (getBookmark.isNotEmpty) {
        List<dynamic> bookmark = jsonDecode(getBookmark);
        return bookmark;
      }
      return [];
    });
  }

  @override
  void dispose() {
    super.dispose();
    _getListBookmarkMovie;
  }

  @override
  Widget build(context) {
    return AppScaffoldWidget(
      isUsingAppBar: true,
      appBarTitle: 'Bookmarks Movie',
      body: FutureBuilder<List<dynamic>>(
          future: _getListBookmarkMovie,
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data!.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: CustomScrollView(
                      slivers: [
                        SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      2, // number of items in each row
                                  mainAxisSpacing: 24.0, // spacing between rows
                                  crossAxisSpacing: 14.0,
                                  mainAxisExtent:
                                      250.0 // spacing between columns
                                  ),
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            final data = snapshot.data![index];
                            return GestureDetector(
                                onTap: () {
                                  AutoRouter.of(context).push(DetailMovieRoute(
                                      movieId: data['id'], isTvSeries: false));
                                },
                                child: Container(
                                  width: 154.0,
                                  height: 154.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: NetworkImage(data['poster_path'] !=
                                              null
                                          ? "${ImageConstant.tmbdImageCard}/${data['poster_path']}"
                                          : ImageConstant.defaultImage),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Colors.black
                                                            .withOpacity(0.7),
                                                        Colors.black
                                                            .withOpacity(0.5),
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0)),
                                              child: SizedBox(
                                                height: 42.0,
                                                child: IconButton(
                                                  icon: const Icon(
                                                      Icons.bookmark_add,
                                                      size: 26.0,
                                                      color: Colors.white),
                                                  onPressed: () => {},
                                                ),
                                              ),
                                            )),
                                        Text(
                                          data['title'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          }, childCount: snapshot.data!.length),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No movie on bookmarks page',
                        style: TextStyle(color: Colors.white)),
                  );
                }
            }
          }),
    );
  }
}
