import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/long_projects_controller.dart';

class LongProjectsView extends GetView<LongProjectsController> {
  const LongProjectsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LongProjectsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LongProjectsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
