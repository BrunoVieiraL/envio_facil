import 'package:flutter/material.dart';

import '../components/component_remetente_black_container_home_page.dart';
import '../components/component_viajante_black_container_home_page.dart';
import '../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 15.97, top: 58, right: 216.03),
                child: Image(
                    color: Color(0xFF222222),
                    width: 80,
                    height: 15,
                    image: AssetImage('assets/home_page/logo.png')),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16, top: 49),
                child: Icon(
                  Icons.person,
                  size: 32,
                ),
              ),
            ],
          ),
          const SizedBox(height: 56),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: RichText(
              text: TextSpan(
                text: 'Facilitando seus ',
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 20,
                  fontFamily: titilliumWebSemiBold,
                ),
                children: const [
                  TextSpan(
                    text: 'envios',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222222),
                        fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Text('Entregue ou Envie'),
          ),
          const RemetenteComponentBlackContainerHomePage(),
          const SizedBox(height: 24),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/transportePage');
              },
              child: const ViajanteComponentBlackContainerHomePage()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedItemColor: const Color(0xFFB8B8B8),
        unselectedItemColor: const Color(0xFFB8B8B8),
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home,
                color: Color(0xFFB8B8B8),
              ),
              label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: Color(0xFFB8B8B8),
              ),
              label: 'Notificações'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Color(0xFFB8B8B8),
              ),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Color(0xFFB8B8B8),
              ),
              label: 'Pedidos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.fire_truck,
                color: Color(0xFFB8B8B8),
              ),
              label: 'Entregas'),
        ],
      ),
    );
  }
}
