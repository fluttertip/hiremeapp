class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final String? bio;
  final List<String> skills;
  final String? resumeUrl;
  final bool isEmployer;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.bio,
    this.skills = const [],
    this.resumeUrl,
    this.isEmployer = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileImage: json['profileImage'] as String?,
      bio: json['bio'] as String?,
      skills: List<String>.from(json['skills'] ?? []),
      resumeUrl: json['resumeUrl'] as String?,
      isEmployer: json['isEmployer'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'bio': bio,
      'skills': skills,
      'resumeUrl': resumeUrl,
      'isEmployer': isEmployer,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    String? bio,
    List<String>? skills,
    String? resumeUrl,
    bool? isEmployer,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      bio: bio ?? this.bio,
      skills: skills ?? this.skills,
      resumeUrl: resumeUrl ?? this.resumeUrl,
      isEmployer: isEmployer ?? this.isEmployer,
    );
  }
}
