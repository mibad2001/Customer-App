import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/reebooking/reebookingcontroller.dart';
import '../Widgets/color.dart';
import '../Widgets/elevat_button.dart';
import '../Widgets/textformfield.dart';
import '../payments/paymentscreen.dart';
import 'extras.dart';

class ReebookingScreen extends StatelessWidget {
  ReebookingScreen({super.key});

  final BookingController reebookingController = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.background,
        body: Column(
          children: [
            // ============================================  Map
            Stack(
              children: [
                Container(
                  height: 400,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/map_image.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
      
      
                Positioned(
                  top: 40,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      icon:  Icon(Icons.arrow_back, color:CustomColor.Icon_Color),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
      
              ],
            ),
      
            // ================================================ Vehicle Select
            Expanded(
              child: Container(
                width: double.infinity,
                decoration:  BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  children: [
                     SizedBox(height: 8),
                    Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                     SizedBox(height: 10),
      
                    // ==================================================       Vehicle List
                    Expanded(
                      child: ListView.builder(
                        itemCount: reebookingController.vehicleList.length,
                        itemBuilder: (context, index) {
                          var vehicle = reebookingController.vehicleList[index];
      
                          return Obx(() {
                            bool isSelected =
                                reebookingController.selectedVehicleIndex.value == index;
      
                            return GestureDetector(
                              onTap: () {
                                reebookingController.selectedVehicleIndex.value = index;
                              },
                              child: Container(
                                margin:  EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                padding:  EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.white10 : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: isSelected ? Colors.white : Colors.white30,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Vehicle Info
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${vehicle["name"]}",
                                          style:  TextStyle(
                                              color:CustomColor.Text_Color, fontSize: 16),
                                        ),
                                         SizedBox(height: 5),
                                        Row(
                                          children: [
                                             Icon(Icons.person,
                                                color: CustomColor.Icon_Color, size: 18),
                                            Text(" x${vehicle["people"]}",
                                                style:
                                                 TextStyle(color: CustomColor.Text_Color)),
                                             Icon(Icons.work,
                                                color: CustomColor.Icon_Color, size: 18),
                                            Text(" x${vehicle["cases"]}",
                                                style:
                                                 TextStyle(color: CustomColor.Text_Color)),
                                          ],
                                        ),
                                      ],
                                    ),
      
                                    // ===========================================       vehicle Icon & Price
                                    Row(
                                      children: [
                                         Icon(Icons.directions_car,
                                            color: CustomColor.Icon_Color, size: 32),
                                         SizedBox(width: 10),
                                        Text(
                                          "£${vehicle["price"]}",
                                          style:  TextStyle(
                                              color: Colors.white, fontSize: 16),
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
      
      
                    // ==================================================    Bottom Tab
                    const Divider(color: Colors.white24),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          InkWell(
                              onTap:(){
                                Get.to(PaymentScreen());
                                },
                              child: BottomButton(icon: Icons.credit_card, button_name: "Card")),
                          InkWell(
                              onTap:(){ Get.to(ExtrasScreen());
                              },
                              child: BottomButton(icon: Icons.add_circle_outline, button_name: "Extras")),
                          InkWell(
                              onTap:(){
                                Get.bottomSheet(
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    height: 350,
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
                                            color: Colors.white,
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
                                                onPressed: () => reebookingController.setASAP(),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: reebookingController.selectedTimeOption.value == "ASAP"
                                                      ? Colors.blueAccent
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
                                                    fontWeight: reebookingController.selectedTimeOption.value == "ASAP"
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
                                                onPressed: () => reebookingController.addMinutes(15),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: reebookingController.selectedTimeOption.value == "15 min"
                                                      ? Colors.blueAccent
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
                                                    fontWeight: reebookingController.selectedTimeOption.value == "15 min"
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
                                                onPressed: () => reebookingController.addMinutes(30),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: reebookingController.selectedTimeOption.value == "30 min"
                                                      ? Colors.blueAccent
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
                                                    fontWeight: reebookingController.selectedTimeOption.value == "30 min"
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
                                                onTap: () => reebookingController.pickDate(context),
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
                                                          reebookingController.formattedDate,
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
                                                onTap: () => reebookingController.pickTime(context),
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
                                                          reebookingController.formattedTime(context),
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

                                        // ---------- Book Ride Button ----------
                                        SizedBox(
                                            width: 220,
                                            height: 50,
                                            child:  SizedBox(
                                              height: 50,
                                              width: 350  ,
                                              child: MyElevatedButton(
                                                text: 'Confirm',
                                                onPressed: () {
                                                 // Get.to();
                                                },
                                                backgroundColor: CustomColor.Icon_Color,
                                                textColor: Colors.black,
                                                fontSize: 20,
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: BottomButton(icon: Icons.schedule, button_name: "Schedule")),
                          InkWell(
                              onTap:(){

                                Get.bottomSheet(
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height * 0.45,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),


                                        Row(
                                          children: [

                                            SizedBox(width: 20,),

                                            IconButton(
                                              icon: Icon(Icons.cancel_outlined, color: CustomColor.Icon_Color),
                                              iconSize: 35,
                                              onPressed: () => Get.back(),
                                            ),


                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  "ADD ORDER DETAILS",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),


                                            const SizedBox(width: 48),
                                          ]
                                        ),

                                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),


                                        const Text(
                                          "Order number",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        CustomTextField(
                                          hintText: "Type your order number",
                                          borderRadius: 15,
                                          fillColor: CustomColor.textfield_fill,
                                        ),

                                        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                                        const Text(
                                          "Name on order",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        CustomTextField(
                                          hintText: "Type name on order",
                                          borderRadius: 15,
                                          fillColor: CustomColor.textfield_fill,
                                        ),

                                        SizedBox(height: MediaQuery.of(context).size.height * 0.025),


                                        Center(
                                          child: SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.053,
                                            width: MediaQuery.of(context).size.width * 0.5,
                                            child: MyElevatedButton(
                                              text: 'DONE',
                                              onPressed: () {},
                                              backgroundColor: Colors.black,
                                              textColor: CustomColor.Icon_Color,
                                              fontSize: MediaQuery.of(context).size.width * 0.035,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );














                                // Get.bottomSheet(
                                //   Container(
                                //     decoration: const BoxDecoration(
                                //       color: Colors.grey,
                                //       borderRadius: BorderRadius.only(
                                //         topLeft: Radius.circular(30),
                                //         topRight: Radius.circular(30),
                                //       ),
                                //     ),
                                //     height: 400,
                                //     width: MediaQuery.of(context).size.width*1,
                                //     child:Padding(
                                //       padding: const EdgeInsets.all(10.0),
                                //       child: Column(
                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                //         children: [
                                //           SizedBox(height: 10,),
                                //           Row(
                                //             children: [
                                //               IconButton(
                                //                 icon:  Icon(Icons.cancel_outlined, color:CustomColor.Icon_Color),
                                //                 onPressed: () {
                                //                   Get.back();
                                //                 },
                                //               ),
                                //               SizedBox(width: 10,),
                                //               Text(
                                //                 "ADD ORDER DETAILS",
                                //                 style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                                //               ),
                                //               SizedBox(width: 20,),
                                //               SizedBox(
                                //                 height: 50,
                                //                 width:   100,
                                //                 child: MyElevatedButton(
                                //                   text: 'DONE',
                                //                   onPressed: () {  },
                                //                   backgroundColor: Colors.black,
                                //                   textColor: CustomColor.Icon_Color,
                                //                   fontSize: 15,
                                //                 ),
                                //               ),
                                //
                                //
                                //             ],
                                //           ),
                                //           SizedBox(height: 10,),
                                //           Text(
                                //             "Oder number",
                                //             style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                                //           ),
                                //           SizedBox(height: 3),
                                //
                                //           Padding(
                                //             padding: const EdgeInsets.all(15.0),
                                //             child: CustomTextField(
                                //               // controller: ,
                                //               hintText: "Type your order number",
                                //               borderRadius: 15,
                                //               fillColor: CustomColor.textfield_fill,
                                //             ),
                                //           ),
                                //           SizedBox(height: 5,),
                                //           Text(
                                //             "Name on oder",
                                //             style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                                //           ),
                                //           SizedBox(height: 3),
                                //
                                //           Padding(
                                //             padding: const EdgeInsets.all(15.0),
                                //             child: CustomTextField(
                                //               // controller: ,
                                //               hintText: "Type name on Oder",
                                //               borderRadius: 15,
                                //               fillColor: CustomColor.textfield_fill,
                                //             ),
                                //           ),
                                //
                                //
                                //
                                //
                                //         ],
                                //       ),
                                //     ),
                                //   )
                                // );

                              },
                              child: BottomButton(icon: Icons.shopping_cart_outlined, button_name: "Shopping")),
                          InkWell(
                              onTap:(){Get.toNamed('/PromoScreen');},
                              child: BottomButton(icon: Icons.local_offer_outlined, button_name: "Promo")),
                        ],
                      ),
                    ),
                     SizedBox(height: 10),
                    //==========================================      Confirm Button
      
                    SizedBox(
                      height: 50,
                      width: 350  ,
                      child: MyElevatedButton(
                        text: 'Confirm Booking',
                        onPressed: () {  },
                        backgroundColor: CustomColor.Icon_Color,
                        textColor: Colors.black,
                        fontSize: 20,
                      ),
                    )
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

// =========================================================== tab bar  Button

class BottomButton extends StatelessWidget {
  final IconData icon;
  final String button_name ;
  const BottomButton({required this.icon, required this.button_name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 22),
         SizedBox(height: 3),
        Text(button_name,
            style:  TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
