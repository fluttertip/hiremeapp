import 'package:flutter/material.dart';
import '../models/job_model.dart';
import '../models/application_model.dart';
import '../data/dummy_jobs.dart';
import '../data/dummy_applications.dart';

class JobProvider with ChangeNotifier {
  List<JobModel> _jobs = dummyJobs;
  final List<ApplicationModel> _applications = dummyApplications;

  List<JobModel> get jobs => _jobs;
  List<JobModel> get featuredJobs =>
      _jobs.where((job) => job.isFeatured).toList();

  List<ApplicationModel> getApplications() {
    return _applications;
  }

  List<JobModel> searchJobs(String query) {
    if (query.isEmpty) return _jobs;
    return _jobs.where((job) {
      return job.title.toLowerCase().contains(query.toLowerCase()) ||
          job.company.toLowerCase().contains(query.toLowerCase()) ||
          job.location.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  void addJob(JobModel job) {
    _jobs.add(job);
    notifyListeners();
  }

  void removeJob(String id) {
    _jobs.removeWhere((job) => job.id == id);
    notifyListeners();
  }

  void updateJob(JobModel updatedJob) {
    final index = _jobs.indexWhere((job) => job.id == updatedJob.id);
    if (index != -1) {
      _jobs[index] = updatedJob;
      notifyListeners();
    }
  }

  void addApplication(ApplicationModel application) {
    _applications.add(application);
    notifyListeners();
  }

  void updateApplicationStatus(String id, String status) {
    final index = _applications.indexWhere((app) => app.id == id);
    if (index != -1) {
      _applications[index] = _applications[index].copyWith(status: status);
      notifyListeners();
    }
  }

  void filterJobs(String location, String jobType, double minSalary, double maxSalary) {
    _jobs = _jobs.where((job) {
      return job.location == location &&
          job.jobType == jobType &&
          job.salary >= minSalary &&
          job.salary <= maxSalary;
    }).toList();
    notifyListeners();
  }

  void toggleSaveJob(JobModel job) {}

  isJobSaved(JobModel job) {}
}
