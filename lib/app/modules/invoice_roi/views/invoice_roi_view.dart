import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invoice_roi_controller.dart';

class InvoiceRoiView extends GetView<InvoiceRoiController> {
  const InvoiceRoiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvoiceRoiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InvoiceRoiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
