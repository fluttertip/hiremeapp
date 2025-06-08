import 'package:flutter/material.dart';
import '../models/job_model.dart';
import '../data/dummy_jobs.dart';

class JobProvider with ChangeNotifier {
  List<JobModel> _jobs = dummyJobs;

  List<JobModel> get jobs {
    return [..._jobs];
  }

  void addJob(JobModel job) {
    _jobs.add(job);
    notifyListeners();
  }

  void removeJob(String jobId) {
    _jobs.removeWhere((job) => job.id == jobId);
    notifyListeners();
  }

  JobModel findJobById(String id) {
    return _jobs.firstWhere((job) => job.id == id);
  }
}