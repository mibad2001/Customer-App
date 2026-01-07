import 'package:customer/Controller/Home/home-controller.dart';
import 'package:customer/View/Deshboard/AddHome/add_home.dart';
import 'package:customer/View/Home/widget.dart';
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:customer/View/textstyle/apptextstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Deshboard/deshboard_cont.dart';
import '../../Controller/Home/model/pickuplocationmodel.dart';
import '../Deshboard/AddWork/add_work.dart';
import '../Widgets/elevat_button.dart';
import '../profile/controller/profile_controller.dart';
import 'dialogbox.dart';

class HomeDriver extends StatelessWidget {
  HomeDriver({super.key});

  final homeC = Get.isRegistered<SwapController>()
      ? Get.find<SwapController>()
      : Get.put(SwapController());

  // final homeC = Get.find<SwapController>();
  // final homeC = Get.put(SwapController());

  //final deshboardController = Get.put(DeshBoardAddHome_Controller());
  //final deshboardController = Get.find<DeshBoardAddHome_Controller>();
  final profileController = Get.isRegistered<profileModelController>()
      ? Get.find<profileModelController>()
      : Get.put(profileModelController());

  @override
  Widget build(BuildContext context) {
    //  final DeshBoardAddHome_Controller hdeshboard_controller = Get.find();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        //backgroundColor: CustomColor.background,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 30, 1, 44),
                Color.fromARGB(255, 227, 194, 242),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),

