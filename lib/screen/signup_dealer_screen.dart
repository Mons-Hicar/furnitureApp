import 'package:flutter/material.dart';

class SignUpDealer extends StatefulWidget {
  @override
  _SignUpDealerState createState() => _SignUpDealerState();
}

class _SignUpDealerState extends State<SignUpDealer> {
  bool _obsureValue1 = true;
  bool _obsureValue2 = true;
  FocusNode _userNameFocusNode = new FocusNode();
  FocusNode _emailFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();
  FocusNode _rePasswordFocusNode = new FocusNode();
  FocusNode _companyNameFocusNode = new FocusNode();
  FocusNode _companyAddressFocusNode = new FocusNode();
  FocusNode _mobileNumberFocusNode = new FocusNode();
  FocusNode _landLineNumberFocusNode = new FocusNode();

  final itemUsernameController = new TextEditingController();
  final itemEmailController = new TextEditingController();
  final itemPasswordController = new TextEditingController();
  final itemRePasswordController = new TextEditingController();
  final itemCompanyNameController = new TextEditingController();
  final itemCompanyAddressController = new TextEditingController();
  final itemMobileNumberController = new TextEditingController();
  final itemLandLineNumberController = new TextEditingController();

  void submitData() {
    String userName = itemUsernameController.text.trim();
    String email = itemEmailController.text.trim();
    String password = itemPasswordController.text.trim();
    String rePassword = itemRePasswordController.text.trim();
    String companyName = itemCompanyNameController.text.trim();
    String companyAddress = itemCompanyAddressController.text.trim();
    String mobileNumber = itemMobileNumberController.text.trim();
    String landLineNumber = itemLandLineNumberController.text.trim();
    if (userName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        rePassword.isEmpty ||
        companyName.isEmpty ||
        companyAddress.isEmpty ||
        mobileNumber.isEmpty ||
        landLineNumber.isEmpty) {
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
                  "assets/logoRohi.jpg",
                  height: 200,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(77, 93, 92, 1),
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
                      color: Color.fromRGBO(77, 93, 92, 1),
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
                      color: Color.fromRGBO(77, 93, 92, 1),
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemPasswordController,
                    focusNode: _passwordFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_rePasswordFocusNode);
                    },
                    obscureText: _obsureValue1,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Password",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            if (_obsureValue1 == true)
                              _obsureValue1 = false;
                            else
                              _obsureValue1 = true;
                          });
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
                      color: Color.fromRGBO(77, 93, 92, 1),
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemRePasswordController,
                    focusNode: _rePasswordFocusNode,
                    obscureText: _obsureValue2,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Re-password",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            if (_obsureValue2 == true)
                              _obsureValue2 = false;
                            else
                              _obsureValue2 = true;
                          });
                        },
                      ),
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_companyNameFocusNode);
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
                      color: Color.fromRGBO(77, 93, 92, 1),
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemCompanyNameController,
                    focusNode: _companyNameFocusNode,
                    decoration: InputDecoration(
                      icon: Icon(Icons.business),
                      hintText: "Company Name",
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_companyAddressFocusNode);
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
                      color: Color.fromRGBO(77, 93, 92, 1),
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemCompanyAddressController,
                    focusNode: _companyAddressFocusNode,
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_city),
                      hintText: "Company Address",
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_mobileNumberFocusNode);
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
                      color: Color.fromRGBO(77, 93, 92, 1),
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemMobileNumberController,
                    focusNode: _mobileNumberFocusNode,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: "Mobile Number",
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_landLineNumberFocusNode);
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
                      color: Color.fromRGBO(77, 93, 92, 1),
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemLandLineNumberController,
                    focusNode: _landLineNumberFocusNode,
                    decoration: InputDecoration(
                      icon: Icon(Icons.add_call),
                      hintText: "LandLine Number",
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
                      color: Color.fromRGBO(77, 93, 92, 1),
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.attach_file),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              "Choose a file",
                            ),
                            color: Color.fromRGBO(77, 93, 92, 1),
                          ),
                        ],
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
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color.fromRGBO(77, 93, 92, 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account ?",
                      style: TextStyle(
                        color: Color.fromRGBO(77, 93, 92, 1),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(77, 93, 92, 1),
                        ),
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
