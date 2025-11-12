
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/payment/paymentcontroller.dart';
import '../Widgets/all_text.dart';
import '../Widgets/color.dart';
import '../Widgets/elevat_button.dart';

class RideComplete extends StatelessWidget {

  final PaymentController  paymentController= Get.put(PaymentController());
   RideComplete({super.key});

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
                          CustomText.Ride_Complete,
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

              SizedBox(height: 30,),

              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
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
                        style: TextStyle(
                          fontSize: 18,
                          color: CustomColor.Text_Color,
                        ),
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
                      style: TextStyle(
                        fontSize: 18,
                        color: CustomColor.Text_Color,
                      ),
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: CustomColor.Text_Color,
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
                  ),
                  Text(
                    "Cash",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: CustomColor.Text_Color,
                    ),
                  ),

                   SizedBox(width: 20),
                  Radio<String>(
                    value: 'Credit Card',
                    groupValue: paymentController.paymentMethod.value,
                    onChanged: paymentController.setPaymentMethod,
                    activeColor: CustomColor.Icon_Color,
                  ),
                  Text(
                    "Credit Card",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: CustomColor.Text_Color,
                    ),
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
                    onPressed: () {  },
                    backgroundColor: CustomColor.Icon_Color,
                    textColor: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),


            ],
          ),
          bottomNavigationBar: Container(
            height: 70,
            child: Column(
              children: [
                Divider(
                  color: CustomColor.Icon_Color,
                ),
                SizedBox(height: 3,),

                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: TextButton(
                        onPressed: (){},
                        child: Text(
                          "Help and Support please call",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: CustomColor.Text_Color,
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.call,size: 25,color: CustomColor.Icon_Color,),



                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
