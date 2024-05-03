import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/plugins/dio/dio.dart';

class MovieService {
  Future<dynamic> getPopularMovies() async {
    final dio = DioClient().dio;
    try {
      final response = await dio.get('/movie/popular?language=en-US&page=1');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getPopularTvSeries() async {
    final dio = DioClient().dio;
    try {
      final response = await dio.get('/tv/popular?language=en-US&page=1');
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
          '/movie/$movieId?language=en-US&append_to_response=casts,similar,reviews');
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
          '/tv/$tvSeriesId?language=en-US&append_to_response=casts,similar,release_dates,reviews');
      return response.data;
    } on DioException catch (err) {
      debugPrint('debug: ${err.requestOptions}');
      debugPrint('debug: ${err.message}');
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> getDetailMovieCredits(int id) async {
    final dio = DioClient().dio;
    try {
      final response = await dio.get('/movie/$id/credits?language=en-US');
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
