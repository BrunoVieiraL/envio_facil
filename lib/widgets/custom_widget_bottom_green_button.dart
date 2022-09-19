import 'package:flutter/material.dart';

import '../constants.dart';

class CustomWidgetBottomGreenButton extends StatelessWidget {
  const CustomWidgetBottomGreenButton({
    Key? key,
    required this.buttonText,
    this.onPressed,
  }) : super(key: key);
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: SizedBox(
        height: 48,
        width: 328,
        child: ElevatedButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(backgroundColor: const Color(0xFF16A45C)),
          child: Text(
            buttonText,
            style: TextStyle(
              fontFamily: titilliumWebBold,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
