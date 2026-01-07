import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../api_servies/api_servies.dart';
import 'model/pickuplocationmodel.dart';

class SwapController extends GetxController {

  // final firstController = TextEditingController();
  // final secondController = TextEditingController();

  var selectedItem = (0).obs;
  RxInt selectedIndex = 0.obs;

  // // var showInterchange = true.obs;
  //   RxList<TextEditingController> viaControllers = <TextEditingController>[].obs;
  //


  List<Map<String, dynamic>> iconItems = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Bus", "icon": Icons.airplanemode_active_rounded},
    {"name": "Plane", "icon": Icons.directions_bus},
  ];


  List<String> busStops = [
    "Korangi 2 No. Bus Stop",
    "Nagan Chowrangi Bus Stop",
    "Gulshan Chowrangi Bus Stop",
    "Sohrab Goth Bus Stop",
    "Johar Mor Bus Stop",
    "Kala Pul Bus Stop",
    "PIDC Bus Stop",
    "Tariq Road Bus Stop",
    "Clifton Teen Talwar Bus Stop",
    "Shah Faisal Colony Stop",
    "Saddar Mobile Market Stop",
    "Cantt Station Bus Stop",
    "Lahore Thokar Niaz Baig Stop",
    "Kalma Chowk Bus Stop",
    "Model Town Link Road Stop",
    "Anarkali Stop",
    "Rawalpindi Faizabad Bus Stop",
    "Murree Road Committee Chowk Stop",
    "Peshawar Khyber Bazaar Stop",
    "Faisalabad D Ground Bus Stop"
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }


  var showInterchange = true.obs;
  var viaControllers = <TextEditingController>[].obs;
  final TextEditingController pickUp = TextEditingController(); // observable list
  final TextEditingController dropOff = TextEditingController(); // observable list



  void selectedContainer(int index) {
    selectedItem.value = index;
  }


  void swapField() {
    String temp = pickUp.text;
    pickUp.text = dropOff.text;
    dropOff.text = temp;
  }


  TextEditingController viaController1 = TextEditingController();
  TextEditingController viaController2 = TextEditingController();

  // Swap button show/hide logic
  bool get canShowSwap => !showVia1.value && !showVia2.value;


  // Show/hide fields
  var showVia1 = false.obs;
  var showVia2 = false.obs;

  // Add via field
  void addField() {
    if (!showVia1.value) {
      showVia1.value = true;
    } else if (!showVia2.value) {
      showVia2.value = true;
    }
  }

  // Remove via field
  void removeField(int fieldNumber) {
    if (fieldNumber == 1) {
      viaController1.clear();
      showVia1.value = false;
    } else if (fieldNumber == 2) {
      viaController2.clear();
      showVia2.value = false;
    }
  }


  // void addField() {
  //   showInterchange.value = false;
  //   if (viaControllers.length < 2) {
  //     viaControllers.add(TextEditingController());
  //
  //   }
  //
  // }
  //
  // void removeField(int index) {
  //   viaControllers[index].dispose();
  //
  //   viaControllers.removeAt(index);
  //       if (viaControllers.isEmpty) {
  //     showInterchange.value = true;
  //   }
  // }

///   ///============================= ======================== ================ ============  Pick Up location search

  RxBool searchloading = false.obs;
  RxList<Result> searchList = <Result>[].obs;


  Future<void> pickupLocation(String text) async {
    if (text.isEmpty) {
      searchList.clear();
      return;
    }


    searchloading.value = true;

    var response = await ApiService.get(
      '',
      fullUrl: 'http://192.168.110.4:5000/api/services/search?search=${pickUp.text.toUpperCase()}',
      auth: true,
      isProgressShow: false,
    );

    if ( response!.statusCode == 200) {
      PickUpLocationModel model = PickUpLocationModel.fromJson(response.data);

      searchList.value = model.result ?? [];
    }

    searchloading.value = false;

  }


  ///   ///============================= ======================== ================ ============   drop off location search
// DropOff related
  RxBool dropSearchLoading = false.obs;
  RxList<Result> dropSearchList = <Result>[].obs;

// ================= LIVE SEARCH API FOR DROPOFF =================
  Future<void> dropOffLocation(String text) async {
    // Agar text field empty ho toh list clear karo
    if (text.isEmpty) {
      dropSearchList.clear();
      return;
    }

    // Loader ON
    dropSearchLoading.value = true;

    // API call
    var response = await ApiService.get(
      '',
      fullUrl: 'http://192.168.110.4:5000/api/services/search?search=${text.toUpperCase()}',
      auth: true,
      isProgressShow: false, // User loader nahi chahiye
    );

    if (response!.statusCode == 200) {
      PickUpLocationModel model = PickUpLocationModel.fromJson(response.data);

      // Result ko update karo
      dropSearchList.value = model.result ?? [];
    }

    // Loader OFF
    dropSearchLoading.value = false;
  }


  ///   ///============================= ======================== ================ ============   via location search


//   var viaSearchLists = <int, List<Result>>{}.obs;
//   var viaLoading = <int, bool>{}.obs;
//   RxInt activeViaIndex = (-1).obs;
//   RxList<Result> activeViaList = <Result>[].obs;
//
//
// // ================= LIVE SEARCH API FOR via =================
//   Future<void> viaLocation(String text, int index) async {
//     if (text.isEmpty) {
//       viaSearchLists[index] = [];
//       viaSearchLists.refresh();
//       return;
//     }
//
//     viaLoading[index] = true;
//     viaLoading.refresh();
//
//     var response = await ApiService.get(
//       '',
//       fullUrl: 'http://192.168.110.4:5000/api/services/search?search=${text.toUpperCase()}',
//       auth: true,
//       isProgressShow: false,
//     );
//
//     if (response?.statusCode == 200) {
//       PickUpLocationModel model = PickUpLocationModel.fromJson(response!.data);
//       viaSearchLists[index] = model.result ?? [];
//     }
//
//     viaLoading[index] = false;
//     viaSearchLists.refresh();
//     viaLoading.refresh();
//   }
//







//   RxBool searchloading = false.obs;
//   PickUpLocationModel? pickUpLocationModel ;
//   Result? result;
//   Future<void> pickupLocation() async {
//
//     searchloading.value = true;
//     update();
//     var response = await ApiService.get(
//      '',
// fullUrl: 'http://192.168.110.3:5000/api/services/search?search=${pickUp.text}',
//       auth: true,
//     );
//
//     if (response!.statusCode == 200) {
//      pickUpLocationModel= PickUpLocationModel.fromJson(response.data);
//     }
//     searchloading.value = false;
//     update();
//   }


}
