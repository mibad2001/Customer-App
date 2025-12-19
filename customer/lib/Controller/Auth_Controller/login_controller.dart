import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response, FormData;
import '../../api_servies/api_servies.dart';

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

    Future<void> userLoginApi() async {

      var headers = {
        'Cookie': 'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsImlhdCI6MTc2'
      };
      var data = FormData.fromMap({
        'email': 'osama@gmail.com',
        'password': '123456'
      });

      var dio = Dio();
      var response = await dio.request(
        'http://192.168.18.16:5000/api/auth/login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      }
      else {
        print(response.statusMessage);
      }
    }

    // Future<void> userLoginApi() async {
    //
    //   // Step 1: Create FormData
    //   // Step 1: Create FormData correctly
    //   final formData = FormData({
    //     "email": emailController.text,
    //     "password": passwordController.text
    //   });
    //
    //
    //   var response = await ApiService.post(
    //     formData,
    //     "auth/login",      // LOGIN ENDPOINT
    //     multiPart: false,
    //     auth: true,
    //   );
    //
    //
    //
    //   // SUCCESS
    //   if (response!.statusCode == 200) {
    //     BotToast.showText(text: "Login Successfully ");
    //     clearFields();
    //     Get.toNamed('/DeshBoard_Screen');
    //     print("LOGIN SUCCESS => ${response.data}");
    //
    //
    //     return;
    //   }
    //
    //   // ERROR HANDLING
    //   String errorMessage = "Login Failed ";
    //
    //   if (response.data is Map) {
    //     errorMessage = response.data['message']?.toString() ?? errorMessage;
    //   } else if (response.data is String) {
    //     errorMessage = response.data.toString();
    //   }
    //
    //   BotToast.showText(text: errorMessage);
    //   print("LOGIN FAILED => ${response.data}");
    // }

}