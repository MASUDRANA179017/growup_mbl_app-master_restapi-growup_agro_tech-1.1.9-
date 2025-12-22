import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/investor_profile_controller.dart';

class InvestorProfileView extends GetView<InvestorProfileController> {
  const InvestorProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvestorProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InvestorProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
