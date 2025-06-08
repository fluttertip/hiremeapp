class ApplicationModel {
  final String id;
  final String jobId;
  final String userId;
  final String status;
  final DateTime appliedDate;

  ApplicationModel({
    required this.id,
    required this.jobId,
    required this.userId,
    required this.status,
    required this.appliedDate,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      id: json['id'],
      jobId: json['jobId'],
      userId: json['userId'],
      status: json['status'],
      appliedDate: DateTime.parse(json['appliedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobId': jobId,
      'userId': userId,
      'status': status,
      'appliedDate': appliedDate.toIso8601String(),
    };
  }
}