import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/job_provider.dart';
// import '../models/application_model.dart';
import 'application_details_screen.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobProvider = context.watch<JobProvider>();
    final applications = jobProvider.getApplications();

    return Scaffold(
      appBar: AppBar(title: const Text('My Applications')),
      body: applications.isEmpty
          ? const Center(
              child: Text(
                'No applications yet',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: applications.length,
              itemBuilder: (context, index) {
                final application = applications[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      application.jobTitle,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          application.companyName,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Applied on: ${application.appliedDate}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getStatusColor(
                              application.status,
                            ).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            application.status,
                            style: TextStyle(
                              color: _getStatusColor(application.status),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApplicationDetailsScreen(
                            application: application,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'reviewing':
        return Colors.blue;
      case 'interview':
        return Colors.purple;
      case 'accepted':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
