import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/favourites_provider.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/widgets/app_bar_title.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeId = "/product_detail_view";
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    int productId = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    final favouriteProduct =
        Provider.of<FavouriteProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Product Image Display
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 300,
                  width: double.infinity,
                  color: Colors.white,
                  child: CachedNetworkImage(
                    //TODO: change API Image BaseURL
                    imageUrl: "https://rohiint.com${product.imageName}",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                //Product Name
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.productName,
                      style: TextStyle(
                        color: kAccentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                //Product price
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs. ${product.retailerPrice}",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: product.isFavourite
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              setState(() {
                                if (product.toggleIsFavourite()) {
                                  favouriteProduct
                                      .addFavouriteProduct(product.id);
                                  return;
                                } else {
                                  favouriteProduct
                                      .removeFavouriteProduct(product.id);
                                  return;
                                }
                              });
                            },
                            iconSize: 28,
                            color: Colors.red,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  // use with Align()
                  // alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      product.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Product Description
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 7.0),
            height: 55.0,
            color: kAccentColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  onPressed: () {
                    cart.addToCart(product.id.toString(), product.productName,
                        double.parse(product.retailerPrice), product.imageName);
                  },
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
