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
          isTvSeries: args.isTvSeries,
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
    GenreRoute.name: (routeData) {
      final args = routeData.argsAs<GenreRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GenreScreen(
          key: args.key,
          genreId: args.genreId,
          genreName: args.genreName,
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
    PopularRoute.name: (routeData) {
      final args = routeData.argsAs<PopularRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PopularScreen(
          key: args.key,
          isTvSeries: args.isTvSeries,
        ),
      );
    },
    ReviewRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReviewScreen(
          key: args.key,
          movieId: args.movieId,
          isTvSeries: args.isTvSeries,
        ),
      );
    },
    SearchNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchNavigationScreen(),
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
          isTvSeries: args.isTvSeries,
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
    required bool isTvSeries,
    List<PageRouteInfo>? children,
  }) : super(
          CastRoute.name,
          args: CastRouteArgs(
            key: key,
            movieId: movieId,
            casts: casts,
            isTvSeries: isTvSeries,
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
    required this.isTvSeries,
  });

  final Key? key;

  final int movieId;

  final List<Map<String, String>> casts;

  final bool isTvSeries;

  @override
  String toString() {
    return 'CastRouteArgs{key: $key, movieId: $movieId, casts: $casts, isTvSeries: $isTvSeries}';
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
/// [GenreScreen]
class GenreRoute extends PageRouteInfo<GenreRouteArgs> {
  GenreRoute({
    Key? key,
    required int genreId,
    required String genreName,
    List<PageRouteInfo>? children,
  }) : super(
          GenreRoute.name,
          args: GenreRouteArgs(
            key: key,
            genreId: genreId,
            genreName: genreName,
          ),
          initialChildren: children,
        );

  static const String name = 'GenreRoute';

  static const PageInfo<GenreRouteArgs> page = PageInfo<GenreRouteArgs>(name);
}

class GenreRouteArgs {
  const GenreRouteArgs({
    this.key,
    required this.genreId,
    required this.genreName,
  });

  final Key? key;

  final int genreId;

  final String genreName;

  @override
  String toString() {
    return 'GenreRouteArgs{key: $key, genreId: $genreId, genreName: $genreName}';
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
/// [PopularScreen]
class PopularRoute extends PageRouteInfo<PopularRouteArgs> {
  PopularRoute({
    Key? key,
    required bool isTvSeries,
    List<PageRouteInfo>? children,
  }) : super(
          PopularRoute.name,
          args: PopularRouteArgs(
            key: key,
            isTvSeries: isTvSeries,
          ),
          initialChildren: children,
        );

  static const String name = 'PopularRoute';

  static const PageInfo<PopularRouteArgs> page =
      PageInfo<PopularRouteArgs>(name);
}

class PopularRouteArgs {
  const PopularRouteArgs({
    this.key,
    required this.isTvSeries,
  });

  final Key? key;

  final bool isTvSeries;

  @override
  String toString() {
    return 'PopularRouteArgs{key: $key, isTvSeries: $isTvSeries}';
  }
}

/// generated route for
/// [ReviewScreen]
class ReviewRoute extends PageRouteInfo<ReviewRouteArgs> {
  ReviewRoute({
    Key? key,
    required int movieId,
    required bool isTvSeries,
    List<PageRouteInfo>? children,
  }) : super(
          ReviewRoute.name,
          args: ReviewRouteArgs(
            key: key,
            movieId: movieId,
            isTvSeries: isTvSeries,
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
    required this.isTvSeries,
  });

  final Key? key;

  final int movieId;

  final bool isTvSeries;

  @override
  String toString() {
    return 'ReviewRouteArgs{key: $key, movieId: $movieId, isTvSeries: $isTvSeries}';
  }
}

/// generated route for
/// [SearchNavigationScreen]
class SearchNavigationRoute extends PageRouteInfo<void> {
  const SearchNavigationRoute({List<PageRouteInfo>? children})
      : super(
          SearchNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
    required bool isTvSeries,
    List<PageRouteInfo>? children,
  }) : super(
          SimilarRoute.name,
          args: SimilarRouteArgs(
            key: key,
            movieId: movieId,
            isTvSeries: isTvSeries,
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
    required this.isTvSeries,
  });

  final Key? key;

  final int movieId;

  final bool isTvSeries;

  @override
  String toString() {
    return 'SimilarRouteArgs{key: $key, movieId: $movieId, isTvSeries: $isTvSeries}';
  }
}
