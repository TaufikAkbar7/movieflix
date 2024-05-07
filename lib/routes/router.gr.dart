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
    BookmarkRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookmarkScreen(),
      );
    },
    CastRoute.name: (routeData) {
      final args = routeData.argsAs<CastRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CastScreen(
          key: args.key,
          movieId: args.movieId,
          casts: args.casts,
        ),
      );
    },
    DetailMovieNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DetailMovieNavigationScreen(),
      );
    },
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
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    ReviewRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReviewScreen(
          key: args.key,
          movieId: args.movieId,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
    SimilarRoute.name: (routeData) {
      final args = routeData.argsAs<SimilarRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SimilarScreen(
          key: args.key,
          movieId: args.movieId,
        ),
      );
    },
  };
}

/// generated route for
/// [BookmarkScreen]
class BookmarkRoute extends PageRouteInfo<void> {
  const BookmarkRoute({List<PageRouteInfo>? children})
      : super(
          BookmarkRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarkRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CastScreen]
class CastRoute extends PageRouteInfo<CastRouteArgs> {
  CastRoute({
    Key? key,
    required int movieId,
    required List<Map<String, String>> casts,
    List<PageRouteInfo>? children,
  }) : super(
          CastRoute.name,
          args: CastRouteArgs(
            key: key,
            movieId: movieId,
            casts: casts,
          ),
          initialChildren: children,
        );

  static const String name = 'CastRoute';

  static const PageInfo<CastRouteArgs> page = PageInfo<CastRouteArgs>(name);
}

class CastRouteArgs {
  const CastRouteArgs({
    this.key,
    required this.movieId,
    required this.casts,
  });

  final Key? key;

  final int movieId;

  final List<Map<String, String>> casts;

  @override
  String toString() {
    return 'CastRouteArgs{key: $key, movieId: $movieId, casts: $casts}';
  }
}

/// generated route for
/// [DetailMovieNavigationScreen]
class DetailMovieNavigationRoute extends PageRouteInfo<void> {
  const DetailMovieNavigationRoute({List<PageRouteInfo>? children})
      : super(
          DetailMovieNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailMovieNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReviewScreen]
class ReviewRoute extends PageRouteInfo<ReviewRouteArgs> {
  ReviewRoute({
    Key? key,
    required int movieId,
    List<PageRouteInfo>? children,
  }) : super(
          ReviewRoute.name,
          args: ReviewRouteArgs(
            key: key,
            movieId: movieId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewRoute';

  static const PageInfo<ReviewRouteArgs> page = PageInfo<ReviewRouteArgs>(name);
}

class ReviewRouteArgs {
  const ReviewRouteArgs({
    this.key,
    required this.movieId,
  });

  final Key? key;

  final int movieId;

  @override
  String toString() {
    return 'ReviewRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SimilarScreen]
class SimilarRoute extends PageRouteInfo<SimilarRouteArgs> {
  SimilarRoute({
    Key? key,
    required int movieId,
    List<PageRouteInfo>? children,
  }) : super(
          SimilarRoute.name,
          args: SimilarRouteArgs(
            key: key,
            movieId: movieId,
          ),
          initialChildren: children,
        );

  static const String name = 'SimilarRoute';

  static const PageInfo<SimilarRouteArgs> page =
      PageInfo<SimilarRouteArgs>(name);
}

class SimilarRouteArgs {
  const SimilarRouteArgs({
    this.key,
    required this.movieId,
  });

  final Key? key;

  final int movieId;

  @override
  String toString() {
    return 'SimilarRouteArgs{key: $key, movieId: $movieId}';
  }
}
