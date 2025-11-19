import 'package:customer/Controller/Auth_Controller/sigup_controller.dart';
import 'package:customer/View/Auth/Login_screens/login.dart';
import 'package:customer/View/Auth/trems.dart';
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/elevat_button.dart';
import 'package:customer/View/Widgets/phone_number_textfield.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:customer/View/Widgets/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SigUp_Screen extends StatefulWidget {
  const SigUp_Screen({super.key});

  @override
  State<SigUp_Screen> createState() => _SigUp_ScreenState();
}

class _SigUp_ScreenState extends State<SigUp_Screen> {
  final SignUp_Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Container(
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
                    CustomTextStyle(text: CustomText.Sig_up, fontSize: 40),
                    SizedBox(height: 5),
                    CustomTextStyle(
                      text: CustomText.Sigup_Description_text,
                      fontSize: 17,
                    ),
                    SizedBox(height: 40),
                    CustomTextField(
                      FontSize: 14,
                      hintText: CustomText.hint_text_first_Name,
                      prefixIcon: Icon(
                        Icons.person,
                        color: CustomColor.textField_Icon_Color,
                      ),
                      borderRadius: 15,
                      //: CustomColor.textfield_fill,
                    ),
                    SizedBox(height: 25),
                    CustomTextField(
                      FontSize: 14,
                      hintText: CustomText.hint_text_last_Name,
                      prefixIcon: Icon(
                        Icons.person,
                        color: CustomColor.textField_Icon_Color,
                      ),
                      borderRadius: 15,
                     // fillColor: CustomColor.textfield_fill,
                    ),
                    SizedBox(height: 25),
                    CustomTextField(
                      hintText: CustomText.hint_text_email,
                      FontSize: 14,
                      prefixIcon: Icon(Icons.email, color: CustomColor.textField_Icon_Color),
                      borderRadius: 15,
                     // fillColor: CustomColor.textfield_fill,
                    ),

                    SizedBox(height: 25),
                    Container(
                      child: PhoneNumber_TextField(
                        hintText: CustomText.hint_text_phone_number,
                      ),
                    ),
                    SizedBox(height: 8),

                    CustomTextField(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: CustomColor.textField_Icon_Color,
                        ),
                      ),
                      hintText: CustomText.hint_password,
                      FontSize: 14,
                      prefixIcon: Icon(
                        Icons.password,
                        color: CustomColor.textField_Icon_Color,
                      ),
                      borderRadius: 15,
                     // fillColor: CustomColor.textfield_fill,
                    ),

                    SizedBox(height: 8),
                    Obx(
                      () => Row(
                        children: [
                          Checkbox(
                            value: controller.isCheckedBox.value,
                            onChanged: (value) {
                              controller.checked_box(value);
                            },
                            activeColor: CustomColor.textField_Icon_Color,
                          ),
                          CustomTextStyle(
                            text: "${CustomText.SigUp_Trems_Text} ",
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.to(TremsAndCondition_Screen());
                              },
                              child: CustomTextStyle(
                                text: CustomText.SigUp_TremsAndCondition,
                                color: CustomColor.trems,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //  ---------------------Sign Up Button---------------------------------
              SizedBox(height: 10),

              Center(
                child:  SizedBox(
                  height: 50,
                  width: 350,
                  child: MyElevatedButton(
                    text: "Sign Up",
                    onPressed: () {
                      Get.to(SigIn_Screen());
                    },
                    backgroundColor: CustomColor.Button_background_Color,
                    textColor: CustomColor.Button_Text_Color,
                  ),
                ),
              ),

              // ==============================================   ==============   Forget
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextStyle(
                    text: CustomText.Already_Account_Text,
                    color:CustomColor.Text_Color,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/SigIn_Screen');
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.Button_background_Color,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }
}
