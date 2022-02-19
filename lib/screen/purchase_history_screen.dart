import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/widgets/app_bar_title.dart';

import '../constants.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  static const String routeId = "/purchase_history_screen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Purchase History',
                  style: TextStyle(
                    color: kAccentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "No Records Yet!",
                  style: TextStyle(fontSize: 20, color: kBlurredTextColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
