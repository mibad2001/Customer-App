// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../Widgets/color.dart';
import '../../Widgets/elevat_button.dart';
import '../../textstyle/apptextstyle.dart';


class ForgotOTPScreen extends StatefulWidget {
  // var email;

  ForgotOTPScreen({
    super.key,

    // required this.email
  });

  @override
  State<ForgotOTPScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<ForgotOTPScreen> {
  Timer? _timer;
  int _remainingTimeInSeconds = 900;
  bool isOtpExpired = false;

  bool isLoading = false;
  final List<TextEditingController> otpControllers =
  List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // registeration() async {
  //   String otpCode = otpControllers.map((controller) => controller.text).join();
  //   print("Collected OTP: $otpCode");
  //
  //   if (mounted) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //   }
  //   var url =
  //       'https://nexustechnologys.com:4000/api/customerRegisteration/verify';
  //
  //
  //   Map<String, dynamic> data = {
  //     "OTP": otpCode,
  //     "emailaddress": widget.email,
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
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text("OTP has been Confirmed"),
  //           backgroundColor: Colors.green,
  //         ),
  //       );
  //
  //
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) =>  ResetPasswordScreen(email:widget.email ,)));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text("OTP has been Not Confirmed"),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //
  //       // handle error
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Bad Request"),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     // error dialog (same as your existing one)
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   }
  // }


  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTimeInSeconds > 0) {
        setState(() {
          _remainingTimeInSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          isOtpExpired = true;
        });
      }
    });
  }


  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.emailAddress);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 30, 1, 44),
          leading: GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const WelcomeScreen()));
              },
              child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child:
                  Icon(Icons.arrow_back, color: Colors.white, size: 40)))),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 30, 1, 44),
                Color.fromARGB(255, 227, 194, 242),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SafeArea(
            child: Stack(
              children: [
                Transform.translate(
                  offset: const Offset(0, -90), // Move upward by 50 pixels
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 30), // Adjust spacing
                          // Heading
                           Text("Email Verification",
                              style: AppTextStyles.heading(
                                ),),
                          const SizedBox(height: 40), // Reduced spacing
                          // Verification Message
                           Text(
                              "We have sent you a verification code on your email address",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.medium()),
                          const SizedBox(height: 20), // Reduced spacing
                          // Email Address
                          Text("info@gmail.com",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.regular()),
                          const SizedBox(height: 40), // Reduced spacing
                          // Code Input Boxes
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(4, (index) {
                              return SizedBox(
                                width: 60,
                                height: 60,
                                child:
                                // TextField(
                                //   controller: otpControllers[index],
                                //   focusNode: focusNodes[index],
                                //   keyboardType: TextInputType.number,
                                //   textAlign: TextAlign.center,
                                //   maxLength: 1,
                                //   style: const TextStyle(
                                //     fontSize: 30,
                                //     fontWeight: FontWeight.bold,
                                //     color: Colors.white,
                                //   ),
                                //   decoration: InputDecoration(
                                //     counterText: "",
                                //     filled: true,
                                //     fillColor: Colors.transparent,
                                //     enabledBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(8),
                                //       borderSide: const BorderSide(color: Colors.black, width: 2),
                                //     ),
                                //     focusedBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(8),
                                //       borderSide: const BorderSide(color: Colors.white, width: 2),
                                //     ),
                                //   ),
                                //   onChanged: (value) {
                                //     if (value.length == 1) {
                                //       if (index + 1 < otpControllers.length) {
                                //         FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                                //       } else {
                                //         FocusScope.of(context).unfocus(); // All fields filled
                                //       }
                                //     } else if (value.isEmpty && index > 0) {
                                //       FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                                //     }
                                //   },
                                // ),
                                TextField(
                                  controller: otpControllers[index],
                                  focusNode: focusNodes[index],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: "",
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    contentPadding: EdgeInsets.symmetric(vertical: 22), // 👈 Add this line
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(color: Colors.black, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(color: Colors.white, width: 2),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      if (index + 1 < otpControllers.length) {
                                        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                                      } else {
                                        FocusScope.of(context).unfocus(); // All fields filled
                                      }
                                    } else if (value.isEmpty && index > 0) {
                                      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                                    }
                                  },
                                ),

                              );
                            }),
                          ),


                          const SizedBox(height: 25), // Reduced spacing
                          // Divider
                          // const Divider(
                          //   color: Colors.white,
                          //   thickness: 2,
                          // ),
                          const SizedBox(height: 20),
                          // Resend Timer Text
                          Text(
                              "Resend code after ${formatTime(_remainingTimeInSeconds)}",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.medium(
                                  color: Colors.black45,)),
                          const SizedBox(height: 40), // Reduced spacing
                          // Confirm Button
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:isOtpExpired
                                ? Column(
                              children: [
                                Text(
                                  "OTP expired. Please go back and resubmit your email.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                              : SizedBox(
                              height: 55,
                              width: 250,
                              child: MyElevatedButton(
                                text: '',
                                textWidget: FittedBox(
                                  child: Text("CONTINUE",style: AppTextStyles.medium(size: 25,weight: FontWeight.bold),),
                                ),
                                fontSize: 18,
                                onPressed: () {
                                 Get.toNamed("/resetPasswordScreen");
                                },
                              ),
                            ),

                            // ElevatedButton(
                            //   onPressed: () {
                            //     if (isOtpExpired) return; // Just in case
                            //     if (otpControllers.any((controller) => controller.text.trim().isEmpty)) {
                            //       ScaffoldMessenger.of(context).removeCurrentSnackBar();
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         SnackBar(
                            //           content: Text("Please enter the complete OTP."),
                            //           backgroundColor: Colors.red,
                            //         ),
                            //       );
                            //       return;
                            //     }
                            //     // registeration();
                            //   },
                            //
                            //   style: ElevatedButton.styleFrom(
                            //     foregroundColor: Colors.white,
                            //     backgroundColor: const Color.fromARGB(255, 106, 24, 130),
                            //     padding:
                            //     const EdgeInsets.symmetric(horizontal: 80, vertical: 22),
                            //     textStyle: const TextStyle(fontSize: 28),
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(16),
                            //     ),
                            //   ),
                            //   child: const Text('Confirm'),
                            // ),


                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
