import 'package:customer/Controller/Auth_Controller/sigup_controller.dart';
import 'package:customer/Controller/Deshboard/deshboard_cont.dart';
import 'package:customer/Controller/Home/home-controller.dart';
import 'package:get/get.dart';

class SingUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUp_Controller());
  }
}

class DeshboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeshBoardAddHome_Controller());
  }
}

class HomeController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SwapController());
  }
}
