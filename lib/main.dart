import 'package:flutter/material.dart';
import 'package:jera_app/views/trajeto_page.dart';
import 'package:jera_app/views/transporte_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'views/home_page.dart';

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
