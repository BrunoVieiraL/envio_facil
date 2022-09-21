import 'package:flutter/material.dart';
import '../constants.dart';
import 'custom_widget_positioned_image.dart';
import 'custom_widget_positioned_text.dart';

class CustomWidgetBlackContainerHomePage extends StatelessWidget {
  const CustomWidgetBlackContainerHomePage({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String imagePath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 328,
        height: 129,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(3, 3),
            colors: <Color>[
              Color(0xFF353740),
              Color(0xFF222222),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Stack(
          children: [
            CustomWidgetPositionedText(
              top: 24,
              bottom: 74,
              left: 58,
              right: 176,
              text: title,
              textAlign: TextAlign.center,
              fontSize: 19.4,
              fontFamily: titilliumWebSemiBold,
            ),
            CustomWidgetPositionedText(
              top: 63,
              bottom: 24,
              left: 28,
              right: 120,
              text: subtitle,
              textAlign: TextAlign.left,
              fontFamily: titilliumWebRegular,
            ),
            CustomWidgetPositionedImage(
              top: 43.02,
              bottom: 42.81,
              left: 247.66,
              right: 39.67,
              path: imagePath,
            ),
          ],
        ),
      ),
    );
  }
}
