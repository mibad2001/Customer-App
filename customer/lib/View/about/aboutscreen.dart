
import 'package:customer/View/Deshboard/Widget/osm.dart';
import 'package:customer/View/Deshboard/drawer/drawer.dart';
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Deshboard/Widget/openstrretmap.dart';


class Aboutscreen extends StatelessWidget {
   Aboutscreen({super.key});
  // final mapWedgit =OpenStreetMapWidget();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.background,

        body:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Row(
                children: [

                  Padding(
                    padding:  EdgeInsets.only(left: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      height: 40,
                      width: 40,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon:  Icon(Icons.arrow_back, size: 25, color: Colors.white),
                      ),
                    ),
                  ),


                   SizedBox(width: 10),


                  Expanded(
                    child: Center(
                      child: Text(
                        CustomText.About,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.065, // responsive font
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),


                  SizedBox(width: 55),
                ],
              ),


              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("CRMILES",
                  style: TextStyle(
                      fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              //==================================  address
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Icon(Icons.location_on_rounded, size:20 , color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "1 MANSOR ROAD, HASTINGSEAST SECESSEX TN34 3LL",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              //=====================================          buttons call and email
              Container(
                height: 50,
                padding:  EdgeInsets.symmetric(horizontal: 10), // optional padding
                child: Row(
                  children: [

                     Spacer(),


                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon:  Icon(Icons.call, size: 20, color: Colors.black),
                      ),
                    ),

                     SizedBox(width: 5),


                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon:  Icon(Icons.email, size: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10
                ,),

              //============================================   map
              Container(
                height:600,
                 // child: OpenStreetMapWidget(),
              ),




            ],
          ),
        ),
        
      ),
    );
  }
}
