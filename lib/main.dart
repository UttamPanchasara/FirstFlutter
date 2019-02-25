import 'package:flutter/material.dart';

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
      body: Center(
          child: Column(
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
                onPressed: (){},
                textColor: Colors.white,
                color: Colors.red,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "LOGIN",
                ),
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            width: double.infinity,
          )
        ],
      )),
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

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Alignment alignment;
  final EdgeInsets edgeInsets;
  final FontWeight fontWeight;

  const CustomText({
    @required this.text,
    @required this.fontSize,
    this.color,
    @required this.textAlign,
    @required this.textDirection,
    @required this.alignment,
    @required this.fontWeight,
    this.edgeInsets,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment,
        child: Container(
          margin: edgeInsets,
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize, color: color, fontWeight: fontWeight),
            textAlign: textAlign,
            textDirection: textDirection,
          ),
        ));
  }
}

class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final String labelText;
  final GestureDetector gestureDetector;
  final EdgeInsets edgeInsets;

  const CustomTextField({
    @required this.labelText,
    Key key,
    this.gestureDetector,
    this.keyboardType,
    this.edgeInsets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsets,
      child: TextField(
        maxLines: 1,
        cursorColor: Colors.white,
        keyboardType:
            keyboardType == null ? TextInputType.emailAddress : keyboardType,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            suffixIcon: gestureDetector,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey))),
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontStyle: FontStyle.normal),
      ),
    );
  }
}
