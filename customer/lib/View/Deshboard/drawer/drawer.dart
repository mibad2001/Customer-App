import 'package:customer/View/textstyle/apptextstyle.dart';
import 'package:customer/api_servies/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widgets/color.dart';
import '../../payments/paymentscreen.dart';
import '../../profile/controller/profile_controller.dart';
import '../../yourtrip/yourtrip.dart';

class appDrawer extends StatelessWidget {
   appDrawer({super.key});
  final profileController = Get.put(profileModelController());
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


                //-----------------------------------------------------
                Obx(
                  (){
                    if (profileController.loading.value) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (profileController.profileData.value == null) {
                      return Center(child: Text("No Data"));
                    }

                    final user = profileController.profileData.value!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 50,
                            child: Icon(
                              Icons.person_add_alt,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),

                        //------------------------ name Drawer
                        // Marquee(text: "${user.firstName} ${user.lastName}",
                        //   style: AppTextStyles.heading(),
                        //   scrollAxis: Axis.horizontal,
                        //   blankSpace: 50,
                        //   velocity: 50,     // speed
                        //   pauseAfterRound: Duration(seconds: 1),
                        //   startPadding: 10,
                        //   accelerationDuration: Duration(seconds: 1),
                        //   decelerationDuration: Duration(seconds: 1),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            //"MUHAMMAD IBAD ULLAH QURESHI",
                            "${user.firstName} ${user.lastName}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.heading(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                           // "mibadulalhqureshi@gmail.com",
                            "${user.email}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.medium(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            //"0123456789",
                            " ${user.phoneNumber}",
                            style: AppTextStyles.medium(
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),


                SizedBox(height: 10),
                Divider(),

                //------------------------------  Drawer option
                SizedBox(height: 5),
                ListTile(
                  leading: Icon(Icons.home, size: 20, color: Colors.white),
                  title: Text("Home", style: AppTextStyles.medium()),
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
                    style: AppTextStyles.medium(),
                  ),
                  onTap: () {
                    Get.to(Yourtrip());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.payments, size: 20, color: Colors.white),
                  title: Text("Payment",style:  AppTextStyles.medium()),
                  onTap: () {

                    Get.to(PaymentScreen());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, size: 20, color: Colors.white),
                  title: Text(
                    "User Profile",
                    style: AppTextStyles.medium(),
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
                    style: AppTextStyles.medium(),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.person, size: 20, color: Colors.white),
                  title: Text("About", style: AppTextStyles.medium(),),
                  onTap: () {
                    Get.toNamed('/AboutScreen');
                  },
                ),
                SizedBox(height: 15),

                ListTile(
                  leading: Icon(Icons.logout, size: 20, color: Colors.white),
                  title: Text("Logout", style:AppTextStyles.medium(),),
                  onTap: () {
                    TokenManager.clearSession();
                    //Get.offAllNamed('/SigIn_Screen');
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
