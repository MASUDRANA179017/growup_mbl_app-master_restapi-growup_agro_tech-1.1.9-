import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/capital_return_controller.dart';

class CapitalReturnView extends GetView<CapitalReturnController> {
  const CapitalReturnView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CapitalReturnView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CapitalReturnView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
