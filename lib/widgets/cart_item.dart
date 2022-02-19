import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';

class CartProductItem extends StatefulWidget {
  final String title, imageUrl;
  final double price;
  final int quantity, productId;

  CartProductItem(
      {this.title, this.productId, this.price, this.quantity, this.imageUrl});

  @override
  _CartProductItemState createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<Cart>(context);
    return Container(
      height: 150,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 100,
                        width: 50,
                        child: CachedNetworkImage(
                          //TODO: change site API BaseURL
                          imageUrl: "https://rohiint.com${widget.imageUrl}",
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
                    Text(
                      widget.title.length < 15
                          ? widget.title
                          : "${widget.title.substring(0, 13)}...",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: kAccentColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0, right: 10),
                    child: Text(
                      "Rs.${widget.price}",
                      style: TextStyle(
                          fontSize: 28,
                          color: kAccentColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: kAccentColor,
                    onPressed: () {
                      cartItem.removeFromCart(widget.productId.toString());
                    },
                    child: Text(
                      "Remove",
                      style: TextStyle(color: kHighlightTextColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
