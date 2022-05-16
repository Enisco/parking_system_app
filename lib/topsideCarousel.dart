import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HostMinistriesCarousel extends StatefulWidget {
  const HostMinistriesCarousel({Key? key}) : super(key: key);

  @override
  _HostMinistriesCarouselState createState() => _HostMinistriesCarouselState();
}

class _HostMinistriesCarouselState extends State<HostMinistriesCarousel> {
  final String imagePath = 'images/';

  final CarouselController _controller = CarouselController();

  final List _isHovering = [false, false, false, false, false, false, false];
  final List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'images/futa1.jpg',
    'images/futa2.jpg',
    'images/futa3.jpg',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(size);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              scrollPhysics: const PageScrollPhysics(),
              enlargeCenterPage: true,
              aspectRatio: 18 / 14,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),
        Container()
      ],
    );
  }
}
//--------------------------------***************************---------------------------------