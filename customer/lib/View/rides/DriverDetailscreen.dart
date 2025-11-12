
import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/all_text.dart';

class Driverdetailscreen extends StatelessWidget {
  const Driverdetailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: CustomColor.background,
      body:Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: CustomColor.textColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [

                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.width * 0.06,
                    color: CustomColor.Icon_Color,
                  ),
                ),


                Expanded(
                  child: Center(
                    child: Text(
                      CustomText.Driver_Info,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.Text_Color,
                      ),
                    ),
                  ),
                ),


                SizedBox(width: MediaQuery.of(context).size.width * 0.06),
              ],
            ),
          ),

          Container(
            height: 300,
            //color: Colors.red,
            decoration: BoxDecoration(
              //color: Colors.yellow,
                image:DecorationImage(image: AssetImage("assets/images/map_image.png",), fit: BoxFit.cover)
            ),
          ),

          SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  CustomText.Name_thnks_scr+  "  :  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: CustomColor.Text_Color,
                      fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  "Muhammad Ibad Ullah Qureshi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColor.Text_Color,
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  CustomText.Name_thnks_scr+  "  :  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: CustomColor.Text_Color,
                      fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  "Muhammad Ibad Ullah Qureshi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColor.Text_Color,
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  CustomText.Name_thnks_scr+  "  :  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: CustomColor.Text_Color,
                      fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  "Muhammad Ibad Ullah Qureshi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColor.Text_Color,
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  CustomText.Name_thnks_scr+  "  :  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: CustomColor.Text_Color,
                      fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  "Muhammad Ibad Ullah Qureshi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColor.Text_Color,
                  ),
                ),

              ],
            ),
          ),
        ],
      )

    ));
  }
}
