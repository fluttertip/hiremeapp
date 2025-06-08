import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: ListView(
        children: [
          _buildSection(context, 'Frequently Asked Questions', [
            _buildFAQItem(
              'How do I apply for a job?',
              'To apply for a job, simply browse through the job listings, click on a job that interests you, and tap the "Apply" button. You\'ll need to provide your resume and a cover letter.',
            ),
            _buildFAQItem(
              'How do I update my profile?',
              'You can update your profile by going to the Profile tab and tapping on "Edit Profile". Here you can modify your personal information, skills, and experience.',
            ),
            _buildFAQItem(
              'How do I save jobs?',
              'To save a job, click on the bookmark icon in the job listing. You can view all your saved jobs in the "Saved Jobs" section of your profile.',
            ),
          ]),
          const Divider(),
          _buildSection(context, 'Contact Support', [
            ListTile(
              leading: const Icon(Icons.email_outlined),
              title: const Text('Email Support'),
              subtitle: const Text('support@hiremeapp.com'),
              onTap: () {
                _showEmailSupportDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat_outlined),
              title: const Text('Live Chat'),
              subtitle: const Text('Available 24/7'),
              onTap: () {
                _showLiveChatDialog(context);
              },
            ),
          ]),
          const Divider(),
          _buildSection(context, 'App Information', [
            const ListTile(title: Text('Version'), subtitle: Text('1.0.0')),
            ListTile(
              title: const Text('Terms of Service'),
              onTap: () {
                _showTermsOfService(context);
              },
            ),
            ListTile(
              title: const Text('Privacy Policy'),
              onTap: () {
                _showPrivacyPolicy(context);
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
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(answer),
        ),
      ],
    );
  }

  void _showEmailSupportDialog(BuildContext context) {
    final TextEditingController subjectController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Email Support'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: subjectController,
                decoration: const InputDecoration(
                  labelText: 'Subject',
                  hintText: 'Enter the subject of your inquiry',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  hintText: 'Describe your issue in detail',
                ),
                maxLines: 5,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (subjectController.text.isNotEmpty &&
                  messageController.text.isNotEmpty) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Your message has been sent to support!'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill in all fields'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }

  void _showLiveChatDialog(BuildContext context) {
    final TextEditingController messageController = TextEditingController();
    final List<ChatMessage> messages = [
      ChatMessage(
        text: 'Hello! How can I help you today?',
        isUser: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      ),
    ];

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Live Chat Support'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return _buildChatMessage(message);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    hintText: 'Type your message...',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('End Chat'),
            ),
            ElevatedButton(
              onPressed: () {
                if (messageController.text.isNotEmpty) {
                  setState(() {
                    messages.add(
                      ChatMessage(
                        text: messageController.text,
                        isUser: true,
                        timestamp: DateTime.now(),
                      ),
                    );
                    messageController.clear();
                  });

                  // Simulate support response
                  Future.delayed(const Duration(seconds: 1), () {
                    setState(() {
                      messages.add(
                        ChatMessage(
                          text:
                              'Thank you for your message. Our support team will get back to you shortly.',
                          isUser: false,
                          timestamp: DateTime.now(),
                        ),
                      );
                    });
                  });
                }
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatMessage(ChatMessage message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: message.isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: message.isUser ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: message.isUser ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showTermsOfService(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Terms of Service'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Last updated: March 15, 2024',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                '1. Acceptance of Terms\n\n'
                'By accessing and using the HireMe app, you agree to be bound by these Terms of Service.\n\n'
                '2. User Responsibilities\n\n'
                'You are responsible for maintaining the confidentiality of your account and for all activities that occur under your account.\n\n'
                '3. Job Applications\n\n'
                'You agree to provide accurate and complete information in your job applications.\n\n'
                '4. Privacy\n\n'
                'Your use of the app is also governed by our Privacy Policy.',
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
  }

  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Privacy Policy'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Last updated: March 15, 2024',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                '1. Information We Collect\n\n'
                'We collect information that you provide directly to us, including your name, email address, and professional information.\n\n'
                '2. How We Use Your Information\n\n'
                'We use your information to provide and improve our services, communicate with you, and personalize your experience.\n\n'
                '3. Information Sharing\n\n'
                'We do not sell your personal information. We may share your information with employers when you apply for jobs.\n\n'
                '4. Data Security\n\n'
                'We implement appropriate security measures to protect your personal information.',
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
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}
