import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/custom_widget_positioned_image.dart';
import '../widgets/custom_widget_positioned_text.dart';

class ComponentSenderBlackContainerHomePage extends StatelessWidget {
  const ComponentSenderBlackContainerHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            text: 'Remetente',
            textAlign: TextAlign.center,
            fontSize: 19.4,
            fontFamily: titilliumWebSemiBold,
          ),
          CustomWidgetPositionedText(
            top: 63,
            bottom: 24,
            left: 28,
            right: 120,
            text: 'Pra onde quer enviar seu objeto ?',
            textAlign: TextAlign.left,
            
            fontFamily: titilliumWebRegular,
          ),
          const CustomWidgetPositionedImage(
            top: 43.02,
            bottom: 42.81,
            left: 247.66,
            right: 39.67,
            path: 'assets/home_page/ic-box.png',
          ),
        ],
      ),
    );
  }
}
