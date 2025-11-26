import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SwapController extends GetxController {
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  var selectedItem = (0).obs;
  RxInt selectedIndex = 0.obs;

    RxList<TextEditingController> viaControllers = <TextEditingController>[].obs;



  List<Map<String, dynamic>> iconItems = [
      {"name": "Home", "icon": Icons.home},
      {"name": "Bus", "icon":Icons.airplanemode_active_rounded },
      {"name": "Plane", "icon":Icons.directions_bus},
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

  swapValues() {
    final temp = firstController.text;
    firstController.text = secondController.text;
    secondController.text = temp;

    update();
  }


  //
  // @override
  // void onClose() {
  //   firstController.dispose();
  //   secondController.dispose();
  //   super.onClose();
  // }


  void addViaField() {
    if (viaControllers.length < 2) {    // max 2 via stops
      viaControllers.add(TextEditingController());
      update();
    }
  }

  void removeViaField(int index) {
    viaControllers.removeAt(index);
    update();
  }
}
