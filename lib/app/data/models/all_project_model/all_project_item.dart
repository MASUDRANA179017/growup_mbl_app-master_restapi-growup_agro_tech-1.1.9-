import 'Type.dart';
import 'Category.dart';

class AllProjectItem {
  AllProjectItem({
      this.id, 
      this.name, 
      this.shortName, 
      this.code, 
      this.typeId, 
      this.categoryId, 
      this.parentId, 
      this.address, 
      this.investmentType, 
      this.thumbnail, 
      this.imageUrl, 
      this.durationMonth, 
      this.durationActualDays, 
      this.durationViewer, 
      this.durationText, 
      this.status, 
      this.projectStatus, 
      this.investmentbtn, 
      this.investmentGoal, 
      this.minInvestAmount, 
      this.annualRoi, 
      this.investorRoiPercent, 
      this.profitReturnPeriod, 
      this.capitalReturnPeriod, 
      this.fundCollectStartDate, 
      this.projectStartDate, 
      this.projectMatureDate, 
      this.investOpportunityDays, 
      this.investmentPlanId, 
      this.collectedAmount, 
      this.raised, 
      this.remainingGoal, 
      this.remainingOpportunityDays, 
      this.createdAt, 
      this.updatedAt, 
      this.type, 
      this.category,});

  AllProjectItem.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    shortName = json['short_name'];
    code = json['code'];
    typeId = json['type_id'];
    categoryId = json['category_id'];
    parentId = json['parent_id'];
    address = json['address'];
    investmentType = json['investment_type'];
    thumbnail = json['thumbnail'];
    imageUrl = json['image_url'];
    durationMonth = json['duration_month'];
    durationActualDays = json['duration_actual_days'];
    durationViewer = json['duration_viewer'];
    durationText = json['duration_text'];
    status = json['status'];
    projectStatus = json['project_status'];
    investmentbtn = json['investmentbtn'];
    investmentGoal = json['investment_goal'];
    minInvestAmount = json['min_invest_amount'];
    annualRoi = json['annual_roi'];
    investorRoiPercent = json['investor_roi_percent'];
    profitReturnPeriod = json['profit_return_period'];
    capitalReturnPeriod = json['capital_return_period'];
    fundCollectStartDate = json['fund_collect_start_date'];
    projectStartDate = json['project_start_date'];
    projectMatureDate = json['project_mature_date'];
    investOpportunityDays = json['invest_opportunity_days'];
    investmentPlanId = json['investment_plan_id'];
    collectedAmount = json['collected_amount'];
    raised = json['raised'];
    remainingGoal = json['remaining_goal'];
    remainingOpportunityDays = json['remaining_opportunity_days'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'] != null ? AllProjectType.fromJson(json['type']) : null;
    category = json['category'] != null ? AllProjectCategory.fromJson(json['category']) : null;
  }
  num? id;
  String? name;
  String? shortName;
  String? code;
  dynamic typeId;
  String? categoryId;
  dynamic parentId;
  dynamic address;
  dynamic investmentType;
  String? thumbnail;
  String? imageUrl;
  String? durationMonth;
  String? durationActualDays;
  String? durationViewer;
  String? durationText;
  String? status;
  String? projectStatus;
  num? investmentbtn;
  String? investmentGoal;
  String? minInvestAmount;
  String? annualRoi;
  String? investorRoiPercent;
  String? profitReturnPeriod;
  String? capitalReturnPeriod;
  String? fundCollectStartDate;
  String? projectStartDate;
  String? projectMatureDate;
  String? investOpportunityDays;
  String? investmentPlanId;
  dynamic collectedAmount;
  num? raised;
  num? remainingGoal;
  num? remainingOpportunityDays;
  String? createdAt;
  String? updatedAt;
  AllProjectType? type;
  AllProjectCategory? category;
AllProjectItem copyWith({  num? id,
  String? name,
  String? shortName,
  String? code,
  dynamic typeId,
  String? categoryId,
  dynamic parentId,
  dynamic address,
  dynamic investmentType,
  String? thumbnail,
  String? imageUrl,
  String? durationMonth,
  String? durationActualDays,
  String? durationViewer,
  String? durationText,
  String? status,
  String? projectStatus,
  num? investmentbtn,
  String? investmentGoal,
  String? minInvestAmount,
  String? annualRoi,
  String? investorRoiPercent,
  String? profitReturnPeriod,
  String? capitalReturnPeriod,
  String? fundCollectStartDate,
  String? projectStartDate,
  String? projectMatureDate,
  String? investOpportunityDays,
  String? investmentPlanId,
  dynamic collectedAmount,
  num? raised,
  num? remainingGoal,
  num? remainingOpportunityDays,
  String? createdAt,
  String? updatedAt,
  AllProjectType? type,
  AllProjectCategory? category,
}) => AllProjectItem(  id: id ?? this.id,
  name: name ?? this.name,
  shortName: shortName ?? this.shortName,
  code: code ?? this.code,
  typeId: typeId ?? this.typeId,
  categoryId: categoryId ?? this.categoryId,
  parentId: parentId ?? this.parentId,
  address: address ?? this.address,
  investmentType: investmentType ?? this.investmentType,
  thumbnail: thumbnail ?? this.thumbnail,
  imageUrl: imageUrl ?? this.imageUrl,
  durationMonth: durationMonth ?? this.durationMonth,
  durationActualDays: durationActualDays ?? this.durationActualDays,
  durationViewer: durationViewer ?? this.durationViewer,
  durationText: durationText ?? this.durationText,
  status: status ?? this.status,
  projectStatus: projectStatus ?? this.projectStatus,
  investmentbtn: investmentbtn ?? this.investmentbtn,
  investmentGoal: investmentGoal ?? this.investmentGoal,
  minInvestAmount: minInvestAmount ?? this.minInvestAmount,
  annualRoi: annualRoi ?? this.annualRoi,
  investorRoiPercent: investorRoiPercent ?? this.investorRoiPercent,
  profitReturnPeriod: profitReturnPeriod ?? this.profitReturnPeriod,
  capitalReturnPeriod: capitalReturnPeriod ?? this.capitalReturnPeriod,
  fundCollectStartDate: fundCollectStartDate ?? this.fundCollectStartDate,
  projectStartDate: projectStartDate ?? this.projectStartDate,
  projectMatureDate: projectMatureDate ?? this.projectMatureDate,
  investOpportunityDays: investOpportunityDays ?? this.investOpportunityDays,
  investmentPlanId: investmentPlanId ?? this.investmentPlanId,
  collectedAmount: collectedAmount ?? this.collectedAmount,
  raised: raised ?? this.raised,
  remainingGoal: remainingGoal ?? this.remainingGoal,
  remainingOpportunityDays: remainingOpportunityDays ?? this.remainingOpportunityDays,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  type: type ?? this.type,
  category: category ?? this.category,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['short_name'] = shortName;
    map['code'] = code;
    map['type_id'] = typeId;
    map['category_id'] = categoryId;
    map['parent_id'] = parentId;
    map['address'] = address;
    map['investment_type'] = investmentType;
    map['thumbnail'] = thumbnail;
    map['image_url'] = imageUrl;
    map['duration_month'] = durationMonth;
    map['duration_actual_days'] = durationActualDays;
    map['duration_viewer'] = durationViewer;
    map['duration_text'] = durationText;
    map['status'] = status;
    map['project_status'] = projectStatus;
    map['investmentbtn'] = investmentbtn;
    map['investment_goal'] = investmentGoal;
    map['min_invest_amount'] = minInvestAmount;
    map['annual_roi'] = annualRoi;
    map['investor_roi_percent'] = investorRoiPercent;
    map['profit_return_period'] = profitReturnPeriod;
    map['capital_return_period'] = capitalReturnPeriod;
    map['fund_collect_start_date'] = fundCollectStartDate;
    map['project_start_date'] = projectStartDate;
    map['project_mature_date'] = projectMatureDate;
    map['invest_opportunity_days'] = investOpportunityDays;
    map['investment_plan_id'] = investmentPlanId;
    map['collected_amount'] = collectedAmount;
    map['raised'] = raised;
    map['remaining_goal'] = remainingGoal;
    map['remaining_opportunity_days'] = remainingOpportunityDays;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (type != null) {
      map['type'] = type?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }

}