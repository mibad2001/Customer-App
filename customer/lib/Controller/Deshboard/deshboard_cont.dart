import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeshBoardAddHome_Controller extends GetxController {

  var homeAddress = ''.obs;
  final RxnInt editingIndex = RxnInt();

  // TextField controller
  final TextEditingController HomeController = TextEditingController();

  /// Save or update home address
  void saveItem() {
    homeAddress.value = HomeController.text;
    editingIndex.value = null;
  }

  /// Edit existing address
  void editItem() {
    HomeController.text = homeAddress.value;
    editingIndex.value = 0;
  }

  ///Delete address
  void deleteItem() {
    homeAddress.value = '';
    if (editingIndex.value != null) {
      HomeController.clear();
      editingIndex.value = null;
    }
  }

  void clearfield(){
    HomeController.clear();
  }

  // @override
  // void onClose() {
  //   HomeController.dispose();
  //   super.onClose();
  // }
}
