import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/localProduct.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/widgets/product_item.dart';

// ignore: must_be_immutable
class ProductGridView extends StatefulWidget {
  int category;

  ProductGridView({this.category});
  @override
  _ProductGridViewState createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  var itemsNumber = 14;
  @override
  Widget build(BuildContext context) {
    final productProvide = Provider.of<ProductProvider>(context, listen: false);
    List<LocalProduct> loadedProduct;
    if (widget.category == 100) {
      loadedProduct = productProvide.products;
    } else {
      loadedProduct = productProvide.findByCategory(widget.category);
    }
    if (loadedProduct.length < itemsNumber) {
      itemsNumber = loadedProduct.length;
    }
    return loadedProduct.isEmpty
        ? Center(
            child: Text("No Products!"),
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
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: itemsNumber,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3 / 4),
                itemBuilder: (ctx, i) {
                  return ChangeNotifierProvider.value(
                    value: loadedProduct[i],
                    child: ProductItem(),
                  );
                }),
          );
  }
}
