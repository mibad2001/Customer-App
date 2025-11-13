import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:get/get.dart';

import '../Widgets/all_text.dart';
import '../Widgets/elevat_button.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: CustomColor.textColor,
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
                      color: CustomColor.Icon_Color,
                    ),
                  ),

                  SizedBox(width: 5),

                  Expanded(
                    child: Center(
                      child: Text(
                        CustomText.PaymentsDone,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.Text_Color,
                        ),
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.edit_notifications_sharp,
                      size: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,

                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        CustomText.Thanks_caption,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: CustomColor.Text_Color,
                        ),
                      ),
                      SizedBox(height: 10),
                      Icon(Icons.favorite),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    CustomText.Name_thnks_scr + "  :  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColor.Text_Color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Muhammad Ibad Ullah Qureshi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColor.Text_Color,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 25,
                    color: CustomColor.Icon_Color,
                  ),
                  SizedBox(width: 5),

                  Expanded(
                    child: Text(
                      "1A Worrior Garden St.LEO "
                      " Worrior Garden St.LEO TN36eb",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: CustomColor.Text_Color,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                CustomText.Payments_Method,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: CustomColor.Text_Color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cash",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: CustomColor.Text_Color),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    CustomText.Status + "  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: CustomColor.Text_Color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Paid",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: CustomColor.Text_Color,
                      ),
                    ),
                  ),
                ],
              ),
            ),



        Center(
              child: Container(
                height: 120, // 👈 height set
                width: MediaQuery.of(context).size.width* 0.9, // 👈 full width
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),


                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    EmojiFeedback(
                      initialRating: 4,
                      animDuration: const Duration(milliseconds: 300),
                      curve: Curves.bounceIn,
                      labelTextStyle: TextStyle(color: CustomColor.Text_Color),
                      inactiveElementScale: .5,
                      onChanged: (value) {
                      },
                      onChangeWaitForAnimation: true,
                    ),
                  ],
                ),
              ),
            ),





            SizedBox(height: 15),
            Center(
              child: SizedBox(
                height: 50,
                width: 300,
                child: MyElevatedButton(
                  text: 'DONE',
                  onPressed: () {},
                  backgroundColor: CustomColor.Icon_Color,
                  textColor: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
