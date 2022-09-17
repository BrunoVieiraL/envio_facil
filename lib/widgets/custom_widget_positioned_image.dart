import 'package:flutter/material.dart';

class CustomWidgetPositionedImage extends StatelessWidget {
  const CustomWidgetPositionedImage({
    Key? key,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
    required this.path,
  }) : super(key: key);

  final double top;
  final double bottom;
  final double left;
  final double right;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Image(
        image: AssetImage(path),
      ),
    );
  }
}
