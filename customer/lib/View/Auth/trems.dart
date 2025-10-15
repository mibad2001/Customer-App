import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/textstyle.dart';
import 'package:flutter/material.dart';

class TremsAndCondition_Screen extends StatelessWidget {
  const TremsAndCondition_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/ 4,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [CustomColor.textColor, CustomColor.trems],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         CustomTextStyle(
                    text: "Hello 👋",
                    fontSize: 30,
                    
                                ),
                    CustomTextStyle(
                    text: CustomText.Terms_text_1,
                    fontSize: 15,
                    
                                ),
                    ],),
                  ),
                ),
              ],
            ),
                CustomTextStyle(
                  text: CustomText.SigUp_TremsAndCondition,
                  fontSize: 30,
                  
                ),
                 CustomTextStyle(
                  text: CustomText.Terms_Text_1_light,
                  color: Colors.grey,
                  
                ),
                SizedBox(height: 12),

                 CustomTextStyle(
                  text: CustomText.Terms_Text_2,
                fontSize: 20,
                  
                ),
                SizedBox(height: 5),

                 CustomTextStyle(
                  text: CustomText.Terms_Text_2_1,
                fontSize: 13,
                  
                ),
                SizedBox(height: 12),

                    CustomTextStyle(
                  text: CustomText.Terms_Text_3,
                fontSize: 20,
                  
                ),
                SizedBox(height: 5),

                       CustomTextStyle(
                  text: CustomText.Terms_Text_3_1,
                fontSize: 13,
                  
                ),
                SizedBox(height: 12),

                      CustomTextStyle(
                  text: CustomText.Terms_Text_4,
                fontSize: 20,
                  
                ),
                SizedBox(height: 5),
                   CustomTextStyle(
                  text: CustomText.Terms_Text_4_1,
                fontSize: 13,
                  
                ),
                




          ],
        ),
      ),
    );
  }
}
