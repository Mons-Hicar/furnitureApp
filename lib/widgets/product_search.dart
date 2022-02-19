import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/localProduct.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/screen/product_detail_screen.dart';

class ProductSearch extends SearchDelegate<ProductProvider> {
  @override
  List<Widget> buildActions(BuildContext context) {
    //  implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // implement buildSuggestions
    final products =
        Provider.of<ProductProvider>(context, listen: false).products;
    final hintProducts = [
      products[5],
      products[11],
      products[22],
      products[29],
      products[50]
    ];

    List<LocalProduct> suggestionList = query.isEmpty
        ? hintProducts
        : products
            .where((element) => element.productName.startsWith(query))
            .toList();
    return ListView.builder(
      scrollDirection: Axis.vertical,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.pushReplacementNamed(context, ProductDetailScreen.routeId,
                arguments: suggestionList[index].id);
          },
          leading: CachedNetworkImage(
            imageUrl: "https://rohiint.com${suggestionList[index].imageName}",
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
          title: RichText(
            text: TextSpan(
                text: suggestionList[index]
                    .productName
                    .substring(0, query.length),
                style: TextStyle(
                    color: Color.fromRGBO(77, 93, 92, 1),
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestionList[index]
                          .productName
                          .substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ]),
          ),
        ),
      ),
    );
  }
}
