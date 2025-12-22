import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/certificate_controller.dart';

class CertificateView extends GetView<CertificateController> {
  const CertificateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CertificateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CertificateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
