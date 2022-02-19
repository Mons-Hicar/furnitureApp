import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/widgets/product_grid_view.dart';

// ignore: must_be_immutable
class ProductListCategoryScreen extends StatelessWidget {
  static const String routeId = "/product_list_category_screen";

  int categoryID;
  String categoryName;
  ProductListCategoryScreen(this.categoryName, this.categoryID);

  @override
  Widget build(BuildContext context) {
    final category = categoryID;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(77, 93, 92, 1),
        title: Text(categoryName),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ProductGridView(
          category: category,
        ),
      ),
    ));
  }
}
