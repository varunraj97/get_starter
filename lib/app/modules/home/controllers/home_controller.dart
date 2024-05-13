import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/app/modules/home/providers/home_provider.dart';

import 'package:http/http.dart' as http;
import '../model/sample_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  late BuildContext context;
  HomeProvider provider = Get.isRegistered<HomeProvider>()
      ? Get.find<HomeProvider>()
      : Get.put(HomeProvider());
  // late SaampleModel saampleModel = SaampleModel();
  List data =[];
  RxList<CheckList> checklists = <CheckList>[].obs;
  final count = 0.obs;
  @override
  void onInit() {
    fetchCheckLists();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  // Future<void> getData()async{
  //   debugPrint("statusCode");
  //   try{
  //     await provider.getList().then((value){
  //       if(value.statusCode==200){
  //         debugPrint("${value.statusCode}");
  //         debugPrint("${value.body}");
  //         debugPrint("statusCode}");
  //         final List<dynamic> data = json.decode(value.body);
  //         debugPrint("statusCode}");
  //         checklists.assignAll(data.map((item) => CheckList.fromJson(item as Map<String, dynamic>)));
  //         // saampleModel = SaampleModel.fromJson(data);
  //         ////
  //       }else{
  //         //error
  //       }
  //     });
  //   }catch(e){
  //     debugPrint(e.toString());
  //   }
  // }


  Future<void> fetchCheckLists() async {
    try {
      final response = await http.get(Uri.parse('https://leafbazar.org/wp-json/wp/v2/media'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        checklists.assignAll(data.map((item) => CheckList.fromJson(item as Map<String, dynamic>)));
      } else {
        throw Exception('Failed to load the lsit');
      }
    } catch (error) {
      debugPrint('Error fetching checklists: $error');
    }
  }
}

