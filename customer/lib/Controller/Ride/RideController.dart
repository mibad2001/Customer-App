import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RideController extends GetxController {
  final List<String> CarName = [
    "Any car",
    "Saloon car",
    "Estate car",
    "Seven seater Van",
    "Saloon car",
    "Estate car",
    "Seven seater Van"
  ];
  final List<String> seats = ["4", "3", "4", "6", "3", "4", "6"];
  var selectedIndex = (-1).obs;

  void selectItem(int index) {
    selectedIndex.value = index;
  }

  // =============================================        Date & Time
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;


  var selectedTimeOption = ''.obs;

  // ================================== Pick Date
  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      selectedTimeOption.value = ''; 
    }
  }

  // ====================================================== Pick Time
  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );

    if (picked != null && picked != selectedTime.value) {
      selectedTime.value = picked;
      selectedTimeOption.value = '';
    }
  }

  // ======================================      Add Minutes (15 / 30)
  void addMinutes(int minutesToAdd) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.value.hour,
      selectedTime.value.minute,
    );

    final newTime = dateTime.add(Duration(minutes: minutesToAdd));
    selectedTime.value = TimeOfDay(hour: newTime.hour, minute: newTime.minute);

    selectedTimeOption.value = "$minutesToAdd min";
  }

  // ==========================================        Set ASAP (Current Time)
  void setASAP() {
    selectedTime.value = TimeOfDay.now();
    selectedTimeOption.value = "ASAP";
  }

  // ===========================================      Format for Display
  // String get formattedDate {
  //   return DateFormat('yyyy-MM-dd').format(selectedDate.value);
  // }
  String formattedTime24() {
    final now = DateTime.now();
    final dt = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.value.hour,
      selectedTime.value.minute,
    );
    return DateFormat('HH:mm').format(dt); // 24-hour forma
  }

  String formattedTime(BuildContext context) {
    return selectedTime.value.format(context);
  }
}
