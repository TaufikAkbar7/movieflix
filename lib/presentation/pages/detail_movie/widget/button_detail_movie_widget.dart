import 'package:flutter/material.dart';

class ButtonDetailMovieWidget extends StatelessWidget {
  const ButtonDetailMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow_sharp, color: Colors.white),
            label: const Text(
              'Watch now',
              style: TextStyle(color: Colors.white),
            ),
            style: const ButtonStyle(
                backgroundColor: WatchNowColor(),
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 26.0)))),
        const SizedBox(width: 20),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.movie, color: Color(0xff8e00fe)),
          label: Text('Watch Trailer'),
          style: const ButtonStyle(
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 26.0))),
        )
      ],
    );
  }
}

class WatchNowColor extends MaterialStateColor {
  const WatchNowColor() : super(_defaultColor);

  static const int _defaultColor = 0xff8e00fe;
  static const int _pressedColor = 0xff9ba086;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return const Color(_pressedColor);
    }
    return const Color(_defaultColor);
  }
}
