import 'package:flutter/material.dart';

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