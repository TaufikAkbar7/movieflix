import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';
import 'package:movie_app/routes/router.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRoute(), SearchRoute(), BookmarkRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: child,
            backgroundColor: Colors.black,
            // extendBodyBehindAppBar: true,
            // extendBody: true,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black.withOpacity(0.4),
              selectedItemColor: ColorConstant.primary,
              unselectedItemColor: ColorConstant.white,
              currentIndex: tabsRouter.activeIndex,
              onTap: (value) {
                tabsRouter.setActiveIndex(value);
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 28,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
              ],
            ));
      },
    );
  }
}
