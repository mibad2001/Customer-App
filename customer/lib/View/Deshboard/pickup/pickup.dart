import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/elevat_button.dart';
import '../Widget/openstrretmap.dart';
import '../Widget/osm.dart';

class PickupScreen extends StatelessWidget {
 const  PickupScreen({super.key});
  // final mapWedgit =OpenStreetMapWidget();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.background,
        body: Stack(
        children: [
          // OpenStreetMapWidget(),//==== map
          Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: CustomColor.background,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back, color: CustomColor.Icon_Color),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.location_on,
                            size: 15,
                            color: CustomColor.Icon_Color,
                          ),
                        ),
                        Text(CustomText.Pickup,style: TextStyle(
                            fontSize:12,
                            color: CustomColor.Text_Color
                        ),)
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25.0,right: 10),
                      child: Text("123 Green Valley Street""Springfield, IL 62704 United States",
                        style: TextStyle(
                            fontSize:20,
                            color: CustomColor.Text_Color,fontWeight: FontWeight.bold
                        ),),
                    )
                  ],
                ),
              ),



            ],
          ),
        ],
        ),
        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 50,
            width: 350  ,
            child: MyElevatedButton(
              text: 'DONE',
              onPressed: () {  },
              backgroundColor: CustomColor.Icon_Color,
              textColor: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
