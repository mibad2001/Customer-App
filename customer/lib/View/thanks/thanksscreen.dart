import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/textstyle/apptextstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:get/get.dart';

import '../Deshboard/dashboard.dart' show DeshBoard_Screen;
import '../Widgets/all_text.dart';
import '../Widgets/elevat_button.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: CustomColor.background,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                 // color: CustomColor.Container_Colors,
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
                          style: AppTextStyles.heading(
                            size: MediaQuery.of(context).size.width * 0.06,

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
                  height: MediaQuery.of(context).size.height * 0.15,
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
                          style: AppTextStyles.medium(

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
                      style: AppTextStyles.medium(),
                    ),

                    Text(
                      "Muhammad Ibad Ullah Qureshi",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.medium(),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8),

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
                        style: AppTextStyles.medium(),
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
                  style: AppTextStyles.medium(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cash",
                  textAlign: TextAlign.center,
                  style:AppTextStyles.medium(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 7.0),
                child: Row(
                  children: [
                    Text(
                      CustomText.Status + "  ",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.medium(),
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Paid",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.medium(),
                      ),
                    ),
                  ],
                ),
              ),



              Center(
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width* 0.9,
                  //padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),


                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      EmojiFeedback(
                        initialRating: 4,
                        animDuration: const Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                        labelTextStyle:AppTextStyles.small(),
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
                    onPressed: () {
                     Get.to(DeshBoard_Screen()) ;
                    },

                    fontSize: 20,
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
