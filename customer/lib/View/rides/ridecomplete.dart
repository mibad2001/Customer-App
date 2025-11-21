
import 'package:customer/View/textstyle/apptextstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/payment/paymentcontroller.dart';
import '../Widgets/all_text.dart';
import '../Widgets/color.dart';
import '../Widgets/elevat_button.dart';
import '../thanks/thanksscreen.dart';
import 'DriverDetailscreen.dart';

class RideCompleteScreen extends StatelessWidget {

  final PaymentController  paymentController= Get.put(PaymentController());
  RideCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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

            child: Column(
              children: [
                Container(height: MediaQuery.of(context).size.height*0.917 ,
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
                                    CustomText.Ride_Complete,
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

                      SizedBox(height: 30,),

                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.9,
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
                                  CustomText.Reached_Destination,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.medium(),
                                ),
                                SizedBox(height: 10),
                                Icon(Icons.favorite,color: CustomColor.Icon_Color,),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),



                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.location_on,size: 25,color: CustomColor.Icon_Color,),
                            SizedBox(width: 3,),

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

                      SizedBox(height: 10,),

                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.money,size: 25,color: CustomColor.Icon_Color,),
                            SizedBox(width: 3,),

                            Text(
                              "3.000",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.medium(),
                            ),
                            Icon(Icons.currency_pound_sharp,size: 25,color: CustomColor.Icon_Color,),


                          ],
                        ),
                      ),

                      SizedBox(height: 10,),

                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text(
                          "Payment Method",
                          style: AppTextStyles.medium(
                          ),
                        ),
                      ),


                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Radio<String>(
                            value: 'Cash',
                            groupValue: paymentController.paymentMethod.value,
                            onChanged: paymentController.setPaymentMethod,
                            activeColor: CustomColor.Icon_Color,
                            fillColor: MaterialStateProperty.all<Color>(CustomColor.Container_Colors),

                          ),

                          Text(
                            "Cash",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.medium(

                            ),
                          ),

                           SizedBox(width: 20),

                          Radio<String>(
                            value: 'Credit Card',
                            groupValue: paymentController.paymentMethod.value,
                            onChanged: paymentController.setPaymentMethod,
                            activeColor: CustomColor.Icon_Color,
                            fillColor: MaterialStateProperty.all<Color>(CustomColor.Container_Colors),
                          ),
                          Text(
                            "Credit Card",
                            textAlign: TextAlign.center,
                            style:  AppTextStyles.medium()
                          ),
                        ],
                      )),

                      SizedBox(height: 50,),

                      Center(
                        child: SizedBox(
                          height: 50,
                          width: 350  ,
                          child: MyElevatedButton(
                            text: 'DONE',
                            onPressed: () {
                              Get.to(ThanksScreen());
                            },
                            fontSize: 20,
                          ),
                        ),
                      ),


                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                 decoration: BoxDecoration(
                   color: CustomColor.Container_Colors,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                 ),
                 
                  height: 70,
                  child:   Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: TextButton(
                          onPressed: (){},
                          child: Text(
                            "Help and Support please call",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.medium(),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.call,size: 25,
                        color: CustomColor.Icon_Color,
                      ),



                    ],
                  ),
                ),

              ],
            ),
          ),

        )
    );
  }
}
