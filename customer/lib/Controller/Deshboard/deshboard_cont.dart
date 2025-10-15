import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeshBoardAddHome_Controller extends GetxController {
  var text = ''.obs;

  final TextEditingController HomeController = TextEditingController();
  var items = <String>[].obs;
  var editingIndex = Rxn(); //null be askta hai isleya

  void addOrUpdateItem() {
    if (HomeController.text.isNotEmpty) {
      if (editingIndex.value == null) {
        items.add(HomeController.text);
      } else {
        items[editingIndex.value!] = HomeController.text;
        editingIndex.value = null;
      }
      HomeController.clear();
    }
  }

  void editItem(int index) {
    HomeController.text = items[index];
    editingIndex.value = index;
  }

  void deleteItem(int index) {
    items.removeAt(index);
    if (editingIndex.value == index) {
      HomeController.clear();
      editingIndex.value = null;
    }
  }
}
