import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp_Controller extends GetxController {
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Email = TextEditingController();
  bool isPasswordVisible = false;
  TextEditingController Password = TextEditingController();

  var isCheckedBox = false.obs;

  void checked_box(bool? value) {
    isCheckedBox.value = value ?? false;
  }
}
