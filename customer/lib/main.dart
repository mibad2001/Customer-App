import 'package:customer/Binding/auth_binding.dart';
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
      initialRoute:  '/Splash_Screen',
      //transitionDuration: Duration(seconds: ),
      defaultTransition: Transition.leftToRight,

      getPages: AppRoutes.appRoutes(),

      // getPages: [
      //
      //   GetPage(
      //     name: '/Splash_Screen',
      //     page: () =>Splash_Screen(),
      //     // binding: Splash_Screen(),
      //   ),
      //   GetPage(
      //     name: '/ProfileScreen',
      //     page: () =>ProfileScreen(),
      //    // binding: ProfileScreen(),
      //   ),
      //   GetPage(
      //     name: '/SignUp',
      //     page: () => SigUp_Screen(),
      //     binding: SingUpBinding(),
      //   ),
      //   GetPage(
      //     name: '/SignIn',
      //     page: () => SigIn_Screen(),
      //     binding: SingUpBinding(),
      //   ),
      //   GetPage(
      //     name: '/Deshboard',
      //     page: () => DeshBoard_Screen(),
      //     binding: DeshboardBinding(),
      //   ),
      //   GetPage(
      //     name: '/AboutScreen',
      //     page: () => Aboutscreen(),
      //     //binding: Aboutscreen(),
      //   ),
      //   GetPage(
      //     name: '/Yourtrip',
      //     page: () => Yourtrip(),
      //     //binding: Yourtrip(),
      //   ),
      //   GetPage(
      //     name: '/TripDetail',
      //     page: () => TripDetail(),
      //     //binding: TripDetail(),
      //   ),GetPage(
      //     name: '/PickupScreen',
      //     page: () => PickupScreen(),
      //     //binding: PickupScreen(),
      //   ),
      //   GetPage(
      //     name: '/RideInfoScreen',
      //     page: () => RideInfoScreen(),
      //     //binding: RideInfoScreen(),
      //   ),
      //   GetPage(
      //     name: '/RideSearchScreen',
      //     page: () => RideSearchScreen(),
      //     //binding: RideSearchScreen(),
      //   ),
      //
      //   GetPage(
      //     name: '/PaymentScreen',
      //     page: () => PaymentScreen(),
      //     //binding: PaymentScreen(),
      //   ),
      //   GetPage(
      //     name: '/PromoScreen',
      //     page: () => PromoScreen(),
      //     //binding: PromoScreen(),
      //   ),
      //
      //   GetPage(
      //     name: '/ReebookingScreen',
      //     page: () => ReebookingScreen(),
      //     //binding: ReebookingScreen(),
      //   ),
      //   GetPage(
      //     name: '/PaymentReschedule',
      //     page: () => ExtrasScreen(),
      //     //binding: PaymentReschedule(),
      //   ),
      //
      //
      //
      //
      //
      // ],
    );
  }
}
