import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment variables and shared app constants.
abstract class Constants {
  static String tmbdApiKey = dotenv.env['TMDB_API_KEY'].toString();
}
