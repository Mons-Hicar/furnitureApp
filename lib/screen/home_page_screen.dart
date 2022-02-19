import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/screen/about_us_screen.dart';
import 'package:rohi_furniture_app/screen/career_view_screen.dart';
import 'package:rohi_furniture_app/screen/contact_us_screen.dart';
import 'package:rohi_furniture_app/screen/home_screen.dart';
import 'package:rohi_furniture_app/screen/login_screen.dart';
import 'package:rohi_furniture_app/screen/product_grid_view_screen.dart';
import 'package:rohi_furniture_app/screen/sign_up_screen.dart';
import 'package:rohi_furniture_app/screen/user_detail_screen.dart';

import 'cart_list_screen.dart';
import 'favourite_product_screen.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  //create all pages
  final UserDetailScreen _userDetailScreen = new UserDetailScreen();
  final AboutUsScreen _aboutUsScreen = new AboutUsScreen();
  final ProductGridViewScreen _productGridViewScreen =
      new ProductGridViewScreen();
  final CareerViewScreen _careerViewScreen = new CareerViewScreen();
  final ContactUsScreen _contactUsScreen = new ContactUsScreen();
  final LoginScreen _loginScreen = new LoginScreen();
  final SignUp _signUpScreen = new SignUp();
  final FavouriteProductScreen _favouriteProductScreen =
      new FavouriteProductScreen();
  final CartListScreen _cartListScreen = new CartListScreen();
  final HomeScreen _homeScreen = new HomeScreen();

  Widget _showPage = new HomeScreen();
  int _pageIndex = 0;

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _homeScreen;
        // return _productGridViewScreen;
        break;

      case 1:
        /*
        TODO: logic for
         if user is logged in
          -userDetailScreen
         else
          -loginScreen
        */
        return _loginScreen;
        break;

      case 2:
        return _aboutUsScreen;
        break;

      case 3:
        return _contactUsScreen;
        break;

      //REMOVE testing page
      // case 4:
      //   return _homeScreen;
      //   break;

      default:
        return new Container(
          child: Center(
            child: Text(
              "Page not found",
              style: TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.loadFromCart();

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: kScaffoldBackgroundColor,
          child: _showPage,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: kAccentColor,
            textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(color: Colors.white),
                ),
          ),
          child: BottomNavigationBar(
            // type: BottomNavigationBarType.fixed,
            type: BottomNavigationBarType.shifting,
            currentIndex: _pageIndex,
            selectedItemColor: kPrimaryColor,
            elevation: 10.0,
            onTap: (int tappedIndex) {
              setState(() {
                _showPage = _pageChooser(tappedIndex);
                _pageIndex = tappedIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                label: 'Login',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info_outline),
                label: 'About Us',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: 'Contact us',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.checkroom),
              //   label: 'Test',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
