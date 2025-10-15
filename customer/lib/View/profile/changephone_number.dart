
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/elevat_button.dart';
import 'package:customer/View/Widgets/phone_number_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ChangPhoneNumber extends StatelessWidget {
  const ChangPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.background,

        body: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [

        Container(
          margin: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(7))
        ),
          height: 30,
          width: 30,
          child: Icon(Icons.arrow_back_sharp, size: 25, color: Colors.white,)
      ),
                SizedBox(width:MediaQuery.of(context).size.width*0.15,),

                Text(CustomText.Chng_Phone_Num,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: CustomColor.Text_Color),),
              ],
            ),


            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(CustomText.Chng_Phone_Num,style: TextStyle(fontSize: 20,color: CustomColor.Text_Color),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(CustomText.Mobile_Num,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: CustomColor.Text_Color),),
            ),
            SizedBox(height: 10,),

            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: PhoneNumber_TextField( hintText: CustomText.Mobile_Num,
              ),
            ),
            SizedBox(height: 10,),

            Container(padding: EdgeInsets.only(left: 15),
                height: 50,width: 400,
                child: MyElevatedButton(text: 'NEXT',
                  onPressed: () { },
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  borderRadius: 20,
                  elevation: 5.0,
                ))



          ],
        ),
      ),
    );
  }
}
