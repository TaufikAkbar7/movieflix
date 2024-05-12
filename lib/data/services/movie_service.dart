import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/plugins/dio/dio.dart';

class MovieService {
  Future<dynamic> getPopularMovies({int page = 1}) async {
    final dio = DioClient().dio;
    try {
      final response =
          await dio.get('/movie/popular?language=en-US&page=$page');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getPopularTvSeries({int page = 1}) async {
    final dio = DioClient().dio;
    try {
      final response = await dio.get('/tv/popular?language=en-US&page=$page');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getUpcomingMovies() async {
    final dio = DioClient().dio;
    try {
      final response = await dio.get('/upcoming?language=en-US&page=1');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getUpcomingTvSeries() async {
    final dio = DioClient().dio;
    try {
      final response = await dio.get('/tv/on_the_air?language=en-US&page=1');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getDetailMovie(int movieId) async {
    final dio = DioClient().dio;
    try {
      final response = await dio.get(
          '/movie/$movieId?language=en-US&append_to_response=casts,similar,reviews,videos');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getDetailTvSeries(int tvSeriesId) async {
    final dio = DioClient().dio;
    try {
      final response = await dio.get(
          '/tv/$tvSeriesId?language=en-US&append_to_response=credits,similar,reviews,videos');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getDetailMovieCredits({int id = 0, prefix = 'movie'}) async {
    final dio = DioClient().dio;
    try {
      final response = await dio.get('/$prefix/$id/credits?language=en-US');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getDetailMovieReviews(
      {int id = 0, int page = 1, prefix = 'movie'}) async {
    final dio = DioClient().dio;
    try {
      final response =
          await dio.get('/$prefix/$id/reviews?language=en-US&page=$page');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getDetailMovieSimilar(
      {int id = 0, int page = 1, prefix = 'movie'}) async {
    final dio = DioClient().dio;
    try {
      final response =
          await dio.get('/$prefix/$id/similar?language=en-US&page=$page');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getMovieListByGenre({int genreId = 0, int page = 1}) async {
    final dio = DioClient().dio;
    try {
      final response = await dio.get(
          '/discover/movie?include_adult=false&include_video=false&language=en-US&page=$page&sort_by=popularity.desc&with_genres=$genreId');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getMovieBySearch({String query = '', int page = 1}) async {
    final dio = DioClient().dio;
    try {
      final response = await dio.get(
          '/search/movie?query=$query&language=en-US&page=$page&region=id,us');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }
}
