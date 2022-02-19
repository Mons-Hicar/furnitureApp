import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/order_provider.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';

// ignore: must_be_immutable
class OrderItem extends StatefulWidget {
  int productId;
  double price;
  String imageName;

  OrderItem(this.productId, this.price, this.imageName);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  int _quantity = 0;
  double _productTotal;
  setTotalProductPrice() {
    setState(() {
      _productTotal = _quantity * widget.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderList>(context, listen: false);
    setTotalProductPrice();
    final itemProvider = Provider.of<ProductProvider>(context, listen: false)
        .findById(widget.productId);
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
                          imageUrl: "https://rohiint.com${widget.imageName}",
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
                      itemProvider.productName.length < 15
                          ? itemProvider.productName
                          : "${itemProvider.productName.substring(0, 13)}...",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromRGBO(77, 93, 92, 1),
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
                      "Rs. $_productTotal",
                      style: TextStyle(
                          fontSize: 28,
                          color: Color.fromRGBO(77, 93, 92, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            if (_quantity > 0) {
                              setState(() {
                                _quantity--;
                                orders.removeOrder(widget.imageName);
                                setTotalProductPrice();
                              });
                            }
                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                      //Number of items
                      Text(
                        "$_quantity",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _quantity++;
                            orders.addOrder(widget.productId, _quantity,
                                widget.price, widget.imageName);
                            setTotalProductPrice();
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
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
