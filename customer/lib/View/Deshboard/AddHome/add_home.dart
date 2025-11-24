import 'package:customer/Controller/Deshboard/deshboard_cont.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/all_text.dart';
import '../../Widgets/text_button.dart';

class AddHomeScreen extends StatefulWidget {
  const AddHomeScreen({super.key});

  @override
  State<AddHomeScreen> createState() => AddHomeScreenState();
}

class AddHomeScreenState extends State<AddHomeScreen> {
  final DeshBoardAddHome_Controller mydeshcontroller = Get.put(DeshBoardAddHome_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: CustomColor.background,
        body:  Container(
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
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  decoration: BoxDecoration(
                    // color: CustomColor.textfield_fill,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    //padding: const EdgeInsets.only(top: 20, left: 10,right: 15 ),
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
                              "Home Address",
                              style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 60),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: mydeshcontroller.HomeController,
                                hintText: "Add Your Home Address",
                                borderRadius: 15,
                                fillColor: CustomColor.textfield_fill,
                              ),
                            ),
                            Obx(() {
                              final isEditing = mydeshcontroller.editingIndex.value != null;
                              return IconButton(
                                  icon: Icon(
                                    isEditing ? Icons.check : Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed:()
                                  {
                                    FocusScope.of(context).unfocus();
                                    mydeshcontroller.saveItem();
                                    mydeshcontroller.clearfield();

                                  }
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),


                Obx(() {
                  final address = mydeshcontroller.homeAddress.value;

                  if (address.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Text(
                          "No data",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: CustomColor.textfield_fill,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          address,
                          style: TextStyle(
                            color: CustomColor.Text_Color,
                            fontSize: 20,
                          ),
                        ),
                        leading:
                        const Icon(Icons.home, color: CustomColor.textColor),
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
                                        height: 220,
                                        width: 100,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10),

                                            Text(
                                              CustomText.Delete_address,
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
                                                padding: EdgeInsets.only(left: 20),
                                                height: 80,
                                                width: 200,
                                                child: Text(
                                                  CustomText.Delete_home_address_Alert,
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
                              //mydeshcontroller.deleteItem,
                            ),
                          ],
                        ),
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
