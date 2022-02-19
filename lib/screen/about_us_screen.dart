import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/widgets/app_bar_title.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Image.asset(
                  "assets/logo.png",
                  height: 150,
                  width: 350,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    '''Welcome to Unique Smart Industries Pvt Ltd. Your number one source for Home UPS, Solar PCU, Tall Tubular Batteries, SMF Batteries, Online UPS, Automotive Batteries, Solar Panels. We are dedicated to giving you the absolute best of our product, with a focus on customer satisfaction, prompt service and a complete market requirement.\n\nFounded in 2015, Unique Smart Industries Pvt Ltd has come a long way from its beginnings in a Bafal-13, Kathmandu, Nepal. We now serve customers all over Nepal and are thrilled to be a part of the wing of Electronics & Renewable Energy industry.\n\nWe hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please do not hesitate to contact us.''',
                    style: TextStyle(
                      color: kAccentColor,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
