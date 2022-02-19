import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/localProduct.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/screen/cart_list_screen.dart';
import 'package:rohi_furniture_app/screen/product_detail_screen.dart';
import 'package:rohi_furniture_app/widgets/app_bar_title.dart';
import 'package:rohi_furniture_app/widgets/app_drawer.dart';
import 'package:rohi_furniture_app/widgets/badge.dart';
import 'package:rohi_furniture_app/widgets/product_grid_view.dart';
import 'package:rohi_furniture_app/widgets/product_search.dart';

// ignore: must_be_immutable
class ProductGridViewScreen extends StatefulWidget {
  @override
  _ProductGridViewScreenState createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  Icon customIcon = Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ProductProvider>(context, listen: false)
          .getProductFromDB(),
      builder: (ctx, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Scaffold(
                // backgroundColor: kScaffoldBackgroundColor,
                appBar: AppBar(
                  title: AppBarTitle(),
                  actions: [
                    Consumer<Cart>(
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, CartListScreen.routeId);
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
                body: Container(
                  color: kScaffoldBackgroundColor,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Center(
                    child: Text(
                      "Loading...",
                      style:
                          TextStyle(fontSize: 22.0, color: kBlurredTextColor),
                    ),
                  ),
                ),
                drawer: AppDrawer(),
              )
            : Scaffold(
                // backgroundColor: Colors.white,
                appBar: AppBar(
                  title: AppBarTitle(padding: EdgeInsets.zero),
                  actions: [
                    IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: ProductSearch());
                      },
                      icon: Icon(
                        Icons.search,
                        // color: Colors.white,
                      ),
                    ),
                    Consumer<Cart>(
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        // color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, CartListScreen.routeId);
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
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: snapshot.hasError
                      ? Center(
                          child: Text(
                            "Sorry no products available!",
                            style: TextStyle(color: kBlurredTextColor),
                          ),
                        )
                      : ProductGridView(
                          category: 100,
                        ),
                ),
                drawer: AppDrawer(),
              );
      },
    );
  }
}
