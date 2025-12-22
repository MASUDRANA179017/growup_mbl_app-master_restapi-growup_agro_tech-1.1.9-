import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_projects_controller.dart';

class AllProjectsView extends GetView<AllProjectsController> {
  const AllProjectsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllProjectsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllProjectsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
