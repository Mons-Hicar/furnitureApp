import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart' show Cart;
import 'package:rohi_furniture_app/widgets/cart_item.dart' as CI;

import 'more_product_view.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProductProvide = Provider.of<Cart>(context);
    return cartProductProvide.items.isEmpty
        ? Container(
            padding: EdgeInsets.only(bottom: 20.0),
            color: kScaffoldBackgroundColor,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 10),
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your Cart',
                      style: TextStyle(
                        color: kAccentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "No Products!",
                        style: TextStyle(
                          fontSize: 24,
                          color: kBlurredTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 10),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Cart',
                    style: TextStyle(
                      color: kAccentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: cartProductProvide.items.length,
                    itemBuilder: (ctx, i) {
                      return CI.CartProductItem(
                        productId: cartProductProvide.items.values
                            .toList()[i]
                            .productId,
                        imageUrl:
                            cartProductProvide.items.values.toList()[i].imgUrl,
                        price:
                            cartProductProvide.items.values.toList()[i].price,
                        title:
                            cartProductProvide.items.values.toList()[i].title,
                      );
                    }),
              ),
            ],
          );
  }
}
