import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growup_agro/app/data/models/property_detail_model/property_detail_item_model.dart';

import '../../../data/models/question_model/question_model.dart';

class PropertiesDetailsController extends GetxController {

  CarouselSliderController controller = CarouselSliderController();
  RxInt currentIndex = 0.obs;

  RxList<String> imageList = <String>[
    'https://growupagro.tech/storage/uploads/property/packages/68d98578b266c.jpeg',
    'https://growupagro.tech/storage/uploads/property/packages/68d986a178f81.jpeg',
    'https://growupagro.tech/storage/uploads/property/packages/68d986a178f81.jpeg',
    'https://growupagro.tech/storage/uploads/property/packages/68d98551b5c76.jpeg',
    'https://growupagro.tech/storage/uploads/property/packages/68d985654d8aa.jpeg',
    'https://growupagro.tech/storage/uploads/property/packages/68d98688f1570.jpeg',
    'https://growupagro.tech/storage/uploads/property/packages/68d9858ca4b25.jpeg',

  ].obs;

  final List<PropertyDetailItemModel> propertyDetailItems = [
    PropertyDetailItemModel(name: 'Overview', id: 0),
    PropertyDetailItemModel(name: 'Specification', id: 1),
    PropertyDetailItemModel(name: 'Payment Term', id: 2),
    PropertyDetailItemModel(name: 'Floor Plan', id: 3),
  ];

  void selectProperty(int index) {
    selectedIndex.value = index;
  }

  RxInt selectedIndex = 0.obs;

  RxInt expandedIndex = (-1).obs;

  final questions = <QuestionItem>[
    QuestionItem(
      question: "What's the booking amount?",
      answer: "Typically 10% of the Share Value; Adjustable Per Plan.",
    ),
    QuestionItem(
      question: "How is flat allocation done?",
      answer: "Flat allocation is done based on booking priority and availability.",
    ),
    QuestionItem(
      question: "Is bank loan available?",
      answer: "Yes, bank loan facilities are available with partner banks.",
    ),
  ];

  void toggle(int index) {
    expandedIndex.value = expandedIndex.value == index ? -1 : index;
  }
}
