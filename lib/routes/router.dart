import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/pages/auth/ui/login_screen.dart';
import 'package:movie_app/presentation/pages/casts/ui/casts_screen.dart';
import 'package:movie_app/presentation/pages/detail_movie/ui/detail_movie_screen.dart';
import 'package:movie_app/presentation/pages/home/ui/home_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: DetailMovieRoute.page, path: '/detail'),
        AutoRoute(page: CastRoute.page, path: '/casts')
      ];
}
