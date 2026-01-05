import 'all_project_item.dart';

class Data {
  Data({
      this.shortTerm, 
      this.live, 
      this.longTerm, 
      this.liveProjects,});

  Data.fromJson(dynamic json) {
    if (json['Short Term'] != null) {
      shortTerm = [];
      json['Short Term'].forEach((v) {
        shortTerm?.add(AllProjectItem.fromJson(v));
      });
    }
    if (json['Live'] != null) {
      live = [];
      json['Live'].forEach((v) {
        live?.add(AllProjectItem.fromJson(v));
      });
    }
    if (json['Long Term'] != null) {
      longTerm = [];
      json['Long Term'].forEach((v) {
        longTerm?.add(AllProjectItem.fromJson(v));
      });
    }
    if (json['Live Projects'] != null) {
      liveProjects = [];
      json['Live Projects'].forEach((v) {
        liveProjects?.add(AllProjectItem.fromJson(v));
      });
    }
  }
  List<AllProjectItem>? shortTerm;
  List<AllProjectItem>? live;
  List<AllProjectItem>? longTerm;
  List<AllProjectItem>? liveProjects;
Data copyWith({  List<AllProjectItem>? shortTerm,
  List<AllProjectItem>? live,
  List<AllProjectItem>? longTerm,
  List<AllProjectItem>? liveProjects,
}) => Data(  shortTerm: shortTerm ?? this.shortTerm,
  live: live ?? this.live,
  longTerm: longTerm ?? this.longTerm,
  liveProjects: liveProjects ?? this.liveProjects,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (shortTerm != null) {
      map['Short Term'] = shortTerm?.map((v) => v.toJson()).toList();
    }
    if (live != null) {
      map['Live'] = live?.map((v) => v.toJson()).toList();
    }
    if (longTerm != null) {
      map['Long Term'] = longTerm?.map((v) => v.toJson()).toList();
    }
    if (liveProjects != null) {
      map['Live Projects'] = liveProjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}