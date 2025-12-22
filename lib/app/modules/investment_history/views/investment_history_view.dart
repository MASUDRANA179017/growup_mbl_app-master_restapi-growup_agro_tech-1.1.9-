import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/investment_history_controller.dart';

class InvestmentHistoryView extends GetView<InvestmentHistoryController> {
  const InvestmentHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvestmentHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InvestmentHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
