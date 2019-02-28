import 'package:flutter/material.dart';
import 'package:flutter_login/customviews/CustomText.dart';
import 'package:flutter_login/customviews/CustomTextField.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpScreen createState() {
    return _SignUpScreen();
  }
}

class _SignUpScreen extends State<SignUp> {
  // Initially password is obscure
  bool _obscureText = true;
  String _name;
  String _email;
  String _password;
  String _confirmPassword;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    textDirection: TextDirection.ltr,
                    fontSize: 35,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.center,
                    text: "Sign Up",
                    edgeInsets: EdgeInsets.only(left: 20, right: 20, top: 60),
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20, top: 60),
                      child: Icon(
                        Icons.cancel,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        autovalidate: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Name';
                          }
                        },
                        onSaved: (value) => this._name = value,

                        labelText: "Name",
                        keyboardType: TextInputType.text,
                        margin: EdgeInsets.only(
                            left: 20, right: 20, bottom: 5, top: 20),
                      ),
                      CustomTextField(
                        autovalidate: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Email';
                          }
                        },
                        onSaved: (value) => this._email = value,

                        labelText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        margin: EdgeInsets.only(
                            left: 20, right: 20, bottom: 5, top: 5),
                      ),
                      CustomTextField(
                        autovalidate: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Password';
                          }
                        },
                        onSaved: (value) => this._password = value,

                        labelText: "Password",
                        margin: EdgeInsets.only(
                            left: 20, right: 20, bottom: 5, top: 5),
                        gestureDetector: GestureDetector(
                          child: Icon(
                            Icons.remove_red_eye,
                            size: 20,
                          ),
                          onTap: () {
                            _toggle();
                          },
                        ),
                      ),
                      CustomTextField(
                        autovalidate: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Confirm Password';
                          }
                        },
                        onSaved: (value) => this._confirmPassword = value,

                        labelText: "Confirm Password",
                        margin: EdgeInsets.only(
                            left: 20, right: 20, bottom: 10, top: 5),
                        gestureDetector: GestureDetector(
                          child: Icon(
                            Icons.remove_red_eye,
                            size: 20,
                          ),
                          onTap: () {
                            _toggle();
                          },
                        ),
                      ),
                      SizedBox(
                        child: Container(
                          margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                          height: 45,
                          child: RaisedButton(
                            onPressed: () {
                              if(_formKey.currentState.validate()){

                              }
                            },
                            textColor: Colors.white,
                            color: Colors.red,
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "SIGN UP",
                            ),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
