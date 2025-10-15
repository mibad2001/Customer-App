import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/elevat_button.dart';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:flutter/material.dart';

class Changepassword extends StatelessWidget {
const Changepassword({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: CustomColor.background,
body: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Text("Change Password",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
    SizedBox(height: 20),
    CustomTextField(
      suffixIcon: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.remove_red_eye,
          color: CustomColor.textColor,
        ),
      ),
      hintText: CustomText.Chng_Curr_pass,
      FontSize: 14,
      prefixIcon: Icon(
        Icons.lock,
        color: CustomColor.textColor,
      ),
      borderRadius: 15,
      fillColor: CustomColor.textfield_fill,
    ),
    SizedBox(height: 10,),

    CustomTextField(
      suffixIcon: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.remove_red_eye,
          color: CustomColor.textColor,
        ),
      ),
      hintText: CustomText.Chng_New_pass,
      FontSize: 14,
      prefixIcon: Icon(
        Icons.lock,
        color: CustomColor.textColor,
      ),
      borderRadius: 15,
      fillColor: CustomColor.textfield_fill,
    ),

    SizedBox(height: 10,),

    CustomTextField(
      suffixIcon: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.remove_red_eye,
          color: CustomColor.textColor,
        ),
      ),
      hintText: CustomText.Chng_Confirm_pass,
      FontSize: 14,
      prefixIcon: Icon(
        Icons.lock,
        color: CustomColor.textColor,
      ),
      borderRadius: 15,
      fillColor: CustomColor.textfield_fill,
    ),

    SizedBox(height: 15,),

    MyElevatedButton(
      text: 'Next',
      onPressed: (){},
      backgroundColor: Colors.white,
      textColor: Colors.black,
      borderRadius: 10,
      elevation: 5.0,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
    ),


  ],


  ),
),

);
}
}
