import 'package:flutter/material.dart';

class ApplicationModel {
  final String id;
  final String jobId;
  final String userId;
  final String jobTitle;
  final String companyName;
  final String location;
  final String jobType;
  final String salary;
  final DateTime appliedDate;
  final String status;
  final String coverLetter;
  final String resumeUrl;

  ApplicationModel({
    required this.id,
    required this.jobId,
    required this.userId,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.jobType,
    required this.salary,
    required this.appliedDate,
    required this.status,
    required this.coverLetter,
    required this.resumeUrl,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      id: json['id'] as String,
      jobId: json['jobId'] as String,
      userId: json['userId'] as String,
      jobTitle: json['jobTitle'] as String,
      companyName: json['companyName'] as String,
      location: json['location'] as String,
      jobType: json['jobType'] as String,
      salary: json['salary'] as String,
      appliedDate: DateTime.parse(json['appliedDate'] as String),
      status: json['status'] as String,
      coverLetter: json['coverLetter'] as String,
      resumeUrl: json['resumeUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobId': jobId,
      'userId': userId,
      'jobTitle': jobTitle,
      'companyName': companyName,
      'location': location,
      'jobType': jobType,
      'salary': salary,
      'appliedDate': appliedDate.toIso8601String(),
      'status': status,
      'coverLetter': coverLetter,
      'resumeUrl': resumeUrl,
    };
  }

  ApplicationModel copyWith({
    String? id,
    String? jobId,
    String? userId,
    String? jobTitle,
    String? companyName,
    String? location,
    String? jobType,
    String ? salary,
    DateTime? appliedDate,
    String? status,
    String? coverLetter,
    String? resumeUrl,
  }) {
    return ApplicationModel(
      id: id ?? this.id,
      jobId: jobId ?? this.jobId,
      userId: userId ?? this.userId,
      jobTitle: jobTitle ?? this.jobTitle,
      companyName: companyName ?? this.companyName,
      location: location ?? this.location,
      jobType: jobType ?? this.jobType,
      salary: salary ?? this.salary,
      appliedDate: appliedDate ?? this.appliedDate,
      status: status ?? this.status,
      coverLetter: coverLetter ?? this.coverLetter,
      resumeUrl: resumeUrl ?? this.resumeUrl,
    );
  }
}
