import 'package:flutter/material.dart';

import '../constants.dart';

// ignore: must_be_immutable
class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({@required this.text, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: kAccentColor,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: kHighlightTextColor,
          ),
          title: Text(
            text,
            style: TextStyle(color: kHighlightTextColor),
          ),
        ),
      ),
    );
  }
}
