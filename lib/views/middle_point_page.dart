import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          Padding(
            padding: EdgeInsets.only(
              right: 205.w,
              bottom: 8.w,
              top: 16.h,
            ),
            child: const Text('Ponto intermediário'),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 24.h,
            ),
            child: const Text(
                'Insira os pontos intermediários na sequência exata em que você passará por eles'),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 17.w,
              right: 16.w,
              bottom: 30.h,
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Color(0xFF353740)),
                label: Text('Nome da Cidade'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 24.h,
            ),
            child: const Text(
                'Usuários que viajam de campo Grande - MS para Dourados - MS também passam por:'),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
            ),
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
