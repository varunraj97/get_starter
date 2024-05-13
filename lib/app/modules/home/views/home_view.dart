import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaf Bazar'),
      ),
      body: Obx(
            () => controller.checklists.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: controller.checklists.length,
          itemBuilder: (context, index) {
            final checklist = controller.checklists[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(checklist.guid?.rendered??''),
              ),
              title: Text(checklist.title?.rendered ??''),
              subtitle: Text(checklist.date ?? ''),
              // Add more fields as needed
            );
          },
        ),
      ),
    );
  }
}
