import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/widgets/product_item.dart';

// ignore: must_be_immutable
class SubCategoryGridView extends StatefulWidget {
  int subId;

  SubCategoryGridView(this.subId);

  @override
  _SubCategoryGridViewState createState() => _SubCategoryGridViewState();
}

class _SubCategoryGridViewState extends State<SubCategoryGridView> {
  var itemsNumber = 14;
  @override
  Widget build(BuildContext context) {
    final productProvide = Provider.of<ProductProvider>(context, listen: false);
    final loadedProducts = productProvide.findBySubCategory(widget.subId);
    if (loadedProducts.length < itemsNumber) {
      itemsNumber = loadedProducts.length;
    }
    return loadedProducts.isEmpty
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
                    value: loadedProducts[i],
                    child: ProductItem(),
                  );
                }),
          );
  }
}
