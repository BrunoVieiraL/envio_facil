import 'package:flutter/material.dart';
import 'package:jera_app/constants.dart';
import 'package:jera_app/widgets/custom_widget_bottom_green_button.dart';
import 'package:jera_app/widgets/custom_widget_list_view.dart';
import 'package:jera_app/widgets/custom_widget_positioned_text.dart';

class TransportePage extends StatefulWidget {
  const TransportePage({super.key});

  @override
  State<TransportePage> createState() => _TransportePageState();
}

class _TransportePageState extends State<TransportePage> {
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
                      Navigator.of(context).pushReplacementNamed('/homePage');
                      for (var i = 0; i < listCheckTransportePage.length; i++) {
                        listCheckTransportePage[i] = false;
                      }
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                CustomWidgetPositionedText(
                  top: 40,
                  bottom: 87,
                  left: 153,
                  right: 153,
                  text: 'Viajante',
                  color: Colors.white.withOpacity(0.54),
                  textAlign: TextAlign.center,
                  fontSize: 14.9,
                  fontFamily: titilliumWebRegular,
                ),
                CustomWidgetPositionedText(
                  top: 80,
                  bottom: 16,
                  left: 16,
                  right: 16,
                  text: 'Qual será o meio de transporte da sua viagem ?',
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
                'Transporte',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: titilliumWebBold,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CustomWidgetListView(
            itemCount: listVeiculosTransportePage.length,
            value: listCheckTransportePage,
            title: listVeiculosTransportePage,
            imagePath: listImageTransportePage,
          ),
          CustomWidgetBottomGreenButton(
            buttonText: 'Avançar',
            onPressed: () {
              if (listCheckTransportePage.any((element) => element == true)) {
                Navigator.of(context).pushNamed('/trajetoPage');
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
