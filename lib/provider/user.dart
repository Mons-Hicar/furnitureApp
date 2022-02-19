import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String userID, userName, userEmail, userPhone, userAddress;

  User(
      {this.userID,
      this.userName,
      this.userEmail,
      this.userPhone,
      this.userAddress});
}
