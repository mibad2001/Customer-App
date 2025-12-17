import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp_Controller extends GetxController {
  var isPasswordVisible = false.obs;
  var loading = false;


  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Email = TextEditingController();

  TextEditingController Password = TextEditingController();

  var isCheckedBox = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void checked_box(bool? value) {
    isCheckedBox.value = value ?? false;
  }

  void SignUpApi() async{
  //  loading.value = true;
  }


}
