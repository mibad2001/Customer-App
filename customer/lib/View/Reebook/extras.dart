import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/elevat_button.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepper_touch/stepper_touch.dart';

class ExtrasScreen extends StatelessWidget {
  const ExtrasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.background,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔙 Back + Title Row
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
                  const Spacer(),
                  const Text(
                    "Extras",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                ],
              ),

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

              // 🚗 Meet and Greet Services
              Row(
                children: [
                  const Text(
                    "Meet and greet services()",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: 100,
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

              // 💧 Water / Extras
              Row(
                children: [
                  const Text(
                    "Water / Extras",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: 100,
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

              // 🚘 MPV4
              Row(
                children: [
                  const Text(
                    "MPV4",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: 100,
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
                  const SizedBox(width: 10),
                  Column(
                    children: const [
                      Text(
                        "Water / Extras",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "17.00",
                        style: TextStyle(
                            color: Colors.white,
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
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "17.00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "=   34.00",
                    style: TextStyle(
                        color: Colors.white,
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
                  backgroundColor: CustomColor.Icon_Color,
                  textColor: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
