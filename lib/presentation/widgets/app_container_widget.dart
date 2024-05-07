import 'package:flutter/material.dart';

class AppContainerWidget extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;
  const AppContainerWidget(
      {super.key, required this.onRefresh, required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.white,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
