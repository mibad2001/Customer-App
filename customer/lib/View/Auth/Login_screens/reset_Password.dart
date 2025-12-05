// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:customer/View/Widgets/textformfield.dart';
import 'package:customer/View/textstyle/apptextstyle.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../Widgets/all_text.dart';
import '../../Widgets/color.dart';
import '../../Widgets/elevat_button.dart';
class ResetPasswordScreen extends StatefulWidget {
  // var email;
  ResetPasswordScreen({super.key,
    // required this.email
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}










class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

  // Resetpassword() async {
  //
  //
  //   if (mounted) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //   }
  //   var url =
  //       'https://nexustechnologys.com:4000/api/customerRegisteration/resetPassword';
  //
  //
  //   Map<String, dynamic> data = {
  //     "emailaddress": widget.email,
  //     "password": _passwordController.text,
  //     "confirmPassword": _confirmpasswordController.text,
  //     // "_id": widget.id,
  //   };
  //
  //   try {
  //     var response = await http.post(Uri.parse(url),
  //         headers: {'Content-Type': 'application/json'},
  //         body: jsonEncode(data));
  //     var jsonData = json.decode(response.body);
  //     print("JSON Data::::::::::::: $jsonData");
  //     if (response.statusCode == 200) {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
  //     } else {
  //       // handle error
  //     }
  //   } catch (e) {
  //     // error dialog (same as your existing one)
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   }
  // }

  bool isValidPassword(String password) {
    // At least 8 characters, 1 uppercase, 1 lowercase, 1 digit, and 1 special character
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    return regex.hasMatch(password);
  }






  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        body: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 30, 1, 44),
                  Color.fromARGB(255, 227, 194, 242),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Reset Password",
                      style: AppTextStyles.heading(),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                      CustomTextField(
                        // suffixIcon: IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(
                        //     Icons.remove_red_eye,
                        //     color: CustomColor.textField_Icon_Color,
                        //   ),
                        // ),
                        suffixIcon: GestureDetector(

                            onTap: (){
                              setState (() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child: Icon(_isPasswordVisible ?Icons.remove_red_eye:Icons.visibility_off)
                        ),
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        hintText: CustomText.hint_password,
                        FontSize: 14,
                        // prefixIcon: Icon(
                        //   Icons.password,
                        //   color: CustomColor.textField_Icon_Color,
                        // ),
                          prefixIcon: const Icon(Icons.lock),
                        borderRadius: 15,
                      ),
                    // TextField(
                    //   controller: _passwordController,
                    //   obscureText: !_isPasswordVisible,
                    //   decoration: InputDecoration(
                    //       suffixIcon: GestureDetector(
                    //
                    //           onTap: (){
                    //             setState (() {
                    //               _isPasswordVisible = !_isPasswordVisible;
                    //             });
                    //           },
                    //           child: Icon(_isPasswordVisible ?Icons.remove_red_eye:Icons.visibility_off)
                    //       ),
                    //       hintText: "Enter Password",
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(18),
                    //           borderSide: BorderSide.none
                    //       ),
                    //       fillColor: Colors.white.withOpacity(0.3),
                    //       filled: true,
                    //       prefixIcon: const Icon(Icons.lock)),
                    // ),
                  ),
                  SizedBox(height: screenHeight/45,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                     child:  CustomTextField(
                       // suffixIcon: IconButton(
                       //   onPressed: () {},
                       //   icon: Icon(
                       //     Icons.remove_red_eye,
                       //     color: CustomColor.textField_Icon_Color,
                       //   ),
                       // ),
                       suffixIcon: GestureDetector(

                           onTap: (){
                             setState (() {
                               _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                             });
                           },
                           child: Icon(_isConfirmPasswordVisible ?Icons.remove_red_eye:Icons.visibility_off)
                       ),
                       controller: _confirmpasswordController,
                       obscureText: !_isConfirmPasswordVisible,
                       hintText: "Confirm Password",
                       FontSize: 14,
                       // prefixIcon: Icon(
                       //   Icons.password,
                       //   color: CustomColor.textField_Icon_Color,
                       // ),
                       prefixIcon: const Icon(Icons.lock),
                       borderRadius: 15,
                     ),

                     //TextField(
                    //   controller: _confirmpasswordController,
                    //   obscureText: !_isConfirmPasswordVisible,
                    //   decoration: InputDecoration(
                    //       suffixIcon: GestureDetector(
                    //
                    //           onTap: (){
                    //             setState (() {
                    //               _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    //             });
                    //           },
                    //           child: Icon(_isConfirmPasswordVisible ?Icons.remove_red_eye:Icons.visibility_off)),
                    //       hintText: "Enter Confirm Password",
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(18),
                    //           borderSide: BorderSide.none
                    //       ),
                    //       fillColor: Colors.white.withOpacity(0.3),
                    //       filled: true,
                    //       prefixIcon: const Icon(Icons.lock)),
                    // ),
                  ),
                  SizedBox(height: screenHeight/35,),

                  SizedBox(
                    height: 55,
                    width: 250,
                    child: MyElevatedButton(
                      text: "",
                      textWidget: FittedBox(
                        child: Text("Submit",style: AppTextStyles.medium(size: 25,weight: FontWeight.bold),),
                      ),

                      onPressed: () {
                       // Get.toNamed('/DeshBoard_Screen');
                        Get.toNamed("/SigIn_Screen");
                      },

                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     String password = _passwordController.text.trim();
                  //     String confirmPassword = _confirmpasswordController.text.trim();
                  //
                  //     // Check empty fields
                  //     if (password.isEmpty || confirmPassword.isEmpty) {
                  //       ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(
                  //           content: Text("Please fill all fields."),
                  //           backgroundColor: Colors.red,
                  //         ),
                  //       );
                  //       return;
                  //     }
                  //
                  //     // Check password format
                  //     if (!isValidPassword(password)) {
                  //       ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(
                  //           content: Text(
                  //               "Password must be at least 8 characters,\ninclude uppercase, lowercase, number, and special character."),
                  //           backgroundColor: Colors.red,
                  //         ),
                  //       );
                  //       return;
                  //     }
                  //
                  //     // Check if passwords match
                  //     if (password != confirmPassword) {
                  //       ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(
                  //           content: Text("Passwords do not match."),
                  //           backgroundColor: Colors.red,
                  //         ),
                  //       );
                  //       return;
                  //     }
                  //
                  //     // All checks passed, call API
                  //     // Resetpassword();
                  //   },
                  //
                  //   child: Container(
                  //     height: screenHeight/14,
                  //     width: screenWidth/1.5,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Color.fromARGB(255, 106, 24, 130)
                  //     ),
                  //     child: Center(
                  //       child: Text("Submit",
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 19
                  //         ),
                  //
                  //       ),
                  //     ),
                  //   ),
                  // ),


                ],

              )
            )
        )
    );
  }
}