import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final String labelText;
  final GestureDetector gestureDetector;
  final EdgeInsets margin;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  bool autovalidate = false;

  CustomTextField({
    @required this.labelText,
    Key key,
    @required this.validator,
    @required this.onSaved,
    this.gestureDetector,
    this.keyboardType,
    this.margin,
    @required this.autovalidate,
  }) : super(key: key);

  @override
  TextFormFieldState createState() {
    return new TextFormFieldState(validator, onSaved, labelText,
        gestureDetector, keyboardType, margin, autovalidate);
  }
}

class TextFormFieldState extends State<CustomTextField> {
  TextInputType keyboardType;
  String labelText;
  GestureDetector gestureDetector;
  EdgeInsets margin;
  FormFieldValidator<String> validator;
  FormFieldSetter<String> onSaved;
  bool autovalidate = false;

  TextFormFieldState(
      FormFieldValidator<String> validator,
      FormFieldSetter<String> onSaved,
      String labelText,
      GestureDetector gestureDetector,
      TextInputType keyboardType,
      EdgeInsets margin,
      bool autovalidate) {
    this.validator = validator;
    this.onSaved = onSaved;
    this.keyboardType = keyboardType;
    this.labelText = labelText;
    this.gestureDetector = gestureDetector;
    this.margin = margin;
    this.autovalidate = autovalidate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        autovalidate: autovalidate,
        maxLines: 1,
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
