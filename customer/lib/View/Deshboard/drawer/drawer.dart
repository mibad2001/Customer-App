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
            color: Colors.blueGrey, // Background color
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
                    "MUHAMMAD FAHEEM",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.Text_Color,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Abcasdfghjk@gmai.com",
                    style: TextStyle(
                      fontSize: 15,
                      color: CustomColor.Text_Color,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "x123456789",
                    style: TextStyle(
                      fontSize: 15,
                      color: CustomColor.Text_Color,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(),

                //------------------------------  Drawer option
                SizedBox(height: 5),
                ListTile(
                  leading: Icon(Icons.home, size: 20, color: Colors.white),
                  title: Text("Home", style: TextStyle(color: Colors.white)),
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
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Get.to(Yourtrip());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.payments, size: 20, color: Colors.white),
                  title: Text("Payment", style: TextStyle(color: Colors.white)),
                  onTap: () {

                    Get.to(PaymentScreen());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, size: 20, color: Colors.white),
                  title: Text(
                    "User Profile",
                    style: TextStyle(color: Colors.white),
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
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.person, size: 20, color: Colors.white),
                  title: Text("About", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Get.toNamed('/AboutScreen');
                  },
                ),
                SizedBox(height: 15),
                ListTile(
                  leading: Icon(Icons.logout, size: 20, color: Colors.white),
                  title: Text("Logout", style: TextStyle(color: Colors.white)),
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
