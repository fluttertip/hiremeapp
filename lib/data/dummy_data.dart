import '../models/job_model.dart';
import '../models/application_model.dart';

final List<JobModel> dummyJobs = [
  JobModel(
    id: '1',
    title: 'Senior Flutter Developer',
    company: 'TechCorp',
    location: 'New York, NY',
    jobType: 'Full-time',
    salary: 120000,
    description:
        'We are looking for an experienced Flutter developer to join our team...',
    requirements: [
      '5+ years of experience with Flutter',
      'Strong understanding of Dart',
      'Experience with state management',
    ],
    benefits: ['Health insurance', '401(k) matching', 'Flexible work hours'],
    postedDate: DateTime.now().subtract(const Duration(days: 2)),
    isFeatured: true,
    isRemote: true,
    companyLogo: 'https://example.com/techcorp.png',
  ),
  JobModel(
    id: '2',
    title: 'Flutter Developer',
    company: 'StartupX',
    location: 'San Francisco, CA',
    jobType: 'Full-time',
    salary: 100000,
    description: 'Join our fast-growing startup as a Flutter developer...',
    requirements: [
      '3+ years of experience with Flutter',
      'Experience with Firebase',
      'Good communication skills',
    ],
    benefits: ['Stock options', 'Remote work', 'Learning budget'],
    postedDate: DateTime.now().subtract(const Duration(days: 1)),
    isFeatured: false,
    isRemote: true,
  ),
  JobModel(
    id: '3',
    title: 'Mobile App Developer',
    company: 'BigTech',
    location: 'Seattle, WA',
    jobType: 'Full-time',
    salary: 130000,
    description:
        'Looking for a mobile app developer with Flutter experience...',
    requirements: [
      '4+ years of mobile development',
      'Flutter experience',
      'iOS/Android knowledge',
    ],
    benefits: ['Competitive salary', 'Great benefits', 'Career growth'],
    postedDate: DateTime.now().subtract(const Duration(hours: 12)),
    isFeatured: true,
    isRemote: false,
    companyLogo: 'https://example.com/bigtech.png',
  ),
];

final List<ApplicationModel> dummyApplications = [
  ApplicationModel(
    id: '1',
    jobId: '1',
    userId: 'user1',
    jobTitle: 'Senior Flutter Developer',
    companyName: 'TechCorp',
    location: 'New York, NY',
    jobType: 'Full-time',
       salary: '\$120,000 - \$150,000',

    appliedDate: DateTime.now().subtract(const Duration(days: 5)),
    status: 'Under Review',
    coverLetter: 'I am excited to apply for this position...',
    resumeUrl: 'https://example.com/resume1.pdf',
  ),
  ApplicationModel(
    id: '2',
    jobId: '2',
    userId: 'user1',
    jobTitle: 'Flutter Developer',
    companyName: 'StartupX',
    location: 'San Francisco, CA',
    jobType: 'Full-time',
        salary: '\$100,000 - \$150,000',

    appliedDate: DateTime.now().subtract(const Duration(days: 3)),
    status: 'Interview Scheduled',
    coverLetter: 'I would be a great fit for this role...',
    resumeUrl: 'https://example.com/resume2.pdf',
  ),
  ApplicationModel(
    id: '3',
    jobId: '3',
    userId: 'user1',
    jobTitle: 'Mobile App Developer',
    companyName: 'BigTech',
    location: 'Seattle, WA',
    jobType: 'Full-time',
        salary: '\$80,000 - \$120,000',

    appliedDate: DateTime.now().subtract(const Duration(days: 1)),
    status: 'Rejected',
    coverLetter: 'I am passionate about mobile development...',
    resumeUrl: 'https://example.com/resume3.pdf',
  ),
];
