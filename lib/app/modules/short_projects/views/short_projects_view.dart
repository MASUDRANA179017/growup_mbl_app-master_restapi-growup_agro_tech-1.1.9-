import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/short_projects_controller.dart';

class ShortProjectsView extends GetView<ShortProjectsController> {
  const ShortProjectsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShortProjectsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ShortProjectsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
