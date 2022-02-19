import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/localProduct.dart';
import 'package:rohi_furniture_app/screen/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<LocalProduct>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreen.routeId,
            arguments: product.id);
      },
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: kAccentColor),
            color: kLightGreyBackground,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 175,
                child: FittedBox(
                  child: CachedNetworkImage(
                    imageUrl: "https://rohiint.com${product.imageName}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                    errorWidget: (context, url, error) => Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              // Image.asset(product.imageName),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          product.productName.length < 10
                              ? product.productName
                              : "${product.productName.substring(0, 9)}...",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text(
                        "Rs. ${product.retailerPrice.toString()}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {
                      cart.addToCart(
                          product.id.toString(),
                          product.productName,
                          double.parse(product.retailerPrice),
                          product.imageName);
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }
}
