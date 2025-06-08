import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text(
              'Receive notifications about your applications',
            ),
            value: profileProvider.profile.notifications.enabled,
            onChanged: (value) async {
              await profileProvider.updateNotificationSettings(
                enabled: value,
                emailNotifications: value
                    ? profileProvider.profile.notifications.emailNotifications
                    : false,
                pushNotifications: value
                    ? profileProvider.profile.notifications.pushNotifications
                    : false,
              );
            },
          ),
          SwitchListTile(
            title: const Text('Email Notifications'),
            subtitle: const Text('Receive notifications via email'),
            value: profileProvider.profile.notifications.emailNotifications,
            secondary: const Icon(Icons.email_outlined),
            onChanged: profileProvider.profile.notifications.enabled
                ? (value) async {
                    await profileProvider.updateNotificationSettings(
                      emailNotifications: value,
                    );
                  }
                : null,
          ),
          SwitchListTile(
            title: const Text('Push Notifications'),
            subtitle: const Text('Receive notifications on your device'),
            value: profileProvider.profile.notifications.pushNotifications,
            secondary: const Icon(Icons.notifications_outlined),
            onChanged: profileProvider.profile.notifications.enabled
                ? (value) async {
                    await profileProvider.updateNotificationSettings(
                      pushNotifications: value,
                    );
                  }
                : null,
          ),
          const Divider(),
          ListTile(
            title: const Text('Notification Preferences'),
            subtitle: const Text(
              'Customize what you want to be notified about',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Notification Preferences'),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPreferenceSwitch(
                          context,
                          'Application Status Updates',
                          'Get notified when your application status changes',
                          true,
                        ),
                        _buildPreferenceSwitch(
                          context,
                          'New Job Matches',
                          'Get notified about jobs that match your profile',
                          true,
                        ),
                        _buildPreferenceSwitch(
                          context,
                          'Interview Invitations',
                          'Get notified when you receive interview invitations',
                          true,
                        ),
                        _buildPreferenceSwitch(
                          context,
                          'Application Reminders',
                          'Get reminded about incomplete applications',
                          false,
                        ),
                        _buildPreferenceSwitch(
                          context,
                          'Profile Views',
                          'Get notified when employers view your profile',
                          true,
                        ),
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
          ),
        ],
      ),
    );
  }

  Widget _buildPreferenceSwitch(
    BuildContext context,
    String title,
    String subtitle,
    bool defaultValue,
  ) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SwitchListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          value: defaultValue,
          onChanged: (value) {
            setState(() {
              defaultValue = value;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title ${value ? 'enabled' : 'disabled'}'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        );
      },
    );
  }
}
