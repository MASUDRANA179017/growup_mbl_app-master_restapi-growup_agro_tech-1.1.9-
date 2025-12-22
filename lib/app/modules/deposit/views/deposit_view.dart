import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/deposit_controller.dart';

class DepositView extends GetView<DepositController> {
  const DepositView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DepositView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DepositView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
