import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: (Padding(
            padding: const EdgeInsets.only(
                bottom: 34.0, top: 76.0, right: 24.0, left: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                          text: 'Welcome to',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xfff8f8f8))),
                      WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: SizedBox(width: 5)),
                      TextSpan(
                          text: 'Movie Magic',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xff8e00fe))),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 292.0),
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsetsDirectional.only(
                            bottom: 18, top: 18, end: 70, start: 70),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: const Color(0xff8e00fe)),
                    child: const Text(
                      'Sign in with password',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xfff8f8f8)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => {},
                      icon: Image.asset(
                        'lib/assets/ic-facebook.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // IconButton(
                    //     onPressed: () => {},
                    //     icon: Image.asset('lib/assets/ic-google.svg')),
                  ],
                ),
                const Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                              fontSize: 16, color: Color(0xff9ba0a6))),
                      WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: SizedBox(width: 5)),
                      TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                              fontSize: 16, color: Color(0xff8e00fe))),
                    ],
                  ),
                ),
              ],
            ))),
      ),
    );
  }
}
