import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/order_provider.dart';
import 'package:rohi_furniture_app/widgets/order_view.dart';

class OrderNowScreen extends StatefulWidget {
  static const String routeId = "/order_now_screen";

  @override
  _OrderNowScreenState createState() => _OrderNowScreenState();
}

class _OrderNowScreenState extends State<OrderNowScreen> {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Now"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.815,
              child: OrderView()),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: ${orders.getTotalAmount()}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      "CHECKOUT",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
