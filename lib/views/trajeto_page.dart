import 'package:flutter/material.dart';

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
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 25,
                      left: 16,
                      right: 86,
                      bottom: 24,
                    ),
                    child: Text(
                      'Selecione a Data e a Rota da sua viagem',
                      style: TextStyle(
                        color: Color(0xFF222222),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            dataPartida = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                                locale: const Locale('pt', 'BR'));
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF222222))),
                            height: 54,
                            width: 156,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                dataPartida == null
                                    ? 'Data de Partida'
                                    : '${dataPartida!.day}/${dataPartida!.month < 10 ? 0 : ''}${dataPartida!.month}/${dataPartida!.year}',
                                style: TextStyle(
                                  color: dataPartida == null
                                      ? const Color(0xFFA9A9A9)
                                      : const Color(0xFF222222),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            dataChegada = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                                locale: const Locale('pt', 'BR'));
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF222222))),
                            height: 54,
                            width: 156,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                dataChegada == null
                                    ? 'Data de Chegada'
                                    : '${dataChegada!.day}/${dataChegada!.month < 10 ? 0 : ''}${dataChegada!.month}/${dataChegada!.year}',
                              ),
                            ),
                          ),
                        ),
                      ),
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
