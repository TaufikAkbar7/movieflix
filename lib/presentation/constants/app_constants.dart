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

enum Status { loading, success, error }
