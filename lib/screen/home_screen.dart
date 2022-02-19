import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/widgets/app_bar_title.dart';
import 'package:rohi_furniture_app/widgets/app_drawer.dart';
import 'package:rohi_furniture_app/widgets/brand_slider.dart';
import 'package:rohi_furniture_app/widgets/contact_slider.dart';
import 'package:rohi_furniture_app/widgets/more_product_view.dart';
import 'package:rohi_furniture_app/widgets/product_search.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  static const String routeId = "/home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _itemSearchController = new TextEditingController();
  FocusNode _itemSearchFocusNode = new FocusNode();

  final List<String> imgList = [
    "assets/art_grass.jpg",
    "assets/carpets.jpg",
    "assets/Laminate.jpg",
    "assets/chairs.jpg",
    "assets/Flooring.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(),
        ),
        drawer: AppDrawer(),
        body: ListView(
          children: [
            SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: kLightGreyBackground,
                border: Border.all(
                  color: kGreenBlackColor,
                ),
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextFormField(
                controller: _itemSearchController,
                focusNode: _itemSearchFocusNode,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  // icon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.search),
                  focusColor: kPrimaryColor,
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
            CarouselSliderDemo(
              imgList: kSlideImgList,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            MoreProductView(
              title: 'Special Offer',
            ),
            MoreProductView(
              title: 'Top Products',
            ),
            MoreProductView(
              title: 'Special Products',
            ),
            BrandSlider(
              imgList: lBrandImgList,
              containerHeight: MediaQuery.of(context).size.height * 0.2,
              imgWidth: 300,
              imgHeight: 100,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
