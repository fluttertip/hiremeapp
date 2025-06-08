import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    final profile = profileProvider.profile;

    return Scaffold(
      appBar: AppBar(title: const Text('Privacy')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Profile Visibility'),
            subtitle: const Text('Make your profile visible to employers'),
            value: profile.isProfileVisible,
            onChanged: (value) async {
              await profileProvider.updateProfileVisibility(value);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Data Usage'),
            subtitle: const Text('Manage how your data is used'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Data Usage'),
                  content: const Text(
                    'We use your data to provide you with relevant job opportunities and improve our services. Your data is never shared with third parties without your consent.',
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
          const Divider(),
          ListTile(
            title: const Text('Delete Account'),
            subtitle: const Text('Permanently delete your account and data'),
            trailing: const Icon(Icons.delete_outline, color: Colors.red),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Account'),
                  content: const Text(
                    'Are you sure you want to delete your account? This action cannot be undone.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Implement account deletion
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Account deletion coming soon!'),
                          ),
                        );
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
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
}
