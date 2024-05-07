import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141A26),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: const Text('search', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
