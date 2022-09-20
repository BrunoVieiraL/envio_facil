import 'package:flutter/material.dart';
import 'package:jera_app/components/component_cancel_button.dart';
import 'package:jera_app/widgets/custom_widget_bottom_green_button.dart';

import '../constants.dart';
import '../widgets/custom_widget_list_view.dart';
import '../widgets/custom_widget_positioned_text.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 151,
            width: 360,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(3, 3),
                  colors: <Color>[
                    Color(0xFF353740),
                    Color(0xFF222222),
                  ],
                  tileMode: TileMode.clamp),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  bottom: 87,
                  left: 16,
                  right: 320,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      for (var i = 0; i < listCheckBalancePage.length; i++) {
                        listCheckBalancePage[i] = false;
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                CustomWidgetPositionedText(
                  top: 40,
                  bottom: 87,
                  left: 129,
                  right: 129,
                  text: 'Ser um Muvver',
                  color: Colors.white.withOpacity(0.54),
                  textAlign: TextAlign.center,
                  fontSize: 14.9,
                  fontFamily: titilliumWebRegular,
                ),
                const ComponentCancelButton(),
                CustomWidgetPositionedText(
                  top: 80,
                  bottom: 16,
                  left: 16,
                  right: 16,
                  text: 'Qual o peso do volume?',
                  fontSize: 20,
                  textAlign: TextAlign.left,
                  fontFamily: titilliumWebRegular,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              left: 16,
              right: 269,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Peso',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: titilliumWebBold,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CustomWidgetListView(
            itemCount: listPesoBalancePage.length,
            value: listCheckBalancePage,
            title: listPesoBalancePage,
            imagePath: listImageBalancePage,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/deliveryValuePage');
            },
            child: const Text(
              'Pular Etapa',
              style: TextStyle(color: Colors.black),
            ),
          ),
          CustomWidgetBottomGreenButton(
            buttonText: 'Avançar',
            onPressed: () {
              if (listCheckBalancePage.any((element) => element == true)) {
                Navigator.of(context).pushNamed('/deliveryValuePage');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Selecione uma opção'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
