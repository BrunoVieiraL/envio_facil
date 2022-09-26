import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jera_app/widgets/custom_widget_black_container_home_page.dart';
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
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 15.97.w, top: 58.h, right: 216.03.w),
                child: Image(
                    color: const Color(0xFF222222),
                    width: 80.w,
                    height: 15.h,
                    image: const AssetImage('assets/home_page/logo.png')),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 16.w,
                  top: 49.h,
                ),
                child: Icon(
                  Icons.person,
                  size: 32.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 56.h),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: RichText(
              text: TextSpan(
                text: 'Facilitando seus ',
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 20.sp,
                  fontFamily: titilliumWebSemiBold,
                ),
                children: [
                  TextSpan(
                    text: 'envios',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF222222),
                        fontSize: 20.sp),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: const Text('Entregue ou Envie'),
          ),
          const CustomWidgetBlackContainerHomePage(
            title: 'Remetente',
            subtitle: 'Pra onde quer enviar seu objeto ?',
            imagePath: 'assets/home_page/ic-box.png',
          ),
          SizedBox(height: 24.h),
          CustomWidgetBlackContainerHomePage(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/transportPage');
            },
            title: 'Viajante',
            subtitle: 'Vai viajar pra onde ?',
            imagePath: 'assets/home_page/delivery-truck.png',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10.sp,
        unselectedFontSize: 10.sp,
        selectedItemColor: const Color(0xFFB8B8B8),
        unselectedItemColor: const Color(0xFFB8B8B8),
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home,
                size: 22.h,
                color: const Color(0xFFB8B8B8),
              ),
              label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 22.h,
                color: const Color(0xFFB8B8B8),
              ),
              label: 'Notificações'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                size: 22.h,
                color: const Color(0xFFB8B8B8),
              ),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 22.h,
                color: const Color(0xFFB8B8B8),
              ),
              label: 'Pedidos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.fire_truck,
                size: 22.h,
                color: const Color(0xFFB8B8B8),
              ),
              label: 'Entregas'),
        ],
      ),
    );
  }
}
