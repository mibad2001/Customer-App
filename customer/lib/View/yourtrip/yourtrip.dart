import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/yourtrip/yourtrip_Controller.dart';
import '../Widgets/color.dart';

class Yourtrip extends StatefulWidget {
  Yourtrip({super.key});

  @override
  State<Yourtrip> createState() => _YourtripState();
}

class _YourtripState extends State<Yourtrip> {
  final YourTripController tripControl = Get.put(YourTripController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.background,
        body: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    height: 40,
                    width: 40,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu, size: 25, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.26),

                Text(
                  CustomText.Your_Trip,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Obx(
                ()=> Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    color:tripControl.selectedIndex.value == 0?
                    Colors.white60
                    :CustomColor.background,

                    child: TextButton(
                      onPressed: () {
                        tripControl.ChangeIndex(0);
                      },
                      child: Text(
                        "SCHEDULED",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                           fontWeight:  FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    color:tripControl.selectedIndex.value == 1?
                    Colors.white60
                        :CustomColor.background,

                    child: TextButton(
                      onPressed: () {
                        tripControl.ChangeIndex(1);
                      },
                      child: Text(
                        "HISTORY",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight:FontWeight.bold

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Obx(
                () => tripControl.selectedIndex.value == 0
                    ? Container(
                        height: 700,
                        width: 400,

                        child:Center(
                            child: Text("NO BOOKING AVALIABLE",
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),))
                      )
                    : Container(
                  height: 700,
                  width: 400,
                  padding: EdgeInsets.only(top: 20),
                  child:Center(
                    child: Container(
                      height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border:Border.all(
                            color: Colors.white60,
                            width: 4
                          ) ,
                          color: Colors.black
                      ),
                      child: Column(
                        children: [
                          //====================================     card top text
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            color: Colors.white60,
                            height: 20,
                            child:
                            Row(
                              children: [
                                Text("Ref: 123456",style: TextStyle(color: Colors.white),),
                                SizedBox(width: 85,),
                                Icon(Icons.access_time,color: Colors.white,size: 15,),
                                Text("00/00/2001",style: TextStyle(color: Colors.white),),
                                SizedBox(width: 10,),
                                Text("00:00",style: TextStyle(color: Colors.white),),


                              ],
                            ),
                          ),


                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            height: 90,
                              
                            child: Row(
                              children: [

                                Container(
                                  margin:  EdgeInsets.only(left: 10),
                                  color:Colors.black,
                                  padding: EdgeInsets.all(10),
                                  height:80,
                                  width: 130,

                                  child: Center(
                                    child: Text(
                                      "1A Worrior "
                                          "Garden St.LEO"
                                          " TN36eb",
                                      softWrap: true,
                                      maxLines:3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),

                                Icon(Icons.arrow_forward_rounded,size: 30,color: Colors.white,),

                                SizedBox(width: 10,),

                                Container(
                                  margin:  EdgeInsets.only(left: 10),
                                  color:Colors.black,
                                  padding: EdgeInsets.all(10),
                                  height:80,
                                  width: 130,
                                  child: Center(
                                    child: Text(
                                      "Flat  1 "
                                          "Bland fold"
                                          " London Nw6",
                                      softWrap: true,
                                      maxLines:3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            )
                          ),
                          SizedBox(height: 2,),

                          Container(
                            padding: EdgeInsets.only(left: 8),
                            height:80 ,

                            child: Row(
                              children: [
                                Icon(Icons.car_repair),
                                Container(
                                  height: 60,
                                  padding: EdgeInsets.only(top:2),
                                  child: Column(
                                    children: [
                                      Text(
                                        " ESTATE CAR",
                                        softWrap: true,
                                        maxLines:3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        "&177.00",
                                        softWrap: true,
                                        maxLines:3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),

                              Container(
                                height:20,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.red

                                ),
                              )

                            ],
                            ),
                          ),



                        ],
                      ),
                    ),
                  ),
                  ),
                    
                 
                      ),
              ),


        
          ],
        ),
      ),
    );
  }
}
