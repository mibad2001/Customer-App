
import 'package:customer/Controller/Ride/RideController.dart';
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Ride/RideController.dart';
import '../Widgets/elevat_button.dart';
import '../Widgets/text_button.dart';
import 'ridesearchscreen.dart';

class RideInfoScreen extends StatefulWidget {
   RideInfoScreen({super.key});

  @override
  State<RideInfoScreen> createState() => _RideInfoScreenState();
}

class _RideInfoScreenState extends State<RideInfoScreen> {
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
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: CustomColor.Container_Colors,
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
                      color: CustomColor.textfield_fill,
                    ),
                  ),

                  const SizedBox(width: 5),
                  // Title centered
                  Expanded(
                    child: Center(
                      child: Text(
                        CustomText.Ride_Info,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.textfield_fill,
                        ),
                      ),
                    ),
                  ),


                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.edit_notifications_sharp,
                      size: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.yellow,
                    ),
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
        height: MediaQuery.of(context).size.height*0.72,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: rideController.CarName.length,
          itemBuilder: (context, index) {
            return Obx(() {
              bool isSelected = rideController.selectedIndex.value == index;

              return GestureDetector(
                onTap: () {
                  rideController.selectItem(index);
                },
                child: Container(
                  height: 120,
                  width: 380,
                  margin:  EdgeInsets.all(8),
                  padding:  EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.all(Radius.circular(20)),
                    color: isSelected
                        ?  CustomColor.Container_Colors
                        : CustomColor.background,
                    border: Border.all(
                      color: isSelected ?  CustomColor.Container_Colors
                          : Colors.grey.shade400,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rideController.CarName[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? Colors.white
                              : CustomColor.Text_Color,
                        ),
                      ),
                       SizedBox(height: 15),
                      Row(
                        children: [
                           SizedBox(width: 20),
                          Icon(
                            Icons.car_repair,
                            size: 30,
                            color: isSelected
                                ? Colors.white
                                : CustomColor.Icon_Color,
                          ),
                           SizedBox(width: 5),
                          Icon(
                            Icons.person,
                            size: 18,
                            color: isSelected
                                ? Colors.white
                                : CustomColor.Icon_Color,
                          ),
                           SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward_outlined,
                            size: 18,
                            color: isSelected
                                ? Colors.white
                                : CustomColor.Icon_Color,
                          ),
                           SizedBox(width: 5),
                          Text(
                            rideController.seats[index],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? Colors.white
                                  : CustomColor.Text_Color,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
          },
        ),
      ),









          ],
        ),

        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.only(top: 5.0,bottom:20 ,left: 10,right: 10),
          child: SizedBox(
            height: 50,
            width: 300  ,
            child: MyElevatedButton(
              text: 'Schedule Booking',
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    decoration: const BoxDecoration(
                      color: CustomColor.textfield_fill,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    height: 350,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15),

                        // ---------- Heading ----------
                        const Text(
                          "Schedule Ride",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.Text_Color,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ---------- Time Buttons ----------
                        Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ----- ASAP -----
                            SizedBox(
                              width: 100,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () => rideController.setASAP(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: rideController.selectedTimeOption.value == "ASAP"
                                      ? CustomColor.Container_Colors
                                      : Colors.black54,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  "ASAP",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: rideController.selectedTimeOption.value == "ASAP"
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),

                            // ----- 15 min -----
                            SizedBox(
                              width: 100,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () => rideController.addMinutes(15),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: rideController.selectedTimeOption.value == "15 min"
                                      ?  CustomColor.Container_Colors
                                      : Colors.black54,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  "15 min",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: rideController.selectedTimeOption.value == "15 min"
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),

                            // ----- 30 min -----
                            SizedBox(
                              width: 100,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () => rideController.addMinutes(30),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: rideController.selectedTimeOption.value == "30 min"
                                      ?  CustomColor.Container_Colors
                                      : Colors.black54,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  "30 min",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: rideController.selectedTimeOption.value == "30 min"
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),

                        const SizedBox(height: 25),

                        // ---------- Date & Time ----------
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ----- Date Picker -----
                              Obx(() => GestureDetector(
                                onTap: () => rideController.pickDate(context),
                                child: Container(
                                  width: 150,
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.calendar_today,
                                          color: Colors.white, size: 18),
                                      const SizedBox(width: 6),
                                      Flexible(
                                        child: Text(
                                          rideController.formattedDate,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                              const SizedBox(width: 15),

                              // ----- Time Picker -----
                              Obx(() => GestureDetector(
                                onTap: () => rideController.pickTime(context),
                                child: Container(
                                  width: 150,
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.access_time,
                                          color: Colors.white, size: 18),
                                      const SizedBox(width: 6),
                                      Flexible(
                                        child: Text(
                                          rideController.formattedTime(context),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),

                        const SizedBox(height: 35),

                        // ========================================================== Book Ride Button
                        SizedBox(
                            width: 220,
                            height: 50,
                            child:  SizedBox(
                              height: 50,
                              width: 350  ,
                              child: MyElevatedButton(
                                text: 'BOOK RIDE',
                                onPressed: () {
                                  Get.to(RideSearchScreen());
                                },

                                fontSize: 20,
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                );
              },

              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}


