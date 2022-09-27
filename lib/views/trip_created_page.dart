import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jera_app/constants.dart';
import 'package:jera_app/widgets/custom_widget_bottom_green_button.dart';

class TripCreatedPage extends StatelessWidget {
  const TripCreatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 126.h,
              bottom: 32.h,
              left: 116.w,
              right: 116.w,
            ),
            child: SizedBox(
              height: 127.h,
              width: 128.w,
              child: const Image(
                image: AssetImage('assets/paper_plane/paper_plane_send.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 17.h,
              left: 75.w,
              right: 75.w,
            ),
            child: Text(
              'Viagem criada',
              style: TextStyle(
                  fontSize: 32.sp,
                  fontFamily: titilliumWebRegular,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 29.h,
              left: 24.w,
              right: 24.w,
            ),
            child: Text(
              'Vamos ver os volumes já disponíveis para a sua viagem.',
              style: TextStyle(
                fontFamily: titilliumWebRegular,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Ao prosseguir, você declara para efeitos legais, administrativos, jurídicos e demais aplicáveis, a veracidade de todas as informações prestadas antes, durante e após qualquer uma das etapas do app.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0x2222228A),
                fontSize: 12.sp,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          CustomWidgetBottomGreenButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/homePage');
              },
              buttonText: 'Visualizar Volumes'),
        ],
      ),
    );
  }
}
