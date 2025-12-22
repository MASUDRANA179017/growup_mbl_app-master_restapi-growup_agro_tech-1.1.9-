import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/intro_page_controller.dart';

class IntroPageView extends GetView<IntroPageController> {
  const IntroPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IntroPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IntroPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
