import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/homePage',
        routes: {
          '/homePage': (_) => const HomePage(),
          '/transportPage': (_) => const TransportPage(),
          '/routePage': (_) => const RoutePage(),
          '/middlePointPage': (_) => const MiddlePointPage(),
          '/boxSizePage': (_) => const BoxSizePage(),
          '/balancePage': (_) => const BalancePage(),
          '/deliveryValuePage': (_) => const DeliveryValuePage(),
          '/tripCreatedPage': (_) => const TripCreatedPage(),
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
      ),
    );
  }
}
