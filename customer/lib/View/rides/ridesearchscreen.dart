


import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/all_text.dart';
import '../Widgets/elevat_button.dart';

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
            height: MediaQuery.of(context).size.height*0.1,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: CustomColor.textColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.arrow_back,size: 25,color: CustomColor.Icon_Color,)
                ),
                SizedBox(width: 100,),
                  Text(
                    "Seaching....",
                    style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.Text_Color),
                  ),
              ],
            ),
          ),

          Container(
            height: 300,
            color: Colors.red,
          ),

          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 10,),
              Icon(Icons.location_on,size: 25,color: CustomColor.Icon_Color,),
              SizedBox(width: 30,),
              Text(
                "Your ride is being searched",
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.Text_Color),
              ),
            ],
          ),
          SizedBox(height: 10,),

          Container(
            height: 200,
            color: Colors.yellow,
          ),
          SizedBox(height: 10,),

          Text(
            "Thanks for your patience please wait",
            style: TextStyle(fontSize: 15,
                fontWeight: FontWeight.bold,
                color: CustomColor.Text_Color),
          ),
          SizedBox(height: 10,),

          SizedBox(
            height: 50,
            width: 350  ,
            child: MyElevatedButton(
              text: 'Cancel Ride',
              onPressed: () {
                Get.to(RideSearchScreen());
              },
              backgroundColor: CustomColor.Icon_Color,
              textColor: Colors.black,
              fontSize: 20,
            ),
          )



        ],
      ),
    ));
  }
}
