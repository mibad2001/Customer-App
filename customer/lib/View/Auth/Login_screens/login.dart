import 'package:customer/View/Auth/Sign_Up_Screen/sign_up.dart';
import 'package:customer/View/Deshboard/dashboard.dart';
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/elevat_button.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:customer/View/Widgets/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SigIn_Screen extends StatefulWidget {
  const SigIn_Screen({super.key});

  @override
  State<SigIn_Screen> createState() => _SigIn_ScreenState();
}

class _SigIn_ScreenState extends State<SigIn_Screen> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustomColor.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 150.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextStyle(text: CustomText.Login_text, fontSize: 40),
                  SizedBox(height: 5),
                  CustomTextStyle(
                    text: CustomText.Login_text_description,
                    fontSize: 17,
                  ),
                  SizedBox(height: 40),

                  CustomTextField(
                    hintText: CustomText.hint_text_email,
                    FontSize: 14,
                    prefixIcon: Icon(Icons.email, color: CustomColor.textColor),
                    borderRadius: 15,
                    fillColor: CustomColor.textfield_fill,
                  ),

                  SizedBox(height: 25),
                  CustomTextField(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: CustomColor.textColor,
                      ),
                    ),
                    hintText: CustomText.hint_password,
                    FontSize: 14,
                    prefixIcon: Icon(
                      Icons.password,
                      color: CustomColor.textColor,
                    ),
                    borderRadius: 15,
                    fillColor: CustomColor.textfield_fill,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text("Forget Password"),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: width,
                    child: MyElevatedButton(
                      text: "Log In",
                      onPressed: () {
                        Get.toNamed('/Deshboard');
                      },
                      backgroundColor: Colors.white,
                      textColor: CustomColor.textColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextStyle(
                        text: CustomText.Already_Account_Text,
                        color: CustomColor.textColor,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(SigUp_Screen());
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
