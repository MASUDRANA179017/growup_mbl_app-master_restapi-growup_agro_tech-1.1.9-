import 'package:growup_agro/models/live_project_model.dart';

class AllPropertiesNew {
  AllPropertiesNew({
      this.message, 
      this.properties,});

  AllPropertiesNew.fromJson(dynamic json) {
    message = json['message'];
    if (json['properties'] != null) {
      properties = [];
      json['properties'].forEach((v) {
        properties?.add(LiveProject.fromJson(v));
      });
    }
  }
  String? message;
  List<LiveProject>? properties;
AllPropertiesNew copyWith({  String? message,
  List<LiveProject>? properties,
}) => AllPropertiesNew(  message: message ?? this.message,
  properties: properties ?? this.properties,
);
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['message'] = message;
  //   if (properties != null) {
  //     map['properties'] = properties?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }

}