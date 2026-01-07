
class PropertyDetailsModel {
  PropertyDetailsModel({
      this.success, 
      this.properties, 
      this.investmentbtn, 
      this.amountStatus, 
      this.overview, 
      this.collectAmount,
      this.thumbnailUrl, 
      this.investmentTime, 
      this.rasied, 
      this.inWaiting, 
      this.imageUrl, 
      this.message,});

  PropertyDetailsModel.fromJson(dynamic json) {
    success = json['success'];
    properties = json['properties'] != null ? Properties.fromJson(json['properties']) : null;
    investmentbtn = json['investmentbtn'];
    amountStatus = json['amountStatus'];
    overview = json['overview'];
    collectAmount = json['collect_amount'];
    // if (json['keyPointsData'] != null) {
    //   keyPointsData = [];
    //   json['keyPointsData'].forEach((v) {
    //     keyPointsData?.add(Dynamic.fromJson(v));
    //   });
    // }
    // if (json['security_information'] != null) {
    //   securityInformation = [];
    //   json['security_information'].forEach((v) {
    //     securityInformation?.add(Dynamic.fromJson(v));
    //   });
    // }
    thumbnailUrl = json['thumbnail_url'];
    investmentTime = json['investment_time'];
    rasied = json['rasied'];
    inWaiting = json['in_waiting'];
    imageUrl = json['image_url'];
    message = json['message'];
  }
  bool? success;
  Properties? properties;
  num? investmentbtn;
  num? amountStatus;
  dynamic overview;
  num? collectAmount;
  // List<dynamic>? keyPointsData;
  // List<dynamic>? securityInformation;
  String? thumbnailUrl;
  num? investmentTime;
  String? rasied;
  String? inWaiting;
  String? imageUrl;
  String? message;
PropertyDetailsModel copyWith({  bool? success,
  Properties? properties,
  num? investmentbtn,
  num? amountStatus,
  dynamic overview,
  num? collectAmount,
  // List<dynamic>? keyPointsData,
  // List<dynamic>? securityInformation,
  String? thumbnailUrl,
  num? investmentTime,
  String? rasied,
  String? inWaiting,
  String? imageUrl,
  String? message,
}) => PropertyDetailsModel(  success: success ?? this.success,
  properties: properties ?? this.properties,
  investmentbtn: investmentbtn ?? this.investmentbtn,
  amountStatus: amountStatus ?? this.amountStatus,
  overview: overview ?? this.overview,
  collectAmount: collectAmount ?? this.collectAmount,
  // keyPointsData: keyPointsData ?? this.keyPointsData,
  // securityInformation: securityInformation ?? this.securityInformation,
  thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
  investmentTime: investmentTime ?? this.investmentTime,
  rasied: rasied ?? this.rasied,
  inWaiting: inWaiting ?? this.inWaiting,
  imageUrl: imageUrl ?? this.imageUrl,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (properties != null) {
      map['properties'] = properties?.toJson();
    }
    map['investmentbtn'] = investmentbtn;
    map['amountStatus'] = amountStatus;
    map['overview'] = overview;
    map['collect_amount'] = collectAmount;
    // if (keyPointsData != null) {
    //   map['keyPointsData'] = keyPointsData?.map((v) => v.toJson()).toList();
    // }
    // if (securityInformation != null) {
    //   map['security_information'] = securityInformation?.map((v) => v.toJson()).toList();
    // }
    map['thumbnail_url'] = thumbnailUrl;
    map['investment_time'] = investmentTime;
    map['rasied'] = rasied;
    map['in_waiting'] = inWaiting;
    map['image_url'] = imageUrl;
    map['message'] = message;
    return map;
  }

}

class Properties {
  Properties({
    this.id,
    this.projectName,
    this.slug,
    this.projectShortName,
    this.projectCode,
    this.projectArea,
    this.projected,
    this.projectDurationActual,
    this.projectDurationViewer,
    this.projectCategoryId,
    this.projectId,
    this.businessTypeId,
    this.projectType,
    this.canInvest,
    this.investmentTypeId,
    this.image,
    this.status,
    this.investmentGoal,
    this.minInvestmentAmount,
    this.riskFactor,
    this.repaymentPerYear,
    this.annualRoi,
    this.investorRoi,
    this.projectStartDate,
    this.projectEndDate,
    this.roiStartDate,
    this.investmentOpportunityDays,
    this.isLongTerm,
    this.roiCycle,
    this.createdAt,
    this.updatedAt,
    this.isDisbursement,
    this.lastRoiReturnDate,
    this.roiReturnCount,
    this.isProperty,
    this.projectCategoryName,
    this.investmentTypeName,
    this.businessTypeName,
    this.totalInvestment,
    this.projectDetail,
    // this.keyPoints,
    // this.projectInvestment,
    this.projectMedia,
    this.projectCategory,
    this.investmentType,
    this.businessType,});

