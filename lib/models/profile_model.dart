import 'package:flutter/material.dart';

class NotificationSettings {
  final bool enabled;
  final bool emailNotifications;
  final bool pushNotifications;

  NotificationSettings({
    this.enabled = true,
    this.emailNotifications = true,
    this.pushNotifications = true,
  });

  factory NotificationSettings.fromJson(Map<String, dynamic> json) {
    return NotificationSettings(
      enabled: json['enabled'] as bool,
      emailNotifications: json['emailNotifications'] as bool,
      pushNotifications: json['pushNotifications'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'emailNotifications': emailNotifications,
      'pushNotifications': pushNotifications,
    };
  }

  NotificationSettings copyWith({
    bool? enabled,
    bool? emailNotifications,
    bool? pushNotifications,
  }) {
    return NotificationSettings(
      enabled: enabled ?? this.enabled,
      emailNotifications: emailNotifications ?? this.emailNotifications,
      pushNotifications: pushNotifications ?? this.pushNotifications,
    );
  }
}

class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String bio;
  final String title;
  final String profileImage;
  final List<String> skills;
  final List<Experience> experience;
  final List<Education> education;
  final String resumeUrl;
  final NotificationSettings notifications;
  final bool isProfileVisible;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.bio,
    required this.title,
    required this.profileImage,
    required this.skills,
    required this.experience,
    required this.education,
    required this.resumeUrl,
    required this.notifications,
    required this.isProfileVisible,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      bio: json['bio'] as String,
      title: json['title'] as String,
      profileImage: json['profileImage'] as String,
      skills: List<String>.from(json['skills'] as List),
      experience: (json['experience'] as List)
          .map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList(),
      education: (json['education'] as List)
          .map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
      resumeUrl: json['resumeUrl'] as String,
      notifications: NotificationSettings.fromJson(
        json['notifications'] as Map<String, dynamic>,
      ),
      isProfileVisible: json['isProfileVisible'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'location': location,
      'bio': bio,
      'title': title,
      'profileImage': profileImage,
      'skills': skills,
      'experience': experience.map((e) => e.toJson()).toList(),
      'education': education.map((e) => e.toJson()).toList(),
      'resumeUrl': resumeUrl,
      'notifications': notifications.toJson(),
      'isProfileVisible': isProfileVisible,
    };
  }

  ProfileModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? location,
    String? bio,
    String? title,
    String? profileImage,
    List<String>? skills,
    List<Experience>? experience,
    List<Education>? education,
    String? resumeUrl,
    NotificationSettings? notifications,
    bool? isProfileVisible,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      bio: bio ?? this.bio,
      title: title ?? this.title,
      profileImage: profileImage ?? this.profileImage,
      skills: skills ?? this.skills,
      experience: experience ?? this.experience,
      education: education ?? this.education,
      resumeUrl: resumeUrl ?? this.resumeUrl,
      notifications: notifications ?? this.notifications,
      isProfileVisible: isProfileVisible ?? this.isProfileVisible,
    );
  }

  factory ProfileModel.dummy() {
    return ProfileModel(
      id: '',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '',
      location: '',
      bio: '',
      title: 'Senior Software Developer',
      profileImage: 'https://via.placeholder.com/150',
      skills: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
      experience: [
        Experience(
          company: 'Tech Corp',
          position: 'Senior Developer',
          startDate: DateTime(2020, 1),
          endDate: DateTime.now(),
          description: 'Led development of mobile applications',
        ),
      ],
      education: [
        Education(
          institution: 'University of Technology',
          degree: 'Bachelor of Computer Science',
          startDate: DateTime(2016, 9),
          endDate: DateTime(2020, 6),
        ),
      ],
      resumeUrl: '',
      notifications: NotificationSettings(),
      isProfileVisible: true,
    );
  }
}

class Experience {
  final String company;
  final String position;
  final DateTime startDate;
  final DateTime endDate;
  final String description;

  Experience({
    required this.company,
    required this.position,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      company: json['company'] as String,
      position: json['position'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'position': position,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'description': description,
    };
  }
}

class Education {
  final String institution;
  final String degree;
  final DateTime startDate;
  final DateTime endDate;

  Education({
    required this.institution,
    required this.degree,
    required this.startDate,
    required this.endDate,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      institution: json['institution'] as String,
      degree: json['degree'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'institution': institution,
      'degree': degree,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}
