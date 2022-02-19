import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/provider/localProduct.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/screen/product_detail_screen.dart';

class MoreProductView extends StatelessWidget {
  final String title;

  const MoreProductView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: FutureBuilder(
        future: Provider.of<ProductProvider>(context).getProductFromDB(),
        builder: (ctx, snapshot) {
          final productProvide =
              Provider.of<ProductProvider>(context, listen: false);
          List<LocalProduct> loadedProduct = productProvide.products;
          return snapshot.connectionState == ConnectionState.waiting
              ? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      // alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          color: kAccentColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 65),
                      child: Divider(
                        thickness: 3,
                        color: kPrimaryColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: kBlurredTextColor,
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      // alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          color: kAccentColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 65),
                      child: Divider(
                        thickness: 3,
                        color: kPrimaryColor,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 15,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 2),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, ProductDetailScreen.routeId,
                                      arguments: loadedProduct[i].id);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 2.0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kLightGreyBackground,
                                    border: Border.all(
                                      color: kAccentColor,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context,
                                              ProductDetailScreen.routeId,
                                              arguments: loadedProduct[i].id);
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              //TODO: change API BaseURL
                                              "https://rohiint.com${loadedProduct[i].imageName}",
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Padding(
                                            padding: const EdgeInsets.all(50.0),
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Padding(
                                            padding: const EdgeInsets.all(50.0),
                                            child: Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        loadedProduct[i].productName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kAccentColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Rs. ${loadedProduct[i].retailerPrice.toString()}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kAccentColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
