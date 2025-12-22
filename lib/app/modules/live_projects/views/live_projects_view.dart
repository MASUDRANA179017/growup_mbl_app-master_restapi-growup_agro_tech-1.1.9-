import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/live_projects_controller.dart';

class LiveProjectsView extends GetView<LiveProjectsController> {
  const LiveProjectsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LiveProjectsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LiveProjectsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
