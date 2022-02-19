import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/widgets/sub_category_grid_view.dart';

// ignore: must_be_immutable
class ProductSubCategoryScreen extends StatelessWidget {
  int categoryId;
  int categorySubId;
  String categoryName;
  ProductSubCategoryScreen(
      this.categoryName, this.categoryId, this.categorySubId);

  @override
  Widget build(BuildContext context) {
    final category = categorySubId;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(77, 93, 92, 1),
        title: Text(categoryName),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: SubCategoryGridView(category),
      ),
    ));
  }
}
