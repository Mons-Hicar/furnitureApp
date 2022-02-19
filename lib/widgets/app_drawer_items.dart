import 'package:flutter/material.dart';

class TileLeadingImage extends StatelessWidget {
  final String url;
  const TileLeadingImage(
    this.url, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      width: 50,
      height: 50,
    );
  }
}

class Expander extends StatelessWidget {
  final String title, imageURL;
  final List<Widget> children;

  const Expander({Key key, this.title, this.imageURL, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(left: 10),
      title: Text(title),
      leading: TileLeadingImage(imageURL),
      children: children,
    );
  }
}

class Lister extends StatelessWidget {
  final String title, imageURL;
  final Function onPressed;

  const Lister({Key key, this.title, this.imageURL, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: TileLeadingImage(imageURL),
      onTap: onPressed,
    );
  }
}
