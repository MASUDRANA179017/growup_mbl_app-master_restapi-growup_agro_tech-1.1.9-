import 'Categories.dart';
import 'Products.dart';

class Data {
  Data({
      this.categories, 
      this.products,});

  Data.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  List<Categories>? categories;
  List<Products>? products;
Data copyWith({  List<Categories>? categories,
  List<Products>? products,
}) => Data(  categories: categories ?? this.categories,
  products: products ?? this.products,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}