import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/all_text.dart';
import '../Widgets/elevat_button.dart';
import '../Widgets/text_button.dart';

class RideSearchScreen extends StatelessWidget {
  const RideSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: CustomColor.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                // Back button
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.width * 0.06, // responsive icon size
                    color: CustomColor.Icon_Color,
                  ),
                ),

                // Title centered
                Expanded(
                  child: Center(
                    child: Text(
                      CustomText.Seaching,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06, // responsive font
                        fontWeight: FontWeight.bold,
                        color: CustomColor.Text_Color,
                      ),
                    ),
                  ),
                ),

                // Optional: add empty space or another icon here if needed
                SizedBox(width: MediaQuery.of(context).size.width * 0.06),
              ],
            ),
          ),

          // Container(
          //   height: MediaQuery.of(context).size.height*0.1,
          //   padding: EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //       color: CustomColor.textColor,
          //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
          //   ),
          //   child: Row(
          //     children: [
          //       IconButton(onPressed: (){
          //         Get.back();
          //       }, icon: Icon(Icons.arrow_back,size: 25,color: CustomColor.Icon_Color,)
          //       ),
          //       SizedBox(width: 100,),
          //         Text(
          //           CustomText.Seaching,
          //           style: TextStyle(fontSize: 25,
          //               fontWeight: FontWeight.bold,
          //               color: CustomColor.Text_Color),
          //         ),
          //     ],
          //   ),
          // ),

          Container(
            height: 300,
            //color: Colors.red,
            decoration: BoxDecoration(
              //color: Colors.yellow,
                image:DecorationImage(image: AssetImage("assets/images/map_image.png",), fit: BoxFit.cover)
            ),
          ),

          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 10,),
              Icon(Icons.location_on,size: 25,color: CustomColor.Icon_Color,),
              SizedBox(width: 30,),
              Text(
                CustomText.Seaching_Text,
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.Text_Color),
              ),
            ],
          ),
          SizedBox(height: 10,),

          Container(
            height: 200,

            decoration: BoxDecoration(
                //color: Colors.yellow,
              image:DecorationImage(image: AssetImage("assets/images/ride_search_image.png",), fit: BoxFit.cover)
            ),
          ),
          SizedBox(height: 10,),

          Text(
            "Thanks for your patience please wait",
            style: TextStyle(fontSize: 15,
                fontWeight: FontWeight.bold,
                color: CustomColor.Text_Color),
          ),
          SizedBox(height: 20,),

          SizedBox(
            height: 50,
            width: 350  ,
            child: MyElevatedButton(
              text: 'Cancel Ride',
              onPressed: () {
                Get.dialog(
                  Dialog(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      height: 220,
                      width: 100,
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          const Icon(
                            Icons.warning_amber,
                            color: Colors.amberAccent,
                            size: 60,
                          ),
                          SizedBox(height: 15,),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.only(left: 20),
                              height: 80,
                              width: 200,
                              child: Text(
                                CustomText.Ride_Cancel_alert,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 70,),
                              CustomTextButton(
                                text: 'Yes',
                                onPressed: () {
                                  Get.toNamed('/Deshboard');
                                },
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                borderRadius: 8,
                                elevation: 2,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                              ),
                              const SizedBox(width: 20),
                              CustomTextButton(
                                text: 'NO',
                                onPressed: () {
                                  Get.back();
                                },
                                backgroundColor: Colors.black54,
                                textColor: Colors.white,
                                borderRadius: 8,
                                elevation: 2,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                );
              },
              backgroundColor: CustomColor.Icon_Color,
              textColor: Colors.black,
              fontSize: 20,
            ),
          )



        ],
      ),
    )
    );
  }
}
