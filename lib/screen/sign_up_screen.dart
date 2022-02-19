import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/screen/login_screen.dart';

import '../constants.dart';

class SignUp extends StatefulWidget {
  static const String routeId = "/sign-up";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FocusNode _userNameFocusNode = new FocusNode();
  FocusNode _emailFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();
  FocusNode _rePasswordFocusNode = new FocusNode();

  bool _obscureValue1 = true;
  bool _obscureValue2 = true;

  final itemUsernameController = new TextEditingController();
  final itemEmailController = new TextEditingController();
  final itemPasswordController = new TextEditingController();
  final itemRePasswordController = new TextEditingController();

  void submitData() {
    String userName = itemUsernameController.text.trim();
    String email = itemEmailController.text.trim();
    String password = itemPasswordController.text.trim();
    String rePassword = itemRePasswordController.text.trim();
    //TODO: Sign Up Business Logic
    if (userName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        rePassword.isEmpty) {
      print("Please fill up the space!");
    } else {
      if (password != rePassword) {
        print("Password and re-password doesnot matched!");
      } else {
        print("Submitted");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/logo.png",
                  height: 200,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kGreenBlackColor,
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemUsernameController,
                    focusNode: _userNameFocusNode,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Full Name",
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_emailFocusNode);
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kGreenBlackColor,
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemEmailController,
                    focusNode: _emailFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail),
                      hintText: "Email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kGreenBlackColor,
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemPasswordController,
                    focusNode: _passwordFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_rePasswordFocusNode);
                    },
                    obscureText: _obscureValue1,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Password",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: _obscureValue1
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() => _obscureValue1 = !_obscureValue1);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kGreenBlackColor,
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemRePasswordController,
                    focusNode: _rePasswordFocusNode,
                    obscureText: _obscureValue2,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Re-password",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: _obscureValue2
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() => _obscureValue2 = !_obscureValue2);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    onPressed: () {
                      submitData();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign Up",
                      style:
                          TextStyle(color: kHighlightTextColor, fontSize: 18),
                    ),
                    color: kAccentColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account ?",
                      style: TextStyle(
                        color: kGreenBlackColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kGreenBlackColor,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
