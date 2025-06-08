import 'package:flutter/material.dart';
import '../models/profile_model.dart';

class ProfileProvider with ChangeNotifier {
  ProfileModel _profile = ProfileModel(
    id: '1',
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '(555) 123-4567',
    location: 'New York, NY',
    bio:
        'Experienced Flutter developer with a passion for creating beautiful and performant mobile applications.',
    skills: ['Flutter', 'Dart', 'Firebase', 'REST APIs', 'Git', 'CI/CD'],
    experience: [
      Experience(
        company: 'TechCorp',
        position: 'Senior Flutter Developer',
        startDate: DateTime(2020, 1),
        endDate: DateTime.now(),
        description:
            'Leading mobile app development using Flutter and Firebase.',
      ),
      Experience(
        company: 'StartupX',
        position: 'Mobile Developer',
        startDate: DateTime(2018, 6),
        endDate: DateTime(2019, 12),
        description:
            'Developed cross-platform mobile applications using Flutter.',
      ),
    ],
    education: [
      Education(
        institution: 'University of Technology',
        degree: 'Bachelor of Science',
            startDate: DateTime(2014, 9),
        endDate: DateTime(2018, 5),
      ),
    ],
    resumeUrl: 'https://example.com/resume.pdf',
    notifications: NotificationSettings(
      enabled: true,
      emailNotifications: true,
      pushNotifications: true,
    ),
    isProfileVisible: true, title: '', profileImage: '',
  );

  ProfileModel get profile => _profile;

  Future<void> updateProfile(ProfileModel updatedProfile, {
    String? name,
    String? email,
    String? phone,
    String? location,
    String? bio,
    List<String>? skills,
    List<Experience>? experience,
    List<Education>? education,
    String? resumeUrl,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    _profile = _profile.copyWith(
      name: name,
      email: email,
      phone: phone,
      location: location,
      bio: bio,
      skills: skills,
      experience: experience,
      education: education,
      resumeUrl: resumeUrl,
    );

    notifyListeners();
  }

  Future<void> updateNotificationSettings({
    bool? enabled,
    bool? emailNotifications,
    bool? pushNotifications,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));

    _profile = _profile.copyWith(
      notifications: _profile.notifications.copyWith(
        enabled: enabled,
        emailNotifications: emailNotifications,
        pushNotifications: pushNotifications,
      ),
    );

    notifyListeners();
  }

  Future<void> updateProfileVisibility(bool isVisible) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));

    _profile = _profile.copyWith(isProfileVisible: isVisible);

    notifyListeners();
  }
}
