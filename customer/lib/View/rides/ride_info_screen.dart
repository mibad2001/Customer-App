
import 'package:customer/Controller/Ride/RideController.dart';
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/elevat_button.dart';

class RideInfoScreen extends StatelessWidget {
   RideInfoScreen({super.key});
   
   final rideController = Get.put(RideController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                   CustomText.Ride_Info,
                    style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.Text_Color),
                  ),
                  SizedBox(width: 80,),
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.edit_notifications_sharp,size: 25,color: Colors.yellow,)
                  ),

                ],
              ),
            ),

            SizedBox(height: 10,),
            Text(
              CustomText.Slect_Suitable_Ride,
              style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.Text_Color),
            ),
            SizedBox(height: 10,),

            Container(
              height: 630,
              child: ListView.builder(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                itemCount:rideController.CarName.length ,
                itemBuilder:  (context, index){
                return Container(
                height: 150,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: CustomColor.textColor,
                ),
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(10),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rideController.CarName[index],
                      style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.Text_Color),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Icon(Icons.car_repair,size: 30,color: CustomColor.Icon_Color,),
                        SizedBox(width: 5,),

                        Icon(Icons.person,size: 18,color: CustomColor.Icon_Color,),
                        SizedBox(width: 5,),
                        Icon(Icons.arrow_forward_outlined,size: 18,color: CustomColor.Icon_Color,),
                        Text(
                          rideController.seats[index],
                          style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.Text_Color),
                        ),


                      ],
                    ),


                  ],
                ),
              );
                  }
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: 350  ,
              child: MyElevatedButton(
                text: 'Shedule Booking',
                onPressed: () {  },
                backgroundColor: CustomColor.Icon_Color,
                textColor: Colors.black,
                fontSize: 20,
              ),
            )








          ],
        ),
      ),
    );
  }
}


