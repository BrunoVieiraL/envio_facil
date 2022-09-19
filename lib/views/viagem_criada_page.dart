import 'package:flutter/material.dart';
import 'package:jera_app/constants.dart';
import 'package:jera_app/widgets/custom_widget_bottom_green_button.dart';

class ViagemCriadaPage extends StatelessWidget {
  const ViagemCriadaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 126,
              bottom: 32,
              left: 116,
              right: 116,
            ),
            child: SizedBox(
              height: 127,
              width: 128,
              child: Image(
                image: AssetImage('assets/paper_plane/paper_plane_send.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 17,
              left: 75,
              right: 75,
            ),
            child: Text(
              'Viagem criada',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: titilliumWebRegular,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 29,
              left: 24,
              right: 24,
            ),
            child: Text(
              'Vamos ver os volumes já disponíveis para a sua viagem.',
              style: TextStyle(
                fontSize: 14,
                fontFamily: titilliumWebRegular,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Ao prosseguir, você declara para efeitos legais, administrativos, jurídicos e demais aplicáveis, a veracidade de todas as informações prestadas antes, durante e após qualquer uma das etapas do app.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0x2222228A),
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 95),
          CustomWidgetBottomGreenButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/homePage');
              },
              buttonText: 'Visualizar Volumes'),
        ],
      ),
    );
  }
}
