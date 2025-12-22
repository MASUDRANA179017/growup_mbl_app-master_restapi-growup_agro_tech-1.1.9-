import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invoice_growup_controller.dart';

class InvoiceGrowupView extends GetView<InvoiceGrowupController> {
  const InvoiceGrowupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvoiceGrowupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InvoiceGrowupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
