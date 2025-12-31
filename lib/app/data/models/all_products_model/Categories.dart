class Categories {
  Categories({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? slug;
  String? image;
Categories copyWith({  num? id,
  String? name,
  String? slug,
  String? image,
}) => Categories(  id: id ?? this.id,
  name: name ?? this.name,
  slug: slug ?? this.slug,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

}