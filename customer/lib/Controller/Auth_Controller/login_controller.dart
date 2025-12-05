import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
    var isPasswordVisible = false.obs;
    final TextEditingController  emailController= TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 2));

    isLoading.value = false;
    Get.toNamed('/DeshBoard_Screen');
  }
  void clearFields(){

    emailController.clear();
    passwordController.clear();

  }
}