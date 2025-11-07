import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/payment/paymentcontroller.dart';
import '../Widgets/all_text.dart';
import '../Widgets/color.dart';
import '../Widgets/elevat_button.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           // ---------- Heading ----------
           const Text(
             CustomText.Payments,
             style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold,
               color: Colors.white,
             ),
           ),
           const SizedBox(height: 15),

           const Text(
             CustomText.Payments_Method_Choose,
             style: TextStyle(
               color: Colors.white70,
               fontSize: 16,
             ),
           ),

           const SizedBox(height: 40),

           // ========================================        Payment Options
           Obx(() => Column(
             children: [
               _buildPaymentOption(
                   icon: Icons.attach_money,
                   Select_Payment: "Cash",
                   index: 0),
               const SizedBox(height: 15),
               _buildPaymentOption(
                   icon: Icons.account_balance,
                   Select_Payment: "Account",
                   index: 1),
               const SizedBox(height: 15),
               _buildPaymentOption(
                   icon: Icons.credit_card,
                   Select_Payment: "Credit Card",
                   index: 2),
             ],
           )),

           const SizedBox(height: 40),

           // ---------- Info Text ----------
           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 20),
             child: Text(
               CustomText.Payments_Text,
               textAlign: TextAlign.center,
               style: TextStyle(color: Colors.white54, fontSize: 14),
             ),
           ),

           const SizedBox(height: 40),

           // ---------- Done Button ----------

           SizedBox(
               width: 350,
               height: 50,
               child:  SizedBox(
                 height: 50,
                 width: 350  ,
                 child: MyElevatedButton(
                   text: 'Done',
                   onPressed: () {
                     Get.toNamed("/SigIn_Screen");
                   },
                   backgroundColor: CustomColor.Icon_Color,
                   textColor: Colors.black,
                   fontSize: 20,
                 ),
               )
           ),

         ],
       ),

    );
  }

  // ---------- Custom Widget ----------
  Widget _buildPaymentOption({
    required IconData icon,
    required String Select_Payment,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => controller.selectMethod(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: CustomColor.textfield_fill,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: controller.selectedMethod.value == index
                ? Colors.white
                : Colors.white30,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 26),
            const SizedBox(width: 10),
            Text(
              Select_Payment,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                color: controller.selectedMethod.value == index
                    ? Colors.white
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
