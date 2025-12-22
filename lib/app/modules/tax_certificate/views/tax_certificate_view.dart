import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tax_certificate_controller.dart';

class TaxCertificateView extends GetView<TaxCertificateController> {
  const TaxCertificateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TaxCertificateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TaxCertificateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
