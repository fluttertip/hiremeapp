class UserModel {
  final String id;
  final String name;
  final String email;
  final String profilePicture;
  final String role; // e.g., "candidate" or "employer"

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      profilePicture: map['profilePicture'],
      role: map['role'],
    );
  }
}
