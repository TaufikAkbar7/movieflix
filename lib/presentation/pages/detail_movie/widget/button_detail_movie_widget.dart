import 'package:flutter/material.dart';
import 'package:movie_app/data/model/trailer_model.dart';
import 'package:movie_app/presentation/widgets/app_modal_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ButtonDetailMovieWidget extends StatefulWidget {
  final List<TrailerModel> trailers;
  const ButtonDetailMovieWidget({super.key, required this.trailers});

  @override
  State<ButtonDetailMovieWidget> createState() => _ButtonDetailMovieWidget();
}

class _ButtonDetailMovieWidget extends State<ButtonDetailMovieWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  void _onPlayVideo() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.trailers[0].key,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    AppModalWidget([
      YoutubePlayerBuilder(
          player: YoutubePlayer(
            aspectRatio: 34 / 24,
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
          ),
          builder: (context, player) {
            return Column(
              children: [
                // some widgets
                player,
                //some other widgets
              ],
            );
          }),
      const SizedBox(height: 5),
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: const ButtonStyle(
            backgroundColor: WatchNowColor(),
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 26.0))),
        child: const Text(
          'Close',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ]).dialogBuilder(context);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
            onPressed: _onPlayVideo,
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
          onPressed: _onPlayVideo,
          icon: const Icon(Icons.movie, color: Color(0xff8e00fe)),
          label: const Text('Watch Trailer'),
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
