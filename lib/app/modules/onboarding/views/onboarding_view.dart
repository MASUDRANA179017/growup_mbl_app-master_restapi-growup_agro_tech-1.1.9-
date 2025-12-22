import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.pages.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              final data = controller.pages[index];
              final isVideo = data['isVideo'] == true;
              final isLast = index == controller.lastPageIndex;

              return Stack(
                fit: StackFit.expand,
                children: [
                  // Background
                  if (isVideo)
                    _VideoBackground(
                      controller: controller.videoController,
                      ready: controller.videoReady.value,
                    )
                  else
                    Image.asset(data['image'], fit: BoxFit.cover),

                  // Blur + gradient for non-last
                  if (!isVideo && !isLast) ...[
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(color: Colors.black.withValues(alpha: 0.3)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.8),
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],

                  // Card content
                  if (!isVideo && !isLast)
                    Align(
                      alignment: const Alignment(0, -0.1),
                      child: Card(
                        color: Colors.black.withValues(alpha: 0.65),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.symmetric(horizontal: screenW * 0.08),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenH * 0.04,
                            horizontal: screenW * 0.06,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                            data['icon'] == '' ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                            children: [
                              if (data['icon'] != '')
                                Icon(data['icon'], color: Colors.white, size: screenW * 0.15),
                              SizedBox(height: screenH * 0.02),
                              Text(
                                data['title'] ?? '',
                                style: TextStyle(
                                  fontSize: screenW * 0.09,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: data['icon'] == '' ? TextAlign.center : TextAlign.start,
                              ),
                              SizedBox(height: screenH * 0.015),
                              Text(
                                data['subtitle'] ?? '',
                                style: TextStyle(
                                  fontSize: screenW * 0.04,
                                  color: Colors.white70,
                                  height: 1.4,
                                ),
                                textAlign: data['icon'] == '' ? TextAlign.center : TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),

          // Skip button
          Positioned(
            top: screenH * 0.06,
            right: screenW * 0.05,
            child: TextButton(
              onPressed: controller.completeOnboarding,
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),

          // Dots + Next button
          Positioned(
            bottom: screenH * 0.08,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Obx(
                      () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.pages.length,
                          (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: screenW * 0.01),
                        width: controller.currentPage.value == i ? screenW * 0.06 : screenW * 0.025,
                        height: screenH * 0.01,
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == i ? Colors.green : Colors.white54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenH * 0.03),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenW * 0.3,
                      vertical: screenH * 0.018,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: controller.nextPage,
                  child: Obx(
                        () => Text(
                      controller.currentPage.value == controller.lastPageIndex ? "Get Started" : "Next",
                      style: TextStyle(
                        fontSize: screenW * 0.045,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoBackground extends StatelessWidget {
  const _VideoBackground({required this.controller, required this.ready});

  final VideoPlayerController? controller;
  final bool ready;

  @override
  Widget build(BuildContext context) {
    if (controller == null || !ready || !controller!.value.isInitialized) {
      return Container(color: Colors.black);
    }

    final value = controller!.value;
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: value.size.width,
        height: value.size.height,
        child: VideoPlayer(controller!),
      ),
    );
  }
}
