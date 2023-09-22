import 'package:flutter/material.dart';
import 'package:material_demo/lib.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Carousel(),
      ),
    );
  }
}
