import 'package:flutter/material.dart';
import 'package:flutter_login/customviews/CustomText.dart';
import 'package:flutter_login/customviews/CustomTextField.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpScreen createState() {
    // TODO: implement createState
    return _SignUpScreen();
  }
}

class _SignUpScreen extends State<SignUp> {
  // Initially password is obscure
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              CustomText(
                textDirection: TextDirection.ltr,
                fontSize: 40,
                alignment: Alignment.centerLeft,
                textAlign: TextAlign.center,
                text: "Sign In",
                edgeInsets: EdgeInsets.only(left: 20, right: 20, top: 60),
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
              CustomTextField(
                labelText: "Email",
                keyboardType: TextInputType.emailAddress,
                edgeInsets:
                EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 20),
              ),
              CustomTextField(
                labelText: "Password",
                edgeInsets:
                EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 5),
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
              CustomText(
                textDirection: TextDirection.ltr,
                fontSize: 15,
                alignment: Alignment.centerRight,
                textAlign: TextAlign.center,
                text: "Forgot Password?",
                edgeInsets: EdgeInsets.only(right: 20),
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                child: Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                  height: 45,
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    color: Colors.red,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "LOGIN",
                    ),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                width: double.infinity,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );;
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}