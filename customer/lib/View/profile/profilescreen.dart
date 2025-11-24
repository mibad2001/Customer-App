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
import '../Deshboard/drawer/drawer.dart';
import '../textstyle/apptextstyle.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  //color: CustomColor.Container_Colors,
                  borderRadius: const BorderRadius.only(
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

                      const SizedBox(width: 5),

                      Expanded(
                        child: Center(
                          child: Text(
                            CustomText.User_Profile,
                            style: AppTextStyles.heading(
                              size: MediaQuery.of(context).size.width * 0.06,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
              ),

              SizedBox(height: 40),

              CircleAvatar(radius: 45, backgroundColor: Colors.blue),

              ListTile(
                leading: Icon(Icons.person, size: 25, color: Colors.white),
                title: Text(
                  CustomText.Name,
                  style: AppTextStyles.regular(),
                ),
                subtitle: Text(
                  "Muhammad Faheem",
                  style: AppTextStyles.regular(),
                ),
              ),

              ListTile(
                leading: Icon(Icons.phone, size: 25, color: Colors.white),
                title: Text(
                  CustomText.Mobile,
                  style: AppTextStyles.regular(),
                ),
                subtitle: Text(
                  "+9234567896",
                  style: AppTextStyles.regular(),
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
                  style: AppTextStyles.regular(),
                ),
                subtitle: Text(
                  "abc@gmail.com",
                  style: AppTextStyles.regular(),
                ),
              ),

              ListTile(
                leading: Icon(Icons.password, size: 25, color: Colors.white),
                title: Text(
                  CustomText.Change_password,
                  style: AppTextStyles.regular(),
                ),
                subtitle: Text(
                  CustomText.Password_tab_Text,
                  style: AppTextStyles.regular(),
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
                  style: AppTextStyles.regular(),
                ),
                onTap: () {
                  Get.dialog(
                    //============================  Dialog box
                    Dialog(
                        backgroundColor: CustomColor.Container_Colors,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: CustomColor.Container_Colors
                      ),
                        height: 260,
                        width: 150,
                        child: Column(
                          children: [
                            SizedBox(height: 25),

                            Text(
                              CustomText.Delete_Account,
                              style: AppTextStyles.heading(
                                size: 20,
                              ),
                            ),
                            SizedBox(height: 12),
                            Icon(
                              Icons.warning_amber,
                              color: Colors.amberAccent,
                              size: 40,
                            ),
                            SizedBox(height: 12),
                            Center(
                              child: Container(
                                height: 80,
                                width: 200,
                                child: Text(
                                  CustomText.Delete_Alert,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.small(),
                                ),
                              ),
                            ),

                            //SizedBox(height: 10,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                CustomTextButton(
                                  text: 'Yes',
                                  onPressed: () {},
                                  backgroundColor: Colors.red,
                                  textColor: CustomColor.Text_Color,
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
                                  backgroundColor: CustomColor.Button_background_Color,
                                  textColor: CustomColor.Text_Color,
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
                  style: AppTextStyles.small(),
                ),
                onTap: () {
                  Get.to(() => AddHomeScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.home_work, size: 25, color: Colors.white),
                title: Text(
                  CustomText.Add_Work,
                  style: AppTextStyles.small(),
                ),
                onTap: () {
                  Get.to(() => AddWork_Screen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
