import 'package:flutter/material.dart';
import 'package:jera_app/components/component_cancelar_button.dart';
import 'package:jera_app/widgets/custom_widget_bottom_green_button.dart';

import '../constants.dart';
import '../widgets/custom_widget_list_view.dart';
import '../widgets/custom_widget_positioned_text.dart';

class TamanhoPage extends StatefulWidget {
  const TamanhoPage({super.key});

  @override
  State<TamanhoPage> createState() => _TamanhoPageState();
}

class _TamanhoPageState extends State<TamanhoPage> {
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
                      for (var i = 0; i < listCheckTamanhoPage.length; i++) {
                        listCheckTamanhoPage[i] = false;
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
                const ComponentCancelarButton(),
                CustomWidgetPositionedText(
                  top: 80,
                  bottom: 16,
                  left: 16,
                  right: 16,
                  text:
                      'O volume que você pode deslocar tem tamanho similar a que?',
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
                'Tamanhos',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: titilliumWebBold,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CustomWidgetListView(
            itemCount: listContainerTamanhoPage.length,
            value: listCheckTamanhoPage,
            title: listContainerTamanhoPage,
            subtitle: '00 x 00 cm',
            imagePath: listImageTamanhoPage,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/balancePage');
            },
            child: const Text(
              'Pular Etapa',
              style: TextStyle(color: Colors.black),
            ),
          ),
          CustomWidgetBottomGreenButton(
            buttonText: 'Avançar',
            onPressed: () {
              if (listCheckTamanhoPage.any((element) => element == true)) {
                Navigator.of(context).pushNamed('/balancePage');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Selecione uma opção'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
