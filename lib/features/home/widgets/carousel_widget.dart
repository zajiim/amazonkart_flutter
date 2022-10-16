import 'package:amazon_clone/constants/variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import "package:flutter/material.dart";

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((items) {
        return Builder(
            builder: (context) => Image.network(
                  items,
                  fit: BoxFit.cover,
                  height: 200,
                ));
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
