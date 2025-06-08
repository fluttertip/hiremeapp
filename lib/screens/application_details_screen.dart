import 'package:flutter/material.dart';
import '../models/application_model.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  final ApplicationModel application;

  const ApplicationDetailsScreen({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Application Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildSection(
              context,
              'Application Status',
              _buildStatusCard(context),
            ),
            const SizedBox(height: 24),
            _buildSection(context, 'Job Details', _buildJobDetails(context)),
            const SizedBox(height: 24),
            _buildSection(context, 'Cover Letter', _buildCoverLetter(context)),
            const SizedBox(height: 24),
            _buildSection(context, 'Resume', _buildResumeCard(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              application.jobTitle,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              application.companyName,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 8),
                Text(
                  'Applied on ${_formatDate(application.appliedDate)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context) {
    Color statusColor;
    IconData statusIcon;
    String statusMessage;

    switch (application.status.toLowerCase()) {
      case 'pending':
        statusColor = Colors.orange;
        statusIcon = Icons.hourglass_empty;
        statusMessage = 'Your application is being reviewed';
        break;
      case 'accepted':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        statusMessage = 'Congratulations! Your application has been accepted';
        break;
      case 'rejected':
        statusColor = Colors.red;
        statusIcon = Icons.cancel;
        statusMessage = 'Your application was not selected for this position';
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help;
        statusMessage = 'Unknown status';
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(statusIcon, size: 48, color: statusColor),
            const SizedBox(height: 16),
            Text(
              application.status.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              statusMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobDetails(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow(
              context,
              Icons.location_on,
              'Location',
              application.location,
            ),
            const SizedBox(height: 16),
            _buildDetailRow(
              context,
              Icons.work,
              'Job Type',
              application.jobType,
            ),
            const SizedBox(height: 16),
            _buildDetailRow(
              context,
              Icons.attach_money,
              'Salary',
              application.salary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverLetter(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cover Letter',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              application.coverLetter,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResumeCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resume',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Simulate download
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Resume downloaded successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    icon: const Icon(Icons.download),
                    label: const Text('Download Resume'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    // Simulate preview
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Resume Preview'),
                        content: const SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('Senior Flutter Developer'),
                              Text('john.doe@example.com'),
                              Text('(555) 123-4567'),
                              SizedBox(height: 16),
                              Text(
                                'Experience',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('• 5+ years of Flutter development'),
                              Text('• 3+ years of mobile app development'),
                              Text('• Experience with Firebase and REST APIs'),
                              SizedBox(height: 16),
                              Text(
                                'Skills',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('• Flutter, Dart, Android, iOS'),
                              Text('• Firebase, REST APIs, GraphQL'),
                              Text('• Git, CI/CD, Agile methodologies'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.visibility),
                  tooltip: 'Preview Resume',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        content,
      ],
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
              Text(value, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
