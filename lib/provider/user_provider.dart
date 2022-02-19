import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/provider/user.dart';

class UserProvider with ChangeNotifier {
  User user = new User(
      userName: "Fake Name",
      userID: "1",
      userPhone: "9841******",
      userAddress: "Kathmandu",
      userEmail: "epic.address@gmail.com");

  void addUser(User user) {}

  saveUserToDB() {}
}
