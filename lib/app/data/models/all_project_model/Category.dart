class AllProjectCategory {
  AllProjectCategory({
      this.id, 
      this.name, 
      this.description, 
      this.code, 
      this.parentId, 
      this.projectCount, 
      this.thumbnail, 
      this.status, 
      this.createdOn, 
      this.createdAt, 
      this.updatedAt,});

  AllProjectCategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    code = json['code'];
    parentId = json['parent_id'];
    projectCount = json['project_count'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    createdOn = json['created_on'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  dynamic description;
  dynamic code;
  dynamic parentId;
  String? projectCount;
  dynamic thumbnail;
  String? status;
  String? createdOn;
  String? createdAt;
  String? updatedAt;
AllProjectCategory copyWith({  num? id,
  String? name,
  dynamic description,
  dynamic code,
  dynamic parentId,
  String? projectCount,
  dynamic thumbnail,
  String? status,
  String? createdOn,
  String? createdAt,
  String? updatedAt,
}) => AllProjectCategory(  id: id ?? this.id,
  name: name ?? this.name,
  description: description ?? this.description,
  code: code ?? this.code,
  parentId: parentId ?? this.parentId,
  projectCount: projectCount ?? this.projectCount,
  thumbnail: thumbnail ?? this.thumbnail,
  status: status ?? this.status,
  createdOn: createdOn ?? this.createdOn,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['code'] = code;
    map['parent_id'] = parentId;
    map['project_count'] = projectCount;
    map['thumbnail'] = thumbnail;
    map['status'] = status;
    map['created_on'] = createdOn;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}