import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/SignIn.dart';
import 'package:flutter_login/customviews/CustomText.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: SplashScreen(title: 'Flutter Login'),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => SignIn(), fullscreenDialog: true)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Center(
              child: CustomText(
                textDirection: TextDirection.ltr,
                fontSize: 40,
                alignment: Alignment.center,
                textAlign: TextAlign.center,
                text: "Splash",
                edgeInsets: EdgeInsets.only(left: 20, right: 20, top: 60),
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: SizedBox(
                width: 20.0, height: 20.0, child: CircularProgressIndicator()),
          )
        ],
      ),
    );
  }
}
// Comment for update
