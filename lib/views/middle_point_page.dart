import 'package:flutter/material.dart';

class MiddlePointPage extends StatelessWidget {
  const MiddlePointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              right: 205,
              bottom: 8,
              top: 16,
            ),
            child: Text('Ponto intermediário'),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 24,
            ),
            child: Text(
                'Insira os pontos intermediários na sequência exata em que você passará por eles'),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 17, right: 16, bottom: 30),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Color(0xFF353740)),
                label: Text('Nome da Cidade'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 24,
            ),
            child: Text(
                'Usuários que viajam de campo Grande - MS para Dourados - MS também passam por:'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: const [
                Icon(Icons.location_on),
                Text('Cidade tal'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
