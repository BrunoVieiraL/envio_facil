import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jera_app/constants.dart';
import 'package:jera_app/widgets/custom_widget_bottom_green_button.dart';
import 'package:jera_app/widgets/custom_widget_list_view.dart';
import 'package:jera_app/widgets/custom_widget_positioned_text.dart';

class TransportPage extends StatefulWidget {
  const TransportPage({super.key});

  @override
  State<TransportPage> createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 151.h,
            width: 360.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(3.w, 3.h),
                  colors: const <Color>[
                    Color(0xFF353740),
                    Color(0xFF222222),
                  ],
                  tileMode: TileMode.clamp),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 40.h,
                  bottom: 87.h,
                  left: 16.w,
                  right: 320.w,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/homePage');
                      for (var i = 0; i < listCheckTransportPage.length; i++) {
                        listCheckTransportPage[i] = false;
                      }
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24.w,
                    ),
                  ),
                ),
                CustomWidgetPositionedText(
                  top: 40.h,
                  bottom: 87.h,
                  left: 153.w,
                  right: 153.w,
                  text: 'Viajante',
                  color: Colors.white.withOpacity(0.54),
                  textAlign: TextAlign.center,
                  fontSize: 15.sp,
                  fontFamily: titilliumWebRegular,
                ),
                CustomWidgetPositionedText(
                  top: 80.h,
                  bottom: 16.h,
                  left: 16.w,
                  right: 16.w,
                  text: 'Qual será o meio de transporte da sua viagem ?',
                  fontSize: 20.sp,
                  textAlign: TextAlign.left,
                  fontFamily: titilliumWebRegular,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 24.h,
              left: 16.w,
              right: 269.w,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Transporte',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: titilliumWebBold,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          CustomWidgetListView(
            itemCount: listVeiculosTransportPage.length,
            value: listCheckTransportPage,
            title: listVeiculosTransportPage,
            imagePath: listImageTransportPage,
          ),
          CustomWidgetBottomGreenButton(
            buttonText: 'Avançar',
            onPressed: () {
              if (listCheckTransportPage.any((element) => element == true)) {
                Navigator.of(context).pushNamed('/routePage');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Selecione uma opção'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