  Properties.fromJson(dynamic json) {
    id = json['id'];
    projectName = json['project_name'];
    slug = json['slug'];
    projectShortName = json['project_short_name'];
    projectCode = json['project_code'];
    projectArea = json['project_area'];
    projected = json['projected'];
    projectDurationActual = json['project_duration_actual'];
    projectDurationViewer = json['project_duration_viewer'];
    projectCategoryId = json['project_category_id'];
    projectId = json['project_id'];
    businessTypeId = json['business_type_id'];
    projectType = json['project_type'];
    canInvest = json['can_invest'];
    investmentTypeId = json['investment_type_id'];
    image = json['image'];
    status = json['status'];
    investmentGoal = json['investment_goal'];
    minInvestmentAmount = json['min_investment_amount'];
    riskFactor = json['risk_factor'];
    repaymentPerYear = json['repayment_per_year'];
    annualRoi = json['annual_roi'];
    investorRoi = json['investor_roi'];
    projectStartDate = json['project_start_date'];
    projectEndDate = json['project_end_date'];
    roiStartDate = json['roi_start_date'];
    investmentOpportunityDays = json['investment_opportunity_days'];
    isLongTerm = json['is_long_term'];
    roiCycle = json['roi_cycle'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDisbursement = json['is_disbursement'];
    lastRoiReturnDate = json['last_roi_return_date'];
    roiReturnCount = json['roi_return_count'];
    isProperty = json['is_property'];
    projectCategoryName = json['projectCategory_name'];
    investmentTypeName = json['investmentType_name'];
    businessTypeName = json['businessType_name'];
    totalInvestment = json['total_investment'];
    projectDetail = json['project_detail'];
    // if (json['key_points'] != null) {
    //   keyPoints = [];
    //   json['key_points'].forEach((v) {
    //     keyPoints?.add(Dynamic.fromJson(v));
    //   });
    // }
    // if (json['project_investment'] != null) {
    //   projectInvestment = [];
    //   json['project_investment'].forEach((v) {
    //     projectInvestment?.add(Dynamic.fromJson(v));
    //   });
    // }
    projectMedia = json['project_media'];
    projectCategory = json['project_category'] != null ? ProjectCategory.fromJson(json['project_category']) : null;
    investmentType = json['investment_type'] != null ? InvestmentType.fromJson(json['investment_type']) : null;
    businessType = json['business_type'];
  }
  num? id;
  String? projectName;
  String? slug;
  dynamic projectShortName;
  String? projectCode;
  String? projectArea;
  dynamic projected;
  String? projectDurationActual;
  String? projectDurationViewer;
  String? projectCategoryId;
  dynamic projectId;
  String? businessTypeId;
  dynamic projectType;
  String? canInvest;
  String? investmentTypeId;
  String? image;
  String? status;
  String? investmentGoal;
  String? minInvestmentAmount;
  String? riskFactor;
  String? repaymentPerYear;
  String? annualRoi;
  String? investorRoi;
  String? projectStartDate;
  String? projectEndDate;
  String? roiStartDate;
  String? investmentOpportunityDays;
  String? isLongTerm;
  dynamic roiCycle;
  String? createdAt;
  String? updatedAt;
  String? isDisbursement;
  String? lastRoiReturnDate;
  String? roiReturnCount;
  String? isProperty;
  String? projectCategoryName;
  String? investmentTypeName;
  String? businessTypeName;
  String? totalInvestment;
  dynamic projectDetail;
  // List<dynamic>? keyPoints;
  // List<dynamic>? projectInvestment;
  dynamic projectMedia;
  ProjectCategory? projectCategory;
  InvestmentType? investmentType;
  dynamic businessType;
  Properties copyWith({  num? id,
    String? projectName,
    String? slug,
    dynamic projectShortName,
    String? projectCode,
    String? projectArea,
    dynamic projected,
    String? projectDurationActual,
    String? projectDurationViewer,
    String? projectCategoryId,
    dynamic projectId,
    String? businessTypeId,
    dynamic projectType,
    String? canInvest,
    String? investmentTypeId,
    String? image,
    String? status,
    String? investmentGoal,
    String? minInvestmentAmount,
    String? riskFactor,
    String? repaymentPerYear,
    String? annualRoi,
    String? investorRoi,
    String? projectStartDate,
    String? projectEndDate,
    String? roiStartDate,
    String? investmentOpportunityDays,
    String? isLongTerm,
    dynamic roiCycle,
    String? createdAt,
    String? updatedAt,
    String? isDisbursement,
    String? lastRoiReturnDate,
    String? roiReturnCount,
    String? isProperty,
    String? projectCategoryName,
    String? investmentTypeName,
    String? businessTypeName,
    String? totalInvestment,
    dynamic projectDetail,
    // List<dynamic>? keyPoints,
    // List<dynamic>? projectInvestment,
    dynamic projectMedia,
    ProjectCategory? projectCategory,
    InvestmentType? investmentType,
    dynamic businessType,
  }) => Properties(  id: id ?? this.id,
    projectName: projectName ?? this.projectName,
    slug: slug ?? this.slug,
    projectShortName: projectShortName ?? this.projectShortName,
    projectCode: projectCode ?? this.projectCode,
    projectArea: projectArea ?? this.projectArea,
    projected: projected ?? this.projected,
    projectDurationActual: projectDurationActual ?? this.projectDurationActual,
    projectDurationViewer: projectDurationViewer ?? this.projectDurationViewer,
    projectCategoryId: projectCategoryId ?? this.projectCategoryId,
    projectId: projectId ?? this.projectId,
    businessTypeId: businessTypeId ?? this.businessTypeId,
    projectType: projectType ?? this.projectType,
    canInvest: canInvest ?? this.canInvest,
    investmentTypeId: investmentTypeId ?? this.investmentTypeId,
    image: image ?? this.image,
    status: status ?? this.status,
    investmentGoal: investmentGoal ?? this.investmentGoal,
    minInvestmentAmount: minInvestmentAmount ?? this.minInvestmentAmount,
    riskFactor: riskFactor ?? this.riskFactor,
    repaymentPerYear: repaymentPerYear ?? this.repaymentPerYear,
    annualRoi: annualRoi ?? this.annualRoi,
    investorRoi: investorRoi ?? this.investorRoi,
    projectStartDate: projectStartDate ?? this.projectStartDate,
    projectEndDate: projectEndDate ?? this.projectEndDate,
    roiStartDate: roiStartDate ?? this.roiStartDate,
    investmentOpportunityDays: investmentOpportunityDays ?? this.investmentOpportunityDays,
    isLongTerm: isLongTerm ?? this.isLongTerm,
    roiCycle: roiCycle ?? this.roiCycle,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isDisbursement: isDisbursement ?? this.isDisbursement,
    lastRoiReturnDate: lastRoiReturnDate ?? this.lastRoiReturnDate,
    roiReturnCount: roiReturnCount ?? this.roiReturnCount,
    isProperty: isProperty ?? this.isProperty,
    projectCategoryName: projectCategoryName ?? this.projectCategoryName,
    investmentTypeName: investmentTypeName ?? this.investmentTypeName,
    businessTypeName: businessTypeName ?? this.businessTypeName,
    totalInvestment: totalInvestment ?? this.totalInvestment,
    projectDetail: projectDetail ?? this.projectDetail,
    // keyPoints: keyPoints ?? this.keyPoints,
    // projectInvestment: projectInvestment ?? this.projectInvestment,
    projectMedia: projectMedia ?? this.projectMedia,
    projectCategory: projectCategory ?? this.projectCategory,
    investmentType: investmentType ?? this.investmentType,
    businessType: businessType ?? this.businessType,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['project_name'] = projectName;
    map['slug'] = slug;
    map['project_short_name'] = projectShortName;
    map['project_code'] = projectCode;
    map['project_area'] = projectArea;
    map['projected'] = projected;
    map['project_duration_actual'] = projectDurationActual;
    map['project_duration_viewer'] = projectDurationViewer;
    map['project_category_id'] = projectCategoryId;
    map['project_id'] = projectId;
    map['business_type_id'] = businessTypeId;
    map['project_type'] = projectType;
    map['can_invest'] = canInvest;
    map['investment_type_id'] = investmentTypeId;
    map['image'] = image;
    map['status'] = status;
    map['investment_goal'] = investmentGoal;
    map['min_investment_amount'] = minInvestmentAmount;
    map['risk_factor'] = riskFactor;
    map['repayment_per_year'] = repaymentPerYear;
    map['annual_roi'] = annualRoi;
    map['investor_roi'] = investorRoi;
    map['project_start_date'] = projectStartDate;
    map['project_end_date'] = projectEndDate;
    map['roi_start_date'] = roiStartDate;
    map['investment_opportunity_days'] = investmentOpportunityDays;
    map['is_long_term'] = isLongTerm;
    map['roi_cycle'] = roiCycle;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['is_disbursement'] = isDisbursement;
    map['last_roi_return_date'] = lastRoiReturnDate;
    map['roi_return_count'] = roiReturnCount;
    map['is_property'] = isProperty;
    map['projectCategory_name'] = projectCategoryName;
    map['investmentType_name'] = investmentTypeName;
    map['businessType_name'] = businessTypeName;
    map['total_investment'] = totalInvestment;
    map['project_detail'] = projectDetail;
    // if (keyPoints != null) {
    //   map['key_points'] = keyPoints?.map((v) => v.toJson()).toList();
    // }
    // if (projectInvestment != null) {
    //   map['project_investment'] = projectInvestment?.map((v) => v.toJson()).toList();
    // }
    map['project_media'] = projectMedia;
    if (projectCategory != null) {
      map['project_category'] = projectCategory?.toJson();
    }
    if (investmentType != null) {
      map['investment_type'] = investmentType?.toJson();
    }
    map['business_type'] = businessType;
    return map;
  }

}

class ProjectCategory {
  ProjectCategory({
    this.id,
    this.projectCategoryName,
    this.projectCategoryId,
    this.createDate,
    this.thumbnailImage,
    this.status,
    this.createdAt,
    this.updatedAt,});

