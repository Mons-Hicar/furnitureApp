import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../constants.dart';

class BrandSlider extends StatefulWidget {
  final List<String> imgList;
  final double containerHeight;
  final double imgHeight, imgWidth;

  BrandSlider(
      {this.imgList, this.containerHeight, this.imgHeight, this.imgWidth})
      : super();
  @override
  BrandSliderState createState() => BrandSliderState();
}

class BrandSliderState extends State<BrandSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          // alignment: Alignment.centerLeft,
          child: Text(
            'Our Brands',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              color: kAccentColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65),
          child: Divider(
            thickness: 3,
            color: kPrimaryColor,
          ),
        ),
        Container(
          height: widget.containerHeight,
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
                      color: kHighlightTextColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imgName,
                        // fit: BoxFit.fill,
                        height: widget.imgHeight,
                        width: widget.imgWidth,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
