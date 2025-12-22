import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  late PageController pageController;

  var currentPage = 0.obs;
  var videoReady = false.obs;

  VideoPlayerController? videoController;

  final List<Map<String, dynamic>> pages = [
    {
      "icon": Icons.grass,
      "title": "The Future of Farming, Today.",
      "subtitle":
      "Join a community of modern farmers. Get insights, manage crops, and grow your business.",
      "image": "assets/images/futurefram.jpg",
    },
    {
      "icon": Icons.show_chart,
      "title": "Invest in Agro-Projects",
      "subtitle":
      "Fund promising agricultural projects and become a trusted partner in their success.",
      "image": "assets/images/animal.jpg",
    },
    {
      "icon": Icons.home,
      "title": "Own Your Farmland",
      "subtitle":
      "Buy or invest in agricultural land. Build your dream farm for a sustainable future.",
      "image": "assets/images/fram.jpg",
    },
    {
      "icon": Icons.shopping_cart,
      "title": "Shop for Agri-essentials",
      "subtitle":
      "Seeds, fertilizers, and machinery—get all your farming needs from our trusted marketplace.",
      "image": "assets/images/agriessn.jpg",
    },
    {
      "icon": "",
      "title": "",
      "subtitle": "",
      "image": "assets/images/APP-BG1-Recovered.jpg",
    },
  ];

  int get lastPageIndex => pages.length - 1;

  int get videoPageIndex =>
      pages.indexWhere((p) => p['isVideo'] == true); // if any

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    _initVideo();
  }

  Future<void> _initVideo() async {
    final i = videoPageIndex;
    if (i == -1) return;

    final isAsset = (pages[i]['videoSource'] ?? 'asset') == 'asset';
    videoController = isAsset
        ? VideoPlayerController.asset(pages[i]['videoPath'])
        : VideoPlayerController.network(pages[i]['videoPath']);

    await videoController!.initialize();
    videoController!
      ..setLooping(true)
      ..setVolume(0.0);
    videoReady.value = true;

    if (currentPage.value == i) {
      videoController!.play();
    }
  }

  void onPageChanged(int index) {
    currentPage.value = index;
    final i = videoPageIndex;

    if (videoController != null && i != -1) {
      if (index == i && videoReady.value) {
        videoController!.play();
      } else {
        videoController!.pause();
      }
    }
  }

  Future<void> nextPage() async {
    if (currentPage.value == lastPageIndex) {
      await completeOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    Get.offAllNamed(Routes.MY_LOGIN);
  }

  @override
  void onClose() {
    videoController?.dispose();
    pageController.dispose();
    super.onClose();
  }
}
