class JobModel {
  final String id;
  final String title;
  final String description;
  final String company;
  final String location;
  final String salary;
  final DateTime postedDate;

  JobModel({
    required this.id,
    required this.title,
    required this.description,
    required this.company,
    required this.location,
    required this.salary,
    required this.postedDate,
  });
}
