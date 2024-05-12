import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/main_screen.dart';
import 'package:movie_app/presentation/pages/bookmark/ui/bookmark_screen.dart';
import 'package:movie_app/presentation/pages/casts/ui/casts_screen.dart';
import 'package:movie_app/presentation/pages/detail_movie/ui/detail_movie_navigation_screen.dart';
import 'package:movie_app/presentation/pages/detail_movie/ui/detail_movie_screen.dart';
import 'package:movie_app/presentation/pages/genre/ui/genre_screen.dart';
import 'package:movie_app/presentation/pages/home/ui/home_screen.dart';
import 'package:movie_app/presentation/pages/popular/ui/popular_screen.dart';
import 'package:movie_app/presentation/pages/reviews/ui/reviews_screen.dart';
import 'package:movie_app/presentation/pages/search/ui/search_navigation_screen.dart';
import 'package:movie_app/presentation/pages/search/ui/search_screen.dart';
import 'package:movie_app/presentation/pages/similar/ui/similar_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: MainRoute.page, initial: true, children: [
          AutoRoute(page: HomeRoute.page, path: 'home'),
          AutoRoute(
              page: SearchNavigationRoute.page,
              path: 'search',
              children: [
                AutoRoute(page: SearchRoute.page, initial: true),
                AutoRoute(page: GenreRoute.page, path: 'genre')
              ]),
          AutoRoute(page: BookmarkRoute.page, path: 'bookmark')
        ]),
        AutoRoute(
            page: DetailMovieNavigationRoute.page,
            path: '/detail',
            children: [
              AutoRoute(page: DetailMovieRoute.page, initial: true),
              AutoRoute(page: CastRoute.page, path: 'casts'),
              AutoRoute(page: ReviewRoute.page, path: 'reviews'),
              AutoRoute(page: SimilarRoute.page, path: 'similar')
            ]),
        AutoRoute(page: PopularRoute.page, path: '/popular')
      ];
}
