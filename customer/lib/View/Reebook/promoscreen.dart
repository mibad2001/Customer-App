
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/color.dart';
import '../Widgets/elevat_button.dart';
import '../Widgets/textformfield.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: CustomColor.background ,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child:  IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, size: 25, color: CustomColor.Icon_Color  ),
            ),
          ),
          SizedBox(height: 20,),

          Container(
            height: 200,
            decoration: BoxDecoration(
              //color: Colors.yellow,
                image:DecorationImage(image: AssetImage("assets/images/promo.png",), fit: BoxFit.cover)
            ),
          ),

          SizedBox(height: 15,),


          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomTextField(
             // controller: ,
              hintText: "Enter Promo",
              borderRadius: 15,
              fillColor: CustomColor.textfield_fill,
            ),
          ),

          SizedBox(height: 10,),
          Center(
            child: Container(
              height: 50,
              width: 350  ,
              child: MyElevatedButton(
                text: 'DONE',
                onPressed: () {  },
                fontSize: 20,
              ),
            ),
          )

        ],
      )
    ));
  }
}
