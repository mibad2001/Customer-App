import 'package:customer/Controller/Deshboard/deshboard_cont.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/all_text.dart';
import '../../Widgets/text_button.dart';

class AddWork_Screen extends StatefulWidget {
  const AddWork_Screen({super.key});

  @override
  State<AddWork_Screen> createState() => AddWork_ScreenState();
}

class AddWork_ScreenState extends State<AddWork_Screen> {
  final DeshBoardAddHome_Controller mydeshcontroller = Get.put(DeshBoardAddHome_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child:Column(
            children: [
              // ===================== Header Section =====================
              Container(
                height: MediaQuery.of(context).size.height*0.25,
                decoration: BoxDecoration(
                  color: CustomColor.textfield_fill,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.only(top: 20, bottom: 30, left: 8, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.17,),

                        Text(
                          "Work Address",
                          style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: mydeshcontroller.WorkAdressController,
                            hintText: "Add Your Work Address",
                            borderRadius: 15,
                            fillColor: CustomColor.textfield_fill,
                          ),
                        ),
                        Obx(() => IconButton(
                          icon: Icon(
                            mydeshcontroller.editingIndex.value == null
                                ? Icons.add
                                : Icons.check,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            mydeshcontroller.saveWorkAddress();
                          },
                        )),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ===================== Address Display Section =====================
              Obx(() {
                if (mydeshcontroller.workAddress.value.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Text(
                        "No data",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  );
                }

                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: CustomColor.textfield_fill,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(
                      mydeshcontroller.workAddress.value,
                      style: TextStyle(
                        color: CustomColor.textColor,
                        fontSize: 18,
                      ),
                    ),
                    leading: const Icon(Icons.work, color: Colors.white),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ================= Edit Button =================
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            mydeshcontroller.editWorkAddress();
                          },
                        ),

                        // ================= Delete Button =================
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            Get.dialog(
                              Dialog(
                                backgroundColor: Colors.white,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                  ),
                                  height: 220,
                                  width: 100,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        CustomText.Delete_address,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Icon(
                                        Icons.warning_amber,
                                        color: Colors.amberAccent,
                                        size: 40,
                                      ),
                                      Center(
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 20),
                                          height: 80,
                                          width: 200,
                                          child: Text(
                                            CustomText.Delete_home_address_Alert,
                                            style: const TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 70, height: 5),
                                          CustomTextButton(
                                            text: 'Yes',
                                            onPressed: () {
                                              mydeshcontroller.deleteWorkAddress();
                                              Get.back();
                                            },
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            borderRadius: 8,
                                            elevation: 2,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 10,
                                            ),
                                          ),
                                           SizedBox(width: 20),
                                          CustomTextButton(
                                            text: 'NO',
                                            onPressed: () {
                                              Get.back();
                                            },
                                            backgroundColor: Colors.black54,
                                            textColor: Colors.white,
                                            borderRadius: 8,
                                            elevation: 2,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),

        ),
      ),
    );
  }
}
