import 'package:customer/View/textstyle/apptextstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/color.dart';
import '../../payments/paymentscreen.dart';
import '../../yourtrip/yourtrip.dart';

class appDrawer extends StatelessWidget {
  const appDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            color: CustomColor.Container_Colors,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                SizedBox(height: 50),
                CircleAvatar(
                  backgroundColor: Colors.white60,
                  radius: 50,
                  child: Icon(
                    Icons.person_add_alt,
                    color: Colors.white,
                    size: 50,
                  ),
                ),

                //------------------------ name Drawer
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "MUHAMMAD IBAD ULLAH QURESHI",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.medium(
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "mibadulalhqureshi@gmail.com",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.regular(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "0123456789",
                    style: AppTextStyles.regular(

                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(),

                //------------------------------  Drawer option
                SizedBox(height: 5),
                ListTile(
                  leading: Icon(Icons.home, size: 20, color: Colors.white),
                  title: Text("Home", style: AppTextStyles.small()),
                  onTap: () {
                    Get.toNamed('/Deshboard');
                  },
                ),

                ListTile(
                  leading: Icon(
                    Icons.picture_in_picture,
                    size: 20,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Your Trip",
                    style: AppTextStyles.small(),
                  ),
                  onTap: () {
                    Get.to(Yourtrip());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.payments, size: 20, color: Colors.white),
                  title: Text("Payment",style:  AppTextStyles.small()),
                  onTap: () {

                    Get.to(PaymentScreen());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, size: 20, color: Colors.white),
                  title: Text(
                    "User Profile",
                    style: AppTextStyles.small(),
                  ),
                  onTap: () {
                    Get.toNamed('/ProfileScreen');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.send_to_mobile,
                    size: 20,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Invite your Friend",
                    style: AppTextStyles.small(),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.person, size: 20, color: Colors.white),
                  title: Text("About", style: AppTextStyles.small(),),
                  onTap: () {
                    Get.toNamed('/AboutScreen');
                  },
                ),
                SizedBox(height: 15),
                ListTile(
                  leading: Icon(Icons.logout, size: 20, color: Colors.white),
                  title: Text("Logout", style:AppTextStyles.small(),),
                  onTap: () {
                    Get.offAllNamed('/SigIn_Screen');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
