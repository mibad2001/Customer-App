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
  final DeshBoardAddHome_Controller mydeshcontroller =
  Get.put(DeshBoardAddHome_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ Fix overflow by making content scrollable
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                // Top section
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.textfield_fill,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  padding:
                  const EdgeInsets.only(top: 20, bottom: 30, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: mydeshcontroller.HomeController,
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
                            onPressed: ()
                            {
                              //mydeshcontroller.clearfield();
                              mydeshcontroller.saveItem();

                          },
                          )),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Address display section
                Obx(() {
                  if (mydeshcontroller.homeAddress.value.isEmpty) {
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
                        mydeshcontroller.homeAddress.value,
                        style: TextStyle(
                          color: CustomColor.textColor,
                          fontSize: 18,
                        ),
                      ),
                      leading: const Icon(Icons.work, color: Colors.white),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: mydeshcontroller.editItem,
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed:(){
                              Get.dialog(
                                Dialog(
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    ),
                                    height: 260,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10),

                                        Text(
                                          CustomText.Delete_Account,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Icon(
                                          Icons.warning_amber,
                                          color: Colors.amberAccent,
                                          size: 40,
                                        ),
                                        Center(
                                          child: Container(
                                            height: 120,
                                            width: 200,
                                            child: Text(
                                              CustomText.Delete_Alert,
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            SizedBox(width: 70, height: 5),
                                            CustomTextButton(
                                              text: 'Yes',
                                              onPressed: (){
                                                mydeshcontroller.deleteItem();
                                                Get.back();
                                              },
                                              backgroundColor: Colors.black54,
                                              textColor: Colors.white,
                                              borderRadius: 8,
                                              elevation: 2,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              padding: EdgeInsets.symmetric(
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
                                              padding: EdgeInsets.symmetric(
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
                            }
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
      ),
    );
  }
}
