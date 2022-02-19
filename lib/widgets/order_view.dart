import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/order_provider.dart';
import 'package:rohi_furniture_app/widgets/order_item.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedCartItem = Provider.of<Cart>(context).items;
    return ListView.builder(
      itemCount: loadedCartItem.length,
      itemBuilder: (ctx, index) {
        return OrderItem(
            loadedCartItem.values.toList()[index].productId,
            loadedCartItem.values.toList()[index].price,
            loadedCartItem.values.toList()[index].imgUrl);
      },
    );
  }
}
