import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CarouselDetailMovieWidget extends StatefulWidget {
  final List<String> poster_images;
  final double rating;

  const CarouselDetailMovieWidget(
      {super.key, required this.poster_images, required this.rating});

  @override
  State<CarouselDetailMovieWidget> createState() =>
      _CarouselDetailMovieWidget();
}

class _CarouselDetailMovieWidget extends State<CarouselDetailMovieWidget> {
  int activePage = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
  }

  double get getRating => widget.rating;
  List<String> get getPoster => widget.poster_images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
          itemCount: getPoster.length,
          pageSnapping: true,
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              activePage = page;
            });
          },
          itemBuilder: (context, pagePosition) {
            return Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w1280/${getPoster[pagePosition]}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: 210,
                  child: Container(
                    margin: const EdgeInsets.only(left: 18.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.6),
                            ]),
                        borderRadius: BorderRadius.circular(50.0)),
                    child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 36.0,
                        ),
                        onPressed: () => context.router.back()),
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 20,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicators(getPoster.length, activePage)),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 10.0),
                    child: Container(
                      width: 160,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 14.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.5),
                              ]),
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.yellow, size: 18.0),
                                const SizedBox(width: 5),
                                Text(
                                  getRating.toStringAsFixed(1),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                )
                              ]),
                          const SizedBox(width: 5),
                          const Text('|',
                              style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 5),
                          const Text(
                            '2023',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                          const SizedBox(width: 5),
                          const Text('|',
                              style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 5),
                          const Text(
                            '13+',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          )
                        ],
                      ),
                    ))
              ],
            );
          }),
    );
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.white : Colors.grey,
          shape: BoxShape.circle),
    );
  });
}
