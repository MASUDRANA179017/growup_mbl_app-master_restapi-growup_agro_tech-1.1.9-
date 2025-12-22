import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invoice_recharge_controller.dart';

class InvoiceRechargeView extends GetView<InvoiceRechargeController> {
  const InvoiceRechargeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvoiceRechargeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InvoiceRechargeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
