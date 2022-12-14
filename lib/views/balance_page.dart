import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jera_app/components/component_cancel_button.dart';
import 'package:jera_app/widgets/custom_widget_bottom_green_button.dart';

import '../constants.dart';
import '../widgets/custom_widget_list_view.dart';
import '../widgets/custom_widget_positioned_text.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
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
                      Navigator.of(context).pop();
                      for (var i = 0; i < listCheckBalancePage.length; i++) {
                        listCheckBalancePage[i] = false;
                      }
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24.h,
                    ),
                  ),
                ),
                CustomWidgetPositionedText(
                  top: 40.h,
                  bottom: 87.h,
                  left: 129.w,
                  right: 129.w,
                  text: 'Ser um Muvver',
                  color: Colors.white.withOpacity(0.54),
                  textAlign: TextAlign.center,
                  fontSize: 14.9.sp,
                  fontFamily: titilliumWebRegular,
                ),
                const ComponentCancelButton(),
                CustomWidgetPositionedText(
                  top: 80.h,
                  bottom: 16.h,
                  left: 16.w,
                  right: 16.w,
                  text: 'Qual o peso do volume?',
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
                'Peso',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: titilliumWebBold,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CustomWidgetListView(
            itemCount: listPesoBalancePage.length,
            value: listCheckBalancePage,
            title: listPesoBalancePage,
            imagePath: listImageBalancePage,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/deliveryValuePage');
            },
            child: const Text(
              'Pular Etapa',
              style: TextStyle(color: Colors.black),
            ),
          ),
          CustomWidgetBottomGreenButton(
            buttonText: 'Avan??ar',
            onPressed: () {
              if (listCheckBalancePage.any((element) => element == true)) {
                Navigator.of(context).pushNamed('/deliveryValuePage');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Selecione uma op????o'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
