import 'package:flutter/material.dart';

class AppModalWidget {
  final List<Widget> content;

  const AppModalWidget(this.content);

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: content,
                ),
              ),
            ));
      },
    );
  }
}
