import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeshBoardAddHome_Controller extends GetxController {

  var homeAddress = ''.obs;
  var workAddress = ''.obs;
  final RxnInt editingIndex = RxnInt();

  // TextField controller
  final TextEditingController HomeController = TextEditingController();
  final TextEditingController WorkAdressController = TextEditingController();
 //========================================= add Home address
  void saveItem() {
    if(HomeController.text.isNotEmpty) {
      homeAddress.value = HomeController.text;
      editingIndex.value = null;
      HomeController.clear();
    }
  }
  void editItem() {
    HomeController.text = homeAddress.value;
    editingIndex.value = 0;
  }
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



  //========================================= add Home address



  void saveWorkAddress() {
    if (WorkAdressController.text.isNotEmpty) {
      workAddress.value = WorkAdressController.text;
      editingIndex.value = null;
      WorkAdressController.clear();
    }
  }

  void editWorkAddress() {
    if (workAddress.value.isNotEmpty) {
      WorkAdressController.text = workAddress.value;
      editingIndex.value = 0;
    }
  }

  void deleteWorkAddress() {
    workAddress.value = '';
    WorkAdressController.clear();
    editingIndex.value = null;
  }

  void clearWorkField() {
    WorkAdressController.clear();
  }

  void deleteWorkItem() {
    workAddress.value = '';
    if (editingIndex.value != null) {
      HomeController.clear();
      editingIndex.value = null;
    }
  }



  // void saveWorkAddress() {
  //   workAddress.value = WorkAdressController.text;
  //   editingIndex.value = null;
  // }
  // void editWorkAddress() {
  //   WorkAdressController.text = workAddress.value;
  //   editingIndex.value = 0;
  // }
  // void deleteWorkAddress() {
  //   workAddress.value = '';
  //   if (editingIndex.value != null) {
  //     WorkAdressController.clear();
  //     editingIndex.value = null;
  //   }
  // }
  // void clearWOrkfield(){
  //   WorkAdressController.clear();
  // }
  //



  // @override
  // void onClose() {
  //   HomeController.dispose();
  //   super.onClose();
  // }
}
