import 'package:flutter/material.dart';

class CompanyTile extends StatelessWidget {
  final String companyName;
  final String companyLogoUrl;
  final String jobCount;

  const CompanyTile({
    Key? key,
    required this.companyName,
    required this.companyLogoUrl,
    required this.jobCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(companyLogoUrl),
        ),
        title: Text(
          companyName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('$jobCount job(s) available'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to company details or job listings
        },
      ),
    );
  }
}