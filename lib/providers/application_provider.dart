import 'package:flutter/material.dart';
import '../models/application_model.dart';

class ApplicationProvider with ChangeNotifier {
  List<ApplicationModel> _applications = [];

  List<ApplicationModel> get applications => _applications;

  void addApplication(ApplicationModel application) {
    _applications.add(application);
    notifyListeners();
  }

  void removeApplication(ApplicationModel application) {
    _applications.remove(application);
    notifyListeners();
  }

  void clearApplications() {
    _applications.clear();
    notifyListeners();
  }
}