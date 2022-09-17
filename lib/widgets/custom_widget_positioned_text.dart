import 'package:flutter/material.dart';

class CustomWidgetPositionedText extends StatelessWidget {
  const CustomWidgetPositionedText({
    Key? key,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
    required this.text,
    this.textAlign,
    this.fontSize,
    this.fontFamily,
    this.color,
  }) : super(key: key);
  final double top;
  final double bottom;
  final double left;
  final double right;
  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final String? fontFamily;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          overflow: TextOverflow.visible,
          color: color ?? Colors.white,
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
