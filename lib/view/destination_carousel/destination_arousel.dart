import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  State<DestinationCarousel> createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  final List<String> images = [
    'assets/images/voucher2.png',
    'assets/images/voucher3.png',
    'assets/images/voucher2.png',
    'assets/images/voucher3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 50),
        color:  const Color(0xEAEAEAFF),
        child: Stack(
          children: [
            CarouselSlider(
              items: generateImageTiles(),
              options: CarouselOptions(
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 300),
                  enlargeCenterPage: true,
                  aspectRatio: 18 / 8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              carouselController: _controller,
            ),
          ],
        ));
  }

  List<Widget> generateImageTiles() {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }
}
