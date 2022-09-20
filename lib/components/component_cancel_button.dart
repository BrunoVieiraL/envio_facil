import 'package:flutter/material.dart';
import 'package:jera_app/constants.dart';

class ComponentCancelButton extends StatelessWidget {
  const ComponentCancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      bottom: 88,
      left: 270,
      right: 16,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/homePage');
        },
        child: Text(
          'Cancelar',
          style: TextStyle(
            color: Colors.white,
            fontFamily: titilliumWebBold,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
