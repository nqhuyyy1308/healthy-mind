import 'package:flutter/material.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';

class HomeCarousel extends StatelessWidget {
  final String image;
  const HomeCarousel({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(image);
  }
}
