import 'package:flutter/material.dart';

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
