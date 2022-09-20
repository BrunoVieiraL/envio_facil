import 'package:flutter/material.dart';

import '../constants.dart';

class CustomWidgetBottomGreenButton extends StatelessWidget {
  const CustomWidgetBottomGreenButton({
    Key? key,
    required this.buttonText,
    this.onPressed,
    this.top,
  }) : super(key: key);
  final String buttonText;
  final void Function()? onPressed;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
        top: top ?? 0,
      ),
      child: SizedBox(
        height: 48,
        width: 328,
        child: ElevatedButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF16A45C).withOpacity(1)),
          child: Text(
            buttonText,
            style: TextStyle(
              fontFamily: titilliumWebBold,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
