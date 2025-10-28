
import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Deshboard/Widget/openstrretmap.dart';
import '../Deshboard/Widget/osm.dart';
import '../Widgets/all_text.dart';

class TripDetail extends StatelessWidget {
  const TripDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: CustomColor.background,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back, size: 25, color: Colors.white),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.22,),
                Text(
                  CustomText.Trip_Detail,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),

            //=========================  Map
            // Container(
            //   height: 300,
            //   child:  OpenStreetMapWidget(),
            // ),

            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: 100,
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Booking Status",
                        style: TextStyle(
                        fontSize: 14  ,
                          color: Colors.blueGrey
                      ),
                      ),
                      Text("Cancelled",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text("Booking REF : 123456",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey
                        ),
                      ),


                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width*0.4,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("CASH",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueGrey
                        ),
                      ),
                      Text(
                        "&177.00",
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 20,
                          color: CustomColor.Text_Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 10,),

            Row(
              children: [

                Text("00/00/2025 00:00",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.33,),

                Text("ESTATE CAR",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey
                  ),
                ),
              ],
            ),

            SizedBox(height: 15,),


            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle_sharp,size: 20,color: Colors.blue),
                      SizedBox(width: 10,),
                      Text(
                        "1A Worrior "
                            "Garden St.LEO"
                            " TN36eb",
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: CustomColor.Text_Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 2,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  ),


                  Row(
                    children: [
                      Icon(Icons.location_on,size: 20,color: Colors.red,),
                      SizedBox(width: 10,),
                      Text(
                        "Flat  1 "
                            "Bland fold"
                            " London Nw6",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: CustomColor.Text_Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )

              ],
              ),
            )




          ],
        ),
      ),
    ));
  }
}
