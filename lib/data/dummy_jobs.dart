import '../models/job_model.dart';

final List<JobModel> dummyJobs = [
  JobModel(
    id: 'job1',
    title: 'Flutter Developer',
    company: 'Tech Solutions',
    location: 'Remote',
    description: 'Develop and maintain Flutter mobile applications.',
    salary: '₹8,00,000 - ₹12,00,000',
    postedDate: DateTime.now().subtract(Duration(days: 2)),
  ),
  JobModel(
    id: 'job2',
    title: 'Backend Engineer',
    company: 'CloudSoft',
    location: 'Bangalore',
    description: 'Design and implement scalable backend systems.',
    salary: '₹10,00,000 - ₹15,00,000',
    postedDate: DateTime.now().subtract(Duration(days: 5)),
  ),
  JobModel(
    id: 'job3',
    title: 'UI/UX Designer',
    company: 'Creative Minds',
    location: 'Mumbai',
    description: 'Create user-friendly interfaces and experiences.',
    salary: '₹6,00,000 - ₹9,00,000',
    postedDate: DateTime.now().subtract(Duration(days: 1)),
  ),
];