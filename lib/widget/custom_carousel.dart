import 'dart:async';

import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final Duration autoPlayInterval;
  final bool isAutoPlay;
  final int initialPage;

  const CustomCarousel({
    super.key,
    required this.imageUrls,
    required this.height,
    required this.autoPlayInterval,
    this.isAutoPlay = true,
    this.initialPage = 0,
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  late final PageController _controller;
  late final int itemCount;
  int _currentPage = 0;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    itemCount = widget.imageUrls.length;
    _controller = PageController(initialPage: widget.initialPage);
    if(widget.isAutoPlay) {
      _startAutoPlay();
    }
    super.initState();
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (timer) {
      _controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index % itemCount;
              });
            },
            itemBuilder: (context, index) {
              final imageIndex = index % itemCount;
              return Image.network(
                widget.imageUrls[imageIndex],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(itemCount, (index) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.blue : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}
