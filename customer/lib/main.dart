import 'package:customer/Binding/auth_binding.dart';
import 'package:customer/Routing/routes_name.dart';
import 'package:customer/View/Auth/Login_screens/login.dart';
import 'package:customer/View/Auth/Sign_Up_Screen/sign_up.dart';
import 'package:customer/View/Auth/splash_Screen/spalsh.dart';
import 'package:customer/View/Deshboard/AddHome/add_home.dart';
import 'package:customer/View/Deshboard/AddWork/add_work.dart';
import 'package:customer/View/Deshboard/dashboard.dart';
import 'package:customer/View/about/aboutscreen.dart';
import 'package:customer/View/profile/profilescreen.dart';
import 'package:customer/View/yourtrip/yourtrip.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'Routing/routes.dart';
import 'View/Deshboard/pickup/pickup.dart';
import 'View/Reebook/extras.dart';
import 'View/Reebook/promoscreen.dart';
import 'View/Reebook/Reebookingscreen.dart';
import 'View/payments/paymentscreen.dart';
import 'View/rides/ride_info_screen.dart';
import 'View/rides/ridesearchscreen.dart';
import 'View/thanks/thanksscreen.dart';
import 'View/yourtrip/tripdetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customer App',
      initialRoute:  routesName.Splash_Screen,
      //transitionDuration: Duration(seconds: ),
      defaultTransition: Transition.leftToRight,

      getPages: AppRoutes.appRoutes(),


    );
  }
}
