import 'package:customer/Controller/Deshboard/deshboard_cont.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHomeScreen extends StatefulWidget {
  const AddHomeScreen({super.key});

  @override
  State<AddHomeScreen> createState() => AddHomeScreenState();
}

class AddHomeScreenState extends State<AddHomeScreen> {
  final DeshBoardAddHome_Controller mydeshcontroller = Get.put(DeshBoardAddHome_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: CustomColor.textfield_fill,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          onChanged: (value) {
                            mydeshcontroller.text.value = value;
                          },
                          controller: mydeshcontroller.HomeController,
                          hintText: "Add Your Home Address",
                          borderRadius: 15,
                          fillColor: CustomColor.textfield_fill,
                        ),
                      ),
                      Obx(
                        () => IconButton(
                          icon: Icon(
                            mydeshcontroller.editingIndex.value == null
                                ? Icons.add
                                : Icons.check,
                            color: Colors.white,
                          ),
                          onPressed: mydeshcontroller.addOrUpdateItem,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              if (mydeshcontroller.items.isEmpty) {
                return const Center(
                  child: Text(
                    "No data",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                );
              }

              return ListView.builder(
                itemCount: mydeshcontroller.items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      mydeshcontroller.items[index],
                      style: TextStyle(
                        color: CustomColor.textColor,
                        fontSize: 20,
                      ),
                    ),
                    leading: const Icon(
                      Icons.home,
                      color: CustomColor.textColor,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => mydeshcontroller.editItem(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => mydeshcontroller.deleteItem(index),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
