import 'package:bot_toast/bot_toast.dart';
import 'package:customer/Controller/Home/home-controller.dart';
import 'package:customer/View/Deshboard/AddHome/add_home.dart';
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/text_button.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/elevat_button.dart';

class HomeDriver extends StatelessWidget {
  HomeDriver({super.key});

  final homeC = Get.put(SwapController());

  @override
  Widget build(BuildContext context) {
    // final DeshBoardAddHome_Controller hdeshboard_controller = Get.find();

    return SafeArea(
      child: Scaffold(
    //backgroundColor: CustomColor.background,

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

          child: GetBuilder<SwapController>(
            builder: (controller) {
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.8,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          Container(
                            height:  homeC.viaControllers.length == 0
                                ? MediaQuery.of(context).size.height * 0.32
                                : homeC.viaControllers.length == 1
                                ? MediaQuery.of(context).size.height * 0.4
                                : MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(

                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },

                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: CustomColor.Icon_Color,
                                        size: 30,
                                      ),
                                    ),
                                    SizedBox(height: 2),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width / 1.2,
                                        child: CustomTextField(
                                          controller: homeC.firstController,
                                          hintText: "pick up",

                                          borderRadius: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),

                                    // -----------swap Button-------------------
                                    Container(
                                      height: 25,
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        onPressed: homeC.swapValues,
                                        icon: const Icon(
                                          Icons.swap_vert,
                                          size: 32,
                                          color: CustomColor.Icon_Color,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    Padding(
                                      padding:  EdgeInsets.only(left: 30),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width / 1.2,
                                        child: CustomTextField(
                                          controller: homeC.secondController,
                                          hintText: "Destination",

                                          borderRadius: 20,
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 5,),




                                    // ------------------------------- --------------------      VIA button
                                    Row(
                                      children: [
                                        //SizedBox(width: MediaQuery.of(context).size.width*0.67,),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: TextButton.icon(
                                            onPressed: () {
                                              homeC.addViaField();
                                            },
                                            icon: const Icon(Icons.add, color: CustomColor.Icon_Color),
                                            label: const Text(
                                              "Add Via",
                                              style: TextStyle(color:CustomColor.Text_Color, fontSize: 16),
                                            ),
                                          ),
                                        ),],
                                    ),

                                    // ---------------------------     add fields

                                      Column(
                                        children: List.generate(homeC.viaControllers.length, (index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(left: 30, bottom: 10),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: CustomTextField(
                                                    controller: homeC.viaControllers[index],
                                                    hintText: index == 0
                                                        ? "1st Stop"
                                                        : "2nd Stop",

                                                    borderRadius: 20,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                IconButton(
                                                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                                                  onPressed: () {
                                                    homeC.removeViaField(index);
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ),


                                  ],
                                ),
                              ),
                            ),
                          ),





                          SizedBox(height: 15),

                          // ================================================ Address / Airoplane / Train  Coloum

                          Container(
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

                                Obx(()=>GestureDetector(
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
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: homeC.selectedItem.value == 0
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),

                                // =================== Airport ===================

                               Obx(()=>
                                   GestureDetector(
                                     onTap: () {
                                       homeC.selectedItem(1);
                                       homeC.changeIndex(1);
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
                                         color: homeC.selectedItem.value == 1
                                             ? Colors.white
                                             : Colors.white10,
                                       ),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
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
                                             style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                               fontSize: 14,
                                               color: homeC.selectedItem.value == 1
                                                   ? Colors.black
                                                   : Colors.white,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),),

                                // =================== Train ===================
                               Obx(()=>
                                   GestureDetector(
                                     onTap: () {
                                       homeC.selectedItem(2);
                                       homeC.changeIndex(2);
                                     },
                                     child: Container(
                                       height: 70,
                                       width: 70,
                                       padding:  EdgeInsets.symmetric(
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
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Icon(
                                             Icons.train_outlined,
                                             size:25,
                                             color: homeC.selectedItem.value == 2
                                                 ? Colors.black
                                                 : Colors.white,
                                           ),
                                           const SizedBox(height: 5),
                                           Text(
                                             "Train",
                                             style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                               fontSize: 14,
                                               color: homeC.selectedItem.value == 2
                                                   ? Colors.black
                                                   : Colors.white,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),)
                              ],
                            ),
                          ),

                          SizedBox(height: 20),
                          //===========================  list show addresses

                        Obx(()=>  Column(
                          children: [
                            controller.selectedIndex.value == 0
                                ? Container(
                              height: 150,
                              width: 350,
                              //color: Colors.grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(
                                      controller.Title_Address[controller
                                          .selectedIndex
                                          .value],
                                      style: TextStyle(
                                        color: CustomColor.textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      controller.Address[controller
                                          .selectedIndex
                                          .value],
                                      style: TextStyle(
                                        color: CustomColor.textColor,
                                        fontSize: 15,
                                      ),
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
                                    //  ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Add_Work",
                                      style: TextStyle(
                                        color: CustomColor.textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "Work Address",
                                      style: TextStyle(
                                        color: CustomColor.textColor,
                                        fontSize: 15,
                                      ),
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
                              height: 150,
                              child: ListTile(
                                title: Text(
                                  controller.Title_Address[controller
                                      .selectedIndex
                                      .value],
                                  style: TextStyle(
                                    color: CustomColor.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  controller.Address[controller
                                      .selectedIndex
                                      .value],
                                  style: TextStyle(
                                    color: CustomColor.textColor,
                                    fontSize: 15,
                                  ),
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
                                //

                              ),
                            ),
                          ],
                        ),
                        ),
                          //Container(height: 200,),




                        ],
                      ),
                    ),
                  ),

                  Spacer(),
                  Container(
                    padding:  EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        SizedBox(
                          height: 50,
                          width: 350,
                          child: MyElevatedButton(
                            text: 'CONTINUE',
                            onPressed: () {
                              Get.dialog(
                                Dialog(
                                  backgroundColor: CustomColor.textfield_fill,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 320,
                                    width: 300,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 25),
                                        Center(
                                          child: Text(
                                            CustomText.Pick_Up_Location,
                                            softWrap: true,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              color: CustomColor.Text_Color,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            height: 80,
                                            width: 200,
                                            child: Text(
                                              CustomText.Pick_Up_Dialog_Text,
                                              textAlign: TextAlign.center,
                                              style:  TextStyle(
                                                color: CustomColor.Text_Color,
                                              ),
                                            ),
                                          ),
                                        ),
                                        //const SizedBox(height: 10),
                                        SizedBox(
                                          height: 50,
                                          width: 250,
                                          child: MyElevatedButton(
                                            text: 'Select Current location',
                                            onPressed: () {},
                                            fontSize: 3,
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        SizedBox(
                                          height: 50,
                                          width: 250,
                                          child: MyElevatedButton(
                                            text: 'Select Pick Up location',
                                            onPressed: () {
                                              Get.toNamed('/RideInfoScreen');
                                            },
                                            fontSize: 3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            fontSize: 20,
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
                                size: 20,
                                color: CustomColor.Icon_Color,
                              ),
                              const SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/PickupScreen');
                                },
                                child: Text(
                                  "SET LOCATION ON MAP",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: CustomColor.Text_Color,
                                    fontWeight: FontWeight.bold,
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
              );
            },
          ),
        ),




      ),
    );
  }
}
