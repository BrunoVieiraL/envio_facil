import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jera_app/components/component_cancel_button.dart';
import '../constants.dart';
import '../widgets/custom_widget_bottom_green_button.dart';
import '../widgets/custom_widget_positioned_text.dart';

class DeliveryValuePage extends StatefulWidget {
  const DeliveryValuePage({super.key});

  @override
  State<DeliveryValuePage> createState() => _DeliveryValuePageState();
}

class _DeliveryValuePageState extends State<DeliveryValuePage> {
  double valorSugerido = 100;

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
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24.w,
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
                  fontSize: 15.sp,
                  fontFamily: titilliumWebRegular,
                ),
                const ComponentCancelButton(),
                CustomWidgetPositionedText(
                  top: 80.h,
                  bottom: 16.h,
                  left: 16.w,
                  right: 16.w,
                  text: 'Definir preço mínimo do deslocamento?',
                  fontSize: 20,
                  textAlign: TextAlign.left,
                  fontFamily: titilliumWebRegular,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 24.h,
              bottom: 24.h,
              left: 16.w,
              right: 227.w,
            ),
            child: const Text('Preço da Entrega'),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 128.w,
              right: 150.w,
            ),
            child: Text(
              'Valor sugerido',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0x22222252),
                  fontFamily: titilliumWebRegular,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Slider(
            activeColor: Colors.black,
            thumbColor: Colors.black,
            min: 0,
            max: 250,
            value: valorSugerido,
            onChanged: (value) {
              valorSugerido = value;
              setState(() {});
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 17.h,
              left: 145.w,
              right: 150.w,
            ),
            child: Text('R\$ ${valorSugerido.toInt()}'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Clique no valor acima, para um preço mais específico.',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: titilliumWebRegular,
                  fontWeight: FontWeight.w400,
                  color: const Color(0x2222228A)),
            ),
          ),
          SizedBox(
            height: 226.h,
          ),
          CustomWidgetBottomGreenButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/tripCreatedPage');
            },
            buttonText: 'Avançar',
          ),
        ],
      ),
    );
  }
}
