import 'package:flutter/material.dart';
import 'package:jera_app/views/box_size_page.dart';
import 'package:jera_app/views/middle_point_page.dart';
import 'package:jera_app/views/route_page.dart';
import 'package:jera_app/views/transport_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'views/balance_page.dart';
import 'views/home_page.dart';
import 'views/delivery_value_page.dart';
import 'views/trip_created_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/homePage',
      routes: {
        '/homePage': (_) => const HomePage(),
        '/transportePage': (_) => const TransportePage(),
        '/trajetoPage': (_) => const TrajetoPage(),
        '/pontoIntermediarioPage': (_) => const PontoIntermediarioPage(),
        '/tamanhoPage': (_) => const TamanhoPage(),
        '/balancePage': (_) => const BalancePage(),
        '/valorEntregaPage': (_) => const ValorEntregaPage(),
        '/viagemCriadaPage': (_) => const ViagemCriadaPage(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
    );
  }
}
