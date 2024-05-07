import 'package:flutter/material.dart';

class AppErrorMessageWidget extends StatelessWidget {
  final String errorMessage;
  const AppErrorMessageWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(errorMessage, style: const TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
