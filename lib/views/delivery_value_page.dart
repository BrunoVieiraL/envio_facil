import 'package:flutter/material.dart';
import 'package:jera_app/components/component_cancel_button.dart';

import '../constants.dart';
import '../widgets/custom_widget_bottom_green_button.dart';
import '../widgets/custom_widget_positioned_text.dart';

class ValorEntregaPage extends StatefulWidget {
  const ValorEntregaPage({super.key});

  @override
  State<ValorEntregaPage> createState() => _ValorEntregaPageState();
}

class _ValorEntregaPageState extends State<ValorEntregaPage> {
  double valorSugerido = 100;

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
                  text: 'Definir preço mínimo do deslocamento?',
                  fontSize: 20,
                  textAlign: TextAlign.left,
                  fontFamily: titilliumWebRegular,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 24,
              bottom: 24,
              left: 16,
              right: 227,
            ),
            child: Text('Preço da Entrega'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 128,
              right: 150,
            ),
            child: Text(
              'Valor sugerido',
              style: TextStyle(
                  fontSize: 12,
                  color: const Color(0x22222252),
                  fontFamily: titilliumWebRegular,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Slider(
            activeColor: Colors.black,
            thumbColor: Colors.black,
            min: 0,
            max: 250,
            value: valorSugerido,
            onChanged: (value) {
              valorSugerido = value;
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 17,
              left: 145,
              right: 150,
            ),
            child: Text('R\$ ${valorSugerido.toInt()}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Clique no valor acima, para um preço mais específico.',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: titilliumWebRegular,
                  fontWeight: FontWeight.w400,
                  color: const Color(0x2222228A)),
            ),
          ),
          const SizedBox(
            height: 226,
          ),
          CustomWidgetBottomGreenButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/viagemCriadaPage');
            },
            buttonText: 'Avançar',
          ),
        ],
      ),
    );
  }
}
