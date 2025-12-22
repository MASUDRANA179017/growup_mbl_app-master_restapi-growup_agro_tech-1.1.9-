import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/blogs_controller.dart';

class BlogsView extends GetView<BlogsController> {
  const BlogsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlogsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlogsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
