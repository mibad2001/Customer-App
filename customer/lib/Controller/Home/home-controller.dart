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
    final List<String> Title_Address = ["Home", "Airport", "bus"];
    final List<String> Address = [ "Address 1","Address 2", "Address 3"];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  swapValues() {
    final temp = firstController.text;
    firstController.text = secondController.text;
    secondController.text = temp;

    update();
  }



  @override
  void onClose() {
    firstController.dispose();
    secondController.dispose();
    super.onClose();
  }


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
