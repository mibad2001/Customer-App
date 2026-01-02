import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../View/profile/controller/profile_controller.dart';
import '../../api_servies/api_servies.dart';
import '../../api_servies/session.dart';

class DeshBoardAddHome_Controller extends GetxController {

  final profileController = Get.isRegistered<profileModelController>()
      ? Get.find<profileModelController>()
      :  Get.put(profileModelController());




  final RxnInt editingIndex = RxnInt();

  // TextField controller
  final TextEditingController HomeController = TextEditingController();
  final TextEditingController WorkAdressController = TextEditingController();
  //late var homeAddress =HomeController.text;
  var workAddress = ''.obs;

 //========================================= add Home address

  //
  // void saveItem() {
  //   if(gethomeaddress.text.isNotEmpty) {
  //     gethomeaddress.value = HomeController.text;
  //     editingIndex.value = null;
  //     HomeController.clear();
  //   }
  // }
  // void saveItem() {
  //   if(HomeController.text.isNotEmpty) {
  //     homeAddress.value = HomeController.text;
  //     editingIndex.value = null;
  //     HomeController.clear();
  //   }
  // }
  void editItem() {
    //HomeController.text =gethomeaddress ?? homeAddress.value;
    HomeController.text =profileController.profileData?.addhomeAddress;
    editingIndex.value = 0;
  }

    void deleteItem() {
      profileController.profileData!.addhomeAddress = "";
      profileController.update();

  }
  void clearfield(){
    HomeController.clear();
  }

  /// Add home api


  Future<void> AddhomeApi() async {

    if (HomeController.text.isEmpty) {
      BotToast.showText(text: "Please enter address");
      return;
    }

    var data = {
      "addhome_address": HomeController.text,
    };

    var response = await ApiService.put(
      data,
      "auth/customer/home-address/${TokenManager.userId}",
      auth: true,
    );

    if (response!.statusCode == 200) {

      profileController.profileData!.addhomeAddress = HomeController.text;

      profileController.update();   // 🔥 THIS refreshes GetBuilder UI

      BotToast.showText(text: "Address Updated Successfully");
      clearfield();
    //   profileController.profileData!.addhomeAddress;
    //   BotToast.showText(text: "Address Updated Successfully");
    //   clearfield();
    //   // profileController.profileData!.addhomeAddress = HomeController.text;
    //
    //   // profileController.update(["home_address"]);
    //   //Get.back();
    // //  saveItem();
    // // profileController.getuserProfile();
    //   //Get.find<profileModelController>().getuserProfile();
    }
  }


///======================================= ================================= ============================

  // void saveWorkAddress() {
  //   if (WorkAdressController.text.isNotEmpty) {
  //     workAddress.value = WorkAdressController.text;
  //     editingIndex.value = null;
  //     WorkAdressController.clear();
  //   }
  // }
  //
  void editWorkAddress() {
    WorkAdressController.text =profileController.profileData?.addhomeAddress;
    editingIndex.value = 0;
  }

  // void deleteWorkAddress() {
  //   workAddress.value = '';
  //   WorkAdressController.clear();
  //   editingIndex.value = null;
  // }

  void clearWorkField() {
    WorkAdressController.clear();
  }

  void deleteWorkItem() {
    profileController.profileData!.addhomeAddress = "";
    profileController.update();
  }


  Future<void> AddworkApi() async {

    if (WorkAdressController.text.isEmpty) {
      BotToast.showText(text: "Please enter address");
      return;
    }

    var data = {
      "addwork_address": WorkAdressController.text,
    };

    var response = await ApiService.put(
      data,
      "auth/customer/work-address/${TokenManager.userId}",
      auth: true,
    );

    if (response!.statusCode == 200) {

      profileController.profileData!.addworkAddress = WorkAdressController.text;

      profileController.update();   // 🔥 THIS refreshes GetBuilder UI

      BotToast.showText(text: "Address Updated Successfully");
      clearWorkField();

    }
  }


  Future<void> deleteWorkapi() async {

    var data = {
      "addwork_address": " ",
    };

    var response = await ApiService.put(
      data,
      "auth/customer/work-address/${TokenManager.userId}",
      auth: true,
    );

    if (response!.statusCode == 200) {

      profileController.profileData!.addworkAddress = "";

      profileController.update();   // 🔥 THIS refreshes GetBuilder UI

      BotToast.showText(text: "Address Delete Successfully");
      clearWorkField();

    }
  }


}
