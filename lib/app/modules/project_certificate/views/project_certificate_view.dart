import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/project_certificate_controller.dart';

class ProjectCertificateView extends GetView<ProjectCertificateController> {
  const ProjectCertificateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjectCertificateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProjectCertificateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
