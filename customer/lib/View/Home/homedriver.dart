import 'package:customer/Controller/Home/home-controller.dart';
import 'package:customer/View/Deshboard/AddHome/add_home.dart';
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/text_button.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDriver extends StatelessWidget {
  HomeDriver({super.key});

  final homeC = Get.put(SwapController());

  @override
  Widget build(BuildContext context) {
    // final DeshBoardAddHome_Controller hdeshboard_controller = Get.find();

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.background,
        body: GetBuilder<SwapController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    decoration: BoxDecoration(
                      color: CustomColor.textfield_fill,
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
                                color: CustomColor.background,
                                size: 30,
                              ),
                            ),
                            SizedBox(height: 20),

                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: CustomTextField(
                                  controller: homeC.firstController,
                                  hintText: "ma",
                                  fillColor: CustomColor.textfield_fill,
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
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),

                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: CustomTextField(
                                  controller: homeC.secondController,
                                  hintText: "ma",
                                  fillColor: CustomColor.textColor,
                                  borderRadius: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  // ----------- Address / Airoplane / Train  Coloum ------------------

                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.93,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: const Color.fromARGB(255, 54, 54, 54),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // =================== Address ===================
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
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  //===========================  list show addresses
                  Obx(
                    () => Column(
                      children: [
                        controller.selectedIndex.value == 0
                            ? Container(
                                height: 150,
                                width: 350,
                                //color: Colors.grey,
                                child: Column(
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
                  Container(height: 250,),

                  //------------------------------------- set map button
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 50,),
                      child: Row(children: [
                        Icon(Icons.location_on,size: 20,color: CustomColor.Icon_Color,),
                        SizedBox(width: 10,),
                        TextButton(onPressed: (){
                          Get.toNamed('/PickupScreen');
                        },
                            child: Text("SET LOCATION ON MAP",
                          style: TextStyle(fontSize: 20,
                              color: CustomColor.Text_Color,
                              fontWeight: FontWeight.bold),
                            )
                        ),
                      ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
