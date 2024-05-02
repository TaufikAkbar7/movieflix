import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});
  @override
  State<CarouselWidget> createState() => _CarouselController();
}

class _CarouselController extends State<CarouselWidget> {
  List<String> images = [
    "https://image.tmdb.org/t/p/w1280/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg",
    "https://image.tmdb.org/t/p/w1280/8uVKfOJUhmybNsVh089EqLHUYEG.jpg",
    "https://image.tmdb.org/t/p/w1280/5Eip60UDiPLASyKjmHPMruggTc4.jpg"
  ];
  int activePage = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
              itemCount: images.length,
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
                      images[pagePosition],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned(
                      right: 30,
                      bottom: 10,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: indicators(images.length, activePage)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 65,
                            height: 35,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    colors: [
                                      Colors.black.withOpacity(0.7),
                                      Colors.black.withOpacity(0.5),
                                    ]),
                                borderRadius: BorderRadius.circular(50.0)),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 18.0),
                                SizedBox(width: 5),
                                Text(
                                  '7.5',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Doctor Strange',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 205,
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
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Action',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                                SizedBox(width: 5),
                                Text('|',
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(width: 5),
                                Text(
                                  'Adventure',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                                SizedBox(width: 5),
                                Text('|',
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(width: 5),
                                Text(
                                  'Adventure',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }),
        ),
      ],
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
