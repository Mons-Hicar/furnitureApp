import 'package:flutter/material.dart';

class CareerScreenView extends StatefulWidget {
  @override
  _CareerViewScreenState createState() => _CareerViewScreenState();
}

class _CareerViewScreenState extends State<CareerScreenView> {
  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _contactFocusNode = FocusNode();
  final _positionFocusNode = FocusNode();
  final _experienceFocusNode = FocusNode();
  final _messageFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  Widget getBullet() {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Color.fromRGBO(77, 93, 92, 1),
        shape: BoxShape.circle,
      ),
    );
  }

  int selectedRadio;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  void setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color _color = Color.fromRGBO(77, 93, 92, 1);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(77, 93, 92, 1),
          title: Text("Join Us"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset("assets/career.png"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Available Job Positions",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: _color),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        getBullet(),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Sales",
                          style: TextStyle(fontSize: 18, color: _color),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        getBullet(),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Deliver Boy",
                          style: TextStyle(fontSize: 18, color: _color),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        getBullet(),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Driver",
                          style: TextStyle(fontSize: 18, color: _color),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        getBullet(),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Accountant",
                          style: TextStyle(fontSize: 18, color: _color),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _form,
                  child: Center(
                    child: Container(
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_emailFocusNode);
                            },
                            decoration: InputDecoration(
                              labelText: "Your good name",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            focusNode: _emailFocusNode,
                            decoration: InputDecoration(
                              labelText: "Email address",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_contactFocusNode);
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            focusNode: _contactFocusNode,
                            decoration: InputDecoration(
                              labelText: "Contact No.",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_addressFocusNode);
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            focusNode: _addressFocusNode,
                            decoration: InputDecoration(
                              labelText: "Address",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_positionFocusNode);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gender",
                                style: TextStyle(fontSize: 17, color: _color),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                          activeColor: _color,
                                          value: 1,
                                          groupValue: selectedRadio,
                                          onChanged: (val) {
                                            setSelectedRadio(val);
                                          }),
                                      Text(
                                        "Male",
                                        style: TextStyle(color: _color),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          activeColor: _color,
                                          value: 2,
                                          groupValue: selectedRadio,
                                          onChanged: (val) {
                                            setSelectedRadio(val);
                                          }),
                                      Text(
                                        "Female",
                                        style: TextStyle(color: _color),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          activeColor: _color,
                                          value: 3,
                                          groupValue: selectedRadio,
                                          onChanged: (val) {
                                            setSelectedRadio(val);
                                          }),
                                      Text(
                                        "Others",
                                        style: TextStyle(color: _color),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            focusNode: _positionFocusNode,
                            decoration: InputDecoration(
                              labelText: "Position You want to apply",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_experienceFocusNode);
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            focusNode: _experienceFocusNode,
                            decoration: InputDecoration(
                              labelText: "Experience",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_messageFocusNode);
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            focusNode: _messageFocusNode,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              labelText: "Message If any",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            maxLines: 3,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromRGBO(77, 93, 92, 1),
                                  width: 2,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 8),
                              child: Text(
                                "Submit",
                                style: TextStyle(fontSize: 24, color: _color),
                              ),
                            ),
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     border: Border.all(
                          //       width: 2,
                          //       color: Color.fromRGBO(77, 93, 92, 1),
                          //     ),
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          //   child: FlatButton(
                          //     clipBehavior: Clip.hardEdge,
                          //     onPressed: () {},
                          //     child: Text(
                          //       "Submit",
                          //       style: TextStyle(fontSize: 24, color: _color),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
