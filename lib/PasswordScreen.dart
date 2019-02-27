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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
          Column(
            children: <Widget>[
              CustomTextField(
                labelText: "Email",
                keyboardType: TextInputType.emailAddress,
                edgeInsets:
                EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 20),
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
                      "SEND AN EMAIL",
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
    );
  }
}
