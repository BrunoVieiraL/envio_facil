import 'package:flutter/material.dart';
import 'package:jera_app/constants.dart';
import 'package:jera_app/widgets/custom_widget_date_container.dart';

class TrajetoPage extends StatefulWidget {
  const TrajetoPage({super.key});

  @override
  State<TrajetoPage> createState() => _TrajetoPageState();
}

class _TrajetoPageState extends State<TrajetoPage> {
  DateTime? dataPartida;
  DateTime? dataChegada;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF353740),
          bottom: const TabBar(
            tabs: [
              Text('Rotas'),
              Text('Mapa'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: const Color(0xFFFAFAFA),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      left: 16,
                      right: 86,
                      bottom: 24,
                    ),
                    child: Text(
                      'Selecione a Data e a Rota da sua viagem',
                      style: TextStyle(
                        color: const Color(0xFF222222),
                        fontFamily: titilliumWebBold,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.2,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomWidgetDateContainer(
                          textPartida: 'Data de Partida',
                          dataPartida: dataPartida,
                          left: 16,
                          right: 16),
                      CustomWidgetDateContainer(
                          textPartida: 'Data de Chegada',
                          dataPartida: dataChegada,
                          right: 16),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
