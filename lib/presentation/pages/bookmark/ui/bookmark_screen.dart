import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141A26),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: const Text('bookmark', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
