import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/PasswordScreen.dart';
import 'package:flutter_login/SignUp.dart';
import 'package:flutter_login/customviews/CustomText.dart';
import 'package:flutter_login/customviews/CustomTextField.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInScreen createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignIn> {
  // Initially password is obscure
  bool _obscureText = true;
  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Form(
            key: this._formKey,
            child: Column(
              children: <Widget>[
                CustomText(
                  textDirection: TextDirection.ltr,
                  fontSize: 35,
                  alignment: Alignment.centerLeft,
                  textAlign: TextAlign.center,
                  text: "Sign In",
                  edgeInsets: EdgeInsets.only(left: 20, right: 20, top: 60),
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
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
                  margin:
                      EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 20),
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
                  margin:
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
                GestureDetector(
                  onTap: () {
                    _formKey.currentState.reset();

                    Navigator.of(context).push(new SecondPageRoute());
                  },
                  child: CustomText(
                    textDirection: TextDirection.ltr,
                    fontSize: 15,
                    alignment: Alignment.centerRight,
                    textAlign: TextAlign.center,
                    text: "Forgot Password?",
                    edgeInsets: EdgeInsets.only(right: 20),
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }
                      },
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
          ),
          GestureDetector(
            onTap: () {
              _formKey.currentState.reset();
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );*/
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) {
                    return SignUp();
                  },
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(
                      opacity: animation1,
                      child: child,
                    );
                  },
                  transitionDuration: Duration(milliseconds: 700),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.deepOrangeAccent,
                    size: 25,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}

class SecondPageRoute extends CupertinoPageRoute {
  SecondPageRoute()
      : super(builder: (BuildContext context) => new ForgotPassword());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new ForgotPassword());
  }
}
