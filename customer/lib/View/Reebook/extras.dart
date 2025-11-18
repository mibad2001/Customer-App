import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/elevat_button.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepper_touch/stepper_touch.dart';

import '../Widgets/all_text.dart';

class ExtrasScreen extends StatelessWidget {
  const ExtrasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.background,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: CustomColor.Container_Colors,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: MediaQuery.of(context).size.width * 0.06,
                        color: CustomColor.textfield_fill,
                      ),
                    ),

                    SizedBox(width: 5),

                    Expanded(
                      child: Center(
                        child: Text(
                          "Extras",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.textfield_fill,
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     IconButton(
              //       onPressed: () => Get.back(),
              //       icon: const Icon(
              //         Icons.arrow_back,
              //         color: CustomColor.Text_Color,
              //         size: 25,
              //       ),
              //     ),
              //
              //     const Text(
              //       "Extras",
              //       style: TextStyle(
              //           color: CustomColor.Text_Color,
              //           fontSize: 25,
              //           fontWeight: FontWeight.bold),
              //     ),
              //     const Spacer(),
              //   ],
              // ),
              Padding(
                  padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    // 📝 TextField Section
                    Container(
                      margin: const EdgeInsets.all(12),
                      child: CustomTextField(
                        hintText: "Enter ",
                        borderRadius: 15,
                        fillColor: CustomColor.textfield_fill,
                        maxLines: 3,
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                      ),
                    ),

                    const SizedBox(height: 20),


                    Row(
                      children: [
                        const Text(
                          "Meet and greet services()",
                          style: TextStyle(
                              color: CustomColor.Text_Color,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          height: 46,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(26)),
                              color: CustomColor.Container_Colors
                          ),
                          child: StepperTouch(
                            initialValue: 0,
                            direction: Axis.horizontal,
                            withSpring: false,
                            onChanged: (int value) {
                              print('new value $value');
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),


                    Row(
                      children: [
                        const Text(
                          "Water / Extras",
                          style: TextStyle(
                              color: CustomColor.Text_Color,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          height: 46,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(26)),
                              color: CustomColor.Container_Colors
                          ),
                          child: StepperTouch(
                            initialValue: 0,
                            direction: Axis.horizontal,
                            withSpring: false,
                            onChanged: (int value) {
                              print('new value $value');
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),


                    Row(
                      children: [
                        const Text(
                          "MPV4",
                          style: TextStyle(
                              color: CustomColor.Text_Color,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          height: 46,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(26)),
                              color: CustomColor.Container_Colors
                          ),
                          child: StepperTouch(
                            initialValue: 0,
                            direction: Axis.horizontal,
                            withSpring: false,
                            onChanged: (int value) {
                              print('new value $value');
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),


                    Row(
                      children: [

                        Column(
                          children: const [
                            Text(
                              "Water / Extras",
                              style: TextStyle(color: CustomColor.Text_Color, fontSize: 15),
                            ),
                            Text(
                              "17.00",
                              style: TextStyle(
                                  color: CustomColor.Text_Color,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.add, size: 30, color: CustomColor.Icon_Color),
                        const SizedBox(width: 10),
                        Column(
                          children: const [
                            Text(
                              "Extra Charges",
                              style: TextStyle(color: CustomColor.Text_Color, fontSize: 15),
                            ),
                            Text(
                              "17.00",
                              style: TextStyle(
                                  color: CustomColor.Text_Color,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "=   34.00",
                          style: TextStyle(
                              color: CustomColor.Text_Color,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),


                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      height: 50,
                      width: double.infinity,
                      child: MyElevatedButton(
                        text: 'DONE',
                        onPressed: () {},
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
