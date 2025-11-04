import 'package:get/get.dart';

class PaymentController extends GetxController {
  var selectedMethod = 0.obs;

  void selectMethod(int index) {
    selectedMethod.value = index;
  }

  String getSelectedMethodName() {
    switch (selectedMethod.value) {
      case 0:
        return "Cash";
      case 1:
        return "Account";
      case 2:
        return "Credit Card";
      default:
        return "Unknown";
    }
  }
}
