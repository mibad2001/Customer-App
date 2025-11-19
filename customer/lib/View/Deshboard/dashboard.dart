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
import '../yourtrip/yourtrip.dart';
import 'drawer/drawer.dart';


class DeshBoard_Screen extends StatelessWidget {
  DeshBoard_Screen({super.key});

  final DeshBoardAddHome_Controller deshboard_controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    //final hight = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;


    return SafeArea(
      child: Scaffold(
        backgroundColor:CustomColor.background,
        drawerEnableOpenDragGesture: false,
        key: _scaffoldkey,
        drawer: appDrawer(),
        body: Container(
          height:MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 30, 1, 44),
                Color.fromARGB(255, 227, 194, 242)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),

          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 550,
                  child: Stack(
                    children: [
                      ///////////////////////////////////////// Map
                      Container(
                        height: 550,
                        child: Image(image: AssetImage("assets/images/map2.png"),fit: BoxFit.cover,),
                        //         child: OpenStreetMapWidget(),
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
                                    _scaffoldkey.currentState!.openDrawer();

                                    // Get.to(ProfileScreen());
                                  },
                                  icon: Icon(Icons.person,size: 30
                                    ,color: Colors.grey,)
                              )
                          ),
                        ),
                      ),



                    ],
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  decoration: BoxDecoration(
                    color:Color(0xFF5E266F)
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                  ),

                    padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 10.0,
                      right: 10.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),

                          child: Row(
                            children: [
                              Icon(
                                Icons.person_2_rounded,
                                size: 27,
                                color: CustomColor.textColor,
                              ),
                              SizedBox(width: 10),
                              CustomTextStyle(
                                text: "User Name",
                                fontSize: 20,
                                color: CustomColor.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        //SizedBox(height: 10),

                        Container(
                          margin:EdgeInsets.all(10),
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Color(0xFFB7D98F).withOpacity(0.2),
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
                                    color: CustomColor.textColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_right, size: 40,color: CustomColor.Icon_Color,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: 10,),
                        Column(
                          children: [
                            CustomTextButton(
                              text: "Add Home",
                              onPressed: () {
                                Get.to(AddHomeScreen());
                              },
                              icon: Icon(
                                  Icons.home, color: CustomColor.textColor),
                              textColor: CustomColor.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                            Obx(
                                  () => Container(
                                child: Text(
                                  deshboard_controller.homeAddress.isEmpty
                                      ? ''
                                      : deshboard_controller.homeAddress.toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
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

                          textColor: CustomColor.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                        SizedBox(height: 10,),
                        CustomTextButton(
                          text: "Previous trip",
                          onPressed: () {
                            Get.to(Yourtrip());
                          },
                          icon: Icon(Icons.home, color: CustomColor.textColor),
                          textColor: CustomColor.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ],
                    ),


                ),


              ],
            ),
          ),
        ),
      )
    );
  }
}
