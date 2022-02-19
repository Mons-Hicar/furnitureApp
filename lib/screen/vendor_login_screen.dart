import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/constants.dart';
import 'package:rohi_furniture_app/screen/sign_up_screen.dart';

class VendorLoginScreen extends StatefulWidget {
  static const String routeId = "/vendorLogin";
  @override
  _VendorLoginScreenState createState() => _VendorLoginScreenState();
}

class _VendorLoginScreenState extends State<VendorLoginScreen> {
  bool _obscureValue = true;
  bool _rememberMe = false;
  FocusNode _userNameFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();

  final itemUsernameController = new TextEditingController();
  final itemPasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 50, left: 24, right: 24),
            child: Column(
              children: [
                SizedBox(height: 60),
                Image.asset("assets/logo.png"),
                SizedBox(height: 70),
                Text(
                  "Login as a Vendor",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: kGreenBlackColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kGreenBlackColor,
                          ),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: TextFormField(
                          controller: itemUsernameController,
                          focusNode: _userNameFocusNode,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            focusColor: kPrimaryColor,
                            hintText: "UserName/Email",
                            border: InputBorder.none,
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kGreenBlackColor,
                          ),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: TextField(
                          controller: itemPasswordController,
                          focusNode: _passwordFocusNode,
                          obscureText: _obscureValue,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: "Password",
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: _obscureValue
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() => _obscureValue = !_obscureValue);
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      //TODO: insert "Remember Me" option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (bool value) {
                              setState(() => _rememberMe = !_rememberMe);
                              //TODO: shared preference logic here
                            },
                          ),
                          Text(
                            "Remember Me",
                            style: TextStyle(
                                color: kGreenBlackColor, fontSize: 15.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          onPressed: () {
                            //TODO: Login Business Logic

                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: kHighlightTextColor, fontSize: 18),
                          ),
                          color: kAccentColor,
                        ),
                      ),
                      SizedBox(height: 25),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Please, Sign-in Using Website Registered Credentials",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kBlurredTextColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
