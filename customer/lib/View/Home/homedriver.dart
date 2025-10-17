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
              return Column(
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 3,
                    decoration: BoxDecoration(
                      color: CustomColor.textfield_fill,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.2,
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.2,
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
                  SizedBox(height: 15),

                  // ----------- Address / Airoplane / Train  Coloum ------------------
                  Container(
                    height: 120,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: const Color.fromARGB(255, 54, 54, 54),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                              () =>
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: homeC.selectedItem.value == 0
                                      ? Colors.white
                                      : Colors.white10,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    homeC.selectedItem(0);
                                    homeC.changeIndex(0);
                                  },
                                  icon: Icon(
                                    size: 40,

                                    Icons.location_on,
                                    color: homeC.selectedItem.value == 0
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                        ),
                        Obx(
                              () =>
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: homeC.selectedItem.value == 1
                                      ? Colors.white
                                      : Colors.white10,
                                ),

                                child: IconButton(
                                  onPressed: () {
                                    homeC.selectedItem(1);
                                    homeC.changeIndex(1);
                                  },
                                  icon: Icon(
                                    size: 40,
                                    Icons.airplanemode_active,
                                    color: homeC.selectedItem.value == 1
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                        ),
                        Obx(
                              () =>
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: homeC.selectedItem.value == 2
                                      ? Colors.white
                                      : Colors.white10,
                                ),

                                child: IconButton(
                                  onPressed: () {
                                    homeC.selectedItem(2);
                                    homeC.changeIndex(2);
                                  },
                                  icon: Icon(
                                    size: 40,

                                    Icons.train_outlined,
                                    color: homeC.selectedItem.value == 2
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 20),




                  Obx(() =>
                      Column(
                        children: [
                          controller.selectedIndex.value==0?
                          Container(
                            height: 200,
                            width: 350,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    controller.Title_Address[controller.selectedIndex
                                        .value ],
                                    style: TextStyle(
                                        color: CustomColor.textColor,
                                        fontSize: 18, fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  subtitle: Text(
                                    controller.Address[controller.selectedIndex.value ],
                                    style: TextStyle(
                                      color: CustomColor.textColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  leading: Icon(
                                    controller.iconItems[controller.selectedIndex
                                        .value]["icon"],
                                    color: CustomColor.textColor, size: 25,
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.delete, color: Colors.redAccent, size: 25,),
                                    onPressed: () {},
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Add_Work",
                                    style: TextStyle(
                                        color: CustomColor.textColor,
                                        fontSize: 18, fontWeight: FontWeight.bold
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
                                    controller.iconItems[controller.selectedIndex
                                        .value]["icon"],
                                    color: CustomColor.textColor, size: 25,
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.delete, color: Colors.redAccent, size: 25,),
                                    onPressed: () {},
                                  ),
                                ),

                              ],
                            ),
                          ):
                          ListTile(
                            title: Text(
                              controller.Title_Address[controller.selectedIndex
                                  .value ],
                              style: TextStyle(
                                  color: CustomColor.textColor,
                                  fontSize: 18, fontWeight: FontWeight.bold
                              ),
                            ),
                            subtitle: Text(
                              controller.Address[controller.selectedIndex.value ],
                              style: TextStyle(
                                color: CustomColor.textColor,
                                fontSize: 15,
                              ),
                            ),
                            leading: Icon(
                              controller.iconItems[controller.selectedIndex
                                  .value]["icon"],
                              color: CustomColor.textColor, size: 25,
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete, color: Colors.redAccent, size: 25,),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )),





                ],
              );
            },
          ),
        ),
      );
    }
  }
