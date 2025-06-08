import 'package:flutter/material.dart';
import '../models/application_model.dart';
import '../data/dummy_applications.dart';

class ApplicationProvider extends ChangeNotifier {
  List<ApplicationModel> _applications = [];

  List<ApplicationModel> get applications => _applications;

  ApplicationProvider() {
    _loadDummyData();
  }

  void _loadDummyData() {
    _applications = dummyApplications;
  }

  void addApplication(ApplicationModel application) {
    _applications.add(application);
    notifyListeners();
  }

  void updateApplicationStatus(String applicationId, String status) {
    final index = _applications.indexWhere((app) => app.id == applicationId);
    if (index != -1) {
      _applications[index] = _applications[index].copyWith(status: status);
      notifyListeners();
    }
  }

  List<ApplicationModel> getApplicationsByStatus(String status) {
    return _applications.where((app) => app.status == status).toList();
  }

  List<ApplicationModel> getApplicationsByJobId(String jobId) {
    return _applications.where((app) => app.jobId == jobId).toList();
  }
}
