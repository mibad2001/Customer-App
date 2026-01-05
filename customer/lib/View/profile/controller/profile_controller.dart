import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:customer/View/profile/model/get_profile_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../../api_servies/api_servies.dart';
import '../../../api_servies/session.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import '../model/picture_model.dart';

class profileModelController extends GetxController {
  RxBool loading = true.obs; // Remove Rx, will call update()
  GetProfileModel? profileData;


  @override
  void onInit() {
    super.onInit();
    getuserProfile();
  }

  ///--------------------------------------------------------------  user profile api


  Future<void> getuserProfile() async {
    loading.value = true;
    update();
    var response = await ApiService.get(
      "auth/customer-profile/${TokenManager.userId}",
      auth: true,
    );

    if (response!.statusCode == 200) {
      profileData= GetProfileModel.fromJson(response.data);
    } else {
      profileData = null;
    }

    loading.value = false;
    update();
  }

  /// ================================= ========================= ==================================== ================== profile image Update


  Rx<File?> selectedImage = Rx<File?>(null);
  RxBool loader = false.obs;

  Future<void> changeProfilePicture(int userId) async {
    final XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;

    selectedImage.value = File(img.path); // 👈 instant preview

    loader(true);

    FormData formData = FormData.fromMap({
      "profile_picture": await MultipartFile.fromFile(
        img.path,
        filename: img.path.split('/').last,
      ),
    });

    var response = await ApiService.put(
      formData,
      '',
      fullUrl: "http://192.168.18.16:5000/api/auth/upload-profile-image/${TokenManager.userId}",
      multiPart: true,
      auth: true,
    );

    if (response!.statusCode == 200) {
      BotToast.showText(text: "Profile picture updated");
      await getuserProfile(); // server se fresh image
    } else {
      BotToast.showText(text: "Upload failed");
    }
    loader(false);
  }


  ///=========================== =================================== ===============================   Delete acc
  Future<void> deleteAccount(int userId) async {
    var response = await ApiService.delete(
      "auth/delete-account/${TokenManager.userId}", // endpoint
      auth: true,
    );

    if (response!.statusCode == 200) {
      BotToast.showText(text: "Account successfully deleted");

      // Clear tokens and storage
      TokenManager.clearAfterDelete();
      await GetStorage().erase();

      // Redirect to login screen
      Get.offAllNamed('/SigIn_Screen');
    }
  }
}




// import 'dart:io';
// import 'package:bot_toast/bot_toast.dart';
// import 'package:customer/View/profile/model/get_profile_model.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:get/get.dart' hide FormData, MultipartFile;
// import 'package:get_storage/get_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../Routing/routes_name.dart';
// import '../../../api_servies/api_servies.dart';
// import '../../../api_servies/session.dart';
// import 'package:dio/dio.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../model/picture_model.dart';
//
// class profileModelController extends GetxController {
//   RxBool loading = true.obs;
//   Rx<GetProfileModel?> profileData = Rx<GetProfileModel?>(null);
//
//   @override
//   void onInit() {
//     super.onInit();
//     getuserProfile();
//   }
//
//   ///--------------------------------------------------------------  user profile api
//   Future<void> getuserProfile() async {
//     ApiService.get(
//       "auth/customer-profile/${TokenManager.userId}",
//       auth: true,
//     ).then((response) {
//       if (response!.statusCode == 200) {
//         profileData.value = GetProfileModel.fromJson(response.data);
//       } else {
//         profileData.value = null;
//       }
//
//       loading.value = false;
//     });
//   }
//
//
//   /// ================================= ========================= ================== profile image Update
//
//   Rx<File?> selectedImage = Rx<File?>(null);
//
//   /// Request gallery / storage permission
//   Future<bool> requestGalleryPermission() async {
//     // Android 13+ requires READ_MEDIA_IMAGES
//     if (Platform.isAndroid) {
//       var status = await Permission.photos.request(); // For Android 13+
//       if (!status.isGranted) {
//         BotToast.showText(text: "Gallery permission denied");
//         return false;
//       }
//     }
//
//     // For Android < 13
//     var statusStorage = await Permission.storage.request();
//     if (!statusStorage.isGranted) {
//       BotToast.showText(text: "Storage permission denied");
//       return false;
//     }
//
//     return true;
//   }
//
//   // /// Camera Icon Click Function
//   ImageModel? profileImg;
//   FilePickerResult? profileImgss;
//
//   RxBool loadere = false.obs;
//
//   Future<void> pickImage() async {
//     loadere(true);
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//     );
//     loadere(false);
//     profileImgss = result;
//
//     if (result != null && result.files.single.bytes != null) {
//       profileImg = ImageModel(
//         name: result.files.single.name,
//         bytes: result.files.single.bytes!,
//         path: result.files.single.path,
//       );
//     }
//     update();
//   }
//
//   Future<void> changeProfilePicture(int userId) async {
//     bool granted = await requestGalleryPermission();
//     if (!granted) return;
//
//
//     final XFile? img = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );
//     if (img == null) return;
//
//     selectedImage.value = File(img.path);
//
//     FormData formData = FormData.fromMap({
//       "profile_image": await MultipartFile.fromFile(
//         img.path,
//         filename: img.path.split('/').last,
//       ),
//     });
//
//     var response = await ApiService.put(
//       formData,
//       '',
//       fullUrl: "http://192.168.18.16:5000/api/auth/upload-profile-image/${TokenManager.userId}",
//       // "auth/upload-profile-image/${TokenManager.userId}",
//       multiPart: true,
//       auth: true,
//     );
//
//     if (response!.statusCode == 200) {
//       BotToast.showText(text: "Profile picture updated");
//       selectedImage.value = File(img.path); // instant preview
//       await getuserProfile(); // permanent server image
//     }
//
//   }
//
//   ///=========================== =================================== ===============================   Delete acc
//   Future<void> deleteAccount(int userId) async {
//     var response = await ApiService.delete(
//       "auth/delete-account/${TokenManager.userId}", // endpoint
//       auth: true,
//     );
//
//     if (response != null && response.statusCode == 200) {
//       BotToast.showText(text: "Account successfully deleted");
//
//       // Token clear karo
//       TokenManager.clearAfterDelete();
//
//       // Storage clear karo
//       await GetStorage().erase();
//
//       // Login screen par bhejo
//       Get.offAllNamed('/SigIn_Screen');
//     }
//   }
// }