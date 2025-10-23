import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
    void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
     Get.toNamed('/SignIn');
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
      Center(
            child: Container(
              height:200,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ProductImages.splash_image),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
