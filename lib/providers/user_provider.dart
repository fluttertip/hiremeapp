import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> fetchUserData(String userId) async {
    setLoading(true);
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));
    // Set a dummy user with all required fields
    _user = UserModel(
      id: userId,
      name: 'John Doe',
      email: 'john.doe@example.com',
      profilePicture: 'https://example.com/profile.jpg',
      role: 'candidate',
    );
    setLoading(false);
  }
}
