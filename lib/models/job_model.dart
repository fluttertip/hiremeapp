class JobModel {
  final String id;
  final String title;
  final String company;
  final String location;
  final String jobType;
  final double salary;
  final String description;
  final List<String> requirements;
  final List<String> benefits;
  final DateTime postedDate;
  final bool isFeatured;
  final bool isRemote;
  final String? companyLogo;

  JobModel({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.jobType,
    required this.salary,
    required this.description,
    required this.requirements,
    required this.benefits,
    required this.postedDate,
    this.isFeatured = false,
    this.isRemote = false,
    this.companyLogo,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'] as String,
      title: json['title'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      jobType: json['jobType'] as String,
      salary: (json['salary'] as num).toDouble(),
      description: json['description'] as String,
      requirements: List<String>.from(json['requirements'] as List),
      benefits: List<String>.from(json['benefits'] as List),
      postedDate: DateTime.parse(json['postedDate'] as String),
      isFeatured: json['isFeatured'] as bool? ?? false,
      isRemote: json['isRemote'] as bool? ?? false,
      companyLogo: json['companyLogo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'location': location,
      'jobType': jobType,
      'salary': salary,
      'description': description,
      'requirements': requirements,
      'benefits': benefits,
      'postedDate': postedDate.toIso8601String(),
      'isFeatured': isFeatured,
      'isRemote': isRemote,
      'companyLogo': companyLogo,
    };
  }

  JobModel copyWith({
    String? id,
    String? title,
    String? company,
    String? location,
    String? jobType,
    double? salary,
    String? description,
    List<String>? requirements,
    List<String>? benefits,
    DateTime? postedDate,
    bool? isFeatured,
    bool? isRemote,
    String? companyLogo,
  }) {
    return JobModel(
      id: id ?? this.id,
      title: title ?? this.title,
      company: company ?? this.company,
      location: location ?? this.location,
      jobType: jobType ?? this.jobType,
      salary: salary ?? this.salary,
      description: description ?? this.description,
      requirements: requirements ?? this.requirements,
      benefits: benefits ?? this.benefits,
      postedDate: postedDate ?? this.postedDate,
      isFeatured: isFeatured ?? this.isFeatured,
      isRemote: isRemote ?? this.isRemote,
      companyLogo: companyLogo ?? this.companyLogo,
    );
  }
}
