import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PropertyDetailItemModel {
  String name;
  int id;
  IconData? icon;
  PropertyDetailItemModel({required this.name, required this.id, this.icon,});
}