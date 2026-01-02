

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

  //final profileController = Get.find<profileModelController>();
  final profileController = Get.isRegistered<profileModelController>()
      ? Get.find<profileModelController>()
      :  Get.put(profileModelController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<profileModelController>(
      builder: (controller) {
        final user = controller.profileData;
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                color: CustomColor.Container_Colors,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child:  ListView (
                  children: [
                    const SizedBox(height: 50),

                    // User Profile Info
                    if (controller.loading.value)
                      const Center(child: CircularProgressIndicator())
                    else if (user == null)
                      const Center(child: Text("No Data"))
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: controller.selectedImage.value != null
                                  ? FileImage(controller.selectedImage.value!) // use .value and null check
                                  : (user.profilePicture != null && user.profilePicture!.isNotEmpty
                                  ? NetworkImage(user.profilePicture!) as ImageProvider
                                  : const AssetImage("assets/images/profileimage.png")),
                            ),
                          ),

                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              user.firstName != null ? "${user.firstName} ${user.lastName}" : "No Data Found",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.heading(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              user.email ?? "Email not found",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.medium(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              user.phoneNumber ?? "No. not found",
                              style: AppTextStyles.medium(),
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 10),
                    const Divider(),

                    // Drawer Options
                    ListTile(
                      leading: const Icon(Icons.home, size: 20, color: Colors.white),
                      title: Text("Home", style: AppTextStyles.medium()),
                      onTap: () => Get.toNamed('/Deshboard'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.picture_in_picture, size: 20, color: Colors.white),
                      title: Text("Your Trip", style: AppTextStyles.medium()),
                      onTap: () => Get.to(Yourtrip()),
                    ),
                    ListTile(
                      leading: const Icon(Icons.payments, size: 20, color: Colors.white),
                      title: Text("Payment", style: AppTextStyles.medium()),
                      onTap: () => Get.to(PaymentScreen()),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings, size: 20, color: Colors.white),
                      title: Text("User Profile", style: AppTextStyles.medium()),
                      onTap: () => Get.toNamed('/ProfileScreen'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.send_to_mobile, size: 20, color: Colors.white),
                      title: Text("Invite your Friend", style: AppTextStyles.medium()),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.person, size: 20, color: Colors.white),
                      title: Text("About", style: AppTextStyles.medium()),
                      onTap: () => Get.toNamed('/AboutScreen'),
                    ),
                    const SizedBox(height: 15),
                    ListTile(
                      leading: const Icon(Icons.logout, size: 20, color: Colors.white),
                      title: Text("Logout", style: AppTextStyles.medium()),
                      onTap: () {
                        TokenManager.clearSession();
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
    );
  }
}




















// import 'package:customer/View/textstyle/apptextstyle.dart';
// import 'package:customer/api_servies/session.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Widgets/color.dart';
// import '../../payments/paymentscreen.dart';
// import '../../profile/controller/profile_controller.dart';
// import '../../yourtrip/yourtrip.dart';
//
// class appDrawer extends StatelessWidget {
//    appDrawer({super.key});
//   final profileController = Get.put(profileModelController());
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.6,
//       child: ClipRRect(
//         child: Container(
//           decoration: BoxDecoration(
//             color: CustomColor.Container_Colors,
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(70),
//               bottomRight: Radius.circular(70),
//             ),
//           ),
//
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: ListView(
//               children: [
//                 SizedBox(height: 50),
//
//
//                 //-----------------------------------------------------
//                 Obx(
//                   (){
//                     // if (profileController.loading.value) {
//                     //   return Center(child: CircularProgressIndicator());
//                     // }
//                     //
//                     // if (profileController.profileData.value == null) {
//                     //   return Center(child: Text("No Data"));
//                     // }
//
//                     final user = profileController.profileData.value!;
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                           child: CircleAvatar(
//                             radius: 50,
//                             child: Icon(
//                               Icons.person_add_alt,
//                               color: Colors.white,
//                               size: 50,
//                             ),
//                           ),
//                         ),
//
//                         //------------------------ name Drawer
//
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: Text(
//                             //"MUHAMMAD IBAD ULLAH QURESHI",
//                             user.firstName != null
//                             ?
//                             "${user.firstName} ${user.lastName}"
//                            :     "No Data Found",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: AppTextStyles.heading(),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: Text(
//                            // "mibadulalhqureshi@gmail.com",
//                             user.email != null
//                             ?
//                             "${user.email}"
//                             :"email not found ",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: AppTextStyles.medium(),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: Text(
//                             //"0123456789",
//                             user.phoneNumber != null
//                             ?
//                             " ${user.phoneNumber}"
//                             :"No. not found",
//                             style: AppTextStyles.medium(
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//
//
//                 SizedBox(height: 10),
//                 Divider(),
//
//                 //------------------------------  Drawer option
//                 SizedBox(height: 5),
//                 ListTile(
//                   leading: Icon(Icons.home, size: 20, color: Colors.white),
//                   title: Text("Home", style: AppTextStyles.medium()),
//                   onTap: () {
//                     Get.toNamed('/Deshboard');
//                   },
//                 ),
//
//                 ListTile(
//                   leading: Icon(
//                     Icons.picture_in_picture,
//                     size: 20,
//                     color: Colors.white,
//                   ),
//                   title: Text(
//                     "Your Trip",
//                     style: AppTextStyles.medium(),
//                   ),
//                   onTap: () {
//                     Get.to(Yourtrip());
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.payments, size: 20, color: Colors.white),
//                   title: Text("Payment",style:  AppTextStyles.medium()),
//                   onTap: () {
//
//                     Get.to(PaymentScreen());
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.settings, size: 20, color: Colors.white),
//                   title: Text(
//                     "User Profile",
//                     style: AppTextStyles.medium(),
//                   ),
//                   onTap: () {
//                     Get.toNamed('/ProfileScreen');
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.send_to_mobile,
//                     size: 20,
//                     color: Colors.white,
//                   ),
//                   title: Text(
//                     "Invite your Friend",
//                     style: AppTextStyles.medium(),
//                   ),
//                   onTap: () {},
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.person, size: 20, color: Colors.white),
//                   title: Text("About", style: AppTextStyles.medium(),),
//                   onTap: () {
//                     Get.toNamed('/AboutScreen');
//                   },
//                 ),
//                 SizedBox(height: 15),
//
//                 ListTile(
//                   leading: Icon(Icons.logout, size: 20, color: Colors.white),
//                   title: Text("Logout", style:AppTextStyles.medium(),),
//                   onTap: () {
//                     TokenManager.clearSession();
//                     //Get.offAllNamed('/SigIn_Screen');
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
