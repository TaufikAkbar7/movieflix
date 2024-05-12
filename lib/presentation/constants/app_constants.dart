import 'package:flutter/material.dart';

class ColorConstant {
  ColorConstant._();
  static const Color primary = Color(0xff8E00FE);
  static const Color black = Color(0xff141A26);
  static const Color white = Color(0xffF8F8F8);
  static const Color lightGrey = Color(0xffE7E7E7);
  static const Color grey = Color(0xff9BA0A6);
  static const Color darkGrey = Color(0xff28303D);
}

class ImageConstant {
  ImageConstant._();
  static const String defaultImage =
      'https://www.gravatar.com/avatar/3b3be63a4c2a439b013787725dfce802?d=identicon';
  static const String tmbdImageCard = 'https://image.tmdb.org/t/p/w154';
  static const String tmbdImageCarousel = 'https://image.tmdb.org/t/p/w1280';
}

class AppConstant {
  AppConstant._();
  static const List<Map<String, dynamic>> listGenres = [
    {"id": 28, "name": "Action", 'bg': Colors.lime},
    {"id": 12, "name": "Adventure", 'bg': Colors.cyanAccent},
    {"id": 16, "name": "Animation", 'bg': Colors.deepPurpleAccent},
    {"id": 35, "name": "Comedy", 'bg': Colors.green},
    {"id": 80, "name": "Crime", 'bg': Colors.lightBlueAccent},
    {"id": 99, "name": "Documentary", 'bg': Colors.lightGreen},
    {"id": 18, "name": "Drama", 'bg': Colors.teal},
    {"id": 10751, "name": "Family", 'bg': Colors.lightGreenAccent},
    {"id": 14, "name": "Fantasy", 'bg': Colors.blue},
    {"id": 36, "name": "History", 'bg': Colors.indigoAccent},
    {"id": 27, "name": "Horror", "bg": Colors.red},
    {"id": 10402, "name": "Music", "bg": Colors.blueGrey},
    {"id": 9648, "name": "Mystery", "bg": Colors.cyan},
    {"id": 10749, "name": "Romance", "bg": Colors.pink},
    {"id": 878, "name": "Science Fiction", "bg": Colors.orangeAccent},
    {"id": 10770, "name": "TV Movie", "bg": Colors.amber},
    {"id": 53, "name": "Thriller", "bg": Colors.lightGreenAccent},
    {"id": 10752, "name": "War", "bg": Colors.red}
  ];
}

enum Status { loading, success, error }
