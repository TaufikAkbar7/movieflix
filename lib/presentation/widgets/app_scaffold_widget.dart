import 'package:flutter/material.dart';

class AppScaffoldWidget extends StatelessWidget {
  final bool isUsingAppBar;
  final String appBarTitle;
  final Widget body;

  const AppScaffoldWidget(
      {super.key,
      this.isUsingAppBar = false,
      this.appBarTitle = 'title',
      required this.body});

  @override
  Widget build(BuildContext context) {
    if (isUsingAppBar) {
      return Scaffold(
        backgroundColor: const Color(0xFF141A26),
        appBar: AppBar(
          title: Text(appBarTitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontWeight: FontWeight.w700)),
          backgroundColor: const Color(0xFF141A26),
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: body,
      );
    }
    return Scaffold(
      backgroundColor: const Color(0xFF141A26),
      body: body,
    );
  }
}
