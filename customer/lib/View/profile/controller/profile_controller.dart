import 'package:bot_toast/bot_toast.dart';
import 'package:customer/View/profile/model/get_profile_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../api_servies/api_servies.dart';
import '../../../api_servies/session.dart';

class profileModelController extends GetxController{

  RxBool loading = true.obs;
  Rx<GetProfileModel?> profileData = Rx<GetProfileModel?>(null);

  @override
  void onInit() {
    super.onInit();
    getuserProfile();

  }
///--------------------------------------------------------------  user profile api
  Future<void> getuserProfile() async{
    ApiService.get(
      "auth/customer-profile/${TokenManager.userId}",
      auth: true,
    ).then((response) {
      if (response!.statusCode == 200) {
        profileData.value = GetProfileModel.fromJson(response.data);
      } else {
        profileData.value = null;
      }

      loading.value = false;
    });
  }


}