import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../api_servies/api_servies.dart';
import '../../api_servies/session.dart';
import 'model/pickuplocationmodel.dart';

class SwapController extends GetxController {
  // final firstController = TextEditingController();
  // final secondController = TextEditingController();
  var selectedItem = (0).obs;
  RxInt selectedIndex = 0.obs;

  // // var showInterchange = true.obs;
  //   RxList<TextEditingController> viaControllers = <TextEditingController>[].obs;
  //


  List<Map<String, dynamic>> iconItems = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Bus", "icon": Icons.airplanemode_active_rounded},
    {"name": "Plane", "icon": Icons.directions_bus},
  ];


  List<String> busStops = [
    "Korangi 2 No. Bus Stop",
    "Nagan Chowrangi Bus Stop",
    "Gulshan Chowrangi Bus Stop",
    "Sohrab Goth Bus Stop",
    "Johar Mor Bus Stop",
    "Kala Pul Bus Stop",
    "PIDC Bus Stop",
    "Tariq Road Bus Stop",
    "Clifton Teen Talwar Bus Stop",
    "Shah Faisal Colony Stop",
    "Saddar Mobile Market Stop",
    "Cantt Station Bus Stop",
    "Lahore Thokar Niaz Baig Stop",
    "Kalma Chowk Bus Stop",
    "Model Town Link Road Stop",
    "Anarkali Stop",
    "Rawalpindi Faizabad Bus Stop",
    "Murree Road Committee Chowk Stop",
    "Peshawar Khyber Bazaar Stop",
    "Faisalabad D Ground Bus Stop"
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  // swapValues() {
  //   final temp = firstController.text;
  //   firstController.text = secondController.text;
  //   secondController.text = temp;
  //
  //   update();
  // }


  //
  // @override
  // void onClose() {
  //   firstController.dispose();
  //   secondController.dispose();
  //   super.onClose();
  // }


  // void addViaField() {
  //   if (viaControllers.length < 2) {    // max 2 via stops
  //     viaControllers.add(TextEditingController());
  //     update();
  //   }
  // }
  //
  // void removeViaField(int index) {
  //   viaControllers.removeAt(index);
  //   update();
  // }


  //var selectedItem =(0).obs;
  var showInterchange = true.obs;
  var controllers = <TextEditingController>[].obs;
  final TextEditingController pickUp = TextEditingController(); // observable list
  final TextEditingController dropOff = TextEditingController(); // observable list





  void selectedContainer(int index) {
    selectedItem.value = index;
  }


  void swapField() {
    String temp = pickUp.text;
    pickUp.text = dropOff.text;
    dropOff.text = temp;
  }


  void addField() {
    showInterchange.value = false;
    if (controllers.length < 2) {
      controllers.add(TextEditingController());

    }
    //else {
    //   Get.snackbar(
    //     "",
    //     "",
    //     titleText: const SizedBox.shrink(),
    //     messageText: Row(
    //       children: [
    //         Container(
    //           width: 20,
    //           height: 20,
    //           clipBehavior: Clip.antiAlias,
    //           decoration: BoxDecoration(
    //               color: Color(0xFF262C60),
    //               borderRadius: BorderRadius.circular(3),
    //               image: DecorationImage(image: AssetImage('assets/logo.png'))),
    //
    //         ),
    //         const SizedBox(width: 14),
    //         const Text(
    //           "Can't add more than 2 Via",
    //           style: TextStyle(color: Colors.white, fontSize: 15),
    //         ),
    //       ],
    //     ),
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.grey.shade900,
    //     borderRadius: 10,
    //     margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
    //     padding: EdgeInsets.only(
    //       left: 12,
    //       right: 12,
    //       bottom: 12,
    //       top: 4,
    //     ),
    //     duration: const Duration(seconds: 2),
    //   );
    // }
  }

  void removeField(int index) {
    controllers[index].dispose();

    controllers.removeAt(index);
        if (controllers.isEmpty) {
      showInterchange.value = true;
    }
  }

  ///============================= ======================== ================ ============pick Up location search
  RxBool searchloading = false.obs;
  PickUpLocationModel? pickUpLocationModel ;
  Result? result;
  Future<void> pickupLocation() async {

    searchloading.value = true;
    update();
    var response = await ApiService.get(
     '',
fullUrl: 'http://192.168.110.3:5000/api/services/search?search=${pickUp.text}',
      auth: true,
    );

    if (response!.statusCode == 200) {
     pickUpLocationModel= PickUpLocationModel.fromJson(response.data);
    }
    searchloading.value = false;
    update();
  }


}