  ProjectCategory.fromJson(dynamic json) {
    id = json['id'];
    projectCategoryName = json['project_category_name'];
    projectCategoryId = json['project_category_id'];
    createDate = json['create_date'];
    thumbnailImage = json['thumbnail_image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? projectCategoryName;
  dynamic projectCategoryId;
  String? createDate;
  String? thumbnailImage;
  String? status;
  String? createdAt;
  String? updatedAt;
  ProjectCategory copyWith({  num? id,
    String? projectCategoryName,
    dynamic projectCategoryId,
    String? createDate,
    String? thumbnailImage,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) => ProjectCategory(  id: id ?? this.id,
    projectCategoryName: projectCategoryName ?? this.projectCategoryName,
    projectCategoryId: projectCategoryId ?? this.projectCategoryId,
    createDate: createDate ?? this.createDate,
    thumbnailImage: thumbnailImage ?? this.thumbnailImage,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['project_category_name'] = projectCategoryName;
    map['project_category_id'] = projectCategoryId;
    map['create_date'] = createDate;
    map['thumbnail_image'] = thumbnailImage;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class InvestmentType {
  InvestmentType({
    this.id,
    this.parentType,
    this.name,
    this.code,
    this.createDate,
    this.status,
    this.createdAt,
    this.updatedAt,});

  InvestmentType.fromJson(dynamic json) {
    id = json['id'];
    parentType = json['parent_type'];
    name = json['name'];
    code = json['code'];
    createDate = json['create_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  dynamic parentType;
  String? name;
  String? code;
  String? createDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  InvestmentType copyWith({  num? id,
    dynamic parentType,
    String? name,
    String? code,
    String? createDate,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) => InvestmentType(  id: id ?? this.id,
    parentType: parentType ?? this.parentType,
    name: name ?? this.name,
    code: code ?? this.code,
    createDate: createDate ?? this.createDate,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['parent_type'] = parentType;
    map['name'] = name;
    map['code'] = code;
    map['create_date'] = createDate;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}