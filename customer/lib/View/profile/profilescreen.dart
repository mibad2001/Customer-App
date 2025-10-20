import 'package:customer/View/Deshboard/AddHome/add_home.dart';
import 'package:customer/View/Deshboard/AddWork/add_work.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/Widgets/text_button.dart';
import 'package:customer/View/profile/changepassword.dart';
import 'package:customer/View/profile/changephone_number.dart';
import 'package:customer/View/yourtrip/yourtrip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../Widgets/all_text.dart';
import '../Widgets/textstyle.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: CustomColor.background,
        drawerEnableOpenDragGesture: false,

        drawer: SizedBox(
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
                      title: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
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
                      leading: Icon(
                        Icons.payments,
                        size: 20,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Payment",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        size: 20,
                        color: Colors.white,
                      ),
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
                      leading: Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.white,
                      ),
                      title: Text(
                        "About",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Get.toNamed('/AboutScreen');
                      },
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        size: 20,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Get.offAllNamed('/SignIn');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    height: 40,
                    width: 40,
                    child: IconButton(
                      onPressed: () {
                        _scaffoldkey.currentState!.openDrawer();
                      },
                      icon: Icon(Icons.menu, size: 25, color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(width: MediaQuery.of(context).size.width * 0.2),

                Text(
                  CustomText.User_Profile,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),

            CircleAvatar(radius: 45, backgroundColor: Colors.blue),

            ListTile(
              leading: Icon(Icons.person, size: 25, color: Colors.white),
              title: Text(
                CustomText.Name,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              subtitle: Text(
                "Muhammad Faheem",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),

            ListTile(
              leading: Icon(Icons.phone, size: 25, color: Colors.white),
              title: Text(
                CustomText.Mobile,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              subtitle: Text(
                "+9234567896",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              trailing: Icon(Icons.edit, color: Colors.white),
              onTap: () {
                Get.to(() => ChangPhoneNumber());
              },
            ),

            ListTile(
              leading: Icon(
                Icons.email_outlined,
                size: 25,
                color: Colors.white,
              ),
              title: Text(
                CustomText.Email,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              subtitle: Text(
                "abc@gmail.com",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),

            ListTile(
              leading: Icon(Icons.password, size: 25, color: Colors.white),
              title: Text(
                CustomText.Change_password,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              subtitle: Text(
                CustomText.Password_tab_Text,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              trailing: Icon(Icons.edit, size: 25, color: Colors.white),
              onTap: () {
                Get.to(Changepassword());
              },
            ),

            ListTile(
              leading: Icon(Icons.delete, size: 25, color: Colors.white),
              title: Text(
                CustomText.Delete_Account,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              onTap: () {
                Get.dialog(
                  Dialog(
                    backgroundColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      height: 260,
                      width: 150,
                      child: Column(
                        children: [
                          SizedBox(height: 10),

                          Text(
                            CustomText.Delete_Account,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Icon(
                            Icons.warning_amber,
                            color: Colors.amberAccent,
                            size: 40,
                          ),
                          Center(
                            child: Container(
                              height: 120,
                              width: 200,
                              child: Text(
                                CustomText.Delete_Alert,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),

                          Row(
                            children: [
                              SizedBox(width: 70, height: 5),
                              CustomTextButton(
                                text: 'Yes',
                                onPressed: () {},
                                backgroundColor: Colors.black54,
                                textColor: Colors.white,
                                borderRadius: 8,
                                elevation: 2,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                              ),
                              SizedBox(width: 20),

                              CustomTextButton(
                                text: 'NO',
                                onPressed: () {
                                  Get.back();
                                },
                                backgroundColor: Colors.black54,
                                textColor: Colors.white,
                                borderRadius: 8,
                                elevation: 2,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home, size: 25, color: Colors.white),
              title: Text(
                CustomText.Add_Home,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              onTap: () {
                Get.to(() => AddHomeScreen());
              },
            ),
            ListTile(
              leading: Icon(Icons.home_work, size: 25, color: Colors.white),
              title: Text(
                CustomText.Add_Work,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              onTap: () {
                Get.to(() => AddWork_Screen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
