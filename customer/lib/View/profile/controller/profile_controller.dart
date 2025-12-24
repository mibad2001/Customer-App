import 'package:bot_toast/bot_toast.dart';
import 'package:customer/View/profile/model/get_profile_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../api_servies/api_servies.dart';

class profileModelController extends GetxController{

   late GetProfileModel getProfileModel ;

  Rx<GetProfileModel?> profileData = Rx<GetProfileModel?>(null);


   @override
   void onInit() {
     super.onInit();
     fetchProfile();
   }

   Future<void> fetchProfile() async {
     loading.value = true;
     profileData.value = await getProfileApi();
     loading.value = false;
   }
   RxBool loading = false.obs;
   Future<GetProfileModel?> getProfileApi() async {
     loading(true);
     final response = await ApiService.get(
       "auth/customer-profile/4",
       auth: true,
     );

     if (response!.statusCode == 200) {
       return GetProfileModel.fromJson(response.data);
     } else {
       BotToast.showText(text: "Profile load failed");
       return null;
     }

   }



}