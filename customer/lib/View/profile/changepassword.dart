import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/elevat_button.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../textstyle/apptextstyle.dart';


class Changepassword extends StatelessWidget {
  const Changepassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: CustomColor.background,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
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
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //padding: const EdgeInsets.all(15.0),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: CustomColor.Icon_Color),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.25,),
              Center(
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: CustomColor.textField_Icon_Color,
                  ),
                ),
                hintText: CustomText.Chng_Curr_pass,
                FontSize: 14,
                prefixIcon: Icon(
                  Icons.password,
                  color: CustomColor.textField_Icon_Color,
                ),
                borderRadius: 15,
                // fillColor: CustomColor.textfield_fill,
              ),


              // CustomTextField(
              //   suffixIcon: IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.remove_red_eye, color: CustomColor.textColor),
              //   ),
              //   hintText: CustomText.Chng_Curr_pass,
              //   FontSize: 14,
              //   prefixIcon: Icon(Icons.lock, color: CustomColor.textColor),
              //   borderRadius: 15,
              //   fillColor: CustomColor.textfield_fill,
              // ),
              SizedBox(height: 10),

              CustomTextField(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: CustomColor.textField_Icon_Color,
                  ),
                ),
                hintText: CustomText.Chng_New_pass,
                FontSize: 14,
                prefixIcon: Icon(
                  Icons.password,
                  color: CustomColor.textField_Icon_Color,
                ),
                borderRadius: 15,
                // fillColor: CustomColor.textfield_fill,
              ),
          
              // CustomTextField(
              //   suffixIcon: IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.remove_red_eye, color: CustomColor.textColor),
              //   ),
              //   hintText: CustomText.Chng_New_pass,
              //   FontSize: 14,
              //   prefixIcon: Icon(Icons.lock, color: CustomColor.textColor),
              //   borderRadius: 15,
              //   fillColor: CustomColor.textfield_fill,
              // ),
              //
              SizedBox(height: 10),


              CustomTextField(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: CustomColor.textField_Icon_Color,
                  ),
                ),
                hintText: CustomText.Chng_Confirm_pass,
                FontSize: 14,
                prefixIcon: Icon(
                  Icons.password,
                  color: CustomColor.textField_Icon_Color,
                ),
                borderRadius: 15,
                // fillColor: CustomColor.textfield_fill,
              ),


          
              // CustomTextField(
              //   suffixIcon: IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.remove_red_eye, color: CustomColor.textColor),
              //   ),
              //   hintText: CustomText.Chng_Confirm_pass,
              //   FontSize: 14,
              //  // prefixIcon: Icon(Icons.lock, color: CustomColor.textColor),
              //   borderRadius: 15,
              //   //fillColor: CustomColor.textfield_fill,
              // ),
              //
              SizedBox(height: 15),

              Center(
                child: SizedBox(
                  height: 55,
                  width: 250,
                  child: MyElevatedButton(
                    text: "",
                    onPressed: () {
                      Get.toNamed('/RideInfoScreen');
                    },
                    textWidget: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Next",
                        style: AppTextStyles.medium(size: 25,weight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
