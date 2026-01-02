import 'package:bot_toast/bot_toast.dart';
import 'package:customer/Controller/Home/home-controller.dart';
import 'package:customer/View/Deshboard/AddHome/add_home.dart';
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/text_button.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:customer/View/textstyle/apptextstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Deshboard/deshboard_cont.dart';
import '../Deshboard/AddWork/add_work.dart';
import '../Widgets/elevat_button.dart';
import '../profile/controller/profile_controller.dart';

class HomeDriver extends StatelessWidget {
  HomeDriver({super.key});

  final homeC = Get.isRegistered<SwapController>()
  ? Get.find<SwapController>()
  :  Get.put(SwapController());

 // final homeC = Get.find<SwapController>();
 // final homeC = Get.put(SwapController());

  //final deshboardController = Get.put(DeshBoardAddHome_Controller());
  final deshboardController = Get.find<DeshBoardAddHome_Controller>();
  final profileController = Get.isRegistered<profileModelController>()
      ? Get.find<profileModelController>()
      :  Get.put(profileModelController());



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

                                /// ===== MAIN AREA with Equal Padding =====
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
                                            child:
                                            // Row(
                                            //   children: [
                                            // Icon(Icons.stop_circle,color: CustomColor.Icon_Color,),
                                            // SizedBox(width: 3,),
                                            CustomTextField(
                                              controller: homeC.pickUp,
                                              hintText: "Pick Up",
                                              borderRadius: 20,
                                              prefixIcon: Icon(Icons.circle,size: 15,color: CustomColor.textField_Icon_Color,),
                                            ),
                                            //   ],
                                            // ),
                                          ),

                                          const SizedBox(height: 12),

                                          // ---------- ADD STOP(S) ----------
                                          Obx(
                                                () => Column(
                                              children: [
                                                for (
                                                int index = 0;
                                                index < controller.controllers.length;
                                                index++
                                                ) ...[
                                                  Row(
                                                    children: [
                                                      // Icon(Icons.stop_circle,color: CustomColor.Icon_Color,),
                                                      // SizedBox(width: 3,),
                                                      Expanded(
                                                        child: CustomTextField(
                                                          controller: homeC
                                                              .controllers[index],
                                                          hintText: index == 0
                                                              ? "1st Stop"
                                                              : "${index + 1}nd Stop",
                                                          borderRadius: 20,
                                                          prefixIcon: Icon(Icons.wb_sunny_outlined,size: 20,color: CustomColor.textField_Icon_Color,),
                                                        ),
                                                      ),

                                                      const SizedBox(width: 5),

                                                      GestureDetector(
                                                        onTap: () => controller
                                                            .removeField(index),
                                                        child: const Icon(
                                                          Icons.clear,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  const SizedBox(height: 12),
                                                ],
                                              ],
                                            ),
                                          ),

                                          /// ---------- DROPOFF ----------
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 25.0,
                                            ),
                                            child:
                                            // Row(
                                            //   children: [
                                            // Icon(Icons.edit_location,color: CustomColor.Icon_Color,),SizedBox(width: 3,),
                                            CustomTextField(
                                              controller: homeC.dropOff,
                                              hintText: "Destination",
                                              borderRadius: 20,
                                              prefixIcon: Icon(Icons.location_pin,size: 20,color: CustomColor.textField_Icon_Color,),
                                            ),
                                            //   ],
                                            // ),
                                          ),

                                          const SizedBox(height: 20),
                                        ],
                                      ),

                                      /// ---------- SWAP BUTTON CENTERED ----------
                                      Obx(
                                            () => controller.showInterchange.value
                                            ? Positioned(
                                          right: -5,
                                          top:
                                          65, // PERFECT midpoint between pickup & drop
                                          child: RotatedBox(
                                            quarterTurns: 1,
                                            child: GestureDetector(
                                              onTap: controller.swapField,
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

                          // ===============================================  fields
                          //  Container(
                          //    height:  homeC.viaControllers.length == 0
                          //        ? MediaQuery.of(context).size.height * 0.3
                          //        : homeC.viaControllers.length == 1
                          //        ? MediaQuery.of(context).size.height * 0.35
                          //        : MediaQuery.of(context).size.height * 0.4,
                          //    width: MediaQuery.of(context).size.height * 0.7    ,
                          //    decoration: BoxDecoration(
                          //      borderRadius: const BorderRadius.only(
                          //        bottomLeft: Radius.circular(30),
                          //        bottomRight: Radius.circular(30),
                          //      ),
                          //    ),
                          //
                          //    child: Container(
                          //      //padding: const EdgeInsets.all(12.0),
                          //
                          //      child: Column(
                          //        crossAxisAlignment: CrossAxisAlignment.start,
                          //        children: [
                          //          IconButton(
                          //            onPressed: () {
                          //              Get.back();
                          //            },
                          //
                          //            icon: Icon(
                          //              Icons.arrow_back,
                          //              color: CustomColor.Icon_Color,
                          //              size: 30,
                          //            ),
                          //          ),
                          //          SizedBox(height: 2),
                          //
                          //          Row(
                          //            children: [
                          //              Container(
                          //                width:MediaQuery.of(context).size.width*0.88,
                          //
                          //                child: Column(
                          //                  children: [
                          //                    Padding(
                          //                      padding: const EdgeInsets.only(left: 30),
                          //                      child: Container(width: MediaQuery.of(context).size.width*0.75,
                          //                        child: CustomTextField(
                          //                          controller: homeC.firstController,
                          //                          hintText: "pick up",
                          //
                          //                          borderRadius: 20,
                          //                        ),
                          //                      ),
                          //                    ),
                          //                    SizedBox(height: 15),
                          //                    Column(
                          //                      children: List.generate(homeC.viaControllers.length, (index) {
                          //                        return Container(
                          //                          //color: Colors.blueGrey,
                          //                          padding: const EdgeInsets.only(left: 38,bottom: 10),
                          //                          child: Row(
                          //                            children: [
                          //                              Expanded(
                          //                                child: CustomTextField(
                          //                                  controller: homeC.viaControllers[index],
                          //                                  hintText: index == 0
                          //                                      ? "1st Stop"
                          //                                      : "2nd Stop",
                          //
                          //                                  borderRadius: 20,
                          //                                ),
                          //                              ),
                          //                              const SizedBox(width: 8),
                          //                              IconButton(
                          //                                icon: const Icon(Icons.remove_circle, color: Colors.red),
                          //                                onPressed: () {
                          //                                  homeC.removeViaField(index);
                          //                                },
                          //                              ),
                          //                            ],
                          //                          ),
                          //                        );
                          //                      }
                          //                      ),
                          //                    ),
                          //
                          //                    Padding(
                          //                      padding:  EdgeInsets.only(left: 30),
                          //                      child: SizedBox(
                          //                        width: MediaQuery.of(context).size.width *0.75,
                          //                        child: CustomTextField(
                          //                          controller: homeC.secondController,
                          //                          hintText: "Destination",
                          //
                          //                          borderRadius: 20,
                          //                        ),
                          //                      ),
                          //                    ),
                          //                  ],
                          //                ),
                          //              ),
                          //
                          //              // -----------swap Button-------------------
                          //
                          //              Obx(
                          //                    () => homeC.showInterchange.value
                          //                    ? GestureDetector(
                          //                  onTap: (){
                          //                    homeC.swapValues();
                          //                  },
                          //                  child: Icon(
                          //                    Icons.compare_arrows,
                          //                    color: Colors.white,
                          //                    size: 28,
                          //                  ),
                          //                )
                          //                     : SizedBox.shrink(),
                          //              ),
                          //
                          //
                          //
                          //                ],
                          //          ),
                          //
                          //          SizedBox(height: 5,),
                          //
                          //
                          //
                          //
                          //
                          //
                          //          // ------------------------------- --------------------      VIA button
                          //          Row(
                          //            children: [
                          //              //SizedBox(width: MediaQuery.of(context).size.width*0.67,),
                          //              Spacer(),
                          //              Padding(
                          //                padding: EdgeInsets.only(right: 8.0),
                          //                child: TextButton.icon(
                          //                  onPressed: () {
                          //                    homeC.addViaField();
                          //                    homeC.showInterchange.value= false;
                          //                  },
                          //                  icon:  Icon(Icons.add, color: CustomColor.Icon_Color),
                          //                  label:  Text(
                          //                    "Add Via",
                          //                    style: AppTextStyles.regular(
                          //                        weight: FontWeight.bold
                          //                    ),
                          //                  ),
                          //                ),
                          //              ),],
                          //          ),
                          //
                          //          // ---------------------------     add fields
                          //
                          //
                          //
                          //
                          //        ],
                          //      ),
                          //    ),
                          //  ),

                          //========================================  ================== ================ ============== khalid


                          SizedBox(height: 15),

                          // ================================================ Address / Airoplane / Train  Coloum
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.93,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              // color: const Color.fromARGB(255, 54, 54, 54),
                              color: CustomColor.Button_background_Color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // ==========================================================       Address
                                Obx(
                                      () => GestureDetector(
                                    onTap: () {
                                      homeC.selectedItem(0);
                                      homeC.changeIndex(0);
                                    },
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: homeC.selectedItem.value == 0
                                            ? Colors.white
                                            : Colors.white10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 25,
                                            color: homeC.selectedItem.value == 0
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Address",
                                            style: AppTextStyles.small(
                                              weight: FontWeight.bold,
                                              size: 11,
                                              color:
                                              homeC.selectedItem.value == 0
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                // =================== Airport ===================
                                Obx(
                                      () => GestureDetector(
                                    onTap: () {
                                      homeC.selectedItem(1);
                                      homeC.changeIndex(1);
                                    },
                                    child: Container(
                                      height: 70,
                                      width: 70,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: homeC.selectedItem.value == 1
                                            ? Colors.white
                                            : Colors.white10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.airplanemode_active,
                                            size: 25,
                                            color: homeC.selectedItem.value == 1
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Airport",
                                            style: AppTextStyles.small(
                                              weight: FontWeight.bold,
                                              color: homeC.selectedItem.value == 1
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                // =================== Train ===================
                                Obx(
                                      () => GestureDetector(
                                    onTap: () {
                                      homeC.selectedItem(2);
                                      homeC.changeIndex(2);
                                    },
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: homeC.selectedItem.value == 2
                                            ? Colors.white
                                            : Colors.white10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.train_outlined,
                                            size: 25,
                                            color: homeC.selectedItem.value == 2
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Train",
                                            style: AppTextStyles.small(
                                              weight: FontWeight.bold,

                                              color:
                                              homeC.selectedItem.value == 2
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          //===========================  list show addresses
                          Obx(
                                () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.selectedIndex.value == 0
                                    ? Container(
                                  height: 150,

                                  //color: Colors.grey,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          Get.to(AddHomeScreen());
                                        },
                                        title: Text(
                                          "Home",
                                          style: AppTextStyles.medium(),
                                        ),
                                        subtitle:   Text(
                                          profileController.profileData?.addhomeAddress ?? 'Address',
                                          style: AppTextStyles.regular(),
                                        ),
                                        // Text(
                                        //   "Address",
                                        //   style: AppTextStyles.regular(),
                                        // ),
                                        leading: Icon(
                                          controller.iconItems[controller
                                              .selectedIndex
                                              .value]["icon"],
                                          color: CustomColor.textColor,
                                          size: 25,
                                        ),
                                        // trailing: IconButton(
                                        //   icon: Icon(
                                        //     Icons.delete,
                                        //     color: Colors.redAccent,
                                        //     size: 25,
                                        //   ),
                                        //   onPressed: () {},
                                        //  ),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          Get.to(AddWork_Screen());
                                        },
                                        title: Text(
                                          "Add Work",
                                          style: AppTextStyles.medium(),
                                        ),
                                        subtitle: Text(
                                          "Work Address",
                                          style: AppTextStyles.regular(),
                                        ),
                                        leading: Icon(
                                          controller.iconItems[controller
                                              .selectedIndex
                                              .value]["icon"],
                                          color: CustomColor.textColor,
                                          size: 25,
                                        ),

                                        // trailing: IconButton(
                                        //   icon: Icon(
                                        //     Icons.delete,
                                        //     color: Colors.redAccent,
                                        //     size: 25,
                                        //   ),
                                        //   onPressed: () {},
                                        // ),
                                      ),
                                    ],
                                  ),
                                )
                                    : Container(
                                  height: homeC.controllers.length==2
                                      ?MediaQuery.of(context).size.height*0.2
                                      :homeC.controllers.length==1
                                      ?MediaQuery.of(context).size.height*0.25
                                      :MediaQuery.of(context).size.height*0.35,
                                  child: ListView.builder(
                                    itemCount: homeC.busStops.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          homeC.busStops[index],
                                          style: AppTextStyles.regular(),
                                        ),
                                        // subtitle: Text(
                                        //   controller.Address[controller
                                        //       .selectedIndex
                                        //       .value],
                                        //   style: TextStyle(
                                        //     color: CustomColor.textColor,
                                        //     fontSize: 15,
                                        //   ),
                                        // ),
                                        leading: Icon(
                                          controller.iconItems[controller
                                              .selectedIndex
                                              .value]["icon"],
                                          color: CustomColor.textColor,
                                          size: 25,
                                        ),

                                        // trailing: IconButton(
                                        //   icon: Icon(
                                        //     Icons.delete,
                                        //     color: Colors.redAccent,
                                        //     size: 25,
                                        //   ),
                                        //   onPressed: () {},
                                        // ),
                                        //
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //Container(height: 200,),
                        ],
                      ),
                    ),

                    //Spacer(),
                    Container(
                      height:MediaQuery.of(context).size.height*0.15,
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
                                child: Text("Continue",style: AppTextStyles.medium(size: 25,weight: FontWeight.bold),),
                              ),
                              fontSize: 18,
                              onPressed: () {
                                Get.dialog(
                                  Dialog(
                                    backgroundColor: Color(0xFF231F20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 320,
                                      width: 350,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 25),
                                          Center(
                                            child: Text(
                                              CustomText.Pick_Up_Location,
                                              softWrap: true,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: AppTextStyles.heading(
                                                size: 20,
                                                //fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Center(
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                              ),
                                              height: 80,
                                              width: 200,
                                              child: Text(
                                                CustomText.Pick_Up_Dialog_Text,
                                                textAlign: TextAlign.center,
                                                style: AppTextStyles.regular(),
                                              ),
                                            ),
                                          ),
                                          //const SizedBox(height: 10),
                                          // SizedBox(
                                          //   height: 50,
                                          //   width: 250,
                                          //   child: MyElevatedButton(
                                          //     text: 'Select Current location',
                                          //     fontSize: 6,
                                          //
                                          //     onPressed: () {},
                                          //
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 50,
                                            width: 250,
                                            child: MyElevatedButton(
                                              text: 'Select Current Location',
                                              fontSize: 14,          // increase size
                                              onPressed: () {},
                                              textWidget: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  'Select Current Location',
                                                  style: AppTextStyles.regular(size: 16),
                                                ),
                                              ),
                                            ),
                                          ),

                                          const SizedBox(height: 15),
                                          SizedBox(
                                            height: 50,
                                            width: 250,
                                            child: MyElevatedButton(
                                              text: "",
                                              onPressed: () {
                                                Get.toNamed('/RideInfoScreen');
                                              },
                                              textWidget: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  "Select PickUp Location",
                                                  style: AppTextStyles.medium(size: 16),
                                                ),
                                              ),
                                            ),
                                          ),

                                          // SizedBox(
                                          //   height: 50,
                                          //   width: 250,
                                          //   child: MyElevatedButton(
                                          //     text: 'Select PickUp location',
                                          //     fontSize: 6,
                                          //     onPressed: () {
                                          //       Get.toNamed('/RideInfoScreen');
                                          //     },
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
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
                                  color:Colors.red
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
