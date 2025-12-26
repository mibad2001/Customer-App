
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart' hide FormData;
import 'package:dio/dio.dart';

import '../../api_servies/api_servies.dart';
import '../../api_servies/session.dart';

class changePasswordController extends GetxController{

  var isCurrentPasswordVisible = false.obs;
  var isnewPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  final TextEditingController  CurrentpasswordtlController= TextEditingController();
  final TextEditingController  newpasswordController= TextEditingController();
  final TextEditingController  ConfirmpasswordController= TextEditingController();

  clearField(){
    CurrentpasswordtlController.clear();
    CurrentpasswordtlController.clear();
    ConfirmpasswordController.clear();
  }


  Future<void> changePasswordApi() async {
    // if (CurrentpasswordtlController.text.isEmpty ||
    //     newpasswordController.text.isEmpty || ConfirmpasswordController.text.isEmpty) {
    //   BotToast.showText(text: "Please fill all fields");
    //   return;
    // }
    //
    // if (newpasswordController.text != ConfirmpasswordController.text) {
    //   BotToast.showText(text: "Passwords do not match");
    //   return;
    // }

    // ✅ Password match ho gaya
    print("============================= ========================== password sahi sahi  ======================= ======================= ========  ");

var data = FormData.fromMap({
  "current_password": CurrentpasswordtlController.text,
  "password": newpasswordController.text,
  "confirm_password": newpasswordController.text,
});


    var response = await ApiService.put(
      data,
      "auth/update-password/${TokenManager.userId}",
      multiPart: false,
      auth: true,
    );

    if (response!.statusCode == 200) {
      BotToast.showText(text: "Password Updated Successfully");
      Get.back();   // profile screen pe wapas
      return;
    }

    String errorMessage = "Password update failed";

    if (response.data is Map) {
      errorMessage = response.data['message']?.toString() ?? errorMessage;
    } else if (response.data is String) {
      errorMessage = response.data.toString();
    }

    BotToast.showText(text: errorMessage);
  }





}