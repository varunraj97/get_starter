import 'dart:ui';

import 'package:get/get.dart';
import '../constants/storage_key_constants.dart';
import '../services/global_storage_service.dart';

GlobalStorageService storageService = Get.find<GlobalStorageService>();


void setBaseURL(String baseURL) {
  storageService.write(StorageKeyConstants.BASE_URL, baseURL);
}
void setFcm(String fcm) {
  storageService.write(StorageKeyConstants.fcm,fcm);
}
String? getBaseURL() {
  return storageService.read(StorageKeyConstants.BASE_URL);
}
String? getFcm() {
  return storageService.read(StorageKeyConstants.fcm);
}

// setUserLogin(LoginResponseModel responseModel) {
//   storageService.write(
//       StorageKeyConstants.ACCESS_TOKEN, responseModel.authToken!.accessToken);
// }

String? getAccessToken(){
  return storageService.read(StorageKeyConstants.ACCESS_TOKEN);
}

