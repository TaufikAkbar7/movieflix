// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailMovieRoute.name: (routeData) {
      final args = routeData.argsAs<DetailMovieRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailMovieScreen(
          key: args.key,
          movieId: args.movieId,
          isTvSeries: args.isTvSeries,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
  };
}

/// generated route for
/// [DetailMovieScreen]
class DetailMovieRoute extends PageRouteInfo<DetailMovieRouteArgs> {
  DetailMovieRoute({
    Key? key,
    required int movieId,
    bool isTvSeries = false,
    List<PageRouteInfo>? children,
  }) : super(
          DetailMovieRoute.name,
          args: DetailMovieRouteArgs(
            key: key,
            movieId: movieId,
            isTvSeries: isTvSeries,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailMovieRoute';

  static const PageInfo<DetailMovieRouteArgs> page =
      PageInfo<DetailMovieRouteArgs>(name);
}

class DetailMovieRouteArgs {
  const DetailMovieRouteArgs({
    this.key,
    required this.movieId,
    this.isTvSeries = false,
  });

  final Key? key;

  final int movieId;

  final bool isTvSeries;

  @override
  String toString() {
    return 'DetailMovieRouteArgs{key: $key, movieId: $movieId, isTvSeries: $isTvSeries}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
