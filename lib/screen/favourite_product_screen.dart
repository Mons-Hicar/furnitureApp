import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/provider/favourites_provider.dart';
import 'package:rohi_furniture_app/provider/localProduct.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/widgets/app_bar_title.dart';
import 'package:rohi_furniture_app/widgets/app_drawer.dart';
import 'package:rohi_furniture_app/widgets/product_item.dart';

class FavouriteProductScreen extends StatefulWidget {
  static const String routeId = "/favourite_product_screen";

  @override
  _FavouriteProductScreenState createState() => _FavouriteProductScreenState();
}

class _FavouriteProductScreenState extends State<FavouriteProductScreen> {
  var itemsNumber = 14;

  @override
  Widget build(BuildContext context) {
    final favouriteProductsId =
        Provider.of<FavouriteProductsProvider>(context, listen: false)
            .favourite;
    List<LocalProduct> loadedProducts = [];
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    for (int i = 0; i < favouriteProductsId.length; i++) {
      loadedProducts.add(productProvider.findById(favouriteProductsId[i].id));
    }
    if (loadedProducts.length < itemsNumber) {
      itemsNumber = loadedProducts.length;
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
      ),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: loadedProducts.isEmpty
            ? Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Favourites',
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
                        "No Products!",
                        style:
                            TextStyle(fontSize: 20, color: kBlurredTextColor),
                      ),
                    ),
                  ),
                ],
              )
            : NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollNotification) {
                  if (scrollNotification.metrics.pixels ==
                      scrollNotification.metrics.maxScrollExtent) {
                    setState(() {
                      itemsNumber += 1;
                    });
                  }
                  return true;
                },
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Favourites',
                          style: TextStyle(
                            color: kAccentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: itemsNumber,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 3 / 4),
                          itemBuilder: (ctx, i) {
                            return ChangeNotifierProvider.value(
                              value: loadedProducts[i],
                              child: ProductItem(),
                            );
                          }),
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
