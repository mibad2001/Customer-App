
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/rides/ride_info_screen.dart';
import 'package:customer/View/rides/ridecomplete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/all_text.dart';
import '../thanks/thanksscreen.dart';

class Driverdetailscreen extends StatelessWidget {
  const Driverdetailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: CustomColor.background,
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              height: 500,
              //color: Colors.red,
              decoration: BoxDecoration(
                //color: Colors.yellow,
                  image:DecorationImage(image: AssetImage("assets/images/map_image.png",), fit: BoxFit.cover)
              ),
            ),
        
            SizedBox(height: 15,),


        

        
        
            //
            // Padding(
            //   padding:EdgeInsets.only(left: 8.0),
            // child: Text(
            //   CustomText.Vehicle_Image +  "  :  ",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //       fontSize: 18,
            //       color: CustomColor.Text_Color,
            //       fontWeight: FontWeight.bold
            //   ),
            // ),
            // ),


            
            
            // Container(
            //   margin : EdgeInsets.only(left: 150),
            //   height: 80,
            //   width: 120,
            //   decoration: BoxDecoration(
            //     //color: Colors.green,
            //     borderRadius: BorderRadius.all(Radius.circular(20))
            //   ),
            //   child: Image(image: AssetImage("assets/images/carimage.jpg",)),
            // ),
            //
            // SizedBox(height: 5,),
            //
        






        
        
           
          ],
        ),
      ),
      bottomNavigationBar:  Container(
        height: MediaQuery.of(context).size.height*0.3,
        decoration: BoxDecoration(
          color: Colors.grey,
            borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
        ),
        //===========================================================  Driver name
        child:  Column(
          children: [
            SizedBox(height: 15,),
            Container(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.blue,radius: 25,),
                  SizedBox(width: 10,),
                  // Text(
                  //   CustomText.Name+  "  :  ",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //       fontSize: 15,
                  //       color: CustomColor.Text_Color,
                  //       fontWeight: FontWeight.bold
                  //   ),
                  // ),

                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Muhammad Ibad Ullah Qureshi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize:20 ,
                          color: CustomColor.Text_Color,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: 5,),



            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    //=============================================================  Status


                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Text(
                            CustomText.Vehicle_Status+ "  :   ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: CustomColor.Text_Color,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            child: Center(
                              child: Text(
                                "Ride Accepted",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: CustomColor.Text_Color,
                                    fontWeight: FontWeight.bold

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 8,),


                    //============================================================  Driver Color
                    Padding(
                      padding:  EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          Text(
                            CustomText.Vehicle_Color+  "  :  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: CustomColor.Text_Color,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          Text(
                            "White",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: CustomColor.Text_Color,
                            ),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 8,),

                    //=============================================================   Driver  Number

                    Padding(
                      padding:  EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Text(
                            CustomText.Vehicle_number+  "  :  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: CustomColor.Text_Color,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          Text(
                            "ABC-1234",
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
                ),

                SizedBox(width: MediaQuery.of(context).size.width*0.06,),
                Container(
                  margin : EdgeInsets.only(right: 3,top: 30),
                  height:60,
                  width: 120,
                  decoration: BoxDecoration(
                    //color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: Image(image: AssetImage("assets/images/carimage.jpg",),fit: BoxFit.cover,),
                ),

              ],
            ),

            ElevatedButton(onPressed: (){

              Get.to(RideCompleteScreen());
            }, child: Text("move to feedback screen"))

          ],
        ),

      ),

    )
    );
  }
}
