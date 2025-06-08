import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import 'notifications_screen.dart';
import 'privacy_screen.dart';
import 'help_support_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          _buildSection(context, 'Account', [
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Edit Profile'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to edit profile
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit profile coming soon!')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text('Notifications'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: const Text('Privacy'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyScreen(),
                  ),
                );
              },
            ),
          ]),
          _buildSection(context, 'Preferences', [
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode_outlined),
              title: const Text('Dark Mode'),
              value: false, // TODO: Implement dark mode
              onChanged: (value) {
                // TODO: Implement dark mode toggle
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Dark mode coming soon!')),
                );
              },
            ),
            SwitchListTile(
              secondary: const Icon(Icons.language_outlined),
              title: const Text('Language'),
              subtitle: const Text('English'),
              value: false,
              onChanged: (value) {
                // TODO: Implement language selection
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Language selection coming soon!'),
                  ),
                );
              },
            ),
          ]),
          _buildSection(context, 'Support', [
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help & Support'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpSupportScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'HireMe',
                  applicationVersion: '1.0.0',
                  applicationIcon: const FlutterLogo(size: 48),
                  children: const [
                    Text(
                      'HireMe is a job search and application platform that helps you find your dream job.',
                    ),
                  ],
                );
              },
            ),
          ]),
          _buildSection(context, 'Account Actions', [
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Log Out', style: TextStyle(color: Colors.red)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Log Out'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: Implement logout
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Logout coming soon!'),
                            ),
                          );
                        },
                        child: const Text(
                          'Log Out',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ...children,
        const Divider(),
      ],
    );
  }
}
