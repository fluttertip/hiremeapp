import 'package:flutter/material.dart';
import '../models/user_model.dart';

class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}

class UserProvider extends ChangeNotifier {
  UserModel? _currentUser;
  bool _isEmployer = false;
  User? _user;

  UserModel? get currentUser => _currentUser;
  bool get isEmployer => _isEmployer;
  bool get isLoggedIn => _currentUser != null;
  User? get user => _user;

  void setUser(UserModel? user) {
    _currentUser = user;
    notifyListeners();
  }

  void toggleUserMode() {
    _isEmployer = !_isEmployer;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    _user = null;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    _user = User(id: '1', name: 'John Doe', email: email);
    notifyListeners();
  }
}
