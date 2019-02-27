import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/PasswordScreen.dart';
import 'package:flutter_login/SignUp.dart';
import 'package:flutter_login/customviews/CustomText.dart';
import 'package:flutter_login/customviews/CustomTextField.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Initially password is obscure
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
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
              GestureDetector(
                onTap: () {
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
          GestureDetector(
            onTap: () {
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
                      transitionsBuilder:
                          (context, animation1, animation2, child) {
                        return FadeTransition(
                          opacity: animation1,
                          child: child,
                        );
                      },
                      transitionDuration: Duration(milliseconds: 1000),
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
