import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_project_details_controller.dart';

class AllProjectDetailsView extends GetView<AllProjectDetailsController> {
  const AllProjectDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllProjectDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllProjectDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
