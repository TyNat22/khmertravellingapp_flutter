// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:network_state_management/model/place_model.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter/material.dart';

class ImagesSlider extends StatelessWidget {
  final Function(int) onChange;
  final String image;
  const ImagesSlider({
    super.key,
    required this.image,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        onPageChanged: (index) {},
        itemCount: image.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 0),
            child: Hero(
              tag: image,
              child: ClipRRect(
                child: Image.asset(
                  image,
                  width: double.infinity,
                  // height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
