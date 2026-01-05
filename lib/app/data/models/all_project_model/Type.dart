class AllProjectType {
  AllProjectType({
      this.id, 
      this.name, 
      this.code, 
      this.parentId, 
      this.projectCount, 
      this.minDuration, 
      this.maxDuration, 
      this.durationUnit, 
      this.description, 
      this.status, 
      this.createdOn, 
      this.thumbnail, 
      this.createdAt, 
      this.updatedAt,});

  AllProjectType.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    parentId = json['parent_id'];
    projectCount = json['project_count'];
    minDuration = json['min_duration'];
    maxDuration = json['max_duration'];
    durationUnit = json['duration_unit'];
    description = json['description'];
    status = json['status'];
    createdOn = json['created_on'];
    thumbnail = json['thumbnail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? code;
  dynamic parentId;
  String? projectCount;
  String? minDuration;
  String? maxDuration;
  String? durationUnit;
  dynamic description;
  String? status;
  dynamic createdOn;
  dynamic thumbnail;
  String? createdAt;
  String? updatedAt;
AllProjectType copyWith({  num? id,
  String? name,
  String? code,
  dynamic parentId,
  String? projectCount,
  String? minDuration,
  String? maxDuration,
  String? durationUnit,
  dynamic description,
  String? status,
  dynamic createdOn,
  dynamic thumbnail,
  String? createdAt,
  String? updatedAt,
}) => AllProjectType(  id: id ?? this.id,
  name: name ?? this.name,
  code: code ?? this.code,
  parentId: parentId ?? this.parentId,
  projectCount: projectCount ?? this.projectCount,
  minDuration: minDuration ?? this.minDuration,
  maxDuration: maxDuration ?? this.maxDuration,
  durationUnit: durationUnit ?? this.durationUnit,
  description: description ?? this.description,
  status: status ?? this.status,
  createdOn: createdOn ?? this.createdOn,
  thumbnail: thumbnail ?? this.thumbnail,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    map['parent_id'] = parentId;
    map['project_count'] = projectCount;
    map['min_duration'] = minDuration;
    map['max_duration'] = maxDuration;
    map['duration_unit'] = durationUnit;
    map['description'] = description;
    map['status'] = status;
    map['created_on'] = createdOn;
    map['thumbnail'] = thumbnail;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}