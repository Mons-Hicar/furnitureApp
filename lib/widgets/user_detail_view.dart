import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/user_provider.dart';
import 'package:rohi_furniture_app/screen/cart_list_screen.dart';
import 'package:rohi_furniture_app/screen/favourite_product_screen.dart';
import 'package:rohi_furniture_app/screen/purchase_history_screen.dart';

import 'badge.dart';

class UserDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Column(
      children: [
        Container(
          // padding: EdgeInsets.only(top: 2.0, left: 20, right: 1, bottom: 20),
          height: MediaQuery.of(context).size.height * .4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: kAccentColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80.0),
                  bottomLeft: Radius.circular(80.0))),
          child: FittedBox(
            // alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Circle Image
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: new Border.all(
                            color: kPrimaryColor,
                            width: 5.0,
                          )),
                      // width: MediaQuery.of(context).size.width * 0.35,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70.0,
                        child: Text(
                          "N",
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                    //UserName
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.55,
                      // padding: EdgeInsets.only(right: 30.0, bottom: 50.0),
                      // alignment: Alignment.bottomCenter,
                      child: Text(
                        user.userName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                //Icon List
                Container(
                  width: MediaQuery.of(context).size.width * .65,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.list,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, PurchaseHistoryScreen.routeId);
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, FavouriteProductScreen.routeId);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                      Consumer<Cart>(
                        child: IconButton(
                          icon: Icon(Icons.shopping_cart),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, CartListScreen.routeId);
                          },
                        ),
                        builder: (_, cart, child) {
                          return Badge(
                            child: child,
                            value: cart.itemCount.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        //User Detail
        Column(
          children: [
            SizedBox(height: 20.0),
            Container(
              // padding: EdgeInsets.all(32.0),
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 60.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: kAccentColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        user.userPhone,
                        style: TextStyle(
                          color: kAccentColor,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: kAccentColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        user.userEmail,
                        style: TextStyle(
                          color: kAccentColor,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_city,
                        color: kAccentColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        user.userAddress,
                        style: TextStyle(
                          color: kAccentColor,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
