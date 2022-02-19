import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  const AppBarTitle({
    Key key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: padding ?? EdgeInsets.fromLTRB(0, 0, 50, 0),
      child: Image.asset(
        'assets/logo.png',
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.45,
      ),
    );
  }
}
