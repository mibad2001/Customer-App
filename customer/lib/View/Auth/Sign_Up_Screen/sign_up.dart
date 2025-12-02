import 'package:customer/Controller/Auth_Controller/sigup_controller.dart';
import 'package:customer/View/Auth/Login_screens/login.dart';
import 'package:customer/View/Auth/trems.dart';
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/elevat_button.dart';
import 'package:customer/View/Widgets/phone_number_textfield.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:customer/View/Widgets/textstyle.dart';
import 'package:customer/View/textstyle/apptextstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Container(
        height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15),
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
                  left: 15.0,
                  right: 15.0,
                  top: 100.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text( CustomText.Sig_up, style: AppTextStyles.heading(size: 40),),
                    SizedBox(height: 5),
                    Text(
                      CustomText.Sigup_Description_text,
                        style: AppTextStyles.medium(),
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
                      height:70,
                      //padding: EdgeInsets.symmetric(vertical: 7),
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
                          Text(
                           "${CustomText.SigUp_Trems_Text} ",style: AppTextStyles.small(),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.to(TermsAndConditionsScreen());
                              },
                              child: Text(
                              CustomText.SigUp_TremsAndCondition,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.small(
                                color: CustomColor.trems,
                              ),
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
                  height: 55,
                  width: 250,
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
                  SizedBox(width: 5,),
                  Text(
                    CustomText.Already_Account_Text,style: AppTextStyles.small(),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/SigIn_Screen');
                    },
                    child: Text(
                      "Log In",
                      style: AppTextStyles.regular( weight: FontWeight.bold,
                        color: CustomColor.Button_background_Color,)

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
