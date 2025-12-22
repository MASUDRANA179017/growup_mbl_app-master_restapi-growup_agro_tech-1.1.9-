import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_projects_controller.dart';

class MyProjectsView extends GetView<MyProjectsController> {
  const MyProjectsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyProjectsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyProjectsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
