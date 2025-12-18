import 'package:bot_toast/bot_toast.dart';
import 'package:customer/api_servies/api_servies.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, Response;

class SignUp_Controller extends GetxController {
  var isPasswordVisible = false.obs;



  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoControllre = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isCheckedBox = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void checked_box(bool? value) {
    isCheckedBox.value = value ?? false;
  }

  Future<void> registerUser() async {
    FormData formData = FormData.fromMap({
           "first_name": firstNameController.text,
            "last_name": lastNameController.text,
            "email": emailController.text,
            "phone_number": phoneNoControllre.text,
            "password": passwordController.text,
    });
print("//////////////////////////////////////////////////${formData}");
    Response? response = await ApiService.post(
      formData,
      "auth/register",
      multiPart: true,      // 👈 form-data ke liye
      auth: false,          // 👈 token nahi chahiye
      isProgressShow: false,
    );

    if (response != null &&
        (response.statusCode == 200)) {
      BotToast.showText(text: "Register Successfully ✅");
      print(response.data);
    } else {
      BotToast.showText(text: "Register Failed ❌");
      print(response?.data);
    }
  }


// Email Validation
  // bool isValidEmail(String email) {
  //   return GetUtils.isEmail(email);
  // }
  //
  // // Password Validation
  // bool isValidPassword(String password) {
  //   return password.length >= 6;
  // }
  //
  // // Name Validation
  // bool isValidName(String name) {
  //   return name.trim().isNotEmpty;
  // }
  //
  // // Number Validation (Pakistani number example)
  // bool isValidNumber(String number) {
  //   return GetUtils.isPhoneNumber(number);
  // }

  // Future<void> registerUser() async {
  //   final dio = Dio();
  //   final url = "http://192.168.18.16:5000/api/auth/register";
  //
  //   try {
  //     // FormData object for form-data
  //     FormData formData = FormData.fromMap({
  //       "first_name": firstNameController.text,
  //       "last_name": lastNameController.text,
  //       "email": emailController.text,
  //       "phone_number": phoneNoControllre.text,
  //       "password": passwordController.text,
  //     });
  //
  //     final response = await dio.post(
  //       url,
  //       data: formData,
  //       options: Options(
  //         contentType: "multipart/form-data", // form-data type
  //       ),
  //     );
  //
  //     if (response.statusCode == 200 ) {
  //       print("User registered successfully!");
  //       print("Response: ${response.data}");
  //     } else {
  //       print("Failed to register user.");
  //       print("Status code: ${response.statusCode}");
  //       print("Response: ${response.data}");
  //     }
  //   } catch (e) {
  //     print("Error occurred: $e");
  //   }
  // }

}

