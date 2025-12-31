class Products {
  Products({
      this.id, 
      this.name, 
      this.slug, 
      this.price, 
      this.discountPrice, 
      this.thumbnailImage, 
      this.brand, 
      this.categories, 
      this.shortDescription,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    price = json['price'];
    discountPrice = json['discount_price'];
    thumbnailImage = json['thumbnail_image'];
    brand = json['brand'];
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    shortDescription = json['short_description'];
  }
  num? id;
  String? name;
  String? slug;
  num? price;
  num? discountPrice;
  String? thumbnailImage;
  String? brand;
  List<String>? categories;
  String? shortDescription;
Products copyWith({  num? id,
  String? name,
  String? slug,
  num? price,
  num? discountPrice,
  String? thumbnailImage,
  String? brand,
  List<String>? categories,
  String? shortDescription,
}) => Products(  id: id ?? this.id,
  name: name ?? this.name,
  slug: slug ?? this.slug,
  price: price ?? this.price,
  discountPrice: discountPrice ?? this.discountPrice,
  thumbnailImage: thumbnailImage ?? this.thumbnailImage,
  brand: brand ?? this.brand,
  categories: categories ?? this.categories,
  shortDescription: shortDescription ?? this.shortDescription,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['price'] = price;
    map['discount_price'] = discountPrice;
    map['thumbnail_image'] = thumbnailImage;
    map['brand'] = brand;
    map['categories'] = categories;
    map['short_description'] = shortDescription;
    return map;
  }

}