          child: GetBuilder<SwapController>(
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () => Get.back(),
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: CustomColor.Icon_Color,
                                    size: 30,
                                  ),
                                ),

                                const SizedBox(height: 20),

                                ///======================================================== ================= MAIN AREA with Equal Padding
                                ///
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          /// ---------- PICKUP ----------
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 25.0,
                                            ),
                                            child: CustomTextField(
                                              controller: homeC.pickUp,
                                              hintText: "Pick Up",
                                              borderRadius: 20,
                                              prefixIcon: Icon(
                                                Icons.circle,
                                                size: 15,
                                                color: CustomColor
                                                    .textField_Icon_Color,
                                              ),
                                              onChanged: (v) =>
                                                  homeC.pickupLocation(v),
                                            ),
                                          ),
                                          const SizedBox(height: 12),

                                          /// ---------- VIA FIELDS ----------
                                          Obx(
                                            () => Column(
                                              children: [
                                                if (homeC.showVia1.value)
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: CustomTextField(
                                                          controller: homeC
                                                              .viaController1,
                                                          hintText: "1st Stop",
                                                          borderRadius: 20,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .wb_sunny_outlined,
                                                            size: 20,
                                                            color: CustomColor
                                                                .textField_Icon_Color,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      GestureDetector(
                                                        onTap: () => homeC
                                                            .removeField(1),
                                                        child: const Icon(
                                                          Icons.clear,
                                                          color: CustomColor
                                                              .Icon_Color,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (homeC.showVia1.value)
                                                  const SizedBox(height: 12),

                                                if (homeC.showVia2.value)
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: CustomTextField(
                                                          controller: homeC
                                                              .viaController2,
                                                          hintText: "2nd Stop",
                                                          borderRadius: 20,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .wb_sunny_outlined,
                                                            size: 20,
                                                            color: CustomColor
                                                                .textField_Icon_Color,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      GestureDetector(
                                                        onTap: () => homeC
                                                            .removeField(2),
                                                        child: const Icon(
                                                          Icons.clear,
                                                          color: CustomColor
                                                              .Icon_Color,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (homeC.showVia2.value)
                                                  const SizedBox(height: 12),
                                              ],
                                            ),
                                          ),

                                          /// ---------- DROPOFF ----------
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 25.0,
                                            ),
                                            child: CustomTextField(
                                              controller: homeC.dropOff,
                                              hintText: "Destination",
                                              borderRadius: 20,
                                              prefixIcon: Icon(
                                                Icons.location_pin,
                                                size: 20,
                                                color: CustomColor
                                                    .textField_Icon_Color,
                                              ),
                                              onChanged: (v) =>
                                                  homeC.dropOffLocation(v),
                                            ),
                                          ),
                                          const SizedBox(height: 20),


                                        ],
                                      ),

                                      /// ---------- SWAP BUTTON ----------
                                      Obx(
                                            () => homeC.canShowSwap
                                            ? Positioned(
                                          right: -5,
                                          top: 40,
                                          child: RotatedBox(
                                            quarterTurns: 1,
                                            child: GestureDetector(
                                              onTap: homeC.swapField,
                                              child: Icon(
                                                Icons.compare_arrows,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        )
                                            : SizedBox.shrink(),
                                      ),

                                    ],
                                  ),
                                ),

                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //     horizontal: 15,
                                //   ),
                                //   child: Stack(
                                //     children: [
                                //       Column(
                                //         children: [
                                //
                                //           /// ---------- PICKUP ----------
                                //           Padding(
                                //             padding: const EdgeInsets.only(
                                //               right: 25.0,
                                //             ),
                                //             child:
                                //
                                //             CustomTextField(
                                //               controller: homeC.pickUp,
                                //               //focusNode: homeC.pickUpFocus,
                                //               hintText: "Pick Up",
                                //               borderRadius: 20,
                                //               prefixIcon: Icon(
                                //                 Icons.circle, size: 15,
                                //                 color: CustomColor
                                //                     .textField_Icon_Color,),
                                //               onChanged: (v) {
                                //                 homeC.pickupLocation(v);
                                //               },
                                //             ),
                                //             //   ],
                                //             // ),
                                //           ),
                                //
                                //
                                //           const SizedBox(height: 12),
                                //
                                //           /// ---------- ADD STOP(S) ----------
                                //
                                //
                                //
                                //           Obx(
                                //                 () =>
                                //                 Column(
                                //                   children: [
                                //                     for (int index = 0; index < controller.viaControllers.length; index++)
                                //                       ...[
                                //                       Row(
                                //                         children: [
                                //
                                //                           Expanded(
                                //                             child: CustomTextField(
                                //                               controller: homeC.viaControllers[index],
                                //                               hintText: index == 0
                                //                                   ? "1st Stop"
                                //                                   : "${index + 1}nd Stop",
                                //                               borderRadius: 20,
                                //                               prefixIcon: Icon(Icons.wb_sunny_outlined,
                                //                                 size: 20,
                                //                                 color: CustomColor.textField_Icon_Color,),
                                //                               // onChanged: (v) {
                                //                               //   controller.activeViaIndex.value = index;
                                //                               //   homeC.viaLocation(v, index);
                                //                               // },
                                //                             ),
                                //                           ),
                                //
                                //                           const SizedBox(
                                //                               width: 5),
                                //
                                //                           GestureDetector(
                                //                             onTap: () {
                                //                               controller.removeField(index);
                                //                             },
                                //                             child: const Icon(
                                //                               Icons.clear,
                                //                               color:CustomColor.Icon_Color,
                                //                               size: 20,
                                //                             ),
                                //                           ),
                                //                         ],
                                //                       ),
                                //
                                //                       const SizedBox(
                                //                           height: 12),
                                //                     ],
                                //                   ],
                                //                 ),
                                //           ),
                                //
                                //           /// ---------- DROPOFF ----------
                                //           Padding(
                                //             padding: const EdgeInsets.only(
                                //               right: 25.0,
                                //             ),
                                //             child:
                                //             // Row(
                                //             //   children: [
                                //             // Icon(Icons.edit_location,color: CustomColor.Icon_Color,),SizedBox(width: 3,),
                                //             CustomTextField(
                                //               controller: homeC.dropOff,
                                //               hintText: "Destination",
                                //               borderRadius: 20,
                                //               prefixIcon: Icon(
                                //                 Icons.location_pin, size: 20,
                                //                 color: CustomColor
                                //                     .textField_Icon_Color,),
                                //               onChanged: (v) {
                                //                 homeC.dropOffLocation(v);
                                //               },
                                //             ),
                                //             //   ],
                                //             // ),
                                //           ),
                                //
                                //           const SizedBox(height: 20),
                                //         ],
                                //       ),
                                //
                                //       /// ---------- SWAP BUTTON CENTERED ----------
                                //       Obx(
                                //             () =>
                                //         controller.showInterchange.value
                                //             ? Positioned(
                                //           right: -5,
                                //           top:
                                //           65,
                                //           // PERFECT midpoint between pickup & drop
                                //           child: RotatedBox(
                                //             quarterTurns: 1,
                                //             child: GestureDetector(
                                //               onTap: controller.swapField,
                                //               child: Icon(
                                //                 Icons.compare_arrows,
                                //                 color: Colors.white,
                                //                 size: 30,
                                //               ),
                                //             ),
                                //           ),
                                //         )
                                //             : SizedBox.shrink(),
                                //       ),
                                //     ],
                                //   ),
                                // ),

                                /// ---------- +ADD(VIA) BUTTON ----------
                                Padding(
                                  padding: const EdgeInsets.only(right: 45),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: controller.addField,
                                        child: Text(
                                          '+Add(Via)',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),
                              ],
                            ),
                          ),

                          ///
                          Obx(() {
                            if (controller.searchloading.value ||
                                controller.dropSearchLoading.value) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: LinearProgressIndicator(
                                  minHeight: 3,
                                  color: Colors.white,
                                  backgroundColor: Colors.white24,
                                ),
                              );
                            }

                            if ((controller.pickUp.text.isEmpty) &&
                                (controller.dropOff.text.isEmpty)) {
                              return containerWidget();
                            }

                            if (controller.searchList.isNotEmpty &&
                                controller.pickUp.text.isNotEmpty) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                height: homeC.viaControllers.length == 2
                                    ? MediaQuery.of(context).size.height * 0.2
                                    : homeC.viaControllers.length == 1
                                    ? MediaQuery.of(context).size.height * 0.25
                                    : MediaQuery.of(context).size.height * 0.45,

                                child: ListView.builder(
                                  itemCount: controller.searchList.length,
                                  itemBuilder: (context, index) {
                                    final item = controller.searchList[index];
                                    return ListTile(
                                      leading: Icon(
                                        Icons.location_on,
                                        color: CustomColor.Icon_Color,
                                      ),
                                      title: Text(
                                        "${item.name ?? ""} ${item.postcode ?? ""}",
                                        style: AppTextStyles.regular(),
                                      ),
                                      //subtitle: Text(item.postcode ?? "", style: AppTextStyles.regular()),
                                      onTap: () {
                                        homeC.pickUp.text = item.name ?? "";
                                        homeC.searchList.clear();
                                      },
                                    );
                                  },
                                ),
                              );
                            }
                            if (controller.dropSearchList.isNotEmpty &&
                                controller.dropOff.text.isNotEmpty) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                height: homeC.viaControllers.length == 2
                                    ? MediaQuery.of(context).size.height * 0.2
                                    : homeC.viaControllers.length == 1
                                    ? MediaQuery.of(context).size.height * 0.25
                                    : MediaQuery.of(context).size.height * 0.45,

                                child: ListView.builder(
                                  itemCount: controller.dropSearchList.length,
                                  itemBuilder: (context, index) {
                                    final item =
                                        controller.dropSearchList[index];
                                    return ListTile(
                                      leading: Icon(
                                        Icons.location_on,
                                        color: CustomColor.Icon_Color,
                                      ),
                                      title: Text(
                                        "${item.name ?? ""} ${item.postcode ?? ""}",
                                        style: AppTextStyles.regular(),
                                      ),
                                      // subtitle: Text(item.postcode ?? "", style: AppTextStyles.small()),
                                      onTap: () {
                                        homeC.dropOff.text = item.name ?? "";
                                        homeC.dropSearchList.clear();
                                      },
                                    );
                                  },
                                ),
                              );
                            }

                            return containerWidget();
                          }),

                          SizedBox(height: 15),
                        ],
                      ),
                    ),

                    //Spacer(),
                    /// ==============================================================  BOTTOM BUTTONS+=> CONTINUE / SET LOCATION ON MAP
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 55,
                            width: 250,
                            child: MyElevatedButton(
                              text: '',
                              textWidget: FittedBox(
                                child: Text(
                                  "Continue",
                                  style: AppTextStyles.medium(
                                    size: 25,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.dialog(
                                  Dialog(
                                    backgroundColor: Color(0xFF231F20),
                                    child: Dialogbox(),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 10),

                          // SET LOCATION ON MAP
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 25,
                                  color: Colors.red,
                                  //CustomColor.Icon_Color,
                                ),
                                const SizedBox(width: 5),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed('/PickupScreen');
                                  },
                                  child: Text(
                                    "SET LOCATION ON MAP",
                                    style: AppTextStyles.medium(
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
