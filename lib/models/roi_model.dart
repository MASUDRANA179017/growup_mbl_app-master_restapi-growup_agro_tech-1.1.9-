class RoiModel {
  final int projectId;
  final int investorId;
  final double roiAmount;
  final String countingDate;

  RoiModel({
    required this.projectId,
    required this.investorId,
    required this.roiAmount,
    required this.countingDate,
  });

  factory RoiModel.fromJson(Map<String, dynamic> json) {
    return RoiModel(
      projectId: int.parse(json['project_id'].toString()),
      investorId: int.parse(json['investor_id'].toString()),
      roiAmount: double.parse(json['roi_amount'].toString()),
      countingDate: json['counting_date'] ?? '',
    );
  }
}
