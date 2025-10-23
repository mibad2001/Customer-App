import 'package:customer/Controller/Deshboard/deshboard_cont.dart';
import 'package:customer/View/Deshboard/AddHome/add_home.dart';
import 'package:customer/View/Deshboard/AddWork/add_work.dart';
import 'package:customer/View/Deshboard/PreviousTrip/previous_trip.dart';
import 'package:customer/View/Deshboard/Widget/openstrretmap.dart';
import 'package:customer/View/Deshboard/Widget/osm.dart';
import 'package:customer/View/Home/homedriver.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/text_button.dart';
import 'package:customer/View/Widgets/textstyle.dart';
import 'package:customer/View/profile/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/color.dart' show CustomColor;

class DeshBoard_Screen extends StatelessWidget {
  DeshBoard_Screen({super.key});

  final DeshBoardAddHome_Controller hdeshboard_controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor:CustomColor.background,
        body: Column(
          children: [
           Stack(
              children: [
                ///////////////////////////////////////// Map
                Container(
                  height: 600,
                  child: OpenStreetMapWidget(),
                ),


               // =====================================================Profile buttom
                Positioned(
                  left: 10,
                  top: 20,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: CustomColor.background,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child:
                    Center(
                      child: IconButton(
                          onPressed: (){
                            Get.to(ProfileScreen());
                          },
                          icon: IconButton(onPressed: (){
                            Get.to(ProfileScreen());
                          },
                              icon: Icon(Icons.person,size: 30
                                ,color: Colors.grey,)
                          )
                      ),
                    ),
                  ),
                )

              ],
            ),


            Container(
              color: CustomColor.background,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 10.0,
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_2_rounded,
                            size: 27,
                            color: CustomColor.textColor,
                          ),
                          SizedBox(width: 15),
                          CustomTextStyle(
                            text: "User Name",
                            fontSize: 20,
                            color: CustomColor.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(HomeDriver());
                          },
                          child: Row(
                            children: [
                              CustomTextStyle(
                                text: "Where To",
                                color: CustomColor.background,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right, size: 40),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CustomTextButton(
                          text: "Add Home",
                          onPressed: () {
                            Get.to(AddHomeScreen());
                          },
                          icon: Icon(Icons.home, color: CustomColor.textColor),
                          backgroundColor: CustomColor.background,
                          textColor: CustomColor.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                        Obx(
                              () => Text(
                            hdeshboard_controller.text.isEmpty
                                ? ''
                                : hdeshboard_controller.text.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextButton(
                      text: "Add Work",
                      onPressed: () {
                        Get.to(AddWork_Screen());
                      },
                      icon: Icon(Icons.home, color: CustomColor.textColor),
                      backgroundColor: CustomColor.background,
                      textColor: CustomColor.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    CustomTextButton(
                      text: "Previous trip",
                      onPressed: () {
                        Get.to(PreviousTrip_Screen());
                      },
                      icon: Icon(Icons.home, color: CustomColor.textColor),
                      backgroundColor: CustomColor.background,
                      textColor: CustomColor.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
