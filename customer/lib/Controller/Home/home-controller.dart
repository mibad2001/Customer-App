import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SwapController extends GetxController {
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  var selectedItem = (0).obs;

  swapValues() {
    final temp = firstController.text;
    firstController.text = secondController.text;
    secondController.text = temp;

    update();
  }

  @override
  void onClose() {
    firstController.dispose();
    secondController.dispose();
    super.onClose();
  }
}
