import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/customviews/CustomText.dart';
import 'package:flutter_login/customviews/CustomTextField.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    Key key,
  }) : super(key: key);

  @override
  _Password createState() {
    return _Password();
  }
}

class _Password extends State<ForgotPassword> {
  String _email;
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  var _firebaseInstance = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget _progressIndicator() {
    if (_loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Container();
    }
  }

  void _showIndicator() {
    setState(() {
      _loading = !_loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    textDirection: TextDirection.ltr,
                    fontSize: 35,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.center,
                    text: "Forgot Password",
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
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
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
                          left: 20, right: 20, bottom: 5, top: 20),
                    ),
                    SizedBox(
                      child: Container(
                        margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                        height: 45,
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              _showIndicator();
                              _sendForgotPasswordEmail(_email);
                            }
                          },
                          textColor: Colors.white,
                          color: Colors.red,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "SEND",
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
            ],
          ),
          _progressIndicator(),
        ],
      ),
    );
  }

  void _sendForgotPasswordEmail(String email) async {
    _firebaseInstance.sendPasswordResetEmail(email: email).then((value) {
      _formKey.currentState.reset();
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
          "Email has been sent to your registered email address",
        ),
      ));
    }).catchError((e) {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
          e.message,
          style: TextStyle(color: Colors.red),
        ),
      ));
    }).whenComplete(() {
      _showIndicator();
    });
  }
}
