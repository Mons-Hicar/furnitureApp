import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../constants.dart';

class CarouselSliderDemo extends StatefulWidget {
  final List<String> imgList;
  final double height;
  CarouselSliderDemo({this.imgList, this.height}) : super();
  @override
  CarouselSliderDemoState createState() => CarouselSliderDemoState();
}

class CarouselSliderDemoState extends State<CarouselSliderDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: EdgeInsets.only(top: 15),
      child: CarouselSlider(
        options: CarouselOptions(
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: true,
            reverse: false,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
            pauseAutoPlayOnTouch: true,
            scrollDirection: Axis.horizontal),
        items: widget.imgList.map((imgName) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: kLightGreyBackground,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(imgName, fit: BoxFit.fill),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
