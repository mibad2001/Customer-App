import 'package:customer/Controller/Deshboard/deshboard_cont.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/all_text.dart';
import '../../Widgets/text_button.dart';
import '../../textstyle/apptextstyle.dart';

class AddWork_Screen extends StatefulWidget {
  const AddWork_Screen({super.key});

  @override
  State<AddWork_Screen> createState() => AddWork_ScreenState();
}

class AddWork_ScreenState extends State<AddWork_Screen> {
  final DeshBoardAddHome_Controller mydeshcontroller = Get.put(DeshBoardAddHome_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.background,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
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
          child: SingleChildScrollView(
            child:Column(
              children: [
                // ===================== Header Section =====================
                Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  decoration: BoxDecoration(
                    //color: CustomColor.textfield_fill,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  //padding: const EdgeInsets.only(top: 20, bottom: 30, left: 8, right: 10),
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
                            style: AppTextStyles.heading(),
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
                    return  Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: Text(
                          "No data",
                          style: AppTextStyles.heading(),
                        ),
                      ),
                    );
                  }
      
                  return Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: CustomColor.Container_Colors,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text(
                        mydeshcontroller.workAddress.value,
                        style: AppTextStyles.medium(
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
                                  backgroundColor: CustomColor.Container_Colors,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    ),
                                    height: 220,
                                    width: 100,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10),

                                        Text(
                                          CustomText.Delete_address,
                                          style: AppTextStyles.heading(

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
                                            padding: EdgeInsets.only(left: 20),
                                            height: 80,
                                            width: 200,
                                            child: Text(
                                              CustomText.Delete_home_address_Alert,
                                              style: AppTextStyles.regular(),
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
                                                //print("yaha hm ma ");
                                                Get.back();
                                              },
                                              backgroundColor: Colors.red,
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
                                              backgroundColor: CustomColor.Button_background_Color,
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
      ),
    );
  }
}
