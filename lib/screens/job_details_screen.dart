import 'package:flutter/material.dart';

class JobDetailsScreen extends StatelessWidget {
  final String jobId;

  JobDetailsScreen({required this.jobId});

  @override
  Widget build(BuildContext context) {
    // Here you would typically fetch job details using the jobId
    // For now, we will use placeholder data

    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Job Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Company Name',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              'Job Description',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle apply action
              },
              child: Text('Apply Now'),
            ),
          ],
        ),
      ),
    );
  }
}