import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_starter/app/modules/home/model/sample_model.dart';

import '../../utils/helpers/common_functions.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = getBaseURL();
    httpClient.defaultContentType = 'application/json';
    httpClient.maxAuthRetries = 3;
    httpClient.timeout = const Duration(seconds: 60);
    var headers = {
      'Authorization': "Bearer ${getAccessToken()}"};
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers.addAll(headers);
      return request;
    });
    httpClient.addRequestModifier<dynamic>((request) async => request);
  }

///get method
  Future<Response> getList() {
    debugPrint(getAccessToken().toString());
    return get(
        "https://leafbazar.org/wp-json/wp/v2/media",
        ///we can give token like this too as commented below
        // headers:{
        //   'Authorization': "Bearer ${getAccessToken()}"}
    );
  }
/// post method using by passing json data
  Future<Response> Logout({String? deviceID, String? userId}) {
    return post(
        "url",
        ///passing data as json raw format
        {
      'user_id':userId,
      'device_id':deviceID
    },
    );
  }

/// post method using by passing formdata data
//   Future<Response> imageEdit(XFile file) {
//     FormData body = FormData(
//         { 'profile_image':
//         MultipartFile(
//           File(file.path),
//           filename: file.path.split('/').last,
//         ),});
//     debugPrint(ApiService.profileEdit);
//     return post(
//       "url",
//         body,
//     );
//   }
}
