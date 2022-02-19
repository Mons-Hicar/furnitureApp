import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/screen/product_list_category_screen.dart';
import 'package:rohi_furniture_app/screen/product_sub_category_screen.dart';

import 'app_drawer_items.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  void onPressedFunc(ctx, categoryName, categoryID) {
    // Navigator.pushNamed(ctx,ProductListCategoryScreen.routeId,
    //     arguments: category,);
    Navigator.push(
        ctx,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 300),
            transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
              var begin = Offset(1, 0.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return ProductListCategoryScreen(categoryName, categoryID);
            }));
  }

  //launch subcategory view
  void onPressedSubCategory(ctx, categoryName, categoryId, categorySubId) {
    // Navigator.pushNamed(ctx,ProductListCategoryScreen.routeId,
    //     arguments: category,);
    Navigator.push(
        ctx,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 300),
            transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
              var begin = Offset(1, 0.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return ProductSubCategoryScreen(
                  categoryName, categoryId, categorySubId);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      child: Drawer(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: kAccentColor,
                ),
                padding: EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Text("CATEGORIES",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kHighlightTextColor,
                        fontSize: 30.0,
                      )),
                ),
              ),
              //TODO: add functionality of onPressed - use onPressedSubCategory()
              Expander(
                title: 'Battery',
                imageURL: 'assets/app_bar_assets/battery.png',
                children: [
                  Lister(
                    title: 'ELITO',
                    imageURL: 'assets/app_bar_assets/elito.png',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Divider(),
                  Lister(
                    title: 'GS',
                    imageURL: 'assets/app_bar_assets/gs.png',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Divider(),
                  Expander(
                    title: 'SMARTEN',
                    imageURL: 'assets/app_bar_assets/smarten.jpg',
                    children: [
                      Lister(
                        title: 'Inverter Tubular Battery',
                        imageURL:
                            'assets/app_bar_assets/s_inverter_tubular_battery.jpg',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Divider(),
                      Lister(
                        title: 'Solar Tubular Battery',
                        imageURL:
                            'assets/app_bar_assets/s_solar_tubular_battery.jpg',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Divider(),
                    ],
                  ),
                  Divider(),
                  Expander(
                    title: 'VOLMAXX',
                    imageURL: 'assets/app_bar_assets/volmaxx.jpg',
                    children: [
                      Lister(
                        title: 'Inverter Tubular Battery',
                        imageURL:
                            'assets/app_bar_assets/v_inverter_tubular_battery.jpg',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Divider(),
                      Lister(
                        title: 'Solar Tubular Battery',
                        imageURL:
                            'assets/app_bar_assets/v_solar_tubular_battery.png',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Divider(),
                    ],
                  ),
                  Divider(),
                ],
              ),
              Divider(),
              Lister(
                title: 'Solar Panel',
                imageURL: 'assets/app_bar_assets/solar_panel.png',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              Lister(
                title: 'Online UPS',
                imageURL: 'assets/app_bar_assets/online_ups.png',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              Lister(
                title: 'Home UPS',
                imageURL: 'assets/app_bar_assets/home_ups.png',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              Expander(
                title: 'Solar PCU',
                imageURL: 'assets/app_bar_assets/solar_pcu.png',
                children: [
                  Lister(
                    title: 'BOOM',
                    imageURL: 'assets/app_bar_assets/solar_pcu.png',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Lister(
                    title: 'SAVER',
                    imageURL: 'assets/app_bar_assets/solar_pcu.png',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Lister(
                    title: 'SUPERB',
                    imageURL: 'assets/app_bar_assets/online_ups.png',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(),
              Expander(
                title: 'Solar Charge',
                imageURL: 'assets/app_bar_assets/solar_charge.png',
                children: [
                  Lister(
                    title: 'MPPT Controller',
                    imageURL: 'assets/app_bar_assets/mppt_controller.jpg',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Lister(
                    title: 'PWM Controller',
                    imageURL: 'assets/app_bar_assets/pwm_controller.jpg',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

//prev app drawer content
// ExpansionTile(
//   title: Text("LUXOR CHAIR"),
//   children: [
//     ListTile(
//       title: Text("Show LUXOR CHAIR"),
//       onTap: () {
//         Navigator.pop(context);
//         onPressedFunc(context, "LUXOR CHAIR", 1);
//       },
//     ),
//     ListTile(
//       title: Text("Executive Chair"),
//       onTap: () {
//         Navigator.pop(context);
//         onPressedSubCategory(context, "Executive Chair", 1, 1);
//       },
//     ),
//     ListTile(
//       title: Text("Office Chair"),
//       onTap: () {
//         Navigator.pop(context);
//         onPressedSubCategory(context, "Office Chair", 1, 2);
//       },
//     ),
//     ListTile(
//       title: Text("Staff Chair"),
//       onTap: () {
//         Navigator.pop(context);
//         onPressedSubCategory(context, "Staff Chair", 1, 3);
//       },
//     ),
//     ListTile(
//       title: Text("Visitor Chair"),
//       onTap: () {
//         Navigator.pop(context);
//         onPressedSubCategory(context, "Visitor Chair", 1, 4);
//       },
//     ),
//   ],
// ),
