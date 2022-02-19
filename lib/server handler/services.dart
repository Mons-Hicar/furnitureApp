import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/user.dart';
import 'package:rohi_furniture_app/provider/user_provider.dart';
import 'package:rohi_furniture_app/server%20handler/user_server.dart';
import 'product_server.dart';

class Services {
  static const String url = 'https://www.rohiint.com/api/v3/products';
  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Product> products = productFromJson(response.body);
        return products;
      } else {
        throw HttpException("Could not load data");
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<void> checkOutOrder(double subTotal) async {
    final url = "https://www.rohiint.com/api/v3/createorder";
    try {
      final response = await http.post(url, body: {
        'user_id': 1,
        'total': subTotal,
        'delivered': 0,
        'payment_type': 1
        // 'product_id': productId,
        // 'order_id': userId,
        // 'qty': quantity,
        // 'color': color,
        // 'size': size,
        // 'total': subTotal
      });
      if (response.statusCode == 200) {
        print(response.statusCode);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
  }

  //user signUp
  static Future<void> userSignUp(
      String name, String email, String password) async {
    final url = "https://www.rohiint.com/api/v3/createuser";
    try {
      final response = await http.post(url,
          body: {'name': name, 'email': email, 'password': password});
      if (response.statusCode == 200) {
        print(response);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
  }

  //contact Us
  static Future<void> contactUs() async {
    final url = "https://www.rohiint.com/api/v3/contactus";
    try {
      final response = await http.post(url, body: {
        'sender_name': "kushal",
        'sender_email': "abc@gmail.com",
        'subject': "dasjdhkajs",
        'message': "kjasdhkjsabndkjabskj"
      });
      if (response.statusCode == 200) {
        print(response.statusCode);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
  }

  //Career
  static Future<void> careerRequest(
      {String applicantName,
      String applicantEmail,
      String applicantAddress,
      String applicantGender,
      String applicantPhone,
      String appliedPost,
      String applicantExperience,
      String applicantMessage}) async {
    final url = "https://www.rohiint.com/api/v3/applyjob";
    try {
      final response = await http.post(url, body: {
        'applicants_name': applicantName,
        'applicants_email': applicantEmail,
        'applicants_address': applicantAddress,
        'gender': applicantGender,
        'phone_number': applicantPhone,
        'applied_post': appliedPost,
        'experience': applicantExperience,
        'message': applicantMessage
      });
      if (response.statusCode == 200) {
        print(response.statusCode);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
    print("submitted");
  }

  //Login
  static Future<bool> loginRequest(
      String email, String password, context) async {
    bool result = false;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final url = "https://www.rohiint.com/api/v3/checkuser";
    print("requested");
    try {
      final response =
          await http.post(url, body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        final List<UserServer> userServer = userServerFromJson(response.body);
        userProvider.addUser(User(
          userName: userServer[0].name,
          userEmail: userServer[0].email,
        ));
        await userProvider.saveUserToDB();
        result = true;
        // loadUser()
      } else {
        throw HttpException("Could not load data");
      }
    } catch (e) {
      throw e;
    }
    return result;
  }
}
